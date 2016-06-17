all: gen objects

gen:
	lua5.1 generator/generate.lua

objects:
	g++ -shared -fPIC -Wall src/*.cpp -Iinclude/ -o noise.so -lnoise -Wno-reorder -Wno-unused-function -Wno-unused-variable -Wno-return-type -Wno-delete-non-virtual-dtor

clean:
	rm src/*
	rm include/*
	rm bin/*
