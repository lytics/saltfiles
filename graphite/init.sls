
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

{#
graphite-pips:
  pip.installed:
    - requirements: salt://graphite/requirements.txt
    - require:
      - pkg: python-pip
#}
graphite-pips:
  pip.installed:
    - pkgs: django==1.3,python-memcached,django-tagging,twisted,whisper,carbon,graphite-web

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
