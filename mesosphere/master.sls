{%- from 'mesosphere/settings.sls' import mesosphere with context %}

include:
  - mesosphere

mesos-master-directories:
  file.directory:
    - user: root
    - group: root
    - makedirs: True
    - names:
      - {{ mesosphere.logs_dir }}
      - {{ mesosphere.work_dir }}
      - {{ mesosphere.config_dir }}/mesos-master/

mesos-master:
  service:
    - running
    - require:
      - pkg: mesos

{%- if mesosphere['ip'] %}
mesos-slave-ip:
  file.managed:
    - name: {{ mesosphere.config_dir }}/mesos-master/ip
    - content_grains: mesosphere:config:ip
{%- endif %}

{%- if mesosphere['hostname'] %}
mesos-slave-hostname:
  file.managed:
    - name: {{ mesosphere.config_dir }}/mesos-master/hostname
    - content_grains: mesosphere:config:hostname
{%- endif %}
