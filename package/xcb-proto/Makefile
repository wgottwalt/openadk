# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		xcb-proto
PKG_VERSION:=		1.6
PKG_RELEASE:=		1
PKG_DESCR:=		XML-XCB protocol descriptions
PKG_SECTION:=		x11/devel
PKG_BUILDDEP:=		python2
PKG_MD5SUM:=		8d29695e8faf5fcdce568c66eaeaa5ee
PKG_SITES:=		${MASTER_SITE_XORG}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,XCB_PROTO,xcb-proto,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

post-install:
	${INSTALL_DIR} ${IDIR_XCB_PROTO}/usr/share
	${CP} ${WRKINST}/usr/share/xcb ${IDIR_XCB_PROTO}/usr/share
	${CP} ${WRKINST}/usr/share/xcb ${STAGING_TARGET_DIR}/usr/share

include ${TOPDIR}/mk/pkg-bottom.mk
