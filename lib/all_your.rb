require 'all_your/base'
require 'all_your/version'

module AllYour
  AllYourError = Class.new(StandardError)
  DecodingError = Class.new(AllYourError)
  EncodingError = Class.new(AllYourError)

  Binary = Base.new(%w(0 1))

  Base62 = Base.new(%w(
    0 1 2 3 4 5 6 7 8 9
    a b c d e f g h i j k l m n o p q r s t u v w x y z
    A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
  ))

  # I *think* this represents the characters that can safely be in a path
  # without having to be encoded.
  #
  # <http://www.ietf.org/rfc/rfc3986.txt>
  Base78 = Base.new(%w(
    A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
    a b c d e f g h i j k l m n o p q r s t u v w x y z
    0 1 2 3 4 5 6 7 8 9
    ! $ & ' ( ) * + , ; =
    - _ . ~
    /
  ).sort)

  # Crockford Base32
  #
  # This encoding scheme is designed to be:
  #   * human readable and machine readable
  #   * compact; humans have difficulty in manipulating long strings of arbitrary symbols
  #   * error resistant; entering the symbols must not require keyboarding gymnastics
  #   * pronounceable; humans should be able to accurately transmit the symbols to other
  #     humans using a telephone
  #
  # <http://www.crockford.com/wrmg/base32.html>
  CrockfordBase32 = Base.new(%w(
    0 1 2 3 4 5 6 7 8 9
    A B C D E F G H J K M N P Q R S T V W X Y Z
  )

  # <http://www.flickr.com/groups/api/discuss/72157616713786392>
  Flickr = Base.new(%w(
      1 2 3 4 5 6 7 8 9
    a b c d e f g h i j k   m n o p q r s t u v w x y z
    A B C D E F G H   J K L M N   P Q R S T U V W X Y Z
  ))
end
