#!/bin/bash

if [ ! -f .config ]; then
    cp IRATI_BUILDROOT_CONFIG .config
fi

diff -puq IRATI_BUILDROOT_CONFIG .config
if [ "$?" != "0" ]; then
    echo "Warning: current .config is different from IRATI_BUILDROOT_CONFIG"
    echo "         I will assume you know what you are doing :)"
fi

# trigger new download
rm dl/fakelinuxdep*
rm dl/rina-tgen*

# clean IRATI software build
make fakelinuxdep-dirclean
make librina-dirclean
make rinad-dirclean
make rinad-plugins-dirclean
make rina-tools-dirclean
make rina-tgen-dirclean

# Recompile IRATI software. Modify package/fakelinuxdep/fakelinuxdep.mk to
# speed-up download by using local repo
make

# Now you should copy the images to the demonstrator location
#cp output/images/* ~/git/nxw/demonstrator/buildroot
