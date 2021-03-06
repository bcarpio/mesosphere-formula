=========
mesosphere - work in progress formula
=========

Formula to set up and configure a mesosphere cluster.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``mesosphere``
-------------

Adds the mesosphere package repository and installs mesosphere.

``mesosphere.master``
--------------------

Includes `mesosphere` to install mesosphere and runs the `mesos-master` service. A Zookeeper is automatically installed and started as well. A Mesosphere install is also added to the master node.

``mesosphere.slave``
--------------------

Includes `mesosphere` to install mesosphere and runs the `mesos-slave` service.


``mesosphere.marathon``
--------------------

Should be assigned to any 'mesosphere.master' node. 

Tested on Ubuntu 14.04.
