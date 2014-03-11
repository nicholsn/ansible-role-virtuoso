FROM ubuntu:12.04
MAINTAINER Nolan Nichols <nolan.nichols@gmail.com>

RUN apt-get update 
RUN apt-get install -y python-software-properties
RUN add-apt-repository -y ppa:rquillo/ansible
RUN apt-get update
RUN apt-get install -y ansible git
RUN ansible-galaxy install nicholsn.supervisor nicholsn.virtuoso
RUN git clone https://github.com/niquery/ansible-role-virtuoso.git /tmp
RUN ansible-playbook -i /tmp/hosts /tmp/local.yml -vvv