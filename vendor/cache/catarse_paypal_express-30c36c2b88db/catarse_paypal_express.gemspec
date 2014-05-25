# -*- encoding: utf-8 -*-
# stub: catarse_paypal_express 2.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "catarse_paypal_express"
  s.version = "2.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ant\u{f4}nio Roberto Silva", "Diogo Biazus", "Josemar Davi Luedke"]
  s.date = "2014-05-25"
  s.description = "PaypalExpress integration with Catarse crowdfunding platform"
  s.email = ["forevertonny@gmail.com", "diogob@gmail.com", "josemarluedke@gmail.com"]
  s.files = [".gitignore", ".rspec", ".travis.yml", "Gemfile", "Gemfile.lock", "MIT-LICENSE", "README.md", "Rakefile", "app/assets/images/paypal_verified.png", "app/controllers/.gitkeep", "app/controllers/catarse_paypal_express/paypal_express_controller.rb", "app/views/catarse_paypal_express/paypal_express/review.html.slim", "catarse_paypal_express.gemspec", "config/initializers/active_merchant.rb", "config/initializers/register.rb", "config/locales/en.yml", "config/locales/pt.yml", "config/routes.rb", "lib/catarse_paypal_express.rb", "lib/catarse_paypal_express/engine.rb", "lib/catarse_paypal_express/version.rb", "lib/tasks/catarse_paypal_express_tasks.rake", "script/rails", "spec/controllers/catarse_paypal_express/paypal_express_controller_spec.rb", "spec/fixtures/ipn_data.txt", "spec/spec_helper.rb", "spec/support/payment_engines.rb", "test/dummy/README.rdoc", "test/dummy/Rakefile", "test/dummy/app/assets/javascripts/application.js", "test/dummy/app/assets/stylesheets/application.css", "test/dummy/app/controllers/application_controller.rb", "test/dummy/app/helpers/application_helper.rb", "test/dummy/app/mailers/.gitkeep", "test/dummy/app/models/.gitkeep", "test/dummy/app/views/layouts/application.html.erb", "test/dummy/config.ru", "test/dummy/config/application.rb", "test/dummy/config/boot.rb", "test/dummy/config/database.yml", "test/dummy/config/environment.rb", "test/dummy/config/environments/development.rb", "test/dummy/config/environments/production.rb", "test/dummy/config/environments/test.rb", "test/dummy/config/initializers/backtrace_silencers.rb", "test/dummy/config/initializers/filter_parameter_logging.rb", "test/dummy/config/initializers/inflections.rb", "test/dummy/config/initializers/mime_types.rb", "test/dummy/config/initializers/secret_token.rb", "test/dummy/config/initializers/session_store.rb", "test/dummy/config/initializers/wrap_parameters.rb", "test/dummy/config/locales/en.yml", "test/dummy/config/routes.rb", "test/dummy/lib/assets/.gitkeep", "test/dummy/log/.gitkeep", "test/dummy/public/404.html", "test/dummy/public/422.html", "test/dummy/public/500.html", "test/dummy/public/favicon.ico", "test/dummy/script/rails"]
  s.homepage = "http://github.com/catarse/catarse_paypal_express"
  s.rubygems_version = "2.2.2"
  s.summary = "PaypalExpress integration with Catarse"
  s.test_files = ["spec/controllers/catarse_paypal_express/paypal_express_controller_spec.rb", "spec/fixtures/ipn_data.txt", "spec/spec_helper.rb", "spec/support/payment_engines.rb", "test/dummy/README.rdoc", "test/dummy/Rakefile", "test/dummy/app/assets/javascripts/application.js", "test/dummy/app/assets/stylesheets/application.css", "test/dummy/app/controllers/application_controller.rb", "test/dummy/app/helpers/application_helper.rb", "test/dummy/app/mailers/.gitkeep", "test/dummy/app/models/.gitkeep", "test/dummy/app/views/layouts/application.html.erb", "test/dummy/config.ru", "test/dummy/config/application.rb", "test/dummy/config/boot.rb", "test/dummy/config/database.yml", "test/dummy/config/environment.rb", "test/dummy/config/environments/development.rb", "test/dummy/config/environments/production.rb", "test/dummy/config/environments/test.rb", "test/dummy/config/initializers/backtrace_silencers.rb", "test/dummy/config/initializers/filter_parameter_logging.rb", "test/dummy/config/initializers/inflections.rb", "test/dummy/config/initializers/mime_types.rb", "test/dummy/config/initializers/secret_token.rb", "test/dummy/config/initializers/session_store.rb", "test/dummy/config/initializers/wrap_parameters.rb", "test/dummy/config/locales/en.yml", "test/dummy/config/routes.rb", "test/dummy/lib/assets/.gitkeep", "test/dummy/log/.gitkeep", "test/dummy/public/404.html", "test/dummy/public/422.html", "test/dummy/public/500.html", "test/dummy/public/favicon.ico", "test/dummy/script/rails"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 4.0"])
      s.add_runtime_dependency(%q<activemerchant>, [">= 1.34.0"])
      s.add_runtime_dependency(%q<slim-rails>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.14.0"])
      s.add_development_dependency(%q<factory_girl_rails>, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 4.0"])
      s.add_dependency(%q<activemerchant>, [">= 1.34.0"])
      s.add_dependency(%q<slim-rails>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.14.0"])
      s.add_dependency(%q<factory_girl_rails>, [">= 0"])
      s.add_dependency(%q<database_cleaner>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 4.0"])
    s.add_dependency(%q<activemerchant>, [">= 1.34.0"])
    s.add_dependency(%q<slim-rails>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.14.0"])
    s.add_dependency(%q<factory_girl_rails>, [">= 0"])
    s.add_dependency(%q<database_cleaner>, [">= 0"])
  end
end
