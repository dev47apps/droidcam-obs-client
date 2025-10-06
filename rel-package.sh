#!/bin/bash
if [ -z "$version" ]; then
        echo please export version=7.x
        exit
fi

INSTALL="/opt/droidcam-obs-client"
find ${INSTALL} -type f -name droidcam-obs.so
find ${INSTALL} -type f -name v4l2loopback-ctl

spec=/tmp/droidcam.spec
sed -e "s/{VERSION}/$version/" droidcam.spec > $spec
rpmbuild -bb $spec
rm $spec
mv ~/rpmbuild/RPMS/*/*.rpm /tmp/
