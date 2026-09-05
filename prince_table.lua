prince_table = {{
    page = 1,
    line = 2,
    word = 2,
    code = 'w'
}, {
    page = 1,
    line = 2,
    word = 2,
    code = 'w'
}, {
    page = 1,
    line = 2,
    word = 2,
    code = 'w'
}, {
    page = 1,
    line = 2,
    word = 2,
    code = 'w'
}, {
    page = 1,
    line = 2,
    word = 2,
    code = 'w'
}, {
    page = 1,
    line = 2,
    word = 2,
    code = 'w'
}, {
    page = 1,
    line = 2,
    word = 2,
    code = 'w'
}, {
    page = 1,
    line = 2,
    word = 2,
    code = 'w'
}, {
    page = 1,
    line = 2,
    word = 2,
    code = 'w'
}, {
    page = 1,
    line = 2,
    word = 2,
    code = 'w'
}}

print("What is the Page you are looking for?")
local page_input = io.read("*n")

print("What is the Line you are looking for?")

local line_input = io.read("*n")

print("What is the Word you are looking for?")

local word_input = io.read("*n")

for i = 1, #prince_table do
    if prince_table[i].page == page_input and prince_table[i].line == line_input and prince_table[i].word == word_input then
        print("The code for the page, line, and word you are looking for is: " .. prince_table[i].code)
        break
    end
end
