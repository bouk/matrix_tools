require 'matrix'

class Matrix
  # Uses O(N^4) dynamic programming algorithm
  def max_sum
    # Field (row, column) of this array will contains the sum of all fields in the rows above it in the same column
    sums = Array.new(row_size) { Array.new(column_size) { 0 } }

    (0...row_size).each do |row|
      (0...column_size).each do |column|
        sums[row][column] = element(row, column)
        sums[row][column] += sums[row - 1][column] if row > 0
      end
    end

    # Use Kadan's algorithm to arrive at a O(N^3) submatrix algorithm
    best_sum = sums[0][0]
    (-1...row_size).each do |start_row|
      (start_row...row_size).each do |end_row|
        current_sum = sums[end_row][0] - (if start_row == -1 then 0 else sums[start_row][0] end)
        subrows_best_sum = current_sum

        (1...column_size).each do |column|
          subsum = sums[end_row][column] - (if start_row == -1 then 0 else sums[start_row][column] end)
          current_sum = [subsum + current_sum, subsum].max
          subrows_best_sum = [subrows_best_sum, current_sum].max
        end

        best_sum = [best_sum, subrows_best_sum].max
      end
    end

    best_sum
  end
end
