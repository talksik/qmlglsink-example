#!/bin/sh

export QT_DEBUG_PLUGINS=1
export GST_DEBUG=2

rm -rf build &&
mkdir build &&
cd build &&

echo "Running cmake with build type Debug."
cmake -Wall -DCMAKE_PREFIX_PATH=$HOME/Qt/5.15.14/gcc_64/ \
  -G "Unix Makefiles" \
  -DCMAKE_BUILD_TYPE=Debug .. &&

make &&

cd ..
./build/qml-example
