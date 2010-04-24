# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		dropbear
PKG_VERSION:=		0.52
PKG_RELEASE:=		2
PKG_MD5SUM:=		1c69ec674481d7745452f68f2ea5597e
PKG_DESCR:=		SSH 2 server/client designed for embedded systems 
PKG_SECTION:=		net/security
PKG_URL:=		http://matt.ucc.asn.au/dropbear
PKG_SITES:=		http://matt.ucc.asn.au/dropbear/releases/

PKG_DESCR_UTIL:=	Utility for converting SSH private keys

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,DROPBEAR,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,DBCONVERT,dropbearconvert,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_UTIL},${PKG_SECTION}))

PKGDFLT_DROPBEAR:=	y if !ADK_TOOLCHAIN_ONLY

BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

CONFIGURE_ARGS+=	--disable-pam \
			--enable-openpty \
			--enable-syslog \
			--enable-shadow \
			--disable-lastlog \
			--disable-utmp \
			--disable-utmpx \
			--disable-wtmp \
			--disable-wtmpx \
			--disable-loginfunc \
			--disable-pututline \
			--disable-pututxline \
			--disable-zlib

pre-configure:
	$(SED) 's,^/\* #define PKG_MULTI.*,#define PKG_MULTI,g' $(WRKBUILD)/options.h
	$(SED) 's,^#define DO_HOST_LOOKUP,/* & */,g' $(WRKBUILD)/options.h

do-build:
	cd ${WRKBUILD} && env ${MAKE_ENV} ${MAKE} \
	    PROGRAMS="dropbear dbclient dropbearkey scp" MULTI=1 SCPPROGRESS=1
	cd ${WRKBUILD} && env ${MAKE_ENV} ${MAKE} \
	    PROGRAMS=dropbearconvert

do-install:
	# main package
	$(INSTALL_DIR) $(IDIR_DROPBEAR)/usr/bin
	$(INSTALL_DIR) $(IDIR_DROPBEAR)/usr/sbin
	$(INSTALL_BIN) $(WRKBUILD)/dropbearmulti \
		$(IDIR_DROPBEAR)/usr/sbin/dropbear
	ln -sf ../sbin/dropbear $(IDIR_DROPBEAR)/usr/bin/scp
	ln -sf ../sbin/dropbear $(IDIR_DROPBEAR)/usr/bin/ssh
	ln -sf ../sbin/dropbear $(IDIR_DROPBEAR)/usr/bin/dbclient
	ln -sf ../sbin/dropbear $(IDIR_DROPBEAR)/usr/bin/dropbearkey
	# subpackage dropbearconvert
	$(INSTALL_DIR) $(IDIR_DBCONVERT)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/dropbearconvert \
		$(IDIR_DBCONVERT)/usr/bin/dropbearconvert

include ${TOPDIR}/mk/pkg-bottom.mk
