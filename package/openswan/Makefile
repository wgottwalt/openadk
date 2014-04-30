# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openswan
PKG_VERSION:=		2.6.41
PKG_RELEASE:=		1
PKG_MD5SUM:=		da2e8b02ecc30a408cc5766767fef84f
PKG_DESCR:=		IPsec software
PKG_SECTION:=		net/security
PKG_DEPENDS:=		ip libgmp libpthread kmod-net-key kmod-xfrm-user
PKG_DEPENDS+=		kmod-inet-ah kmod-inet-esp
PKG_DEPENDS+=		kmod-inet-xfrm-mode-tunnel kmod-inet-xfrm-mode-transport
PKG_DEPENDS+=		kmod-crypto-sha1 kmod-crypto-md5
PKG_DEPENDS+=		kmod-crypto-null kmod-crypto-des kmod-crypto-aes
PKG_DEPENDS+=		kmod-crypto-hmac kmod-crypto-cbc kmod-crypto-authenc
PKG_BUILDDEP:=		gmp
PKG_URL:=		http://www.openswan.org/
PKG_SITES:=		http://www.openswan.org/download/
PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

# GLOB_BRACE usage
PKG_LIBC_DEPENDS:=	uclibc glibc

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENSWAN,openswan,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		KERNELSRC="${LINUX_DIR}" \
			IPSECDIR="/usr/lib/ipsec" \
			INC_USRLOCAL="/usr" \
			MODPROBE="insmod" \
			OSDEP="linux" \
			WERROR="" \
			BUILDENV="linux"
ALL_TARGET:=		programs

openswan-install:
	${INSTALL_DIR} ${IDIR_OPENSWAN}/usr/lib/ipsec
	${INSTALL_DIR} ${IDIR_OPENSWAN}/usr/libexec/ipsec
	${INSTALL_DIR} ${IDIR_OPENSWAN}/etc/ipsec.d
	${INSTALL_DIR} ${IDIR_OPENSWAN}/usr/sbin
	${INSTALL_DATA} ${WRKINST}/etc/ipsec.conf ${IDIR_OPENSWAN}/etc/
	${CP} ${WRKINST}/etc/ipsec.d/* ${IDIR_OPENSWAN}/etc/ipsec.d
	${CP} ${WRKINST}/usr/lib/ipsec/* ${IDIR_OPENSWAN}/usr/lib/ipsec
	${CP} ${WRKINST}/usr/libexec/ipsec/* ${IDIR_OPENSWAN}/usr/libexec/ipsec
	rm ${IDIR_OPENSWAN}/usr/libexec/ipsec/setup
	${INSTALL_BIN} ${WRKINST}/etc/rc.d/init.d/ipsec \
		${IDIR_OPENSWAN}/usr/libexec/ipsec/setup
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ipsec ${IDIR_OPENSWAN}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
