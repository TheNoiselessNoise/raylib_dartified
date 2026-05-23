#!/bin/bash

emcc -c ../src/mylib.c -o build/mylib.o
emar rcs build/libmylib.a build/mylib.o