############################################
# rina-tgen                                #
############################################

RINA_TGEN_VERSION = master

RINA_TGEN_SITE = https://github.com/edugrasa/traffic-generator.git
RINA_TGEN_SITE_METHOD = git

#RINA_TGEN_SITE = output/build/fakelinuxdep-arcfire/rina-tools
#RINA_TGEN_SITE_METHOD = local

RINA_TGEN_INSTALL_STAGING = YES
RINA_TGEN_INSTALL_TARGET = YES
RINA_TGEN_DEPENDENCIES = host-pkgconf librina
RINA_TGEN_LICENSE = LGPL
RINA_TGEN_AUTORECONF = YES
RINA_TGEN_AUTORECONF_OPTS = -i -f -Wall
RINA_TGEN_CONF_ENV = PKG_CONFIG_PATH=/usr/lib/pkgconfig
RINA_TGEN_CONF_ENV += LD_LIBRARY_PATH=/usr/lib:/lib:/usr/lib/pkgconfig/

$(eval $(autotools-package))
