require 'rake/testtask'
require 'bundler/gem_tasks'

Bundler::GemHelper.install_tasks

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

namespace :pkg do
  desc 'Generate package source gem'
  task generate_source: :build
end

task default: :test

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue StandardError => _e
  puts 'Rubocop not loaded.'
end

task :default do
  Rake::Task['rubocop'].execute
end

require 'hammer_cli_foreman_scc_manager/version'
require 'hammer_cli_foreman_scc_manager/i18n'
require 'hammer_cli/i18n/find_task'
HammerCLI::I18n::FindTask.define(HammerCLIForemanSCCManager::I18n::LocaleDomain.new,
  HammerCLIForemanSCCManager.version.to_s)
