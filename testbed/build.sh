#!/bin/bash
# Build script for testbed
set echo on

mkdir -p ../bin

# Get alist of all the .c files.
cFilenames=$(find . -type f -name "*.c")

# echo "Files:" $cFilenames

assembly="testbed"
compilerFlags="-g -fdeclspec -fPIC"
# -fms-extensins
# -Wall -Werror
includeFlags="-Isrc -I../engine/src/"
linkderFlags="-L../bin/ -lengine -Wl,-rpath,."
defines="-D_DEBUG -DKIMPORT"

echo "Building $assembly..."
echo clang  $cFilenames $compilerFlags -o ../bin/$assembly  $defines $includeFlags $linkderFlags
clang $cFilenames $compilerFlags -o ../bin/$assembly $defines $includeFlags $linkderFlags