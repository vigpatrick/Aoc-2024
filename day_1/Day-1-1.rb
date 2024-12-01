list_a = []
list_b = []

# Read the input file and process each line
File.foreach("input") do |line|
  num1, num2 = line.split.map(&:to_i)
  list_a << num1
  list_b << num2
end

# Sort the lists
list_a.sort!
list_b.sort!

# Calculate the sum of absolute differences
result = list_a.zip(list_b).sum { |a, b| (a - b).abs }

# Print the result
p result
