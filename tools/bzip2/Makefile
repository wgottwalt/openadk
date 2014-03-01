# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		bzip2
PKG_VERSION:=		1.0.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		00b516f4704d4a7cb50a1d97e6e8e15b
PKG_SITES:=		http://www.bzip.org/${PKG_VERSION}/

include ../rules.mk

install: ${STAGING_HOST_DIR}/usr/bin/bzip2

$(WRKBUILD)/.compiled: ${WRKDIST}/.prepared
	${MAKE} -C ${WRKBUILD} CC='${CC_FOR_BUILD}' PREFIX=$(STAGING_HOST_DIR)/usr
	touch $@

${STAGING_HOST_DIR}/usr/bin/bzip2: $(WRKBUILD)/.compiled
	$(INSTALL_BIN) $(WRKBUILD)/bzip2 \
		${STAGING_HOST_DIR}/usr/bin

include $(TOPDIR)/mk/tools.mk
