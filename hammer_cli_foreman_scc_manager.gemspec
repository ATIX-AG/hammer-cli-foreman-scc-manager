lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hammer_cli_foreman_scc_manager/version'

Gem::Specification.new do |spec|
  spec.name          = 'hammer_cli_foreman_scc_manager'
  spec.version       = HammerCLIForemanSCCManager.version.dup
  spec.authors       = ['Nadja Heitmann']
  spec.email         = ['heitmann@atix.de']
  spec.homepage      = 'https://github.com/ATIX-AG/hammer-cli-foreman-scc-manager'
  spec.license       = 'GPL-3.0'

  spec.platform      = Gem::Platform::RUBY
  spec.summary       = 'Foreman SCC Manager plugin for Hammer CLI'

  spec.files         = Dir['{lib,config}/**/*', 'LICENSE', 'README*'] + Dir['locale/**/*.{po,pot,mo}']
  spec.require_paths = ['lib']
  spec.test_files    = Dir['{test}/**/*']

  spec.add_dependency 'hammer_cli_foreman', '~> 3.10'
  spec.required_ruby_version = '>= 2.7', '< 4'

  spec.add_development_dependency 'bundler', '< 2.5'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 12.0'

  spec.add_development_dependency 'rdoc', '~> 4'
  spec.add_development_dependency 'theforeman-rubocop', '~> 0.1.2'
end
