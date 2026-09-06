.PHONY: build run runex clean lua_examples main

build: lua_examples main

lua_examples:
	gcc -std=c99 -Wall ./lib/lua/src/*.c ./src/lua_examples.c -o lua_examples

main:
	gcc -std=c99 -Wall -I/opt/homebrew/include -L/opt/homebrew/lib ./lib/lua/src/*.c ./src/main.c -lSDL2 -o main

run: main
	./main

runex: lua_examples
	./lua_examples

clean:
	rm -f main lua_examples
