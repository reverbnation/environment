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
  CURRENT_DIR = File.dirname(__FILE__)
  VARIABLE_DUMP = "/tmp/.environment_variables_#{Process.pid}"
  SHELL_SCRIPT = "#{CURRENT_DIR}/save_environment_variables.sh #{VARIABLE_DUMP}"
  @env = {}
  
  def self.load
    success = system("bash -l #{SHELL_SCRIPT}")
    if success && File.exists?(VARIABLE_DUMP)
      File.read(VARIABLE_DUMP).each_line do |line|
        key,value = line.chomp.split("=")
        @env[key] = value
      end
      File.delete(VARIABLE_DUMP)
    end
  end
  
  def self.get(key)
    return @env[key]
  end
  
  def self.[](key)
    return @env[key]
  end
  
  def self.override!
    @env.each do |key,value|
      ENV[key] = value
    end
  end
end

Environment.load
      
