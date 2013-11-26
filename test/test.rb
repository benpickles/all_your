require 'bundler/setup'

require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'

$: << File.expand_path('../../lib', __FILE__)

require 'all_your'

describe AllYour do
  it do
    assert_equal '4VPmP', AllYour.encode(123456789)
    assert_equal 123456789, AllYour.decode('4VPmP')
  end
end
