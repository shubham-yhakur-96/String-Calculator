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
  end
end
