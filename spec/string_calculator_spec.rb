require 'rspec'
require_relative '../src/string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    context 'when the string is empty' do
      it 'returns 0' do
        calculator = StringCalculator.new
        expect(calculator.add('')).to eq(0)
      end
    end

    context 'when the string contains a single number' do
      it 'returns the number itself' do
        calculator = StringCalculator.new
        expect(calculator.add('1')).to eq(1)
      end
    end

    context 'when the string contains numbers separated by commas' do
      it 'returns the sum of the numbers' do
        calculator = StringCalculator.new
        expect(calculator.add("1,2,3")).to eq(6)  # 1 + 2 + 3 = 6
      end
    end

    context 'when the string contains numbers separated by newlines and commas' do
      it 'returns the sum of the numbers, allowing newlines between them' do
        calculator = StringCalculator.new
        expect(calculator.add("1\n2,3")).to eq(6)  # 1 + 2 + 3 = 6
      end
    end

    context 'when the string contains numbers with a custom delimiter' do
      it 'returns the sum of the numbers using the custom delimiter' do
        calculator = StringCalculator.new
        expect(calculator.add("//;\n1;2;3")).to eq(6)  # 1 + 2 + 3 = 6 with delimiter ;
      end

      it 'returns the sum of the numbers with a multi-character custom delimiter' do
        calculator = StringCalculator.new
        expect(calculator.add("//#\n1#2#3")).to eq(6)  # 1 + 2 + 3 = 6 with delimiter #
      end
    end

    context 'when the string contains numbers greater than 1000' do
      it 'ignores numbers greater than 1000' do
        calculator = StringCalculator.new
        expect(calculator.add("1,2,1001,3,4")).to eq(10)  # 1001 should be ignored, sum = 1 + 2 + 3 + 4 = 10
      end
    end

    context 'when the string contains multiple custom delimiters' do
      it 'returns the sum of the numbers using all custom delimiters' do
        calculator = StringCalculator.new
        expect(calculator.add("//[*][%]\n5*2%3*4")).to eq(14)  # 5 + 2 + 3 + 4 = 14 with delimiters * and %
      end
    end

    context 'when the string contains multiple custom delimiters of different lengths' do
      it 'returns the sum of the numbers using all custom delimiters' do
        calculator = StringCalculator.new
        expect(calculator.add("//[***][%%]\n1***2%%3")).to eq(6)  # 1 + 2 + 3 = 6 with delimiters *** and %%
      end
    end

    context 'when the string contains a custom delimiter of any length' do
      it 'returns the sum of the numbers using the custom delimiter' do
        calculator = StringCalculator.new
        expect(calculator.add("//[***]\n1***2***3")).to eq(6)  # 1 + 2 + 3 = 6 with delimiter ***
      end
    end
  end
end
