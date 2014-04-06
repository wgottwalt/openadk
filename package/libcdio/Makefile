# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libcdio
PKG_VERSION:=		0.92
PKG_RELEASE:=		1
PKG_MD5SUM:=		86f3f2869c1d34e4c6e52db77992b918
PKG_DESCR:=		library for CD-ROM and CD image access
PKG_SECTION:=		libs
PKG_BUILDDEP:=		libiconv-tiny
PKG_URL:=		http://www.gnu.org/software/libcdio
PKG_SITES:=		${MASTER_SITE_GNU:=libcdio/}
PKG_OPTS:=		dev

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBCDIO,libcdio,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_LDFLAGS+=	-ltinfo

libcdio-install:
	$(INSTALL_DIR) $(IDIR_LIBCDIO)/usr/lib
	$(CP) $(WRKINST)/usr/lib/libcdio*.so* \
		$(IDIR_LIBCDIO)/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
