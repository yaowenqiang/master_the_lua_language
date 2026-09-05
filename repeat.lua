local sum_scores = 0

local num_scores = 0

repeat
    print("Enter a number (or 0 to exit):")
    local score = tonumber(io.read("*n"))
    if score ~= 0 then
        sum_scores = sum_scores + score
        num_scores = num_scores + 1
    end
until score == 0

local average_score = sum_scores / num_scores
print("The average score is " .. average_score)

-- num = 1

-- repeat
--     print(num)
--     num = num + 1
-- until num > 10
