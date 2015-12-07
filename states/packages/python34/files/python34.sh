{#
# states/packages/python34/files/nrpe.cfg
# EugeneKay/salt
-#}
#
# /etc/profile.d/python34.sh
#
# WARNING: This file is managed by Salt. Any changes you make WILL be erased!
#
# Python3.4 environment setup
#

if [ -z "${PYTHON34_PATHSET}" ]
then
        export PATH+=":/opt/rh/rh-python34/root/usr/bin"
        export LD_LIBRARY_PATH+=":/opt/rh/rh-python34/root/usr/lib64"
        export MANPATH+=":/opt/rh/rh-python34/root/usr/share/man"
        export XDG_DATA_DIRS+=":/opt/rh/rh-python34/root/usr/share"
        export PYTHON34_PATHSET=0
fi
