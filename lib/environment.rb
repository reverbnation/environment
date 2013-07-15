=begin rdoc
= Environment

Environment variables in are not available to scripts running as crons and/or services. This gem allows ruby scripts running as a cron and/or as a service full access to the system environment variables.

== Installation

# gem install environment

== Usage

The global constant ENV is left untouched by default. To read an environment variable, use Environment.get or Environment[].

Example usage:

  require "rubygems"
  require "environment"
  
  # the following two are the same
  path = Environment['PATH']
  home = Environment.get('HOME')
  
If you want to override the default ENV constant, use the override! method

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
      
