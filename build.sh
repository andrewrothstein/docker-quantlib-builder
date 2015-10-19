#!/usr/bin/env bash
export APP_NAME=quantlib
#docker build -t andrewrothstein/docker-$APP_NAME-builder:fedora_21 fedora_21
docker build -t andrewrothstein/docker-$APP_NAME-builder:ubuntu_trusty ubuntu_trusty
