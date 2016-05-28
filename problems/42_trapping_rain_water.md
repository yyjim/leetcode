##42. Trapping Rain Water
https://leetcode.com/problems/trapping-rain-water/

Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.

For example,
Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6.

![rain_water_trap]http://www.leetcode.com/wp-content/uploads/2012/08/rainwatertrap.png

The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!

## Solutions
###[Ruby](./algorithms/42_trapping_rain_water.rb)

```ruby
# @param {Integer[]} height
# @return {Integer}

def calculate_amount(height)
    heighest = height[0]
    amount = 0
    tmp_amount = 0
    height.each do |h|
       if h >= heighest
           amount += tmp_amount
           tmp_amount = 0
           heighest = h
       else
           tmp_amount += heighest - h
       end
    end
    return amount
end

def trap(height)
    heighest = height[0]
    traps = []
    trap = []
    height.each do |h|
      if h >= heighest && trap.size > 0
        heighest = h
        trap << h
        traps << trap if trap.size >= 3
        trap = [h]
      else
        trap << h
      end
    end
    traps << trap  if trap.size >= 3

    amount = 0
    traps.each do |trap|
        if trap[0] > trap[trap.size - 1]
            amount += calculate_amount(trap.reverse)
        else
            amount += calculate_amount(trap)
        end
    end
    return amount
end
```
