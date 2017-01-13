############################################
# rinad                                    #
############################################

RINAD_VERSION = arcfire

#RINAD_SITE = https://github.com/IRATI/stack.git
#RINAD_SITE_METHOD = git
#RINAD_SUBDIR = rinad

RINAD_SITE = output/build/fakelinuxdep-arcfire/rinad
RINAD_SITE_METHOD = local

RINAD_INSTALL_STAGING = YES
RINAD_INSTALL_TARGET = YES
RINAD_DEPENDENCIES = host-pkgconf librina protobuf
RINAD_LICENSE = LGPL
RINAD_AUTORECONF = YES
RINAD_AUTORECONF_OPTS = -i -f -Wall
RINAD_CONF_OPTS = --disable-java-bindings --enable-debug
RINAD_CONF_ENV = PKG_CONFIG_PATH=/usr/lib/pkgconfig
RINAD_CONF_ENV += LD_LIBRARY_PATH=/usr/lib:/lib

$(eval $(autotools-package))
