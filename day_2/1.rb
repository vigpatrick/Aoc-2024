reports = []
count = 0

# Read the input file and process each line
File.foreach("input") do |line|
  reports << line.split
end

reports.each do |report|
  p report
  variations = report.each_cons(2).map {|pair| pair[0].to_i - pair[1].to_i}

  next if variations.include?(0)

  count += 1 if variations.all? { |n| n >= 1 && n <= 3 } || variations.all? { |n| n <= -1 && n >= -3 }
end

p count
