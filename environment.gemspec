# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{environment}
  s.version = "0.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Bruehl", "Nitesh Goel"]
  s.date = %q{2013-07-17}
  s.description = %q{Ensures Ruby has all bash env vars available regardless of how it was started.}
  s.email = %q{adam.bruehl@gmail.com}
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "README.rdoc", "lib/environment.rb"]
  s.files = ["CHANGELOG.rdoc", "Manifest", "README.rdoc", "Rakefile", "environment.gemspec", "lib/environment.rb"]
  s.homepage = %q{https://github.com/abruehl/environment}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Environment", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{environment}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Depending on how you start a Ruby process, it may not pick up all of the Bash Env Vars.  To rectify this, This gem both loads a .env file and fires up a full login shell and sucks out all of the vars.  This Gem also purges standard ENV of any Env Vars that start with SEC_.  This was added to prevent some debugging tools from leaking secure env vars.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
