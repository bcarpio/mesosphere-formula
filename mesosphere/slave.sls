{%- from 'mesosphere/settings.sls' import mesosphere with context %}

include:
  - mesosphere

mesos-slave:
  service.running:
    - enable: True
    - watch:
      - file: mesos-zk-file
    - require:
      - pkg: mesos

{%- if mesosphere['ip'] %}
mesos-slave-ip:
  file.managed:
    - name: {{ mesosphere.config_dir }}/mesos-slave/ip
    - content_grains: mesosphere:config:ip
{%- endif %}

{%- if mesosphere['hostname'] %}
mesos-master-hostname:
  file.managed:
    - name: {{ mesosphere.config_dir }}/mesos-slave/hostname
    - content_grains: mesosphere:config:hostname
{%- endif %}
