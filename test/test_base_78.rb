require 'helper'
require 'uri'

describe AllYour::Base78 do
  it 'contains only URL-encodable characters' do
    chars = AllYour::Base78::CHARS.join('')
    assert_equal chars, URI.encode(chars)
  end

  it 'works' do
    assert_equal %('C0'D), AllYour::Base78::encode(123456789)
    assert_equal 123456789, AllYour::Base78::decode(%('C0'D))
  end

  it 'works again' do
    assert_equal %{-!o('NC1y}, AllYour::Base78::encode(12345678987654321)
    assert_equal 12345678987654321, AllYour::Base78::decode(%{-!o('NC1y})
  end

  it 'encodes a string of digits' do
    assert_equal %('C0'D), AllYour::Base78::encode('123456789')
  end

  it 'returns an empty string for a non-positive number' do
    assert_equal '', AllYour::Base78.encode(-999)
  end

  it 'likes slashes' do
    assert_equal 288757223154835410767515610539, AllYour::Base78.decode('/~path/2/nowhere')
  end
end
