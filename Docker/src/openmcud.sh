#!/bin/sh
# Run as user mcu (per installation)
exec /sbin/setuser mcu /usr/bin/openmcu-ru -x -i /etc/openmcu-ru/settings.ini >>/var/log/openmcu.log 2>&1