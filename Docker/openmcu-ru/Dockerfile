FROM phusion/baseimage:0.9.18

# Install dependencies

ENV MAKE_OPTS="-j 3"
ENV PREFIX="/opt"

RUN add-apt-repository ppa:rayanayar/openmcu-ru && \
    apt-get update && \
    apt-get install openmcu-ru

EXPOSE 5060 5061 1420 1554 1720
CMD ["/opt/openmcu-ru/bin/openmcu-ru"]
