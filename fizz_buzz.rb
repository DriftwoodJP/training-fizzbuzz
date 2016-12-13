#
# Class FizzBuzz
#
class FizzBuzz
  # 1 つの数を取って FizzBuzz の結果を返す関数
  def fizzbuzz(num)
    str = ''
    str << 'Fizz' if (num % 3).zero?
    str << 'Buzz' if (num % 5).zero?
    str.empty? ? num : str
  end

  # 1 から max_num までの数をその関数に適用する関数
  def map_upto(max_num, fnc)
    (1..max_num).map { |n| fnc[n] }
  end

  # スクリプト引数 max_num を map_upto 関数に与えて結果をターミナルに出力する関数
  def console(fnc)
    raise 'need an argument of integer' if ARGV[0].nil?
    max_num = ARGV[0].to_i
    fnc[max_num].each { |e| puts e }
  end
end

# require 時には呼ばれない
if __FILE__ == $PROGRAM_NAME
  @fizz_buzz = FizzBuzz.new
  result = ->(max) { @fizz_buzz.map_upto(max, @fizz_buzz.method(:fizzbuzz)) }
  @fizz_buzz.console(result)
end
