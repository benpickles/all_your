require 'all_your/version'

module AllYour
  CHARS = %w(
    A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
    a b c d e f g h i j k l m n o p q r s t u v w x y z
    0 1 2 3 4 5 6 7 8 9 - _ . ~
  ).sort.freeze

  BASE = CHARS.size

  def self.decode(string)
    string.split(//).map { |char|
      CHARS.index(char)
    }.inject(0) { |id, i|
      id * BASE + i
    }
  end

  def self.encode(integer)
    integer = integer.to_i
    string = ''

    while integer > 0
      integer, m = integer.divmod(BASE)
      string = CHARS[m] + string
    end

    string
  end
end
