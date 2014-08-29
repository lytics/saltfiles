

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

