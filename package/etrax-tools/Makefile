# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		etrax-tools
PKG_VERSION:=		1.0
PKG_RELEASE:=		1
PKG_DESCR:=		flash tools for cris etrax boards
PKG_SECTION:=		base/tools

NO_DISTFILES:=		1

PKG_CFLINE_ETRAX_TOOLS:=depends on ADK_HOST_ONLY

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,ETRAX_TOOLS,etrax-tools,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		manual

host-build:
	(cd ${WRKBUILD}/e100boot && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET}) $(MAKE_TRACE)

etrax-tools-hostinstall:
	$(HOST_CC) -o $(STAGING_HOST_DIR)/usr/bin/mkfimage $(WRKBUILD)/mkfimage.c
	$(CP) $(WRKBUILD)/boot_linux $(STAGING_HOST_DIR)/usr/bin
	$(CP) $(WRKBUILD)/e100boot/sbl/e100boot.stripped \
		$(STAGING_HOST_DIR)/usr/bin/e100boot


include ${ADK_TOPDIR}/mk/host-bottom.mk
include $(ADK_TOPDIR)/mk/pkg-bottom.mk
