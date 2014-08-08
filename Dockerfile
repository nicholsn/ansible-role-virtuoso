FROM ubuntu:12.04
MAINTAINER Nolan Nichols <nolan.nichols@gmail.com>
ENV UPDATED "Sat May  3 12:23:48 PDT 2014"

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y ansible git autoconf automake libtool flex bison gperf gawk m4 make openssl libssl-dev sudo
RUN ansible-galaxy install nicholsn.virtuoso --force
RUN cd /etc/ansible/roles/nicholsn.virtuoso/ && ansible-playbook -i hosts local.yml

#EXPOSE 22 8890:8890

#CMD ["/usr/bin/supervisord"]