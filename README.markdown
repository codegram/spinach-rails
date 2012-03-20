# Spinach-rails

[![Build Status](https://secure.travis-ci.org/codegram/spinach-rails.png?branch=master)](http://travis-ci.org/codegram/spinach-rails)

Spinach-rails is a compatibility layer on top of [Spinach](http://codegram.github.com/spinach)
to provide rails support.

## Usage

Add `spinach-rails` to your Gemfile:

    group :test, :development do
      gem 'spinach-rails'
    end

Generate your rails environment file with:

    rails generate spinach

Follow the instructions from [Spinach](http://github.com/codegram/spinach) to
set up spinach and run the rake task:

    RAILS_ENV=test rake spinach

If you want spinach to automatically generate a step definition file when
necessary, you can also run:

    RAILS_ENV=test rake spinach:generate

## Cleaning your database before each scenario

You can take benefit from spinach's [hook architecture](http://rdoc.info/github/codegram/spinach/master/Spinach/Hooks)
and use DatabaseCleaner to reset your database to a pristine state each time
a scenario is executed.

Here's an example you can add to your env `features/support/env.rb` file:

    require 'database_cleaner'
    DatabaseCleaner.strategy = :truncation

    Spinach.hooks.after_scenario do
      DatabaseCleaner.clean
    end

## Contributing

* Fork the project.
* Make your feature addition or bug fix.
* Add specs for it. This is important so we don't break it in a future
  version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  If you want to have your own version, that is fine but bump version
  in a commit by itself I can ignore when I pull.
* Send me a pull request. Bonus points for topic branches.

[gherkin]: http://github.com/cucumber/gherkin
[cucumber]: http://github.com/cucumber/cucumber
[documentation]: http://rubydoc.info/github/codegram/spinach/master/frames

## License

MIT License. Copyright 2011 [Codegram Technologies](http://codegram.com)
