require_relative '../fizz_buzz'

describe FizzBuzz do
  before do
    ARGV[0] = 15
  end
  let(:fizz_buzz) { described_class.new }
  let(:ans) { [1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz', 11, 'Fizz', 13, 14, 'FizzBuzz'] }

  describe '#fizzbuzz' do
    it '' do
      (1..15).each { |n| expect(fizz_buzz.fizzbuzz(n)).to eq(ans[n - 1]) }
    end
  end

  describe '#map_upto' do
    let(:result) { fizz_buzz.map_upto(15, fizz_buzz.method(:fizzbuzz)) }

    it '' do
      expect(result).to eq(ans)
    end
  end

  describe '#console' do
    let(:result) { fizz_buzz.console(->(max) { fizz_buzz.map_upto(max, fizz_buzz.method(:fizzbuzz)) }) }
    let(:out) { "1\n2\nFizz\n4\nBuzz\nFizz\n7\n8\nFizz\nBuzz\n11\nFizz\n13\n14\nFizzBuzz\n" }

    it '' do
      expect { result }.to output(out).to_stdout
    end
  end
end
