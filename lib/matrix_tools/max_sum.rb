require 'matrix'

class Matrix
  # Uses O(N^4) dynamic programming algorithm
  def max_sum
    # Field (row, column) of this array will contains the submatrix sum of (0, 0) to (row, column)
    sums = Array.new(row_size) { Array.new(column_size) { 0 } }

    (0...row_size).each do |row|
      (0...column_size).each do |column|
        sums[row][column] = element(row, column)

        sums[row][column] += sums[row - 1][column] if row > 0
        sums[row][column] += sums[row][column - 1] if column > 0

        # Make sure we don't count a submatrix double
        sums[row][column] -= sums[row - 1][column - 1] if row > 0 && column > 0
      end
    end

    # Go through all possible submatrices (which is O(N^4)) and calculate the sum
    # of that submatrix, which is O(1) by using the sums array created above
    best_sum = sums[0][0]
    (0...row_size).each do |start_row|
      (0...column_size).each do |start_column|
        (start_row...row_size).each do |end_row|
          (start_column...column_size).each do |end_column|
            subsum = sums[end_row][end_column]

            subsum -= sums[start_row - 1][end_column] if start_row > 0
            subsum -= sums[end_row][start_column - 1] if start_column > 0

            subsum += sums[start_row - 1][start_column - 1] if start_row > 0 && start_column > 0

            best_sum = [best_sum, subsum].max
          end
        end
      end
    end

    best_sum
  end
end
