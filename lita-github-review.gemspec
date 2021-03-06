Gem::Specification.new do |spec|
  spec.name          = 'lita-github-review'
  spec.version       = '0.1.0.alpha'
  spec.authors       = ['Mario Perez']
  spec.email         = ['mapreal19@gmail.com']
  spec.description   = 'Add a description'
  spec.summary       = 'Add a summary'
  spec.homepage      = 'https://github.com/mapreal19/lita-github-review'
  spec.license       = 'MIT'
  spec.metadata      = { 'lita_plugin_type' => 'handler' }

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '>= 4.7'
  spec.add_runtime_dependency 'octokit'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rubocop', '0.39'
  spec.add_development_dependency 'rubocop-rspec', '1.4.1'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rspec', '>= 3.0.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'coveralls'
end
