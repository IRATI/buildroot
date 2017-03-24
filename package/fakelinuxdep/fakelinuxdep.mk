############################################
# fakelinuxdep                             #
############################################

# Use a version which includes 4.1.24 kernel, since it
# can be compiled with gcc6
FAKELINUXDEP_VERSION = arcfire

FAKELINUXDEP_SITE = https://github.com/IRATI/stack.git
FAKELINUXDEP_SITE_METHOD = git

# Enable these ones to fast download from a local repo
#FAKELINUXDEP_SITE = /home/vmaffione/git/nxw/irati
#FAKELINUXDEP_SITE_METHOD = local

FAKELINUXDEP_INSTALL_STAGING = YES
FAKELINUXDEP_INSTALL_TARGET = YES
FAKELINUXDEP_DEPENDENCIES =
FAKELINUXDEP_LICENSE = LGPL

define FAKELINUXDEP_CONFIGURE_CMDS
	echo "fakelinuxdep: configuring"
	for p in $(FAKELINUXDEP_PKGDIR)/*.patch.manual ; do \
		 patch -d $(@D) -p1 < $$p ; \
	done
endef

define FAKELINUXDEP_BUILD_CMDS
	echo "fakelinuxdep: build"
endef

define FAKELINUXDEP_INSTALL_STAGING_CMDS
	echo "fakelinuxdep: install staging"
endef

define FAKELINUXDEP_INSTALL_TARGET_CMDS
	echo "fakelinuxdep: install target"
endef

$(eval $(generic-package))
