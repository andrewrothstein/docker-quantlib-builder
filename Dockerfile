FROM ubuntu:xenial
MAINTAINER Andrew Rothstein <andrew.rothstein@gmail.com>

ENV BUILD_DEP_PKGS "git g++ make libboost-all-dev autoconf automake libtool ruby ruby-dev"
ENV BUILD_DEP_GEMS "fpm"

ENV APP_NAME quantlib
ENV APP_VER 1.8
ENV APP_PKG_TYPE deb

ENV GIT_TRANSPORT https
ENV GIT_REPO lballabio/quantlib
ENV GIT_VER QuantLib-v$APP_VER
ENV GIT_SRC_URL ${GIT_TRANSPORT}://github.com/${GIT_REPO}.git

ENV BUILD_SRC_DIR /tmp/quantlib
ENV BUILD_TARGET_DIR /tmp/installdir

RUN apt-get update -y && apt-get install -y $BUILD_DEP_PKGS
RUN git clone $GIT_SRC_URL $BUILD_SRC_DIR
WORKDIR $BUILD_SRC_DIR
RUN git checkout -b building-$GIT_VER $GIT_VER
RUN ./autogen.sh
RUN ./configure --prefix=/usr
RUN make -j 4
RUN mkdir -p $BUILD_TARGET_DIR && make install DESTDIR=$BUILD_TARGET_DIR

VOLUME ['/pkgdir']
RUN gem install --no-ri --no-rdoc $BUILD_DEP_GEMS

CMD fpm \
 -t $APP_PKG_TYPE \
 -s dir \
 -n $APP_NAME \
 -v $APP_VER \
 -C $BUILD_TARGET_DIR \
 -p /pkgdir/${APP_NAME}-VERSION-ARCH.deb \
 usr/bin usr/include usr/share usr/lib
 
