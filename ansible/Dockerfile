FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential sudo&& \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS naveen
ARG TAGS
RUN addgroup --gid 1000 naveen
RUN adduser --gecos naveen --uid 1000 --gid 1000 --disabled-password naveen
RUN usermod -aG sudo naveen
USER root
WORKDIR /root

FROM naveen
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
