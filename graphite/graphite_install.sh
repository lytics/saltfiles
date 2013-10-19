#!/bin/bash

# http://geek.michaelgrace.org/2011/09/how-to-install-graphite-on-ubuntu/

#
# Configure carbon
#
cd /opt/graphite/conf/
cp carbon.conf.example carbon.conf

# Create storage schema and copy it over
# Using the sample as provided in the statsd README
# https://github.com/etsy/statsd#graphite-schema

cat >> /tmp/storage-schemas.conf << EOF
# Schema definitions for Whisper files. Entries are scanned in order,
# and first match wins. This file is scanned for changes every 60 seconds.
#
#  [name]
#  pattern = regex
#  retentions = timePerPoint:timeToStore, timePerPoint:timeToStore, ...
[stats]
priority = 110
pattern = ^metd\..*
retentions = 10s:6h,1m:7d
EOF

cp /tmp/storage-schemas.conf storage-schemas.conf

# Make sure log dir exists for webapp
mkdir -p /opt/graphite/storage/log/webapp

# Copy over the local settings file and initialize database
cd /opt/graphite/webapp/graphite/

#cp local_settings.py.example local_settings.py
#python manage.py syncdb  # Follow the prompts, creating a superuser is optional
python manage.py syncdb --noinput 

# cd /opt/graphite/bin
# sudo ./carbon-cache.py start #daemonizes itself

#cd /opt/graphite 
#PYTHONPATH=`pwd`/whisper ./bin/run-graphite-devel-server.py --libs=`pwd`/webapp/ /opt/graphite/

