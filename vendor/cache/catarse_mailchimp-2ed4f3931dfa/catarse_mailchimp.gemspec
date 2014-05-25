# -*- encoding: utf-8 -*-
# stub: catarse_mailchimp 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "catarse_mailchimp"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ant\u{f4}nio Roberto Silva"]
  s.date = "2014-05-25"
  s.description = "MailChimp integration with Catarse crowdfunding platform"
  s.email = ["forevertonny@gmail.com"]
  s.files = [".gitignore", "Gemfile", "Gemfile.lock", "MIT-LICENSE", "README.md", "Rakefile", "catarse_mailchimp.gemspec", "lib/catarse_mailchimp.rb", "lib/catarse_mailchimp/active_record.rb", "lib/catarse_mailchimp/api.rb", "lib/catarse_mailchimp/railtie.rb", "lib/catarse_mailchimp/version.rb", "script/rails", "spec/catarse_mailchimp_spec.rb", "spec/lib/catarse_mailchimp/api_spec.rb", "spec/spec_helper.rb"]
  s.homepage = "http://github.com/devton/catarse_mailchimp"
  s.rubygems_version = "2.2.2"
  s.summary = "MailChimp integration with Catarse"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mailchimp>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_runtime_dependency(%q<supermodel>, [">= 0"])
    else
      s.add_dependency(%q<mailchimp>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<supermodel>, [">= 0"])
    end
  else
    s.add_dependency(%q<mailchimp>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<supermodel>, [">= 0"])
  end
end
