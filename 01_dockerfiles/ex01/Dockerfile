FROM debian

# install the latest teamspeak
RUN apt-get update && apt-get install -y bzip2  wget &&\
  wget http://dl.4players.de/ts/releases/3.8.0/teamspeak3-server_linux_amd64-3.8.0.tar.bz2 &&\
  tar jxf teamspeak3-server_linux_amd64-3.8.0.tar.bz2 -C /opt &&\
  mv /opt/teamspeak3-server_* /opt/teamspeak 


WORKDIR /opt/teamspeak
RUN touch .ts3server_license_accepted

EXPOSE 9987 10011 30033 
CMD ["./ts3server"]

