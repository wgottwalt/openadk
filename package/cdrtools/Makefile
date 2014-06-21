# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		cdrtools
PKG_VERSION:=		3.01
PKG_RELEASE:=		1
PKG_MD5SUM:=		afd4563e335a614a11e042c7b6734d66
PKG_DESCR:=		cd writing tools
PKG_SECTION:=		sys/fs
PKG_URL:=		http://cdrecord.berlios.de/private/cdrecord.html
PKG_SITES:=		ftp://ftp.berlios.de/pub/cdrecord/

PKG_CFLINE_CDRTOOLS:=	depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,CDRTOOLS,cdrtools,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual

host-build:
	(cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET})

cdrtools-hostinstall:
	$(INSTALL_DIR) $(STAGING_HOST_DIR)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/mkisofs/OBJ/*/mkisofs \
		$(STAGING_HOST_DIR)/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
