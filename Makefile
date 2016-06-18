all: gen objects

gen:
	lua5.1 generator/generate.lua

objects:
	cd noise/ && $(MAKE) src
	g++ -shared -fPIC noise/src/*.o noise/src/module/*.o noise/src/model/*.o src/*.cpp -Iinclude/ -Inoise/include -o noise.so -Wall -Wno-reorder -Wno-unused-function -Wno-unused-variable -Wno-return-type -Wno-delete-non-virtual-dtor

clean:
	rm -f src/*_gen.cpp
	rm -f include/*_gen.hpp
	rm -f noise.so
	cd noise/ && $(MAKE) cleansrc
