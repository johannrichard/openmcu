# Based on "Trusty" (14.04) baseimage
FROM phusion/baseimage:0.9.18

ENV PREFIX="/opt"

# Install (witha resounding "YES" :-))
RUN add-apt-repository -y ppa:rayanayar/openmcu-ru && \
    apt-get update && \
    apt-get install -y openmcu-ru

# Expose some ports
EXPOSE 5060 5061 1420 1554 1720

# TODO: Add volumes for data / config
# HERE

# Run that thing
RUN mkdir /etc/service/openmcud
ADD src/openmcud.sh /etc/service/openmcud/run
# RUN chmod +x /etc/service/openmcud/run

# Use baseimage-docker's init system.
# CMD ["/sbin/my_init"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*