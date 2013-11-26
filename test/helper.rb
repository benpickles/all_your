require 'bundler/setup'

require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'

$: << File.expand_path('../../lib', __FILE__)

require 'all_your'
