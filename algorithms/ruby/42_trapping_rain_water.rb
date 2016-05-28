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
