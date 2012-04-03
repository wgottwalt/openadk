# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libvirt
PKG_VERSION:=		0.9.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		a424bb793521e637349da47e93dd5fff
PKG_DESCR:=		virtualization API
PKG_SECTION:=		libs
PKG_BUILDDEP:=		libxml2 gnutls python2 libpcap parted udev
PKG_DEPENDS:=		libxml2 libgnutls python2 libpcap libreadline
PKG_DEPENDS+=		libintl dmidecode kmod-netfilter-xt-target-checksum
PKG_DEPENDS+=		dnsmasq qemu libnl
PKG_URL:=		http://www.libvirt.org/
PKG_SITES:=		ftp://libvirt.org/libvirt/

PKG_HOST_DEPENDS:=	!freebsd !netbsd !openbsd
PKG_ARCH_DEPENDS:=	x86 x86_64

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBVIRT,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

include ${TOPDIR}/mk/python.mk

TARGET_CPPFLAGS+=	-I${STAGING_TARGET_DIR}/usr/include/tirpc

CONFIGURE_ENV+=		gl_cv_warn__fstack_protector_all=no \
			ac_cv_path_IPTABLES_PATH=/usr/sbin/iptables \
			ac_cv_path_IP6TABLES_PATH=/usr/sbin/ip6tables \
			ac_cv_path_IP_PATH=/bin/ip
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
	${INSTALL_DIR} ${IDIR_LIBVIRT}/usr/share/libvirt
	$(CP) $(WRKINST)/usr/share/libvirt/* \
		${IDIR_LIBVIRT}/usr/share/libvirt
	${INSTALL_BIN} ${WRKINST}/usr/bin/virsh ${IDIR_LIBVIRT}/usr/bin
	${CP} ${WRKINST}/usr/lib/libvirt*.so* ${IDIR_LIBVIRT}/usr/lib
	${CP} ${WRKINST}/etc/libvirt/* ${IDIR_LIBVIRT}/etc/libvirt
	${INSTALL_BIN} ${WRKINST}/usr/sbin/libvirtd ${IDIR_LIBVIRT}/usr/sbin
	${INSTALL_DIR} ${IDIR_LIBVIRT}/usr/lib/python$(PYTHON_VERSION)/site-packages
	$(CP) $(WRKINST)/usr/lib/python$(PYTHON_VERSION)/site-packages/* \
		${IDIR_LIBVIRT}/usr/lib/python$(PYTHON_VERSION)/site-packages

include ${TOPDIR}/mk/pkg-bottom.mk
