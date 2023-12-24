$:.push File.expand_path("../lib", __FILE__)
require "devise-guests/version"

Gem::Specification.new do |s|
  s.name = "devise-guests"
  s.version = DeviseGuests::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Chris Beer"]
  s.email = "chris@cbeer.info"
  s.homepage = "http://github.com/cbeer/devise-guests"
  s.summary = " Guest user implementation for devise "
  s.description = " Guest user implementation for devise "
  s.license = "MIT"

  s.add_dependency "devise"

  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "rake"
  s.add_development_dependency "combustion", "~> 1.0"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "standard"
  s.add_development_dependency "yard"

  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]

  s.require_paths = ["lib"]
end
