{%- from 'mesosphere/settings.sls' import mesosphere with context %}

include:
  - mesosphere

docker.io:
  pkg.installed

containerizers:
  file.managed:
    - name: /etc/mesos-slave/containerizers   
    - source: salt://mesosphere/files/mesos-slave/containerizers
    - user: root
    - group: root
    - mode: 644
    - template: jinja

executor_registration_timeout:
  file.managed:
    - name: /etc/mesos-slave/executor_registration_timeout
    - contents: {{ mesosphere.timeout }}

mesos-slave:
  service.running:
    - enable: True
    - watch:
      - file: mesos-zk-file
    - require:
      - pkg: mesos
      - pkg: docker.io
      - file: executor_registration_timeout
      - file: containerizers

{%- if mesosphere['ip'] %}
mesos-slave-ip:
  file.managed:
    - name: {{ mesosphere.config_dir }}/mesos-slave/ip
    - contents_grains:  mesosphere:config:ip 
{%- endif %}

{%- if mesosphere['hostname'] %}
mesos-master-hostname:
  file.managed:
    - name: {{ mesosphere.config_dir }}/mesos-slave/hostname
    - contents_grains:  mesosphere:config:hostname 
{%- endif %}
