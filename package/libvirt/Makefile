# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libvirt
PKG_VERSION:=		0.8.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		596bafb53bb6c079a0703f1726cb2305
PKG_DESCR:=		virtualization API
PKG_SECTION:=		libs
PKG_DEPENDS:=		libxml2 libgnutls python2 libpcap
PKG_BUILDDEP:=		libxml2 gnutls python2 libpcap
PKG_URL:=		http://www.libvirt.org/
PKG_SITES:=		ftp://libvirt.org/libvirt/

PKG_HOST_DEPENDS:=	!freebsd !netbsd !openbsd
PKG_ARCH_DEPENDS:=	x86 x86_64

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBVIRT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TCFLAGS+=		-std=c99
CONFIGURE_ARGS+=	--without-xen \
			--without-uml \
			--without-esx \
			--without-openvz \
			--without-lxc \
			--without-vbox \
			--without-macvtap \
			--disable-silent-rules \
			--without-sasl

post-install:
	${INSTALL_DIR} ${IDIR_LIBVIRT}/usr/lib ${IDIR_LIBVIRT}/usr/bin
	${INSTALL_DIR} ${IDIR_LIBVIRT}/etc/libvirt ${IDIR_LIBVIRT}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/bin/virsh ${IDIR_LIBVIRT}/usr/bin
	${CP} ${WRKINST}/usr/lib/libvirt.so* ${IDIR_LIBVIRT}/usr/lib
	${CP} ${WRKINST}/etc/libvirt/* ${IDIR_LIBVIRT}/etc/libvirt
	${INSTALL_BIN} ${WRKINST}/usr/sbin/libvirtd ${IDIR_LIBVIRT}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
