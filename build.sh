#!/bin/bash

docker pull multiarch/crossbuild 
docker build -t xforty/crossbuild .
