# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ipset
PKG_VERSION:=		4.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		d104007fdf5ea64fef774c22b1c0a97b
PKG_DESCR:=		ip sets administration utility
PKG_SECTION:=		firewall
PKG_URL:=		http://ipset.netfilter.org/
PKG_SITES:=		http://ipset.netfilter.org/

PKG_SUBPKGS:=		IPSET IPSET_KMOD
PKGSD_IPSET_KMOD:=	ipset kernel module
PKGSC_IPSET_KMOD:=	kernel

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IPSET,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,IPSET_KMOD,ipset-kmod,${KERNEL_VERSION}+${PKG_VERSION}-${ADK_TARGET}-${PKG_RELEASE},,${PKGSD_IPSET_KMOD},${PKGSC_IPSET_KMOD}))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		PREFIX=/usr
ALL_TARGET:=		binaries
INSTALL_TARGET:=	binaries_install

pre-build:
	V=1 ARCH=${ARCH} KERNEL_DIR=${LINUX_DIR} \
	PREFIX=/usr CROSS_COMPILE="${TARGET_CROSS}" \
	LD=$(TARGET_CROSS)gcc LDFLAGS="" \
	$(MAKE) -C ${WRKBUILD} modules

post-install:
	${INSTALL_DIR} ${IDIR_IPSET}/usr/sbin ${IDIR_IPSET}/usr/lib/ipset
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ipset ${IDIR_IPSET}/usr/sbin
	${CP} ${WRKINST}/usr/lib/ipset/*.so ${IDIR_IPSET}/usr/lib/ipset/
	# kernel modules (no autoload at the moment)
	${INSTALL_DIR} ${IDIR_IPSET_KMOD}/lib/modules/${KERNEL_VERSION}/
	${INSTALL_DATA} ${WRKBUILD}/kernel/*.ko \
		${IDIR_IPSET_KMOD}/lib/modules/${KERNEL_VERSION}

include ${TOPDIR}/mk/pkg-bottom.mk
