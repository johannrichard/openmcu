FROM ubuntu:14.04

# Install dependencies

ENV MAKE_OPTS="-j 3"
ENV PREFIX="/opt"

sudo add-apt-repository ppa:rayanayar/openmcu-ru
sudo apt-get update
sudo apt-get install openmcu-ru

EXPOSE 5060 5061 1420 1554 1720
CMD ["/opt/openmcu-ru/bin/openmcu-ru"]
