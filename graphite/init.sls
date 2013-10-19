
{% set user = salt['env.user']() %}

# required packages for graphite
graphite-base-pkgs:
  pkg.installed:
    - pkgs:
      - memcached 
      - python-dev 
      - python-pip 
      - sqlite3 
      - libcairo2 
      - libcairo2-dev
      - python-cairo 
      - pkg-config

graphite-pips:
  pip.installed:
    - requirements: salt://graphite/requirements.txt
    - require:
      - pkg: python-pip

/opt/graphite/storage/log/webapp:
  file.directory:
    - makedirs: True

/opt/graphite/conf/storage-schemas.conf:
  file.managed:
    - template: jinja
    - source: salt://graphite/storage-schemas.conf

/opt/graphite/conf/carbon.conf:
  file.managed:
    - template: jinja
    - source: salt://graphite/carbon.conf

/opt/graphite/webapp/graphite/local_settings.py:
  file.managed:
    - template: jinja
    - source: salt://graphite/local_settings.py

# ===========================================
#  Finish Configuring Graphite DB
# ===========================================
/opt/graphite/graphite_install.sh:
  cmd.script:
    - template: jinja
    - source: salt://graphite/graphite_install.sh
    - unless: test -f /opt/graphite/dbinstalled.txt


/etc/init/graphiteweb.conf:
  file.managed:
    - template: jinja
    - source: salt://graphite/graphiteweb.init.conf


/etc/init/carbon.conf:
  file.managed:
    - template: jinja
    - source: salt://graphite/carbon.init.conf

