# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		jikes
PKG_VERSION:=		1.22
PKG_RELEASE:=		1
PKG_MD5SUM:=		14d4bdfac236e347d806c6743dba48c6
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=jikes/Jikes/2.22/}
#http://sourceforge.net/projects/jikes/files/Jikes/1.22/jikes-1.22.tar.bz2/download

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

include $(TOPDIR)/mk/tools.mk
