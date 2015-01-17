{%- from 'mesosphere/settings.sls' import mesosphere with context %}

include:
  - mesosphere

marathon_package:
  pkg.installed:
    - name: marathon
    - version: {{ mesosphere.marathon_version }}

marathon_service:
  service.running:
    - name: marathon
    - enable: True
