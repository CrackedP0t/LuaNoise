CC=g++
CFLAGS=-c
LFLAGS=-shared
LIBS=

SOURCES=$(wildcard src/*.cpp)
OBJECTS=$(SOURCES:.cpp=.o)
LIBRARY=noise.so

ifeq ($(OS),Windows_NT)
LIBRARY=noise.dll
LIBS+= -L/mingw64/bin -llua51
else
CFLAGS+= -fPIC
endif

all: $(LIBRARY)

$(LIBRARY): libnoise $(OBJECTS)
	$(CC) $(LFLAGS) noise/src/*.o noise/src/module/*.o noise/src/model/*.o $(OBJECTS) $(LIBS) -o $@

libnoise:
	cd noise/ && $(MAKE) src

.cpp.o:
	$(CC) $(CFLAGS) -Iinclude/ -Inoise/include/ $< -o $@

clean:
	rm -f src/*_gen.cpp
	rm -f include/*_gen.hpp
	rm -f noise.so
	rm -f src/*.o
	rm -f noise.dll
	cd noise/ && $(MAKE) cleansrc
