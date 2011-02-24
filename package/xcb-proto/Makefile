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
$(eval $(call PKG_template,XCB_PYTHON,xcb-python,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include $(TOPDIR)/mk/python.mk

CONFIGURE_ENV+=		PYTHON=$(PYTHON)

xcb-proto-install:
	${INSTALL_DIR} ${IDIR_XCB_PROTO}/usr/share/
	${CP} ${WRKINST}/usr/share/xcb ${IDIR_XCB_PROTO}/usr/share
	${INSTALL_DIR} ${STAGING_DIR}/usr/share/xcb
	${CP} ${WRKINST}/usr/share/xcb/* ${STAGING_DIR}/usr/share/xcb
	${INSTALL_DIR} ${IDIR_XCB_PROTO}/usr/lib/pkgconfig
	${INSTALL_DATA} ${WRKINST}/usr/lib/pkgconfig/xcb-proto.pc \
		${IDIR_XCB_PROTO}/usr/lib/pkgconfig

xcb-python-install:
	${INSTALL_DIR} ${IDIR_XCB_PYTHON}/usr/lib/python${PYTHON_VERSION}/site-packages/xcbgen
	${CP} ${WRKINST}/usr/lib/python${PYTHON_VERSION}/site-packages/xcbgen/*.py \
		${IDIR_XCB_PYTHON}/usr/lib/python${PYTHON_VERSION}/site-packages/xcbgen

include ${TOPDIR}/mk/pkg-bottom.mk
