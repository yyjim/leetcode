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
