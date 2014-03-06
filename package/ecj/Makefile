# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		ecj
PKG_VERSION:=		4.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		c474fa9d0c35a24037c23b6e476862c1
PKG_DESCR:=		ecj java compiler
PKG_SECTION:=		lang

NO_DISTFILES:=		1

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,ECJ,ecj,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual

ecj-hostinstall:
	env LD_LIBRARY_PATH=$(STAGING_HOST_DIR)/usr/lib:$(STAGING_HOST_DIR)/usr/lib64 \
	$(STAGING_HOST_DIR)/usr/bin/gcj -lgcj -O2 -findirect-dispatch \
		-o ${STAGING_HOST_DIR}/usr/bin/ecj.native \
		--main=org.eclipse.jdt.internal.compiler.batch.Main \
		$(DISTDIR)/ecj.jar
	echo "env LD_LIBRARY_PATH=$(STAGING_HOST_DIR)/usr/lib:$(STAGING_HOST_DIR)/usr/lib64 ${STAGING_HOST_DIR}/usr/bin/ecj.native \$$@" > \
		${STAGING_HOST_DIR}/usr/bin/ecj
	chmod u+x ${STAGING_HOST_DIR}/usr/bin/ecj
	# put a wrapper for java here
	mv ${STAGING_HOST_DIR}/usr/bin/gij ${STAGING_HOST_DIR}/usr/bin/gij.native
	echo "env LD_LIBRARY_PATH=$(STAGING_HOST_DIR)/usr/lib:$(STAGING_HOST_DIR)/usr/lib64 ${STAGING_HOST_DIR}/usr/bin/gij.native \"\$$@\"" > \
		${STAGING_HOST_DIR}/usr/bin/java
	chmod u+x ${STAGING_HOST_DIR}/usr/bin/java
	echo "env LD_LIBRARY_PATH=$(STAGING_HOST_DIR)/usr/lib:$(STAGING_HOST_DIR)/usr/lib64 ${STAGING_HOST_DIR}/usr/bin/gij.native \"\$$@\"" > \
		${STAGING_HOST_DIR}/usr/bin/gij
	chmod u+x ${STAGING_HOST_DIR}/usr/bin/gij

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
