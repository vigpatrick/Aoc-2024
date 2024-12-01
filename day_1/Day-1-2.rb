list_a = []
list_b = Hash.new(0)

# Read the input file and process each line
File.foreach("input") do |line|
  num1, num2 = line.split.map(&:to_i)

  list_a << num1
  list_b[num2] += 1
end

# Calculate the sum
result = list_a.sum { |a| a * list_b[a] }

# Print the result
p result
