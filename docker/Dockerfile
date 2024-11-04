FROM ubuntu:latest

RUN apt update && apt upgrade -y

# Clingo
RUN apt install -y gringo
RUN useradd -ms /bin/bash clingo

# Workdir
ARG WORKDIR="/home/clingo/code"
RUN mkdir ${WORKDIR}
WORKDIR ${WORKDIR}

RUN chown -R clingo:clingo ${WORKDIR}
RUN chmod -R 755 ${WORKDIR}
USER clingo
