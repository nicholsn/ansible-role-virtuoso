FROM ubuntu:12.04
MAINTAINER Nolan Nichols <nolan.nichols@gmail.com>
ENV UPDATED "Wed Apr 30 22:56:42 PDT 2014"

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y ansible sudo bzip2 python-apt openssh-client
RUN ansible-galaxy install nicholsn.supervisor 
RUN ansible-galaxy install nicholsn.virtuoso
WORKDIR /etc/ansible/roles/nicholsn.virtuoso
RUN ansible-playbook -i hosts local.yml -vvv

EXPOSE 22 8890:8890

CMD ["/usr/bin/supervisord"]