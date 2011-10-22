# Spinach-rails
Spinach-rails is a compatibility layer on top of [Spinach](http://codegram.github.com/spinach)
to provide rails support.

## Usage

Add `spinach-rails` to your Gemfile:

    group :test do
      gem 'spinach-rails'
    end

Follow the instructions from [Spinach](http://github.com/codegram/spinach) and
add the following into `features/support/rails.rb`:

    require 'spinach-rails'
    ENV['RAILS_ENV']='test'
    require_relative '../../config/environment'

## Cleaning your database before each scenario

You can take benefit from spinach's [hook architecture](http://rdoc.info/github/codegram/spinach/master/Spinach/Hooks)
and use DatabaseCleaner to reset your database to a pristine state each time
a scenario is executed.

Here's an example you can append to `features/support/rails.rb`:

    Spinach.hooks.before_scenario do
      DatabaseCleaner.start
    end

    Spinach.hooks.after_scenario do
      DatabaseCleaner.clean
    end

## Contributing

You can easily contribute to Spinach. Its codebase is simple and
[extensively documented][documentation].

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
