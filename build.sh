#!/bin/bash
mapfile="example.se"
if [ $# -eq 0 ] ; then
    echo "using example.se"
else
    mapfile=$1
fi
python shockemu.py $mapfile
clang -dynamiclib -std=gnu99 iohid_wrap.m -current_version 1.0 -compatibility_version 1.0 -lobjc -framework Foundation -framework AppKit -framework CoreFoundation -o iohid_wrap.dylib
