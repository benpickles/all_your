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

  it 'works again' do
    assert_equal '-~9wMnVh$', AllYour::Base77::encode(12345678987654321)
    assert_equal 12345678987654321, AllYour::Base77::decode('-~9wMnVh$')
  end

  it 'encodes a string of digits' do
    assert_equal %('QJRv), AllYour::Base77::encode('123456789')
  end

  it 'returns an empty string for a non-positive number' do
    assert_equal '', AllYour::Base77.encode(-999)
  end
end
