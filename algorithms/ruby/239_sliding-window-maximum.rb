# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
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