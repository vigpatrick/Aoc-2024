grid = []
result = 0

File.foreach("input") do |line|
  grid << line.chars
end

def search_xmas(grid, row, col)
  return 0 if row == 0 || col == 0

  begin
    return 0 unless ["SAM", "MAS"].include?("#{grid[row - 1][col - 1]}#{grid[row][col]}#{grid[row + 1][col + 1]}")

    return 1 if ["SAM", "MAS"].include?("#{grid[row - 1][col + 1]}#{grid[row][col]}#{grid[row + 1][col - 1]}")
  rescue
    return 0
  end

  return 0
end

grid.each_with_index do |row, i|
  indices = row.map.with_index { |element, index| index if element == "A" }.compact

  indices.each do |a|
    result += search_xmas(grid, i, a)
  end
end

p result
