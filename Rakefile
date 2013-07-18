require "rubygems"
require "rake"
require "echoe"

Echoe.new("environment", "0.2.1") do |p|
  p.description = "Depending on how you start a Ruby process, it may not pick up all of the Bash Env Vars.  To rectify this, This gem fires up a full login shell and sucks out all of the vars.  This Gem also purges standard ENV of any Env Vars that start with SEC_.  This was added to prevent some debugging tools from leaking secure env vars."
  p.summary = "The global constant ENV is mostly left untouched by default.  The global ENV will be purged of anything matching \^SEC_\.  To read an environment variable, use Environment.get or Environment[]."
  p.url = "https://github.com/abruehl/environment"
  p.author = "Adam Bruehl, Nitesh Goel"
  p.email = "adam.bruehl@gmail.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
