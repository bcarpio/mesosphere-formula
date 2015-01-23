{%- from 'mesosphere/settings.sls' import mesosphere with context %}

include:
  - mesosphere

chronos_package:
  pkg.installed:
    - name: chronos
    - version: {{ mesosphere.chronos_version }}

chronos_service:
  service.running:
    - name: chronos
    - enable: True
