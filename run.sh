#!/usr/bin/env bash
docker run --rm -v $(docker-machine ssh default pwd):/pkgdir docker-quantlib-builder
