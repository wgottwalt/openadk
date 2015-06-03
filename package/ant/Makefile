# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ant
PKG_VERSION:=		1.8.4
PKG_RELEASE:=		1
PKG_HASH:=		5de65f7ba3f67e436ffffcdc0a73f591d1006e9fb41af8632c1f1f84d4a3e0b1
PKG_DESCR:=		java code build utility
PKG_SECTION:=		dev/tools
HOST_BUILDDEP:=		gcj-host
PKG_SITES:=		http://archive.apache.org/dist/ant/source/

PKG_CFLINE_ANT:=	depends on ADK_HOST_ONLY

DISTFILES:=             apache-$(PKG_NAME)-$(PKG_VERSION)-src.tar.bz2
WRKDIST=                $(WRKDIR)/apache-$(PKG_NAME)-$(PKG_VERSION)

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,ANT,ant,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual

host-build:
	if [ ! -f $(WRKBUILD)/lib/optional/junit-4.9b2.jar ];then \
		cd $(WRKBUILD)/lib/optional; wget http://distfiles.openadk.org/junit-4.9b2.jar; \
	fi
	cp $(DL_DIR)/ecj*.jar $(WRKBUILD)/lib/optional/ecj.jar
	(cd ${WRKBUILD}; \
		export JAVA_HOME=$(STAGING_HOST_DIR)/usr/lib/jvm ;\
		export CLASSPATH=$(STAGING_HOST_DIR)/usr/lib/jvm/lib/tools.jar ;\
		export JAVAC=$(STAGING_HOST_DIR)/usr/bin/ecj ;\
		export JAVACMD=$(STAGING_HOST_DIR)/usr/bin/gij ;\
		$(BASH) ./build.sh)

ant-hostinstall:
	cd $(WRKBUILD)/dist; \
	$(CP) bin/* $(STAGING_HOST_DIR)/usr/bin ; \
	$(CP) lib/* $(STAGING_HOST_DIR)/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
