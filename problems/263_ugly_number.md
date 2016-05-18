# 263. Ugly Number
https://leetcode.com/problems/ugly-number/

Write a program to check whether a given number is an ugly number.

Ugly numbers are positive numbers whose prime factors only include 2, 3, 5. For example, 6, 8 are ugly while 14 is not ugly since it includes another prime factor 7.

Note that 1 is typically treated as an ugly number.

## Solutions
###[Ruby](./algorithms/263_ugly_number.rb)

```Ruby
# @param {Integer} num
# @return {Boolean}
def is_ugly(num)
  return false if num <= 0
  while num % 2 == 0 do
     num = num / 2
  end
  while num % 3 == 0 do
     num = num / 3
  end
  while num % 5 == 0 do
     num = num / 5
  end
  return num == 1
end
```
