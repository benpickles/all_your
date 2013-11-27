require 'helper'
require 'uri'

describe AllYour do
  let(:chars) { %w(q w e r t y u i o p) }
  let(:base) { AllYour.base(chars.size) }

  before do
    AllYour.register(chars)
  end

  after do
    AllYour.bases.delete(chars.size)
  end

  it 'works' do
    assert_equal 'wertyuiop', base.encode(123456789)
    assert_equal 123456789, base.decode('wertyuiop')
  end

  it 'works again' do
    assert_equal 'wertyuiopoiuytrew', base.encode(12345678987654321)
    assert_equal 12345678987654321, base.decode('wertyuiopoiuytrew')
  end

  it 'encodes a string of digits' do
    assert_equal 'wertyuiop', base.encode('123456789')
  end

  it 'returns an empty string for a non-positive number' do
    assert_equal '', base.encode(-999)
  end

  describe 'base 78' do
    let(:base) { AllYour.base(78) }

    it 'contains only URL-encodable characters' do
      chars = base.send(:chars).join('')
      assert_equal chars, URI.encode(chars)
    end

    it 'likes slashes' do
      assert_equal 288757223154835410767515610539, base.decode('/~path/2/nowhere')
    end
  end
end
