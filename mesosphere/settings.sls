{% set p    = salt['pillar.get']('mesosphere', {}) %}
{% set pc   = p.get('config', {}) %}
{% set g    = salt['grains.get']('mesosphere', {}) %}
{% set gc   = g.get('config', {}) %}

{%- set mesosphere = {} %}
{%- do mesosphere.update( {
  'mesos_version'           : p.get('version', '0.21.1-1.1.ubuntu1404'),
  'marathon_version'        : p.get('marathon_version', '0.7.6-1.0'),
  'chronos_version'         : p.get('chronos_version', '2.3.1-0.1.20150122202347'),
  'cluster_name'            : pc.get('cluster_name', 'mesos'),
  'timeout'                 : pc.get('timeout', '5mins'),
  'ip'                      : gc.get('ip', None),
  'hostname'                : gc.get('hostname', None),
  'logs_dir'                : gc.get('logs_dir', pc.get('logs_dir', '/var/log/mesos')),
  'work_dir'                : gc.get('work_dir', pc.get('work_dir', '/tmp/mesos')),
  'config_dir'              : gc.get('config_dir', pc.get('config_dir', '/etc/mesos')),
  'port'                    : gc.get('port', pc.get('port', '5050')),
  'isolation_type'          : gc.get('isolation_type', pc.get('isolation_type', 'posix/cpu,posix/mem')),
  'zookeeper_path'          : gc.get('zookeeper_path', pc.get('cluser_name', 'mesos')),
  }) %}
