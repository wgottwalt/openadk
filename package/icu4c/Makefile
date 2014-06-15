# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		icu4c
PKG_VERSION:=		52.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		9e96ed4c1d99c0d14ac03c140f9f346c
PKG_DESCR:=		unicode and globalization library
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		icu4c-host
PKG_URL:=		http://icu-project.org
PKG_SITES:=		http://download.icu-project.org/files/icu4c/52.1/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-52_1-src.tgz

WRKDIST=		${WRKDIR}/icu/source

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,ICU4C,icu4c,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,ICU4C,icu4c,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

CFLAGS_FOR_BUILD+=	-fPIC
CXXFLAGS_FOR_BUILD+=	-fPIC
HOST_CONFIGURE_ARGS+=	--enable-extras=no \
			--enable-samples=no \
			--enable-tests=no \
			--enable-dyload=no \
			--enable-shared=no \
			--enable-static
CONFIGURE_ARGS+=	--with-cross-build=${HOST_BUILD_DIR}/w-${PKG_NAME}-${PKG_VERSION}-${PKG_RELEASE}-host/icu/source \
			--enable-extras=no \
			--enable-samples=no \
			--enable-tests=no \

icu4c-hostinstall:

icu4c-install:
	$(INSTALL_DIR) $(IDIR_ICU4C)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libicuuc.so* \
		$(IDIR_ICU4C)/usr/lib

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
