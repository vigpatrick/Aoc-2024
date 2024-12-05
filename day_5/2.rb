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
  good = false

  update.each do |page|
    next if !rules[page].nil? && (rules[page] & printed).any?

    printed << page
  end

  # no need to get result if it's already good
  next if printed.count == update.count

  while printed.count != update.count
    printed = []
    update.each do |page|
      if !rules[page].nil? && (rules[page] & printed).any?
        rules_broken = rules[page] & printed
        first_that_break_rule = update.find { |a| rules_broken.include?(a) }

        # Swap value with the first that break the rule and the current page
        page_index = update.index(page)
        breaker_index = update.index(first_that_break_rule)
        update[page_index], update[breaker_index] = update[breaker_index], update[page_index]
        break
      end

      printed << page
    end
  end

  result += update[update.length / 2] if printed.count == update.count
end

p result
