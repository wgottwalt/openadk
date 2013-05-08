# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		ant
PKG_VERSION:=		1.8.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		c474fa9d0c35a24037c23b6e476862c1
PKG_SITES:=		http://archive.apache.org/dist/ant/source/

DISTFILES:=		apache-$(PKG_NAME)-$(PKG_VERSION)-src.tar.bz2
WRKDIST=		$(WRKDIR)/apache-$(PKG_NAME)-$(PKG_VERSION)

include ../rules.mk

install: ${STAGING_JAVA_HOST_DIR}/usr/bin/ant

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	cd $(WRKBUILD)/lib/optional; wget http://openadk.org/distfiles/junit-4.9b2.jar
	cp $(STAGING_JAVA_HOST_DIR)/usr/share/java/ecj.jar $(WRKBUILD)/lib/optional
	cd ${WRKBUILD}; export BOOTJAVAC_OPTS="-bootclasspath $(STAGING_JAVA_HOST_DIR)/usr/share/classpath/glibj.zip" \
		LD_LIBRARY_PATH=$(STAGING_JAVA_HOST_DIR)/usr/lib:$(STAGING_JAVA_HOST_DIR)/usr/lib64 \
		JAVA_HOME=$(STAGING_JAVA_HOST_DIR)/usr/lib/jvm ; \
		$(BASH) build.sh
	touch $@

${STAGING_JAVA_HOST_DIR}/usr/bin/ant: $(WRKBUILD)/.compiled
	cd $(WRKBUILD)/dist; \
	$(CP) bin/* $(STAGING_JAVA_HOST_DIR)/usr/bin ; \
	$(CP) lib/* $(STAGING_JAVA_HOST_DIR)/usr/lib

include $(TOPDIR)/mk/tools.mk
