require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.description = 'benchmark'
  t.libs << 'test'
  t.name = 'benchmark'
  t.test_files = FileList['test/benchmark.rb']
end

Rake::TestTask.new do |t|
  t.libs << 'test'
end

task default: :test
