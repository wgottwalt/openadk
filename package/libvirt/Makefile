# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libvirt
PKG_VERSION:=		0.7.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		1645975662a326969d2f42d5c04574aa
PKG_DESCR:=		virtualization API
PKG_SECTION:=		utils
PKG_DEPENDS:=		libxml2 libgnutls python
PKG_URL:=		http://www.libvirt.org
PKG_SITES:=		ftp://libvirt.org/libvirt/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBVIRT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TCFLAGS+=		-std=c99
CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--without-xen \
			--without-uml \
			--without-esx \
			--without-openvz \
			--without-vbox \
			--without-sasl
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_LIBVIRT}/usr/lib ${IDIR_LIBVIRT}/usr/bin
	${INSTALL_DIR} ${IDIR_LIBVIRT}/etc/libvirt ${IDIR_LIBVIRT}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/bin/virsh ${IDIR_LIBVIRT}/usr/bin
	${CP} ${WRKINST}/usr/lib/libvirt.so* ${IDIR_LIBVIRT}/usr/lib
	${CP} ${WRKINST}/etc/libvirt/* ${IDIR_LIBVIRT}/etc/libvirt
	${INSTALL_BIN} ${WRKINST}/usr/sbin/libvirtd ${IDIR_LIBVIRT}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
