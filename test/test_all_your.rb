require 'helper'
require 'uri'

describe AllYour do
  describe 'generally' do
    let(:base) { AllYour::Base.new(chars) }
    let(:chars) { %w(q w e r t y u i o p) }

    it 'works' do
      assert_equal 'q', base.encode(0)
      assert_equal 'w', base.encode(1)
      assert_equal 'e', base.encode(2)
      assert_equal 'r', base.encode(3)
      assert_equal 't', base.encode(4)
      assert_equal 'y', base.encode(5)
      assert_equal 'u', base.encode(6)
      assert_equal 'i', base.encode(7)
      assert_equal 'o', base.encode(8)
      assert_equal 'p', base.encode(9)
      assert_equal 'wq', base.encode(10)
      assert_equal 'pp', base.encode(99)
    end

    it 'really works' do
      assert_equal 'wertyuiop', base.encode(123456789)
      assert_equal 123456789, base.decode('qwertyuiop')
    end

    it 'really really works' do
      assert_equal 'wertyuiopoiuytrew', base.encode(12345678987654321)
      assert_equal 12345678987654321, base.decode('wertyuiopoiuytrew')
    end

    it 'blows up for a negative number' do
      assert_raises AllYour::EncodingError do
        base.encode(-999)
      end
    end

    it 'blows up for an unsupported character' do
      assert_raises AllYour::EncodingError do
        base.decode('z')
      end
    end
  end

  describe 'Binary' do
    let(:base) { AllYour::Binary }

    it do
      assert_equal    '0', base.encode(0)
      assert_equal    '1', base.encode(1)
      assert_equal   '10', base.encode(2)
      assert_equal   '11', base.encode(3)
      assert_equal  '100', base.encode(4)
      assert_equal  '101', base.encode(5)
      assert_equal  '110', base.encode(6)
      assert_equal  '111', base.encode(7)
      assert_equal '1000', base.encode(8)
      assert_equal '1001', base.encode(9)
      assert_equal '1010', base.encode(10)
    end
  end

  describe 'Base62' do
    let(:base) { AllYour::Base62 }

    it do
      assert_equal '8m0Kx', base.encode(123456789)
      assert_equal 123456789, base.decode('8m0Kx')
    end
  end

  describe 'Base78' do
    let(:base) { AllYour::Base78 }

    it 'contains only URL-encodable characters' do
      string = base.send(:chars).join('')
      assert_equal string, URI.encode(string)
    end

    it 'likes slashes' do
      assert_equal 288757223154835410767515610539, base.decode('/~path/2/nowhere')
    end
  end

  describe 'CrockfordBase32' do
    let(:base) { AllYour::CrockfordBase32 }

    it do
      assert_equal '3NQK8N', base.encode(123456789)
      assert_equal 123456789, base.decode('3NQK8N')
    end
  end

  describe 'Flickr' do
    let(:base) { AllYour::Flickr }

    it do
      assert_equal 'c3Nyn3', base.encode(7251641460)
      assert_equal 7251641460, base.decode('c3Nyn3')
    end
  end
end
