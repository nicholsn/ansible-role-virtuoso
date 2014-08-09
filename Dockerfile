FROM ubuntu:12.04
MAINTAINER Nolan Nichols <nolan.nichols@gmail.com>
ENV UPDATED "Fri Aug  8 13:30:08 PDT 2014"

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y build-essential debhelper autotools-dev autoconf automake unzip wget net-tools > /dev/null
RUN apt-get install -y libtool flex bison gperf gawk m4 libssl-dev libreadline-dev openssl > /dev/null
RUN wget --no-check-certificate -q https://github.com/openlink/virtuoso-opensource/archive/develop/7.zip -O virtuoso-opensource.zip
RUN unzip -q virtuoso-opensource.zip
RUN cd virtuoso-opensource-develop-7/ && dpkg-buildpackage -us -uc
RUN cd .. && dpkg -i virtuoso-opensource_7.1_amd64.deb

RUN rm -rf virtuoso-opensource.zip virtuoso-opensource-develop-7/ virtuoso-opensource_7.1_amd64.deb
RUN rm -rf virtuoso-opensource_7.1.tar.gz virtuoso-opensource-develop-7 virtuoso-opensource_7.1_amd64.changes
RUN apt-get remove -y build-essential debhelper autotools-dev autoconf automake unzip wget net-tools

