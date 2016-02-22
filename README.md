# Docker-Fhem
Dockerfile for a Fhem test instance

build image with: docker build -t fhem .
run container	: docker run -it -p 8083:8083 fhem

use fhem.cfg.example as an example config to start from.
Simply copy fhem.cfg.example to fhem.cfg.
