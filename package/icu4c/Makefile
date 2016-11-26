# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		icu4c
PKG_VERSION:=		54.1
PKG_RELEASE:=		2
PKG_HASH:=		d42bc9a8ca6a91c55eb0925c279f49e5b508d51ef26ac9850d9be55de5bb8ab3
PKG_DESCR:=		unicode and globalization library
PKG_SECTION:=		libs/misc
PKG_BUILDDEP:=		icu4c-host
PKG_URL:=		http://icu-project.org
PKG_SITES:=		http://download.icu-project.org/files/icu4c/$(PKG_VERSION)/
PKG_OPTS:=		dev

DISTFILES:=             ${PKG_NAME}-54_1-src.tgz

WRKDIST=		${WRKDIR}/icu/source

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,ICU4C,icu4c,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,ICU4C,icu4c,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_CFLAGS+=		-static-libstdc++ -fPIC
HOST_CXXFLAGS+=		-static-libstdc++ -fPIC
HOST_STYLE:=		auto
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
	$(CP) $(WRKINST)/usr/lib/libicudata.so* \
		$(IDIR_ICU4C)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libicui18n.so* \
		$(IDIR_ICU4C)/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
