rules = {}
updates = []
reading_rules = true
result = 0

File.foreach("input") do |line|
  if line.chomp == ""
    reading_rules = false
    next
  end

  if reading_rules
    page1, page2 = line.chomp.split("|").map(&:to_i)

    if rules[page1].nil?
      rules[page1] = [page2]
    else
      rules[page1] << page2
    end

  else
    updates << line.chomp.split(",").map(&:to_i)
  end
end

updates.each do |update|
  printed = []

  update.each do |page|
    next if !rules[page].nil? && (rules[page] & printed).any?

    printed << page
  end

  result += update[update.length / 2] if printed.count == update.count
end

p result
