FROM ubuntu:18.04

RUN apt-get update && apt-get install -y wget vim git

RUN wget https://storage.googleapis.com/dart-archive/channels/stable/release/latest/linux_packages/dart_2.4.0-1_amd64.deb &&\
	dpkg -i dart_2.4.0-1_amd64.deb &&\
	rm dart_2.4.0-1_amd64.deb

WORKDIR /root

RUN echo "export PATH=\$PATH:/usr/lib/dart/bin" >> .bashrc

CMD ["/bin/bash"]

