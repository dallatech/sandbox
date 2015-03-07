#!/bin/bash

pushd . > /dev/null

mkdir -p build
cd build
cmake ..

popd > /dev/null
