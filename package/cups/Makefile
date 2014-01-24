# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cups
PKG_VERSION:=		1.7.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		55277c40fd4b7183dc3671d39c5c42b7
PKG_DESCR:=		Common Unix Printing System
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		zlib libpthread
PKG_BUILDDEP:=		cups-host zlib
PKG_URL:=		http://www.cups.org/
PKG_SITES:=		http://www.cups.org/software/${PKG_VERSION}/
PKG_NEED_CXX:=		1
PKG_OPTS:=		dev

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-source.tar.bz2

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,CUPS,cups,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,CUPS,cups,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

HOST_STYLE:=		auto
HOST_CONFIGURE_ARGS+=	--disable-tcp-wrappers \
			--disable-webif \
			--disable-gssapi \
			--disable-pam \
			--disable-dbus \
			--without-java \
			--without-perl \
			--without-python \
			--without-php \
			--disable-gnutls \
			--disable-openssl \
			--disable-cdsassl \
			--disable-dbus \
			--disable-ssl
CONFIGURE_ENV+=		ac_cv_func_sigset=no \
			OPTIM='-fPIC'

CONFIGURE_ARGS+=	--with-cups-user=cups \
			--with-cups-group=cups \
			--disable-webif \
			--disable-tcp-wrappers \
			--disable-gssapi \
			--disable-pam \
			--disable-dbus \
			--without-java \
			--without-perl \
			--without-python \
			--without-php \
			--disable-gnutls \
			--disable-openssl \
			--disable-cdsassl \
			--disable-dbus \
			--disable-ssl

FAKE_FLAGS+=		DSTROOT="${WRKINST}" STRIP="/bin/true"
ifeq ($(ADK_TOOLCHAIN_GCC_USE_SSP),y)
XAKE_FLAGS+=		OPTIM='-fPIC -fstack-protector'
else
XAKE_FLAGS+=		OPTIM='-fPIC'
endif

cups-hostpackage:

cups-install:
	${INSTALL_DIR} ${IDIR_CUPS}/usr/bin
	${INSTALL_DIR} ${IDIR_CUPS}/usr/sbin
	${INSTALL_DIR} ${IDIR_CUPS}/etc/cups
	${INSTALL_DIR} ${IDIR_CUPS}/usr/lib/cups/daemon
	${CP} ${WRKINST}/etc/cups/* ${IDIR_CUPS}/etc/cups/
	rm ${IDIR_CUPS}/etc/cups/cupsd.conf.default
	${CP} ${WRKINST}/usr/bin/* ${IDIR_CUPS}/usr/bin/
	rm -f ${IDIR_CUPS}/usr/bin/cups-config
	${CP} ${WRKINST}/usr/lib/libcups*.so* ${IDIR_CUPS}/usr/lib/
	${CP} ${WRKINST}/usr/lib/cups/daemon/* \
		${IDIR_CUPS}/usr/lib/cups/daemon/
	${CP} ${WRKINST}/usr/sbin/* ${IDIR_CUPS}/usr/sbin/
	${CP} ./files/etc/cups/* ${IDIR_CUPS}/etc/cups/

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
