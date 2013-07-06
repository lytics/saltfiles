
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

{{ pillar['saltbin'] }}/graphite_install:
  file.managed:
    - template: jinja
    - source: salt://graphite/graphite.sh
    - user: {{user}}
    - group: {{user}}
    - mode: 755


graphite_install:
  cmd.wait:
    - cwd: {{pillar['saltbin']}}
    - name: sudo -u {{user}} {{pillar['saltbin']}}/graphite_install
    - require:                             
      - file: {{pillar['saltbin']}}/graphite_install
      - pip: graphite-pips
    - watch:
      - file: {{pillar['saltbin']}}/graphite_install

