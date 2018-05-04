require 'helper'
require 'minitest/benchmark'

class BenchmarkAllYour < Minitest::Benchmark
  def self.bench_range
    Minitest::Benchmark.bench_exp(2, 128, 2)
  end

  def setup
    @base_lookup = {}
    @char_lookup = {}

    self.class.bench_range.each do |n|
      chars = (48...(48 + n)).map(&:chr)
      string = chars.join('')

      # Pre-generate a Base of size `n`.
      @base_lookup[n] = AllYour::Base.new(chars)

      # Pre-generate a 128 character string containing only the Base's chars.
      @char_lookup[n] = string.rjust(128, string)
    end
  end

  def bench_decode
    assert_performance_linear 0.9 do |n|
      base = @base_lookup[n]
      string = @char_lookup[n]

      (n * 100).times do
        base.decode(string)
      end
    end
  end

  def bench_encode
    assert_performance_linear 0.9 do |n|
      base = @base_lookup[n]

      (n * 10_000).times do
        base.encode(1234567890987654321)
      end
    end
  end
end
