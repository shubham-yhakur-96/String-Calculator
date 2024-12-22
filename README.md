
Code Explanation

StringCalculator Class

- The StringCalculator class has a method called add that accepts a string containing numbers. The method processes the string to return the sum of the numbers, considering different delimiter formats.

Run Tests:

- Now you can run the tests using RSpec. To run all the tests, use the following command:
- Prerequisites: Ensure you have RSpec installed. If it's not installed, run the following command: gem install rspec
-  To run all the tests in the spec folder, use the following command: rspec spec/string_calculator_spec.rb

Key Features:

- Empty string: If the input string is empty, the method returns 0.
- Single number: If the string contains just one number, it returns that number.
- Comma-separated numbers: The default behavior is to split numbers by commas and return their sum.
- Newline-separated numbers: The string can contain newlines between numbers, and they are treated the same as commas.
- Custom delimiters: Custom delimiters can be defined at the start of the string, using a format like //[delimiter], and the string will be split by the specified delimiter(s).
- Numbers greater than 1000: Numbers greater than 1000 are ignored in the sum.
- StringCalculator#add Method
- The method first checks if the string starts with a custom delimiter declaration (using //).
- If a custom delimiter is provided, the method extracts it and uses it to split the numbers.
- If no custom delimiter is provided, it defaults to splitting the string by commas and newlines.
- The method then filters out any numbers greater than 1000 and returns the sum of the remaining numbers.
