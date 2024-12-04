
matches = []
result = 0

File.foreach("input") do |line|
  matches = line.scan(/mul\(\d{1,3},\d{1,3}\)/)
end

matches.each do |mul|
  num1, num2 = mul.gsub("mul(", "").gsub(")", "").split(",")

  result += num1.to_i * num2.to_i
end

p result
