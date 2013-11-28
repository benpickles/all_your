require 'all_your/version'

class AllYour
  class EncodingError < StandardError; end

  Binary = %w(0 1).freeze

  # I *think* this represents the characters that can safely be in a path
  # without having to be encoded.
  #
  # <http://www.ietf.org/rfc/rfc3986.txt>
  Base78 = %w(
    A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
    a b c d e f g h i j k l m n o p q r s t u v w x y z
    0 1 2 3 4 5 6 7 8 9
    ! $ & ' ( ) * + , ; =
    - _ . ~
    /
  ).sort!.freeze

  def self.base(base)
    @bases.fetch(base)
  end

  def self.bases
    @bases ||= {}
  end

  def self.register(name, chars)
    bases[name] = new(chars)
  end

  def initialize(chars)
    @chars = chars
  end

  def decode(string)
    string.split(//).map { |char|
      chars.index(char)
    }.inject(0) { |id, i|
      id * size + i
    }
  end

  def encode(integer)
    integer = integer.to_i

    raise EncodingError if integer < 0

    string = ''

    if integer.zero?
      chars.first
    else
      string = ''

      while integer > 0
        integer, mod = integer.divmod(size)
        string = chars[mod] + string
      end

      string
    end
  end

  private
    attr_reader :chars

    def size
      @size ||= chars.size
    end
end

AllYour.register(:binary, AllYour::Binary)
AllYour.register(78, AllYour::Base78)
