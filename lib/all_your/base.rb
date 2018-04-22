require 'all_your/errors'

module AllYour
  class Base
    attr_reader :chars

    def initialize(chars)
      @chars = chars
    end

    def decode(string)
      string.split(//).map { |char|
        raise DecodingError.new("could not decode character: #{char}") unless chars.include?(char)
        chars.index(char)
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

    private
      def size
        @size ||= chars.size
      end
  end
end
