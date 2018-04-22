module AllYour
  AllYourError = Class.new(StandardError)
  DecodingError = Class.new(AllYourError)
  EncodingError = Class.new(AllYourError)
end
