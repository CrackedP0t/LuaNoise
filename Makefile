CC=g++
CFLAGS=-c -fPIC
LFLAGS=-shared

SOURCES=$(wildcard src/*.cpp)
OBJECTS=$(SOURCES:.cpp=.o)
LIBRARY=noise.so

all: $(LIBRARY)

$(LIBRARY): libnoise $(OBJECTS)
	$(CC) $(LFLAGS) noise/src/*.o noise/src/module/*.o noise/src/model/*.o $(OBJECTS) -o $@

libnoise:
	cd noise/ && $(MAKE) src

.cpp.o:
	$(CC) $(CFLAGS) -Iinclude/ -Inoise/include $< -o $@

clean:
	rm -f src/*_gen.cpp
	rm -f include/*_gen.hpp
	rm -f noise.so
	rm -f src/*.o
	cd noise/ && $(MAKE) cleansrc
