# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{environment}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nitesh Goel"]
  s.date = %q{2011-04-22}
  s.description = %q{Environment variables in are not available to scripts running as crons and/or services. This gem allows ruby scripts running as a cron and/or as a service full access to the system environment variables.}
  s.email = %q{nitesh@wikinvest.com}
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "README.rdoc", "lib/environment.rb", "lib/save_environment_variables.sh"]
  s.files = ["CHANGELOG.rdoc", "Manifest", "README.rdoc", "Rakefile", "environment.gemspec", "lib/environment.rb", "lib/save_environment_variables.sh"]
  s.homepage = %q{http://rubygems.org/gems/environment}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Environment", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{environment}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Environment variables in are not available to scripts running as crons and/or services. This gem allows ruby scripts running as a cron and/or as a service full access to the system environment variables.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
