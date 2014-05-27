# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		libvirt
PKG_VERSION:=		1.2.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		da7a9ca519df45a460659189fe0024e6
PKG_DESCR:=		virtualization API
PKG_SECTION:=		libs
PKG_BUILDDEP:=		libxml2 gnutls python2 libpcap parted eudev qemu
PKG_DEPENDS:=		libxml2 libgnutls python2 libpcap libreadline
PKG_DEPENDS+=		dmidecode dnsmasq qemu libnl libudev
PKG_URL:=		http://www.libvirt.org/
PKG_SITES:=		http://libvirt.org/sources/
PKG_OPTS:=		dev

PKG_CFLINE_LIBVIRT:=	depends on ADK_BROKEN

PKG_HOST_DEPENDS:=	!freebsd !netbsd !openbsd
PKG_ARCH_DEPENDS:=	x86 x86_64
PKG_LIBC_DEPENDS:=	glibc
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBVIRT,libvirt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${TOPDIR}/mk/python.mk

TARGET_CPPFLAGS+=	-I${STAGING_TARGET_DIR}/usr/include/tirpc
ifeq ($(ADK_TARGET_USE_SSP),)
TARGET_CFLAGS+=		-fno-stack-protector
endif

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
			--without-vmware \
			--without-macvtap \
			--without-remote \
			--disable-silent-rules \
			--without-sasl \
			--with-qemu \
			--with-libvirtd

libvirt-install:
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
