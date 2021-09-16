# frozen_string_literal: true

# = Environment

# Depending on how you start a Ruby process, it may not pick up all of the Bash Env Vars.
# To rectify this, This gem employs two mechanisms.
# First if tries to load some code from a .env file in the process root dir.
# Then it fires up a full login shell and sucks out all of the vars.

# The final authority is the login shell variables.  They will override any conflicts stemming from .env files.

# This Gem also purges standard ENV of any Env Vars that start with SEC_
# This was added to prevent some debugging tools from leaking secure env vars.

# Some code was borrowed from teh dotenv gem project.

# == Installation

# # gem install environment

# == Usage

# The global constant ENV is mostly left untouched by default.
# The global ENV will be purged of anything matching \^SEC_\.
# To read an environment variable, use Environment.get or Environment[].

# Example usage:

#   require "rubygems"
#   require "environment"

#   # the following two are the same
#   path = Environment['PATH']
#   home = Environment.get('HOME')

# If you want to override the default ENV constant, use the override! method
# Caution, the override! method can mess up any ruby process dynamically changing env vars.

# Example usage:

#   require "rubygems"
#   require "environment"

#   host = ENV['HOSTNAME'] #nil
#   Environment.override!
#   host = ENV['HOSTNAME'] #yourdomain.com
module Environment
  @env = {}

  # borrowed from dotenv
  LINE = /
    \A
    (?:export\s+)?    # optional export
    ([\w.]+)          # key
    (?:\s*=\s*|:\s+?) # separator
    (                 # value begin
      '(?:'|[^'])*'   #   single quoted value
      |               #   or
      "(?:"|[^"])*"   #   double quoted value
      |               #   or
      [^#\n]+         #   unquoted value
    )                 # value end
    (?:\s*\#.*)?      # optional comment
    \z
  /x.freeze

  def self.load
    # load a local env files first looking for *.env
    load_env_file

    # load user env vars
    `/bin/bash -lc /usr/bin/env`&.split("\n")&.each do |line|
      process_line(line)
    end
    clean_secrets_from_env
  end

  # Clean vars flagged as sensitive from ENV
  def self.clean_secrets_from_env
    ENV.delete_if { |k, _| k =~ /^SEC_/ }
  end

  # attempt to match entire line to 'LINE' regex
  def self.process_line(line)
    if (match = line.match(LINE))
      key, value = match.captures
      set_env(key, value)
    elsif line !~ /\A\s*(?:#.*)?\z/ # not comment or blank line
      puts "Line #{line.inspect} does not match expected format VAR=val.  Probably missing a value."
    end
  end

  # strip quotes and newlines then set in @env
  def self.set_env(key, value)
    return if key.nil? || value.nil?

    value = value.strip.sub(/\A(['"])(.*)\1\z/, '\2') # remove quotes surrounding value if present
    value = value.gsub('\n', "\n").gsub(/\\(.)/, '\1') if Regexp.last_match(1)
    @env[key] = value
  end

  # adapted from dotenv gem
  def self.load_env_file
    Dir.glob('*.env').sort.each do |file|
      read(file).each do |line|
        process_line(line)
      end
    end
  end

  # adapted from dotenv gem
  def self.read(file)
    File.read(file).split("\n")
  end

  def self.get(key)
    @env[key]
  end

  def self.[](key)
    @env[key]
  end

  def self.to_a
    @env.to_a
  end

  def self.override!
    @env.each do |key, value|
      ENV[key] = value
    end
  end
end

Environment.load
