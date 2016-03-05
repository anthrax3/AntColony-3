if ENV['SIMPLECOV']
  require 'simplecov'
  SimpleCov.start
end

require 'yaml'

require_relative '../lib/ant_colony.rb'
