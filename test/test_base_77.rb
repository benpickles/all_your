require 'helper'
require 'uri'

describe AllYour::Base77 do
  it 'contains only URL-encodable characters' do
    chars = AllYour::Base77::CHARS.join('')
    assert_equal chars, URI.encode(chars)
  end

  it 'works' do
    assert_equal %('QJRv), AllYour::Base77::encode(123456789)
    assert_equal 123456789, AllYour::Base77::decode(%('QJRv))
  end
end
