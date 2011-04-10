# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		jikes
PKG_VERSION:=		1.22
PKG_RELEASE:=		1
PKG_MD5SUM:=		14d4bdfac236e347d806c6743dba48c6
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=jikes/Jikes/1.22/}

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.bz2

include ../rules.mk

install: ${STAGING_JAVA_HOST_DIR}/usr/bin/jikes

$(WRKBUILD)/.configured: ${WRKDIST}/.prepared
	(cd $(WRKBUILD); ./configure --prefix=/usr);
	touch $@

$(WRKBUILD)/.compiled: ${WRKDIST}/.configured
	${MAKE} -C ${WRKBUILD} $(MAKE_TRACE)
	touch $@

${STAGING_JAVA_HOST_DIR}/usr/bin/jikes: $(WRKBUILD)/.compiled
	${MAKE} -C ${WRKBUILD} DESTDIR=$(STAGING_JAVA_HOST_DIR) install $(MAKE_TRACE)
	$(CP) ${STAGING_JAVA_HOST_DIR}/usr/bin/jikes ${STAGING_JAVA_HOST_DIR}/usr/lib/jvm/bin/javac
	$(CP) ${STAGING_JAVA_HOST_DIR}/usr/bin/jikes ${STAGING_JAVA_HOST_DIR}/usr/lib/jvm/jre/bin/javac

include $(TOPDIR)/mk/tools.mk
