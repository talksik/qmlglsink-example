#!/bin/sh
# this is special script for running on jetson nano

export QT_DEBUG_PLUGINS=1

rm -rf build &&
mkdir build &&
cd build &&

echo "Running cmake with build type Debug."
cmake -Wall -DCMAKE_PREFIX_PATH=~/Qt/ \
  -G "Unix Makefiles" \
  -DCMAKE_BUILD_TYPE=Debug .. &&

make &&

echo "running qml-example" &&

./build/qml-example -platform eglfs

