<!--
# README.md
# EugeneKay/srv-salt
-->
Salt
----

This is a collection of [SaltStack](https://docs.saltstack.com/) State files and PIllar tree used by EugeneKay's systems. They may be useful as a reference for managing your own Salt-based infrastructure.


License
-------

All files contained in this repository are Copyright © 2014 by [Eugene E. Kashpureff Jr](mailto:eugene@kashpureff.org), unless otherwise marked. License is granted under the WTFPL(version 2 or higher), and under the GNU GPL(version 3 or higher).


Bootstrapping
-------------

 1. Clone this repository into /srv/salt/.
 2. Create `pillar/minion/<minion>.sls`. Include `master` in the `roles` list.
 3. Install the salt-minion package. Set `id: <minion>` in `/etc/salt/minion`
 4. `sudo salt-call --file-root=/srv/salt/states/ --pillar-root=/srv/salt/pillar/ --local state.apply`
 5. Enjoy!
