# 239. Sliding Window Maximum
https://leetcode.com/problems/sliding-window-maximum/

Given an array nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.

For example,
Given nums = [1,3,-1,-3,5,3,6,7], and k = 3.
Therefore, return the max sliding window as [3,3,5,5,6,7].

Note: 
You may assume k is always valid, ie: 1 ≤ k ≤ input array's size for non-empty array.

## Solutions
### [Ruby](../algorithms/ruby/239_sliding-window-maximum.rb)

```ruby
def max_sliding_window(nums, k)
    return [] if k == 0 || nums.count == 0
    window = nums[0...k]
    max = window.max
    result = [max]
    (0...nums.count - k).each do |i|
        shift_num = window.shift
        next_num  = nums[i+k]
        window.push next_num
        if max == shift_num 
            max = window.max #TODO fix it later
        elsif next_num > max
            max = next_num
        end
        result << max
    end
    return result
end
```

