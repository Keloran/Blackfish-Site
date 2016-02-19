#!/bin/sh

rm -rf Packages
swift build -Xcc -I/usr/local/include/libbson-1.0
sh .build/debug/Site
