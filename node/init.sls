

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

npm:
  pkg.installed

# node supervisor
nodesupervisor:
  npm.installed:
    - name: supervisor
    - runas: {{user}}

# node docpad
nodedocpad:
  npm.installed:
    - name: docpad
    - runas: {{user}}

# node node-static
nodestatic:
  npm.installed:
    - name: node-static
    - runas: {{user}}

# node coffeescript
nodecoffee:
  npm.installed:
    - name: coffee-script
    - runas: {{user}}

# less css compiler (only web ui needs this, different roles?)
nodeless:
  npm.installed:
    - name: less
    - runas: {{user}}

# grunt task runner
nodegrunt:
  npm.installed:
    - name: grunt-cli
    - runas: {{user}}

# grunt task runner
uglify-js:
  npm.installed:
    - name: uglify-js
    - runas: {{user}}
