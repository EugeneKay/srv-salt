<!--
# README.md
# EugeneKay/srv-salt
-->
Salt
----

This is a collection of [SaltStack](https://docs.saltstack.com/) States to manage your infrastructure.


License
-------

All files contained in this repository are Copyright © 2014 by [Eugene E. Kashpureff Jr](mailto:eugene@kashpureff.org), unless otherwise marked. License is granted under the WTFPL(version 2 or higher), and under the GNU GPL(version 3 or higher).


Bootstrapping
-------------

 1. Clone this repository into /srv/salt/.
 2. Customize `pillar/defaults.sls` to suit your environment.
 2. Copy `pillar/minion/example-master.sls` to `pillar/minion/<hostname>.sls` and customize as desired.
 3. Install the salt-minion package. Set `id: <hostname>` in the minion config(_/etc/salt/minion_).
 4. Perform a state run: `$ salt-call --file-root=/srv/salt/states/ --pillar-root=/srv/salt/pillar/ --local state.apply`
 5. Accept the master's minion key: `$ salt-key -a <hostname> -y`
 6. Enjoy!
