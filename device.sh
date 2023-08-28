#!/bin/sh
# this is special script for running on jetson nano

export QT_DEBUG_PLUGINS=1

export QT_QPA_EGLFS_DEBUG=1
# the below will run on kms. it will not work on X11/desktop environment
# export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
export QT_QPA_EGLFS_HIDECURSOR=1

export GST_DEBUG=2
export QT_QPA_EGLFS_DEBUG=1

rm -rf build
mkdir build
cd build

echo "Running cmake with build type Debug."
cmake -Wall \
  -G "Unix Makefiles" \
  -DCMAKE_BUILD_TYPE=Debug ..

make

echo "running qml-example"

cd ..
./build/qml-example -platform eglfs
