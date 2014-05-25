# -*- encoding: utf-8 -*-
# stub: font-icons-rails 0.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "font-icons-rails"
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Zbigniew Zemla"]
  s.date = "2014-05-25"
  s.description = "A package of free font icons for use in Rails apps"
  s.email = ["zbyszek@shorelabs.com"]
  s.files = ["README.rdoc", "Rakefile", "lib/font-icons-rails", "lib/font-icons-rails.rb", "lib/font-icons-rails/engine.rb", "lib/font-icons-rails/version.rb"]
  s.homepage = "http://www.shorelabs.com"
  s.rubygems_version = "2.2.2"
  s.summary = "A package of free font icons for use in Rails apps"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sass-rails>, [">= 3.1.1"])
    else
      s.add_dependency(%q<sass-rails>, [">= 3.1.1"])
    end
  else
    s.add_dependency(%q<sass-rails>, [">= 3.1.1"])
  end
end
