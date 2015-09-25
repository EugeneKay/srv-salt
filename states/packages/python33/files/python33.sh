{#
# states/packages/python33/files/nrpe.cfg
# EugeneKay/salt
-#}
#
# /etc/profile.d/python33.sh
#
# WARNING: This file is managed by Salt. Any changes you make WILL be erased!
#
# Python33 environment setup
#

if [ -z "${PYTHON3_PATHSET}" ]
then
        export PATH+=":/opt/rh/python33/root/usr/bin"
        export LD_LIBRARY_PATH+=":/opt/rh/python33/root/usr/lib64"
        export MANPATH+=":/opt/rh/python33/root/usr/share/man"
        export XDG_DATA_DIRS+="/opt/rh/python33/root/usr/share"
        export PKG_CONFIG_PATH+=":/opt/rh/python33/root/usr/lib64/pkgconfig"

        export PYTHON3_PATHSET=0
fi

