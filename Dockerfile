FROM ubuntu:12.04
MAINTAINER Nolan Nichols <nolan.nichols@gmail.com>

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y ansible git
RUN ansible-galaxy install nicholsn.supervisor 
RUN ansible-galaxy install nicholsn.virtuoso
RUN ansible-pull -U https://github.com/niquery/ansible-role-virtuoso.git -d /ansible -i hosts local.yml

EXPOSE 8890:8890