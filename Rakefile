# encoding: utf-8
require 'rubygems'
require 'bundler'
require 'rake'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "za-id-validator"
  gem.homepage = "http://github.com/craigp/za-id-validator"
  gem.license = "MIT"
  gem.summary = %Q{Validates South African identity numbers}
  gem.description = %Q{Validates South African identity numbers}
  gem.email = "darksavant@gmail.com"
  gem.authors = ["Craig Paterson"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "za-id-validator #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
