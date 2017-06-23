# Based on "Trusty" (14.04) baseimage
FROM phusion/baseimage:0.9.18

ENV PREFIX="/opt"

RUN add-apt-repository ppa:rayanayar/openmcu-ru && \
    apt-get update && \
    apt-get install -y openmcu-ru

EXPOSE 5060 5061 1420 1554 1720
CMD ["/opt/openmcu-ru/bin/openmcu-ru"]
