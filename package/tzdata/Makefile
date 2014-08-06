# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		tzdata
PKG_VERSION:=		2014d
PKG_RELEASE:=		1
PKG_MD5SUM:=		299b86c0368ecfb321f15d5c408a1d9b 4a0f5f259ba8a2b826fffb1fa26d0134
PKG_DESCR:=		timezone data (/usr/share/zoneinfo)
PKG_SECTION:=		base/apps
PKG_URL:=		http://www.iana.org/time-zones/
PKG_SITES:=		http://www.iana.org/time-zones/repository/releases/
PKG_NOPARALLEL:=	1

PKG_LIBC_DEPENDS:=	glibc musl

DISTFILES:=             ${PKG_NAME}${PKG_VERSION}.tar.gz tzcode${PKG_VERSION}.tar.gz
# both archives do not extract into subdirectories
WRKDIST=		${WRKDIR}

# no use for tzselect, since that is a ksh-script
PKG_SUBPKGS:=		TZDATA DATE
PKGSD_DATE:=		famous date utility

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,TZDATA,tzdata,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,DATE,date,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_DATE},${PKG_SECTION}))

CONFIG_STYLE:=		manual
HOST_CFLAGS+=		-DSTD_INSPIRED=1 -DHAVE_STDINT_H=1
TARGET_CFLAGS+=		-DHAVE_INTTYPES_H=1
XAKE_FLAGS+=		TZDIR="/usr/share/zoneinfo" cc="${TARGET_CC}"
# the uppercase targets enable building and installation of the date utility
ALL_TARGET:=		ALL
INSTALL_TARGET:=	INSTALL

tzdata-install:
	$(INSTALL_DIR) $(IDIR_TZDATA)/usr/share/zoneinfo $(IDIR_TZDATA)/etc
	cd ${WRKINST} && for f in UTC ${ADK_RUNTIME_TIMEZONE}; do \
		test -s usr/share/zoneinfo/"$$f" || continue; \
		echo usr/share/zoneinfo/"$$f" | \
		${STAGING_HOST_DIR}/usr/bin/cpio -pdu ${IDIR_TZDATA}/; \
	done
	tz=; cd $(IDIR_TZDATA)/usr/share/zoneinfo || exit 1; \
		for f in UTC ${ADK_RUNTIME_TIMEZONE}; do \
			test -s "$$f" || continue; \
			tz=$$f; \
	done; if test x"$$tz" = x""; then \
		echo >&2 Error during timezone installation; \
		exit 1; \
	else \
		ln -sf "../usr/share/zoneinfo/$$tz" \
		$(IDIR_TZDATA)/etc/localtime; \
	fi	

date-install:
	${INSTALL_DIR} ${IDIR_DATE}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/date ${IDIR_DATE}/usr/bin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
