require "rubygems"
require "rake"
require "echoe"

Echoe.new("environment", "0.2.1") do |p|
  p.description = "Environment variables in are not available to scripts running as crons and/or services. This gem allows ruby scripts running as a cron and/or as a service full access to the system environment variables."
  p.summary = "Environment variables in are not available to scripts running as crons and/or services. This gem allows ruby scripts running as a cron and/or as a service full access to the system environment variables."
  p.url = "http://rubygems.org/gems/environment"
  p.author = "Nitesh Goel"
  p.email = "nitesh@wikinvest.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
