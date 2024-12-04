grid = []
result = 0

File.foreach("input") do |line|
  grid << line.chars
end

def search_xmas(grid, row, col)
  total = 0
  (-1..1).each do |i|
    (-1..1).each do |j|
      next if i == 0 and j == 0
      next if row + i*3 < 0 || col + j*3 < 0
      begin
        total += 1 if "#{grid[row][col]}#{grid[row + i][col + j]}#{grid[row + i*2][col + j*2]}#{grid[row + i*3][col + j*3]}" == "XMAS"
      rescue
        next
      end
    end
  end

  return total
end

grid.each_with_index do |row, i|
  indices = row.map.with_index { |element, index| index if element == "X" }.compact

  indices.each do |x|
    result += search_xmas(grid, i, x)
  end
end

p result
