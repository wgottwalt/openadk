# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openswan
PKG_VERSION:=		2.6.21
PKG_RELEASE:=		1
PKG_MD5SUM:=		ba9da6c90e0f5fe856767d7510ce371f
PKG_DESCR:=		IPSec software
PKG_SECTION:=		net
PKG_DEPENDS:=		ip libgmp
PKG_URL:=		http://www.openswan.org
PKG_SITES:=		http://www.openswan.org/download/ \
			ftp://ftp.openswan.org/openswan/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENSWAN,openswan,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

FLAGS:=			${TCFLAGS} ${TCPPFLAGS} ${TLDFLAGS}

do-build:
	${MAKE} -C ${WRKBUILD} \
		${TARGET_CONFIGURE_OPTS} \
		KERNELSRC="${LINUX_DIR}" \
		ARCH="${ARCH}" \
		USERCOMPILE="${FLAGS}" \
		EXTRA_INCLUDE="${TCPPFLAGS}" \
		EXTRA_LIBS="${TLDFLAGS}" \
		IPSECDIR="/usr/lib/ipsec" \
		INC_USRLOCAL="/usr" \
		MODPROBE="insmod" \
		programs

do-install:
	${MAKE} -C ${WRKBUILD} \
		${TARGET_CONFIGURE_OPTS} \
		DESTDIR="${IDIR_OPENSWAN}" \
		KERNELSRC="${LINUX_DIR}" \
		ARCH="${ARCH}" \
		USERCOMPILE="${FLAGS}" \
		IPSECDIR="/usr/lib/ipsec" \
		INC_USRLOCAL="/usr" \
		MODPROBE="insmod" \
		install
	rm -rf ${IDIR_OPENSWAN}/usr/share
	rm -rf ${IDIR_OPENSWAN}/usr/man
	rm -rf ${IDIR_OPENSWAN}/var
	mv ${IDIR_OPENSWAN}/etc/rc.d/init.d/ipsec \
		${IDIR_OPENSWAN}/usr/libexec/ipsec/setup
	rm -rf ${IDIR_OPENSWAN}/etc/rc*.d
	find ${IDIR_OPENSWAN} -name \*.old -print0 | xargs -0 rm -rf

include ${TOPDIR}/mk/pkg-bottom.mk
