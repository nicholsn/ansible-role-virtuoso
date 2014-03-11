# Engine container
FROM nicholsn/ansible:latest
MAINTAINER Nolan Nichols <nolan.nichols@gmail.com>

RUN apt-get update 
RUN ansible-galaxy install nicholsn.supervisor nicholsn.virtuoso
RUN ansible-pull -C master -d /tmp -i hosts -U https://github.com/niquery/ansible-role-virtuoso.git local.yml

EXPOSE 8890:8890

ENTRYPOINT ["/usr/bin/supervisorctl", "start", "virtuoso"]
