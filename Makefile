export OS

CFLAGS=-c
LFLAGS=-shared
LIBS=

SOURCES=$(wildcard src/*.cpp)
OBJECTS=$(SOURCES:.cpp=.o)
LIBRARY=noise.so

ifeq ($(OS),Windows_NT)
CROSS=x86_64-w64-mingw32-
LIBRARY=noise.dll
LFLAGS+= -static-libgcc -static-libstdc++
LIBS+= -L. -llua51
else
CFLAGS+= -fPIC
endif

export CXX=$(CROSS)g++
export CC=$(CROSS)gcc
export LD=$(CROSS)ld
export AR=$(CROSS)ar

all: $(LIBRARY)

$(LIBRARY): libnoise $(OBJECTS)
	$(CXX) $(LFLAGS) noise/src/*.o noise/src/module/*.o noise/src/model/*.o $(OBJECTS) $(LIBS) -o $@

libnoise:
	$(MAKE) -C noise/ src

.cpp.o:
	$(CXX) $(CFLAGS) -Iinclude/ -Inoise/include/ $< -o $@

cleangen:
	rm -f src/*_gen.cpp
	rm -f include/*_gen.hpp

cleanbuild:
	rm -f noise.so
	rm -f src/*.o
	rm -f noise.dll

clean: cleangen cleanbuild
	$(MAKE) -C noise/ cleansrc
