# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name         = 'getenv'
  spec.version      = '0.1.0'
  spec.authors      = ['Erlend Finvåg']
  spec.email        = ['erlend.finvag@gmail.com']

  spec.summary      = 'Tiny gem for getting environment variables'
  spec.homepage     = 'https://github.com/erlend/getenv/'
  spec.license      = 'MIT'

  # Specify which files should be added to the gem when it is released.
  spec.files        = ['getenv.rb']
  spec.test_file    = 'getenv_spec.rb'
  spec.require_path = '.'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.70'
end
