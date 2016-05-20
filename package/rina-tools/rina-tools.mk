############################################
# rina-tools                               #
############################################

RINA_TOOLS_VERSION = kernel-update
RINA_TOOLS_SITE = https://github.com/IRATI/stack.git
RINA_TOOLS_SITE_METHOD = git
RINA_TOOLS_INSTALL_STAGING = YES
RINA_TOOLS_INSTALL_TARGET = YES
RINA_TOOLS_DEPENDENCIES = host-pkgconf librina rinad
RINA_TOOLS_LICENSE = LGPL
RINA_TOOLS_SUBDIR = rina-tools
RINA_TOOLS_AUTORECONF = YES
RINA_TOOLS_AUTORECONF_OPTS = -i -f -Wall
RINA_TOOLS_CONF_ENV = PKG_CONFIG_PATH=/usr/lib/pkgconfig
RINA_TOOLS_CONF_ENV += LD_LIBRARY_PATH=/usr/lib:/lib

$(eval $(autotools-package))
