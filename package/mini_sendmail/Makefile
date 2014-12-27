# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		mini-sendmail
PKG_VERSION:=		1.3.6
PKG_RELEASE:=		1
PKG_HASH:=		b9f7c20e2d148c8b9369cf8ca65a2b0a72ff29b377f0cdceb5f1d4e184fedd34
PKG_DESCR:=		small sendmail-compatible mail forwarder
PKG_SECTION:=		net/mail
PKG_URL:=		http://www.acme.com/software/mini_sendmail/
PKG_SITES:=		http://www.acme.com/software/mini_sendmail/

DISTFILES:=		mini_sendmail-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/mini_sendmail-${PKG_VERSION}

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MINI_SENDMAIL,mini-sendmail,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
INSTALL_STYLE:=		manual

MAKE_FLAGS+=		OFLAGS="${TARGET_CFLAGS}"
MAKE_FLAGS+=		CC="${TARGET_CC}"

do-install:
	${INSTALL_DIR} ${IDIR_MINI_SENDMAIL}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/mini_sendmail \
		${IDIR_MINI_SENDMAIL}/usr/sbin/
	ln -sf mini_sendmail ${IDIR_MINI_SENDMAIL}/usr/sbin/sendmail

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
