# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		ecj
PKG_VERSION:=		4.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		7339f199ba11c941890031fd9981d7be
PKG_DESCR:=		ecj java compiler
PKG_SECTION:=		dev/lang
PKG_SITES:=		ftp://sourceware.org/pub/java/

PKG_CFLINE_ECJ:=	depends on ADK_HOST_ONLY
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.jar

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,ECJ,ecj,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual

ecj-hostinstall:
	env LD_LIBRARY_PATH=$(STAGING_HOST_DIR)/usr/lib:$(STAGING_HOST_DIR)/usr/lib64 \
	$(STAGING_HOST_DIR)/usr/bin/gcj -lgcj -O2 -findirect-dispatch \
		-o ${STAGING_HOST_DIR}/usr/bin/ecj.native \
		--main=org.eclipse.jdt.internal.compiler.batch.Main \
		$(DL_DIR)/${PKG_NAME}-${PKG_VERSION}.jar
	echo "env LD_LIBRARY_PATH=$(STAGING_HOST_DIR)/usr/lib:$(STAGING_HOST_DIR)/usr/lib64 ${STAGING_HOST_DIR}/usr/bin/ecj.native \$$@" > \
		${STAGING_HOST_DIR}/usr/bin/ecj
	chmod u+x ${STAGING_HOST_DIR}/usr/bin/ecj
	# put a wrapper for java here
	mv ${STAGING_HOST_DIR}/usr/bin/gij ${STAGING_HOST_DIR}/usr/bin/gij.native
	echo "env LD_LIBRARY_PATH=$(STAGING_HOST_DIR)/usr/lib:$(STAGING_HOST_DIR)/usr/lib64 ${STAGING_HOST_DIR}/usr/bin/gij.native \"\$$@\"" > \
		${STAGING_HOST_DIR}/usr/bin/hostjava
	chmod u+x ${STAGING_HOST_DIR}/usr/bin/hostjava
	echo "env LD_LIBRARY_PATH=$(STAGING_HOST_DIR)/usr/lib:$(STAGING_HOST_DIR)/usr/lib64 ${STAGING_HOST_DIR}/usr/bin/gij.native \"\$$@\"" > \
		${STAGING_HOST_DIR}/usr/bin/gij
	chmod u+x ${STAGING_HOST_DIR}/usr/bin/gij

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
