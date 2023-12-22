#!/bin/sh
make clean
rm -r /build/build-commands
CC=$(pwd)/c2rust/scripts/cc-wrappers/cc make sdl-release
./convert_build_commands.py /tmp/build_commands compile_commands.json
