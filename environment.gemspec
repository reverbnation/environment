# frozen-string-literal: true

Gem::Specification.new do |s|
  s.name = 'environment'
  s.version = '0.2.6'

  s.required_ruby_version = '>= 2.7'
  s.required_rubygems_version = '>= 3.1'
  s.authors = ['Andrew Watts', 'Adam Bruehl', 'Nitesh Goel']
  s.date = '2021-09-16'
  s.description = 'Ensures Ruby has all bash env vars available regardless of how it was started.'
  s.email = 'awatts@reverbnation.com'
  s.extra_rdoc_files = ['CHANGELOG.rdoc', 'README.rdoc', 'lib/environment.rb']
  s.files = ['CHANGELOG.rdoc', 'Manifest', 'README.rdoc', 'Rakefile', 'environment.gemspec', 'lib/environment.rb']
  s.homepage = 'https://github.com/abruehl/environment'
  s.rdoc_options = ['--line-numbers', '--inline-source', '--title', 'Environment', '--main', 'README.rdoc']
  s.require_paths = ['lib']
  s.rubyforge_project = 'environment'
  s.rubygems_version = '1.7.2'
  s.summary = <<~_TEXT
    Depending on how you start a Ruby process, it may not pick up all of the
    Bash Env Vars. To rectify this, This gem both loads a .env file and fires up
    a full login shell and sucks out all of the vars. This Gem also purges
    standard ENV of any Env Vars that start with SEC_. This was added to prevent
    some debugging tools from leaking secure env vars.'
  _TEXT
end
