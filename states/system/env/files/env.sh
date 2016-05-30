{#
# states/system/env/files/env.sh
# EugeneKay/srv-salt
-#}
#
# /etc/profile.d/0_env.sh
#
# WARNING: This file is managed by Salt. Any changes you make WILL be erased!
#
# Stupid environment var hacks
#

if [ -z "${XDG_DATA_DIRS}" ]
then
	export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"
fi
