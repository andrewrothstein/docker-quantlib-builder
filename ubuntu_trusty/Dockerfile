FROM ubuntu:trusty
MAINTAINER Andrew Rothstein <andrew.rothstein@gmail.com>

RUN apt-get update -y
RUN apt-get install -y git g++ make libboost-all-dev autoconf automake libtool

ENV GIT_TRANSPORT https
ENV GIT_REPO lballabio/quantlib
ENV QUANTLIB_BUILD_DIR /tmp/quantlib
RUN git clone ${GIT_TRANSPORT}://github.com/${GIT_REPO}.git ${QUANTLIB_BUILD_DIR}
WORKDIR ${QUANTLIB_BUILD_DIR}/QuantLib
ENV GIT_VER QuantLib-v1.6.2
RUN git checkout -b building-${GIT_VER} ${GIT_VER}

RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install