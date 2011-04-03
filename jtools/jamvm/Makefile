# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		jamvm
PKG_VERSION:=		1.5.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		63220327925ace13756ae334c55a3baa
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=jamvm/}

include ../rules.mk

install: ${STAGING_JAVA_HOST_DIR}/usr/bin/jamvm

$(WRKBUILD)/.configured: ${WRKDIST}/.prepared
	(cd $(WRKBUILD); ./configure --prefix=/usr --with-classpath-install-dir=$(STAGING_JAVA_HOST_DIR) );
	touch $@

$(WRKBUILD)/.compiled: ${WRKDIST}/.configured
	${MAKE} -C ${WRKBUILD} $(MAKE_TRACE)
	touch $@

${STAGING_JAVA_HOST_DIR}/usr/bin/jamvm: $(WRKBUILD)/.compiled
	${MAKE} -C ${WRKBUILD} DESTDIR=$(STAGING_JAVA_HOST_DIR) install $(MAKE_TRACE)

include $(TOPDIR)/mk/tools.mk
