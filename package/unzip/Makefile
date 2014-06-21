# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		unzip
PKG_VERSION:=		6.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		62b490407489521db863b523a7f86375
PKG_DESCR:=		zip extraction utility
PKG_SECTION:=		app/archive
PKG_URL:=		http://www.info-zip.org/UnZip.html
PKG_SITES:=		http://downloads.sourceforge.net/infozip/

DISTFILES:=             ${PKG_NAME}60.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}60

include ${ADK_TOPDIR}/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,UNZIP,unzip,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,UNZIP,unzip,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_STYLE:=		manual
CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

TARGET_CPPFLAGS+=	-DNO_BZIP2_SUPPORT
CONFIGURE_PROG:=	unix/configure
MAKE_FILE:=		unix/Makefile
ALL_TARGET:=		generic_gcc

host-build:
	(cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${ALL_TARGET})

unzip-hostinstall:
	$(CP) $(WRKBUILD)/unzip \
		$(STAGING_HOST_DIR)/usr/bin

unzip-install:
	$(INSTALL_DIR) $(IDIR_UNZIP)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/unzip $(IDIR_UNZIP)/usr/bin

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
