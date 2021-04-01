FROM ubuntu:18.04

RUN apt-get update && apt-get install -y wget git vim

RUN wget -O /usr/local/go.tar.gz https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz

WORKDIR /usr/local

RUN tar xzf go.tar.gz && rm go.tar.gz

WORKDIR /root

RUN mkdir /root/go && echo "export PATH=\$PATH:/usr/local/go/bin" >> .bashrc

CMD ["/bin/bash"]
