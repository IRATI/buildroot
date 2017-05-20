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

FAKELINUXDEP_MODULE_SUBDIRS = kernel
# Set options that are passed through kernel/configure when building manually.
FAKELINUXDEP_MODULE_MAKE_OPTS = REGRESSION_TESTS=n HAVE_VMPI=n TCP_UDP_BUFFER_SIZE=1500

# Invoke the ./configure script to generate kernel Makefile
define FAKELINUXDEP_DO_CONFIGURE
	echo "fakelinuxdep: patching"
	for p in $(FAKELINUXDEP_PKGDIR)/*.patch.manual ; do \
		 patch -d $(@D) -p1 < $$p ; \
	done
	echo "fakelinuxdep: Running kernel configure ..."
	cd $(@D)/kernel && ./configure
	echo "... done!"
endef

FAKELINUXDEP_PRE_CONFIGURE_HOOKS += FAKELINUXDEP_DO_CONFIGURE

$(eval $(kernel-module))
$(eval $(generic-package))
