require 'test/unit'
require 'stringio'
require './fizzbuzz'

# Test case for FizzBuzz class
class TestFizzBuzz < Test::Unit::TestCase
  def setup
    ARGV[0] = 15
    @fizz_buzz = FizzBuzz.new
    @ans = [1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz', 11, 'Fizz', 13, 14, 'FizzBuzz']
  end

  def test_fizzbuzz
    (1..15).each { |n| assert_equal(@ans[n - 1], @fizz_buzz.fizzbuzz(n)) }
  end

  def test_map_upto
    assert_equal(@ans, @fizz_buzz.map_upto(15, @fizz_buzz.method(:fizzbuzz)))
  end

  def test_console
    $stdout = op = StringIO.new('', 'w')
    result = ->(max) { @fizz_buzz.map_upto(max, @fizz_buzz.method(:fizzbuzz)) }
    @fizz_buzz.console(result)
    out = str2fizzbuzz_list(op.string)
    assert_equal(@ans, out)
  ensure
    $stdout = STDOUT
  end

  def str2fizzbuzz_list(str)
    str.split.map { |n| n =~ /(Fi|Bu)zz/ ? n : n.to_i }
  end
end
