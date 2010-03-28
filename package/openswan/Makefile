# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openswan
PKG_VERSION:=		2.6.24
PKG_RELEASE:=		1
PKG_MD5SUM:=		1c76b6982c05392f7c360afb92699661
PKG_DESCR:=		IPSec software
PKG_SECTION:=		net
PKG_DEPENDS:=		ip libgmp
PKG_BUILDDEP+=		gmp
PKG_URL:=		http://www.openswan.org
PKG_SITES:=		http://www.openswan.org/download/ \
			ftp://ftp.openswan.org/openswan/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENSWAN,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

#ifeq ($(ADK_COMPILE_OPENSWAN_WITH_NETKEY),y)
#XAKE_FLAGS+=		USE_KLIPS=false USE_NETKEY=true
#endif

#ifeq ($(ADK_COMPILE_OPENSWAN_WITH_KLIPS),y)
#XAKE_FLAGS+=		USE_KLIPS=true USE_NETKEY=false
#endif

CONFIG_STYLE:=		manual

XAKE_FLAGS+=		KERNELSRC="${LINUX_DIR}" \
			IPSECDIR="/usr/lib/ipsec" \
			INC_USRLOCAL="/usr" \
			MODPROBE="insmod" \
			OSDEP="linux" \
			WERROR="" \
			BUILDENV="linux"
ALL_TARGET:=		programs

post-install:
	${INSTALL_DIR} ${IDIR_OPENSWAN}/usr/lib/ipsec
	${INSTALL_DIR} ${IDIR_OPENSWAN}/usr/libexec/ipsec
	${INSTALL_DIR} ${IDIR_OPENSWAN}/etc/ipsec.d 
	${INSTALL_DIR} ${IDIR_OPENSWAN}/usr/sbin
	${INSTALL_DATA} ${WRKINST}/etc/ipsec.conf ${IDIR_OPENSWAN}/etc/
	${CP} ${WRKINST}/etc/ipsec.d/* ${IDIR_OPENSWAN}/etc/ipsec.d
	${CP} ${WRKINST}/usr/lib/ipsec/* ${IDIR_OPENSWAN}/usr/lib/ipsec
	${CP} ${WRKINST}/usr/libexec/ipsec/* ${IDIR_OPENSWAN}/usr/libexec/ipsec
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ipsec ${IDIR_OPENSWAN}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
