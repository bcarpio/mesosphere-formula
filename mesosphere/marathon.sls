{%- from 'mesosphere/settings.sls' import mesos with context %}

include:
  - mesosphere

marathon_package:
  pkg.installed:
    - name: marathon
    - version: {{ mesos.marathon_version }}

marathon_service:
  service.running:
    - name: marathon
    - enable: True
