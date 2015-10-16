QuantLib rocks
QuantLib is huge

Container builds QuantLib from github
see build.sh

run it to build/emit package
docker run --rm -v /pkgdir:$(pwd) andrewrothstein/docker-quantlib-builder:ubuntu_trusty
ls -l *.deb