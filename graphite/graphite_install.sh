#!/bin/bash

# http://geek.michaelgrace.org/2011/09/how-to-install-graphite-on-ubuntu/

#cp local_settings.py.example local_settings.py
#python manage.py syncdb  # Follow the prompts, creating a superuser is optional
python manage.py syncdb --noinput 

#cd /opt/graphite 
#PYTHONPATH=`pwd`/whisper ./bin/run-graphite-devel-server.py --libs=`pwd`/webapp/ /opt/graphite/

touch /opt/graphite/dbinstalled.txt