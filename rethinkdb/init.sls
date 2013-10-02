{# 
# this is older 3.3.6 on 12.10, maybe on 13.04 
libzookeeper-mt-dev:
  pkg:
    - installed

#}


{{pillar['saltbin']}}/zklibinstall:
  cmd.script:
    - template: jinja
    - source: salt://zkclient/zkclient.sh
    - unless: test -f /usr/local/include/zookeeper.h


