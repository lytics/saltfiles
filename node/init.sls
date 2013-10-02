

{% set user = salt['env.user']() %}

{{ pillar['saltbin'] }}/nodeinstall:
  file.managed:
    - template: jinja
    - source: salt://node/node.sh
    - user: {{user}}
    - group: {{user}}
    - mode: 755


installnode:
  cmd.wait:
    - cwd: {{pillar['saltbin']}}
    - name: sudo -u {{user}} {{pillar['saltbin']}}/nodeinstall
    - require:                             
      - file: {{pillar['saltbin']}}/nodeinstall
    - watch:
      - file: {{pillar['saltbin']}}/nodeinstall

# node supervisor
npm install -fg supervisor:
  cmd.run:
    - unless:  which supervisor >/dev/null

# node docpad
npm install -fg docpad:
  cmd.run:
    - unless:  which docpad >/dev/null

npm install -fg node-static:
  cmd.run:
    - unless:  which static >/dev/null

# node coffeescript
npm install -fg coffee-script:
  cmd.run:
    - unless:  which coffee >/dev/null

# less css compiler (only web ui needs this, different roles?)
npm install -fg less:
  cmd.run:
    - unless:  which lessc >/dev/null

# grunt task runner
npm install -fg grunt:
  cmd.run:
    - unless:  which grunt >/dev/null


{#

{{ pillar['saltbin'] }}/nodeinstall:
  cmd.script:
    - template: jinja
    - source: salt://node/node.sh
    - unless: test -f /usr/local/bin/node
    - user: {{user}}
    - group: {{user}}


# node supervisor
npm install -fg supervisor:
  cmd.run:
    - unless:  which supervisor >/dev/null

# node docpad
npm install -fg docpad:
  cmd.run:
    - unless:  which docpad >/dev/null

npm install -fg node-static:
  cmd.run:
    - unless:  which static >/dev/null

# node coffeescript
npm install -fg coffee-script:
  cmd.run:
    - unless:  which coffee >/dev/null

# less css compiler (only web ui needs this, different roles?)
npm install -fg less:
  cmd.run:
    - unless:  which lessc >/dev/null

#}
