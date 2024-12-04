
matches = []
parts = []
result = 0

# Read line and split to get all segment between do and don't
File.foreach("input") do |line|
  segments = line.split("don't()")

  segments.each do |segment|
    parts << segment.split("do()", 2)[1]
  end

  # add the first segment
  parts << line.split("don't()", 2)[0]
  parts = parts.compact
end

# find all mull in each parts
parts.each do |part|
  matches << part.scan(/mul\(\d{1,3},\d{1,3}\)/)
end

matches = matches.flatten

# Calcul the restult
matches.each do |mul|
  num1, num2 = mul.gsub("mul(", "").gsub(")", "").split(",")

  result += num1.to_i * num2.to_i
end

p result
