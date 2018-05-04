require 'all_your/errors'

module AllYour
  class Base
    attr_reader :chars, :lookup, :size

    def initialize(chars)
      @chars = chars
      @lookup = chars.each_with_object({}).with_index { |(char, memo), index|
        memo[char] = index
      }
      @size = chars.size
    end

    def decode(string)
      string.chars.map { |char|
        lookup.fetch(char) { |key|
          raise DecodingError.new("could not decode character: #{key}")
        }
      }.inject(0) { |id, i|
        id * size + i
      }
    end

    def encode(integer)
      integer = integer.to_i

      raise EncodingError if integer < 0

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
  end
end
