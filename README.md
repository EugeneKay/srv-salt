<!--
# README.md
# EugeneKay/srv-salt
-->
Salt
----

This is a collection of [SaltStack](https://docs.saltstack.com/) States to manage your infrastructure.


License
-------

All files contained in this repository are Copyright © 2014 by [Eugene E. Kashpureff Jr](mailto:eugene@kashpureff.org) and License granted under the WTFPL(version 2) as outlined in LICENSE.txt, unless otherwise marked.


Compatibility
-------------

This collection makes a few assumptions about your infrastructure:

  * **OS:** Developed and maintained using [CentOS](https://www.centos.org/) 7.0+, compatible with [Red Hat Enterprise Linux](https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux2) 7.0+. Other RPM-based distributions should work, including [Fedora](https://getfedora.org/).


Master Setup
------------

 1. Clone this repository into `/srv/salt/`.
 2. Customize `pillar/defaults.sls` to suit your environment.
 2. Copy `pillar/minion/example-master.sls` to `pillar/minion/<hostname>.sls` and customize as desired.
 3. Install the salt-minion package. Set `id: <hostname>` in the minion config(_/etc/salt/minion_).
 4. Perform a state run: `$ salt-call --file-root=/srv/salt/states/ --pillar-root=/srv/salt/pillar/ --local state.apply`
 5. Accept the master's minion key: `$ salt-key -a <hostname> -y`
 6. Enjoy!


Minion Setup
------------

 1. Copy `pillar/minion/example.sls` to `pillar/minion/<hostname>.sls` and customize as desired.
 2. Provision the minion:
    * **Linode:** Create the Minion from the Master: `$ salt-cloud -p <profile> <hostname>`
    * **Other:** Bootstrap the minion: `$ curl https://eugenekay.com/salt | bash`. Accept it on the Master: `$ salt-key -a <hostname> -y`
 3. Perform a state run from the master: `salt <hostname> state.apply`
 4. Enjoy!
