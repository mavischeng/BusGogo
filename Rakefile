require 'rake/testtask'

task :default => [:spec]

desc 'Run specs'
task :spec do
  sh 'ruby -I lib spec/minitest.rb'
  sh 'rubocop ./lib/scraper.rb'
  sh 'rubocop ./bin/executable.rb'
end
