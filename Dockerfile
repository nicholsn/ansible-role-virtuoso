FROM ubuntu:12.04
MAINTAINER Nolan Nichols <nolan.nichols@gmail.com>
ENV UPDATED "Wed Apr 23 13:56:18 PDT 2014"

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y ansible git
RUN ansible-galaxy install nicholsn.supervisor 
RUN ansible-galaxy install nicholsn.virtuoso
RUN cd /etc/ansible/roles/nicholsn.virtuoso/ && ansible-playbook -i hosts local.yml

EXPOSE 8890:8890