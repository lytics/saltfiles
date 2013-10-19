#!/bin/bash

# http://geek.michaelgrace.org/2011/09/how-to-install-graphite-on-ubuntu/

# just in case we are going to create monit folders
# if monit isn't in use, no worries, no harm
mkdir -p /etc/monit/conf.d 


#cp local_settings.py.example local_settings.py
#python manage.py syncdb  # Follow the prompts, creating a superuser is optional
cd /opt/graphite/webapp/graphite 

python manage.py syncdb --noinput 

#cd /opt/graphite 
#PYTHONPATH=`pwd`/whisper ./bin/run-graphite-devel-server.py --libs=`pwd`/webapp/ /opt/graphite/

touch /opt/graphite/dbinstalled.txt

