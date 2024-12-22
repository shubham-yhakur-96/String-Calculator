
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    # Check if the string starts with the custom delimiter syntax
    if numbers.start_with?("//")
      delimiter, numbers = extract_delimiter_and_numbers(numbers)
      numbers = numbers.split(delimiter)
    else
      # Split by commas and newlines for the default case
      numbers = numbers.split(/[\n,]/)
    end

    # Convert all numbers to integers and sum them
    numbers.map(&:to_i).sum
  end

  private

  # Extract the custom delimiter and numbers from the input string
  def extract_delimiter_and_numbers(input)
    # Get the delimiter from the first line (e.g., "//;\n1;2")
    delimiter_line, numbers = input.split("\n", 2)
    delimiter = delimiter_line[2..-1]  # Remove the "//" part
    delimiter = delimiter.start_with?('[') ? delimiter[1..-2] : delimiter  # Handle multi-character delimiters
    return delimiter, numbers
  end
end
