#!/bin/bash

mkdir release/

rm release/*

make clean && OS=Windows_NT ./build.sh && mv noise.dll release/ && make clean && OS=Linux ./build.sh && mv noise.so release/
