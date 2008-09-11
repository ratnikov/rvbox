
require 'rake'
require 'rake/testtask'


desc "Loads up the environment."
task :environment do
  require File.dirname(__FILE__) + '/config/environment'
end

namespace :test do
  desc "Runs the unit tests."
  task :units => :environment do 
    require 'rake/runtest'
    Rake.run_tests File.dirname(__FILE__) + '/test/unit/**/*_test.rb'
  end
end

desc "Runs all the tests."
task :test => [ "test:units" ]
