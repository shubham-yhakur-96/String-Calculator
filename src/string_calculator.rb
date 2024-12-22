class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    # Split by commas, convert to integers, and sum
    numbers.split(',').map(&:to_i).sum
  end
end
