# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		ssmtp
PKG_VERSION:=		2.61
PKG_RELEASE:=		1
PKG_HASH:=		2151ad18cb73f9a254f796dde2b48be7318b45410b59fedbb258db5a41044fb5
PKG_DESCR:=		minimal and secure mail sender
PKG_SECTION:=		net/mail
PKG_SITES:=		http://ftp.debian.org/debian/pool/main/s/ssmtp/

DISTFILES:=		${PKG_NAME}_${PKG_VERSION}.orig.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SSMTP,ssmtp,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

INSTALL_STYLE:=		manual

CONFIGURE_ENV+=		ac_cv_lib_nsl_gethostname=no

do-install:
	${INSTALL_DIR} ${IDIR_SSMTP}/etc/ssmtp
	${INSTALL_DIR} ${IDIR_SSMTP}/usr/sbin
	${INSTALL_DATA} ${WRKBUILD}/ssmtp.conf ${IDIR_SSMTP}/etc/ssmtp/
	${INSTALL_DATA} ${WRKBUILD}/revaliases ${IDIR_SSMTP}/etc/ssmtp/
	${INSTALL_BIN} ${WRKBUILD}/ssmtp ${IDIR_SSMTP}/usr/sbin/
	ln -sf ssmtp ${IDIR_SSMTP}/usr/sbin/sendmail

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
