
OPENJDK_BIN_VERSION := 8u102-b14.1-2
OPENJDK_BIN_SITE := http://ftp.debian.org/debian/pool/main/o/openjdk-8
OPENJDK_BIN_SOURCE := openjdk-8-jre-headless_$(OPENJDK_BIN_VERSION)_amd64.deb

define OPENJDK_BIN_EXTRACT_CMDS
		cp $(DL_DIR)/$(OPENJDK_BIN_SOURCE) $(@D)
	(\
		cd $(@D) && \
		ar vx $(OPENJDK_BIN_SOURCE) && \
		tar -xJvf data.tar.xz && \
		rm control.tar.gz data.tar.xz debian-binary $(OPENJDK_BIN_SOURCE)\
	)
endef

define OPENJDK_BIN_BUILD_CMDS
	cd .
endef

define OPENJDK_BIN_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/jvm
	cp -alf $(@D)/usr/lib/jvm/. $(TARGET_DIR)/usr/lib/jvm
	rm -f $(TARGET_DIR)/usr/bin/java
	ln -s ../lib/jvm/java-8-openjdk-amd64/jre/bin/java \
		$(TARGET_DIR)/usr/bin/java
endef

define OPENJDK_BIN_CLEAN_CMDS
	rm -rf $(@D)/fs
endef

$(eval $(generic-package))
