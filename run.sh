#!/usr/bin/env bash
docker run --rm -v $(docker-machine ssh default pwd):/pkgdir andrewrothstein/docker-quantlib-builder:ubuntu_trusty
