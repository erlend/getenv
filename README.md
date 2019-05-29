# Getenv

[![Build
Status](https://travis-ci.org/erlend/getenv.svg?branch=master)](https://travis-ci.org/erlend/getenv)
[![Gem](https://img.shields.io/gem/v/getenv.svg)](https://rubygems.org/gems/getenv)

A tiny gem for getting environment variables.

```ruby
Getenv.HOME  #=> "/Users/erlend"
Getenv.HOME? #=> true
Getenv.NOTHING? #=> false
Getenv.custom_variable = "foo"
Getenv.custom_variable! #=> "foo"
Getenv.no_variable! #=> raises Getenv::Error (key not found `no_variable`)
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'getenv'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install getenv

## Usage

### Getting a variable

```ruby
Getenv.HOME #=> "/Users/erlend"
Getenv.LANG #=> "en_US.UTF-8"
```

###  Setting a variable

```ruby
Getenv.LANG                 #=> "en_US.UTF-8"
Getenv.LANG = "nb_NO.UTF-8" #=> "nb_NO.UTF-8"
Getenv.LANG                 #=> "nb_NO.UTF-8"
```

### Check if a variable is set

```ruby
Getenv.LANG?   #=> true
Getenv.NOTHING #=> false
```

### Getting a variable or raise error if missing

```ruby
Getenv.LANG!    #=> "en_US.UTF-8"
Getenv.NOTHING! #=> raises Getenv::Error (key not found `NOTHING`)
```

## Development

After checking out the repo, run `bundle install` to install dependencies. Then,
run `rake spec` to run the tests. You can also run `rake rubocop` analyze the
code with [RuboCop](https://www.rubocop.org/en/stable/).

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `getenv.gemspec`, and then
run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/erlend/getenv. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT
License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Getenv project’s codebases, issue trackers, chat
rooms and mailing lists is expected to follow the [code of
conduct](https://github.com/erlend/getenv/blob/master/CODE_OF_CONDUCT.md).
