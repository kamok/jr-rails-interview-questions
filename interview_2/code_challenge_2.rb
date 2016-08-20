# Implement: public void dilate(int[][] grid)

# Given a square 2D array of integers with the value 0 or 1 (represented in the grid below by blank or 1),
# Dilate the grid so that anything adjacent to a 1 will also be a 1. In the example below, grid 1 is the input and grid 2 is the same grid after being passed as an argument to dilate. Grid 3 shows the changes as *s.

# int [][] grid:      dilate(grid):     New Points as (*)
#  _ _ _ _ _ _ _ _  _ _ _ _ _ _ _ _   _ _ _ _ _ _ _ _
# |_|_|_|_|_|_|_|_|   |_|_|_|_|_|_|_|_|   |_|_|_|_|_|_|_|_|
# |_|_|_|_|_|_|_|_|   |_|_|_|1|_|_|3_|_|   |_|_|_|*|_|_|_|_|
# |_|_|_|1|_|_|_|_|   |_|_|1|1|1|_|_|_|   |_|_|*|1|*|_|_|_|
# |_|_|_|_|1|_|_|_|   |_|_|1|1|1|1|_|_|   |_|_|*|*|1|*|_|_|
# |_|_|1|_|_|_|_|_|   |_|1|1|1|1|_|_|_|   |_|*|1|*|*|_|_|_|
# |_|_|_|_|_|_|_|_|   |_|_|1|_|_|_|_|_|   |_|_|*|_|_|_|_|_|
# |_|_|_|_|_|_|_|_|   |_|_|_|_|_|_|_|_|   |_|_|_|_|_|_|_|_|


# [[0,0,0,0],[0,1,0,0],[0,0,0,1]]

def dilate(2d_array)
  index_to_change = [[0,0]]
  2d_array.count.times do |row|
    2d_array[i].count.times do |col|
      index_to_change << [row,col] if 2d_array[row][col] == 1
    end
  end

  right_edge_of_board = 2d_array[0].count + 1
  bottom_edge_of_board = 2d_array.count + 1
  
  row_adjacent = []
  index_to_change.each do |pair|
    row = pair[0]
    col = pair[1]
    row_adjacent << [row + 1, col]
    row_adjacent << [row - 1, col]
  end

  row_adjacent.delete_if { |pair| pair[0] <= -1 || pair[1] >= right_edge_of_board }

  col_adjacent = []
  index_to_change.each do |pair|
    row = pair[0]
    col = pair[1]
    col_adjacent << [row, col + 1]
    col_adjacent << [row, col - 1]
  end

  col_adjacent.delete_if { |pair| pair[1] <= -1 || pair[1] > bottom_edge_of_board }

  values_to_change = row_adjacent + col_adjacent

  values_to_change.each do |pair|
    row, col = pair[0], pair[1]
    2d_array[row][col] = 1
  end

  2d_array
end