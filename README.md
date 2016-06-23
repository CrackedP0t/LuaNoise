LuaNoise
===
This is a Lua library written in C++ to expose the functionality of [libnoise](http://libnoise.sourceforge.net/) to Lua programs.

It uses a custom generator to write the C++ code for the Lua package, which uses Lua's C API directly.

Currently it only works with Lua 5.1 (and therefore LuaJIT), but that's being worked on.

Compiles with GCC for Linux and MinGW from MXE for Windows.

In order to build for Linux, run `./build.sh` in the root directory. In order to build for Windows, run `OS=Windows_NT ./build.sh` in the root directory.

Then, take the `noise.so` or `noise.dll` file from the root directory and put it wherever you need for your Lua program.

If you would like to see some examples, the [tutorials](http://libnoise.sourceforge.net/tutorials/index.html) from the libnoise website have been translated to work with Lua. Make sure to copy `noise.so` or `noise.dll` into the `tutorials/` directory, then run them with Lua 5.1.

It does include libnoise's `noiseutils`.
