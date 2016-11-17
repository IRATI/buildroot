############################################
# rinad-plugins                            #
############################################

RINAD_PLUGINS_VERSION = pristine-1.5

#RINAD_PLUGINS_SITE = https://github.com/IRATI/stack.git
#RINAD_PLUGINS_SITE_METHOD = git

RINAD_PLUGINS_SITE = output/build/fakelinuxdep-pristine-1.5
RINAD_PLUGINS_SITE_METHOD = local

RINAD_PLUGINS_INSTALL_STAGING = YES
RINAD_PLUGINS_INSTALL_TARGET = YES
RINAD_PLUGINS_DEPENDENCIES = host-pkgconf linux
RINAD_PLUGINS_LICENSE = LGPL

RINAD_PLUGINS_MODULE_SUBDIRS = plugins/cherish-urgency plugins/cong_avoidance plugins/lfa plugins/multipath plugins/red

RINAD_PLUGINS_DIRNAMES = cherish-urgency cong_avoidance lfa multipath red

# This used to be RINAD_PLUGINS_INSTALL_TARGET_CMDS, see the explanation below
define RINAD_PLUGINS_INSTALL_MANIFESTS
	for plu in $(RINAD_PLUGINS_DIRNAMES) ; do \
		manif=`ls -1 $(@D)/plugins/$${plu}/ | grep manifest` ; \
		$(INSTALL) -D -m 0644 $(@D)/plugins/$${plu}/$${manif} $(TARGET_DIR)/lib/modules/4.1.33-irati/extra ; \
	done
endef

$(eval $(kernel-module))

# We have to make sure that buildroot installs the manifest files after the
# "Install kernel module(s)" phase, because for some silly reason the latter
# phase fails if the "extra" directory is already there - and the "extra"
# directory is created by the manifests installation code, if needed.
# That's why we have to use a post-install hook, and the hook must
# be added here, after calling $(eval $(kernel-module)), which will append
# the post-install hook for kernel modules installation.
RINAD_PLUGINS_POST_INSTALL_TARGET_HOOKS += RINAD_PLUGINS_INSTALL_MANIFESTS

$(eval $(generic-package))
