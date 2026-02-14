#!/bin/bash

for i in {1..4}
do
    cd lab$i
    # make
    make clean
    rm -rf buildDir
    cd -
done