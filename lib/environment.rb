=begin rdoc
= Environment

Depending on how you start a Ruby process, it may not pick up all of the Bash Env Vars.
To rectify this, This gem fires up a full login shell and sucks out all of the vars.

This Gem also purges standard ENV of any Env Vars that start with SEC_
This was added to prevent some debugging tools from leaking secure env vars.

== Installation

# gem install environment

== Usage

The global constant ENV is mostly left untouched by default. 
The global ENV will be purged of anything matching \^SEC_\.
To read an environment variable, use Environment.get or Environment[].

Example usage:

  require "rubygems"
  require "environment"
  
  # the following two are the same
  path = Environment['PATH']
  home = Environment.get('HOME')
  
If you want to override the default ENV constant, use the override! method
Caution, the override! method can mess up any ruby process dynamically changing env vars.

Example usage:

  require "rubygems"
  require "environment"
  
  host = ENV['HOSTNAME'] #nil
  Environment.override!
  host = ENV['HOSTNAME'] #yourdomain.com
=end
module Environment
  
  @env = {}
  
  def self.load
    env_vars = `/bin/bash -lc /usr/bin/env`
    env_vars = env_vars.split("\n")
    if env_vars
      env_vars.each do |v|
        key,value = v.chomp.split("=")
        @env[key] = value
      end
    end 
    clean_secrets_from_env()
  end

  #Clean vars flagged as sensitive from ENV
  def self.clean_secrets_from_env()
    ENV.delete_if{ |k,v| k =~ /^SEC_/ }
  end

  def self.get(key)
    return @env[key]
  end
  
  def self.[](key)
    return @env[key]
  end

  def self.to_a
     return @env.to_a
  end
  
  def self.override!
    @env.each do |key,value|
      ENV[key] = value
    end
  end
end

Environment.load
      
