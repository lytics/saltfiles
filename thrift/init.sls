# thrift requires boost & libssl
libboost-dev:
  pkg:
    - installed

libssl-dev:
  pkg:
    - installed

{{pillar['saltbin']}}/thrift:
  file:
    - mode: 755
    - managed
    - source: salt://thrift/thrift.sh
    - require:                             
      - file: {{pillar['saltbin']}}

installthrift:
  cmd:
    - run
    - cwd: /tmp
    - name: {{pillar['saltbin']}}/thrift
    - unless: test -f /usr/local/bin/thrift
    - require:                             
      - file: {{pillar['saltbin']}}/thrift 
      - pkg: libboost-dev
      - pkg: libssl-dev



