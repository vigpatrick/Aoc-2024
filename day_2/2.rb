reports = []
count = 0

# Read the input file and process each line
File.foreach("input") do |line|
  reports << line.split
end

def validate(report)
  variations = report.each_cons(2).map {|pair| pair[0].to_i - pair[1].to_i}

  return 0 if variations.count {|n| n == 0} > 1

  return 1 if variations.all? { |n| n >= 1 && n <= 3 } || variations.all? { |n| n <= -1 && n >= -3 }

  return 0
end

reports.each do |report|
  result = validate(report)

  if result == 1
    count += 1
    next
  end

  (0..report.length-1).each do |i|
    new_report = report.dup
    new_report.delete_at(i)
    result = validate(new_report)
    if result == 1
      count += 1
      break
    end
  end
end

p count
