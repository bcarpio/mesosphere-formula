{%- from 'zookeeper/settings.sls' import zk with context %}
{%- from 'mesosphere/settings.sls' import mesosphere with context %}

mesos-repo:
  pkgrepo.managed:
    - humanname: Mesosphere Repo
    - name: "deb http://repos.mesosphere.io/{{ grains['osfullname'].lower() }} {{ grains['oscodename'] }} main"
    - dist: {{ grains['oscodename'] }}
    - file: /etc/apt/sources.list.d/mesosphere.list
    - keyid: E56151BF
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: mesos

mesos:
  pkg.installed:
    - version: {{ mesosphere.mesos_version }}

mesos-zk-file:
  file.managed:
    - name: {{ mesosphere.config_dir }}/zk
    - source: salt://mesosphere/files/conf/zk
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      zookeeper_server_list: {{ zk.connection_string }}
      zookeeper_path: {{ mesosphere.zookeeper_path }}
