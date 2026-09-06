-- varidic functions 可变参数函数
-- Lua 5.0
function add(...)
    local s = 0
    for i, v in ipairs {...} do
        s = s + v
    end
    return s
end

print(add(1, 2, 3, 4, 5)) -- 15
print(add(1, 2, 3)) -- 6

-- Lua 5.1
-- function add(...)
--     local s = 0
--     for i, v in ipairs{...} do
--         s = s + v

function find_max(...)
    local max = nil
    local n = 0
    local arguments = {...}
    local max = arguments[1]
    for i, num in ipairs(arguments) do
        if num > max then
            max = num
        end
        n = n + 1
    end
    return n, max
end

local n, max = find_max(1, 22, 3, 4, 5)
print("The maximum out of " .. n .. " values is: " .. max) -- The maximum out of 5 numbers is: 5
