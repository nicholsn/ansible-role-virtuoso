Virtuoso
========

Build Virtuoso 7 Open Source Edition on Ubuntu 12.04

Requirements
------------

Ubuntu 12.04

Role Variables
--------------

- virtuoso_port: 8890 (default)

Dependencies
------------

None

Example Playbook
-------------------------

    - hosts: virtuoso
      roles:
         - { role: nicholsn.virtuoso, virtuoso_port: 8890,  }

License
-------

Apache 2.0

Author Information
------------------

Nolan Nichols