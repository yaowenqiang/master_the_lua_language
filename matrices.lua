local M = {{3.4, 2.0, 2.0}, {-3.5, 3.3, 0.5}, {0.1, 0.3, 3.3}}

print("Matrix M:")
for i = 1, #M do
    for j = 1, #M[i] do
        io.write(M[i][j] .. " ")
    end
    print()
end

local mat = {}

for i = 1, N do
    mat[i] = {}
    for j = 1, M do
        mat[i][j] = 0
    end
end
