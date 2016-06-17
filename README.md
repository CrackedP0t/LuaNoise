LuaNoise
===
This is a Lua library written in C++ to expose the functionality of [LibNoise](http://libnoise.sourceforge.net/) to Lua programs.

It uses a custom generator to write the C++ code for the Lua package, which uses Lua's C API directly.

Currently it only works with Lua 5.1 (and therefore LuaJIT), but that's being worked on.

Run `make` in the root directory to generate the C++ files and compile them.

Then, take the `noise.so` file from the `bin/` directory and put it wherever you need it for a Lua program.

If you would like to see some examples, the [tutorials](http://libnoise.sourceforge.net/tutorials/index.html) from the LibNoise website have been translated to work with Lua. Make sure to copy `noise.so` into the `tutorials/` directory, then run them with Lua 5.1.

Does not currently contain LibNoise's noiseutils, but that's coming soon.
