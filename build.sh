#!/bin/sh
cmake -E make_directory build
cmake -E chdir build cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release -G Ninja ..
cmake --build build
