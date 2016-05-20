# @param {Integer[]} nums
# @return {Integer}
def find_min_loop(nums)
    min = v = nums[0]
    i = 1
    while i < nums.size do
        cur = nums[i]
        if cur < v
            return cur
        end
        v = cur
        i += 1
    end
    return min
end

#binary search
def find_min_binary_search(nums)
    left = 0
    right = nums.size - 1
    while left < right
        mid = (left + right) / 2
        if nums[mid] < nums[right]
            right = mid
        else
            left = mid + 1
        end
    end
    return nums[right]
end

def find_min(nums)
    # find_min_loop(nums)
    find_min_binary_search(nums)
end
