# Dockerfile for fhem
# http://fhem.de/
#
# run with "docker run -it -p 8083:8083 ...“

FROM ubuntu:14.04

MAINTAINER Sebastian Sucker <sebastian.sucker@googlemail.com>

# preparations
RUN apt-get update && apt-get install -y wget apt-transport-https
RUN wget -qO - https://debian.fhem.de/archive.key | apt-key add -
RUN echo deb https://debian.fhem.de/stable ./ >> /etc/apt/sources.list
RUN echo 'Acquire::https::debian.fhem.de::Verify-Peer "false";' > /etc/apt/apt.conf.d/30nohttps

# actual install of fhem
RUN apt-get update && apt-get install -y fhem

# disables security warning message
RUN echo attr global motd none >> /opt/fhem/fhem.cfg

EXPOSE 8083
EXPOSE 8084
EXPOSE 8085

CMD /etc/init.d/fhem start && tail -F /opt/fhem/log/*.log
