class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    # Replace newlines with commas
    numbers = numbers.gsub("\n", ",")

    # Split by commas, convert to integers, and sum
    numbers.split(',').map(&:to_i).sum
  end
end
