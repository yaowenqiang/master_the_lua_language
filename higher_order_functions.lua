students = {{
    name = "John",
    grade = 90
}, {
    name = "Jane",
    grade = 85
}, {
    name = "Bob",
    grade = 95
}, {
    name = "Alice",
    grade = 80
}}

table.sort(students, function(a, b)
    return a.grade > b.grade
end)

for k, v in pairs(students) do
    print(v.name, v.grade)
end
