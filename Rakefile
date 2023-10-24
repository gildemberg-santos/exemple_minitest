# frozen_string_literal: true

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.test_files = FileList['test/*/*/*/*_test.rb']
  t.verbose = false
  t.warning = false
end
