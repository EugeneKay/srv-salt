{#
# states/packages/python34/files/python34.sh
# EugeneKay/salt
-#}
#
# /etc/profile.d/python34.sh
#
# WARNING: This file is managed by Salt. Any changes you make WILL be erased!
#
# Python3.4 environment setup
#

if [[ ! "${PATH}" == *rh-python34* ]]
then
	export PATH+=":/opt/rh/rh-python34/root/usr/bin"
fi
if [[ ! "${LD_LIBRARY_PATH}" == *rh-python34* ]]
then
	export LD_LIBRARY_PATH+=":/opt/rh/rh-python34/root/usr/lib64"
fi
if [[ ! "${MANPATH}" == *rh-python34* ]]
then
	export MANPATH+=":/opt/rh/rh-python34/root/usr/share/man"
fi
if [[ ! "${XDF_DATA_DIRS}" == *rh-python34* ]]
then
	export XDG_DATA_DIRS+=":/opt/rh/rh-python34/root/usr/share"
fi
