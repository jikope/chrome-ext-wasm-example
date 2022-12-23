CC=clang
.PHONY: clean all
all: main.wasm
clean:
	rm -frv *.o *.wasm
main.o: main.c
	${CC} -Wall -Wextra -Wswitch-enum -c main.c
main.wasm: main.o
	${CC} -Os -fno-builtin -Wall -Wextra -Wswitch-enum --target=wasm32 --no-standard-libraries -Wl,--export=square_from_wasm -Wl,--no-entry -Wl,--allow-undefined -o main.wasm main.c

