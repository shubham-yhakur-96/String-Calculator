require 'rspec'
RSpec.describe StringCalculator do
  describe '#add' do
    context 'when the string is empty' do
      it 'returns 0' do
        calculator = StringCalculator.new
        expect(calculator.add('')).to eq(0)
      end
    end
  end
end
