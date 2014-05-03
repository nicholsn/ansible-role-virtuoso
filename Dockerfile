FROM ubuntu:12.04
MAINTAINER Nolan Nichols <nolan.nichols@gmail.com>
ENV UPDATED "Wed Apr 30 23:51:39 PDT 2014"

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y ansible python-apt
RUN ansible-galaxy install nicholsn.virtuoso --force
WORKDIR /etc/ansible/roles/nicholsn.virtuoso
RUN ansible-playbook -i hosts local.yml -v

EXPOSE 22 8890:8890

CMD ["/usr/bin/supervisord"]