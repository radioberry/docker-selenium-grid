FROM centos:centos7

RUN yum -y update && \
    yum -y install git wget && \
    curl --silent --location https://rpm.nodesource.com/setup_6.x | bash - && \
    wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo && \
    yum -y install nodejs yarn

WORKDIR /work

COPY package.json yarn.lock /work/

RUN yarn --frozen-lockfile

COPY . /work

CMD docker-entrypoint.sh
#!/bin/bash
