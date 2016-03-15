FROM multiarch/crossbuild 
MAINTAINER "xforty technologies" <xforty.com>

ENV PATH /opt/cmake-3.4.0-Linux-x86_64/bin:$PATH

RUN curl -sSL https://cmake.org/files/v3.4/cmake-3.4.0-Linux-x86_64.tar.gz | tar -xzC /opt

RUN apt-get install -y vim-common nasm uuid-dev gperf libtool automake autoconf texinfo libicu-dev && apt-get clean

RUN mkdir -p /tmp/osxcross
RUN curl -sSL "https://codeload.github.com/tpoechtrager/osxcross/tar.gz/${OSXCROSS_REVISION}" | tar --strip=1 -xzC /tmp/osxcross

ENV MACOSX_DEPLOYMENT_TARGET 10.7
RUN CROSS_TRIPLE=x86_64-apple-darwin /usr/bin/crossbuild /usr/osxcross/bin/osxcross-macports install icu
RUN rm /usr/x86_64-apple-darwin14/bin/pkg-config
