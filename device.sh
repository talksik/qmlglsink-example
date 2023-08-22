#!/bin/sh
# this is special script for running on jetson nano

export QT_DEBUG_PLUGINS=1
export QT_QPA_EGLFS_WIDTH=1920
export QT_QPA_EGLFS_HEIGHT=1080
export QT_QPA_EGLFS_INTEGRATION=eglfs_kms

export GST_DEBUG=2

rm -rf build
mkdir build
cd build

echo "Running cmake with build type Debug."
cmake -Wall -DCMAKE_PREFIX_PATH=/home/pluto/Qt/ \
  -G "Unix Makefiles" \
  -DCMAKE_BUILD_TYPE=Debug ..

make

echo "running qml-example"

cd ..
./build/qml-example -platform eglfs

