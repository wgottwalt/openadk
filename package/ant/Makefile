# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		ant
PKG_VERSION:=		1.8.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		c474fa9d0c35a24037c23b6e476862c1
PKG_DESCR:=		ant utility
PKG_SECTION:=		lang
HOST_BUILDDEP:=		gcj-host
PKG_SITES:=		http://archive.apache.org/dist/ant/source/

PKG_CFLINE_ANT:=	depends on ADK_HOST_ONLY

DISTFILES:=             apache-$(PKG_NAME)-$(PKG_VERSION)-src.tar.bz2
WRKDIST=                $(WRKDIR)/apache-$(PKG_NAME)-$(PKG_VERSION)

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,ANT,ant,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual

host-build:
	if [ ! -f $(WRKBUILD)/lib/optional/junit-4.9b2.jar ];then \
		cd $(WRKBUILD)/lib/optional; wget http://openadk.org/distfiles/junit-4.9b2.jar; \
	fi
	cp $(DL_DIR)/ecj*.jar $(WRKBUILD)/lib/optional/ecj.jar
	cd ${WRKBUILD}; export BOOTJAVAC_OPTS="-bootclasspath $(STAGING_HOST_DIR)/usr/share/classpath/glibj.zip" \
		LD_LIBRARY_PATH=$(STAGING_HOST_DIR)/usr/lib:$(STAGING_HOST_DIR)/usr/lib64 \
		JAVA_HOME=$(STAGING_HOST_DIR)/usr/lib/jvm ; \
		$(BASH) build.sh

ant-hostinstall:
	cd $(WRKBUILD)/dist; \
	$(CP) bin/* $(STAGING_HOST_DIR)/usr/bin ; \
	$(CP) lib/* $(STAGING_HOST_DIR)/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
