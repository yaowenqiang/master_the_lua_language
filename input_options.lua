txt = io.read('a') -- This reads "a"ll input fromthe stdin (ie. keyboard or whatever)
txt = io.read('all') -- This reads "a"ll input fromthe stdin (ie. keyboard or whatever)
print(txt)
txt = io.read('*a') -- same as above, also reds all input from stdin
print(txt)
txt = io.read('*n') -- This reads a number
print(txt)
txt = io.read('*l') -- Read an entire line from stdin（default when io.read() has no params)
print(txt)
txt = io.read(4) -- this reads 4 characters
print(txt)
a, b = io.read(4, 6) -- reads 4 and 6 characters and assign them to a ans b
print(a, b)
a, b = io.read('*n', "*n") -- reads two numbers ans assign them to a and b
print(a, b)

nubers = tonumber(io.read()) -- this reads 4 characters
