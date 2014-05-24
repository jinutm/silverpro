# Neighbor.ly [![Build Status](https://secure.travis-ci.org/neighborly/neighborly.png?branch=master)](https://travis-ci.org/neighborly/neighborly) [![Coverage Status](https://coveralls.io/repos/neighborly/neighborly/badge.png?branch=master)](https://coveralls.io/r/neighborly/neighborly) [![Code Climate](https://codeclimate.com/github/neighborly/neighborly.png)](https://codeclimate.com/github/neighborly/neighborly) [![Dependency Status](https://gemnasium.com/neighborly/neighborly.png)](https://gemnasium.com/neighborly/neighborly) 

Welcome to the first open source fundraising toolkit for needy people. Silveralms starting their venture on coming May 29th 2014. As a fork of the wildly successful Brazillian crowdfunding platform [Catarse](https://github.com/catarse/catarse) and International crowdfunding paltform [Neighborly](https://github.com/neighborly/neighborly). Working closely with the developers of those project, helped us to build silveralms and we are always thankful for their support.


### Payment gateways

Neighbor.ly supports payment gateways through payment engines. Payment engines are extensions to Neighbor.ly that implement a specific payment gateway logic.
The two current supported payment gateways are:

* Balanced Credit Card
* Balanced Bank Account (ACH)

If you have created another payment engine, please contact us so we can link your engine here.

* For Paypal and Wepay

Use githash : f9a91ee6e3bce119f181c5e7b8cb3908fdf014c4 and checkout

## How to contribute

Thank you for your interest in helping to advance this project. We are actively working on a public roadmap. Meanwhile, please feel free to [open issues](https://github.com/neighborly/neighborly/issues/new) with your concerns and [fix/implement](https://github.com/neighborly/neighborly/issues) something using pull requests. Probably the better way to do this is commenting on the issue so we can give you the responsibility of it. This will prevent more than one person to contribute with the same change.

### Coding style

* We prefer `{foo: 'bar'}` over `{:foo => 'bar'}`
* We prefer `->(foo){ bar(foo) }` over `lambda{|foo| bar(foo) }`

### Best practices (or how to get your pull request accepted faster)

We use RSpec, Capybara and Jasmine for the tests, and the best practices are:
* Create one acceptance test for each scenario of the feature you are trying to implement.
* Create model and controller tests to keep 100% of code coverage at least in the new parts that you are writing.
* Feel free to add specs to the code that is already in the repository without the proper coverage ;)
* Try to isolate models from controllers as best as you can.
* Regard the existing tests for a style guide, we try to use implicit spec subjects and lazy evaluation as often as we can.

## Quick Installation

**IMPORTANT**: Make sure you have postgresql-contrib ([Aditional Modules](http://www.postgresql.org/docs/9.3/static/contrib.html)) installed on your system.

```bash
$ git clone https://github.com/jinutm/silveralms.git
$ cd neighborly
$ cp config/database.sample.yml config/database.yml
$ vim config/database.yml
# change username/password and save
$ bundle install
$ rake db:create db:migrate db:seed
$ rails server
```

## Credits

Hi I am [jinutm](https://github.com/jinutm), This script is originally forked from [Neighborly](https://github.com/neighborly/neighborly), which is made on [catarse](https://github.com/catarse/catarse).
Adapted by [devton](https://github.com/devton), [josemarluedke](https://github.com/josemarluedke), and [luminopolis](https://github.com/luminopolis). Made possible by support from hundreds of code contributors, [financial support](http://www.silveralms.com) from Silver Alms Foundation.

## License

Copyright (c) 2012 - 2014 Silveralms.com. Licensed as free and open source under the [MIT License](MIT-LICENSE)
