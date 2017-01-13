############################################
# librina				   #
############################################

LIBRINA_VERSION = arcfire

#LIBRINA_SITE = https://github.com/IRATI/stack.git
#LIBRINA_SITE_METHOD = git
#LIBRINA_SUBDIR = librina

LIBRINA_SITE = output/build/fakelinuxdep-arcfire/librina
LIBRINA_SITE_METHOD = local

LIBRINA_INSTALL_STAGING = YES
LIBRINA_INSTALL_TARGET = YES
LIBRINA_DEPENDENCIES = fakelinuxdep libnl host-pkgconf openssl protobuf linux
LIBRINA_LICENSE = LGPL
LIBRINA_AUTORECONF = YES
LIBRINA_AUTORECONF_OPTS = -i -f -Wall
LIBRINA_CONF_OPTS = --disable-java-bindings --enable-debug --with-sysheaders=${LINUX_DIR}/usr/include

$(eval $(autotools-package))
