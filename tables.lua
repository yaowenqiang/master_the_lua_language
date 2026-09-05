a = {1, 2, 3, 4}
print(a[1])
a[5] = 5
print(a[5])
a[6] = 'abc'
print(a[6])

a['new_item'] = 'new_item'
print(a['new_item'])

quiz_souces = {
    ['miles'] = 1.60934,
    ['feet'] = 0.3048,
    ['inches'] = 0.0254,
    ['yards'] = 0.9144
}
print(quiz_souces['miles'])
print(quiz_souces['feet'])
print(quiz_souces['inches'])
print(quiz_souces['yards'])

print(#a)
print(#quiz_souces)

quiz_souces[0] = 0
quiz_souces[6] = 6

for k, v in pairs(quiz_souces) do
    print("Inside the key: " .. k .. ", we have the Value: " .. v)
end

-- for i, v in ipairs(quiz_souces) do
--     print("Inside the index: " .. i .. ", we have the Value: " .. v)
-- end

quiz_souces2 = {
    miles = 1.60934,
    feet = 0.3048,
    inches = 0.0254,
    yards = 0.9144
}

for k, v in pairs(quiz_souces2) do
    print("Inside the key: " .. k .. ", we have the Value: " .. v)
end
quiz_souces2.feet = 0.3048
quiz_souces2[2] = 0.3048
print(quiz_souces2.feet)
