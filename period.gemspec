lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'period/version'

Gem::Specification.new do |spec|
  spec.authors       = ['Martin Spickermann']
  spec.email         = ['spickermann@gmail.com']
  spec.homepage      = 'https://github.com/spickermann/period'

  spec.name          = 'period'
  spec.version       = Period::VERSION::STRING
  spec.summary       = 'Gem that helps defining periods of time.'
  # spec.description   = 'TODO: Write a longer description. Optional.'
  spec.license       = 'MIT'

  spec.files         = Dir['CHANGELOG', 'LICENSE', 'README', 'lib/**/*', 'spec/**/*']

  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_dependency 'activesupport', '>= 3.0.0'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rubocop'
end
