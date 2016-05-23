# 329. Longest Increasing Path in a Matrix
https://leetcode.com/problems/longest-increasing-path-in-a-matrix/

Given an integer matrix, find the length of the longest increasing path.

From each cell, you can either move to four directions: left, right, up or down. You may NOT move diagonally or move outside of the boundary (i.e. wrap-around is not allowed).

Example 1:

nums = [
  [9,9,4],
  [6,6,8],
  [2,1,1]
]
Return 4
The longest increasing path is [1, 2, 6, 9].

Example 2:

nums = [
  [3,4,5],
  [3,2,6],
  [2,2,1]
]
Return 4
The longest increasing path is [3, 4, 5, 6]. Moving diagonally is not allowed.

## Solutions
###[Ruby](./algorithms/329_longest_increasing_path_in_a_matrix.rb)

```Ruby
# @param {Integer[][]} matrix
# @return {Integer}

def longest_increasing_path(matrix)
  if matrix == nil || matrix.size < 1 || matrix[0].size < 1
    return 0
  end

  longest_path = 0
  num_rows = matrix.size
  num_cols = matrix[0].size
  # create same dimension matrix for caching path result
  path_matrix = Array.new(num_rows) { Array.new(num_cols, 0) }
  for row in 0...num_rows
    for col in 0...num_cols
        longest_path = [dfs_path(matrix, -1, row, col, path_matrix), longest_path].max
    end
  end
  return longest_path
end

# @return {Integer} longest path number start at [row][col]
def dfs_path(matrix, num, row, col, path_matrix)
  if matrix[row][col] <= num
    return 0
  end
  # Return value from cache
  if path_matrix[row][col] != 0
    return path_matrix[row][col]
  end

  num_rows = matrix.size
  num_cols = matrix[0].size
  curNum = matrix[row][col]
  longest_path = 1
  # Search U,D,L,R directions
  # Up
  if row - 1 >= 0
    longest_path = [1 + dfs_path(matrix, curNum, row - 1, col, path_matrix), longest_path].max
  end
  # Down
  if row + 1 < num_rows
    longest_path = [1 + dfs_path(matrix, curNum, row + 1, col, path_matrix), longest_path].max
  end
  # Left
  if col - 1 >= 0
    longest_path = [1 + dfs_path(matrix, curNum, row, col - 1, path_matrix), longest_path].max
  end
  # Right
  if col + 1 < num_cols
    longest_path = [1 + dfs_path(matrix, curNum, row, col + 1, path_matrix), longest_path].max
  end

  # Cache the longest_path for current [row][col]
  path_matrix[row][col] = longest_path
  return longest_path;
end
```
