class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    # Check if the string starts with the custom delimiter syntax
    if numbers.start_with?("//")
      delimiter, numbers = extract_delimiter_and_numbers(numbers)
      numbers = numbers.split(delimiter)  # Split the numbers by the delimiter(s)
    else
      # Split by commas and newlines for the default case
      numbers = numbers.split(/[\n,]/)
    end

    # Convert all numbers to integers and filter out those greater than 1000
    numbers.map(&:to_i).select { |num| num <= 1000 }.sum
  end

  private

  # Extract the custom delimiter(s) and numbers from the input string
  def extract_delimiter_and_numbers(input)
    # Get the delimiter line and the numbers part
    delimiter_line, numbers = input.split("\n", 2)
    
    # If there are multiple delimiters, handle them
    if delimiter_line.start_with?("//[")
      delimiters = delimiter_line[3..-1].split('][').map { |delim| delim.tr('[]', '') }  # Extract and clean the delimiters
      numbers = numbers.gsub(Regexp.union(delimiters), ',')  # Replace each delimiter with a comma
    else
      delimiters = delimiter_line[2..-1]  # Single delimiter
      numbers = numbers.gsub(delimiters, ',')  # Replace the single delimiter with commas
    end

    return ',', numbers  # Returning ',' because the delimiters are replaced by commas
  end
end
