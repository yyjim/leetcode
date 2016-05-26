##62. Unique Paths
https://leetcode.com/problems/unique-paths/

A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

How many possible unique paths are there?

![robot_maze](http://leetcode.com/wp-content/uploads/2014/12/robot_maze.png)

Above is a 3 x 7 grid. How many possible unique paths are there?

Note: m and n will be at most 100.

## Solutions
###[Ruby](./algorithms/62_unique_paths.rb)

```Ruby
# @param {Integer} m
# @param {Integer} n
# @return {Integer}

$cache = {}

def unique_paths(m, n)
    return 0 if m == 0 || n == 0
    return 1 if m == 1 || n == 1

    v1 = $cache["#{m}x#{n-1}"] ||= unique_paths(m, n-1)
    v2 = $cache["#{m-1}x#{n}"] ||= unique_paths(m-1, n)
    return v1 + v2
end
```
