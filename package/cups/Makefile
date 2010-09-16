# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cups
PKG_VERSION:=		1.4.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		d95e2d588e3d36e563027a963b117b1b
PKG_DESCR:=		Common Unix Printing System
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		zlib libpthread
PKG_BUILDDEP:=		zlib
PKG_URL:=		http://www.cups.org/
PKG_SITES:=		ftp://ftp.easysw.com/pub/cups/${PKG_VERSION}/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-source.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CUPS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_func_sigset=no \
			OPTIM='-fPIC'
CONFIGURE_ARGS+=	--with-cups-user=0 \
			--with-cups-group=0 \
			--disable-ldap \
			--disable-gssapi \
			--disable-pam \
			--disable-pap \
			--disable-dbus \
			--without-java \
			--without-perl \
			--without-python \
			--without-php \
			--disable-slp \
			--disable-gnutls \
			--disable-openssl \
			--disable-cdsassl \
			--disable-dbus \
			--disable-ssl

FAKE_FLAGS+=		DSTROOT="${WRKINST}" STRIP="/bin/true"
XAKE_FLAGS+=		OPTIM='-fPIC'

post-install:
	${INSTALL_DIR} ${IDIR_CUPS}/usr/bin
	${INSTALL_DIR} ${IDIR_CUPS}/usr/sbin
	${INSTALL_DIR} ${IDIR_CUPS}/etc/cups
	${INSTALL_DIR} ${IDIR_CUPS}/usr/lib/cups/cgi-bin
	${INSTALL_DIR} ${IDIR_CUPS}/usr/lib/cups/daemon
	${INSTALL_DIR} ${IDIR_CUPS}/usr/share/cups/banners
	${INSTALL_DIR} ${IDIR_CUPS}/usr/share/doc/cups
	${INSTALL_DIR} ${IDIR_CUPS}/usr/share/cups/templates
	${CP} ${WRKINST}/etc/cups/* ${IDIR_CUPS}/etc/cups/
	rm ${IDIR_CUPS}/etc/cups/cupsd.conf.default
	${CP} ${WRKINST}/usr/bin/* ${IDIR_CUPS}/usr/bin/
	${CP} ${WRKINST}/usr/share/doc/cups/index.html \
		${IDIR_CUPS}/usr/share/doc/cups/
	${CP} ${WRKINST}/usr/share/doc/cups/*.css \
		${IDIR_CUPS}/usr/share/doc/cups/
	${CP} ${WRKINST}/usr/share/doc/cups/images \
		${IDIR_CUPS}/usr/share/doc/cups/
	rm -f ${IDIR_CUPS}/usr/bin/cups-config
	${CP} ${WRKINST}/usr/lib/libcups*.so* ${IDIR_CUPS}/usr/lib/
	${CP} ${WRKINST}/usr/lib/cups/cgi-bin/* \
		${IDIR_CUPS}/usr/lib/cups/cgi-bin/
	${CP} ${WRKINST}/usr/lib/cups/daemon/* \
		${IDIR_CUPS}/usr/lib/cups/daemon/
	${CP} ${WRKINST}/usr/share/cups/banners/* \
		${IDIR_CUPS}/usr/share/cups/banners/
	${CP} ${WRKINST}/usr/share/cups/templates/*.tmpl \
		${IDIR_CUPS}/usr/share/cups/templates/
	${CP} ${WRKINST}/usr/sbin/* ${IDIR_CUPS}/usr/sbin/
	${CP} ./files/etc/cups/* ${IDIR_CUPS}/etc/cups/

include ${TOPDIR}/mk/pkg-bottom.mk
