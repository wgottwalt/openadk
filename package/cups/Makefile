# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		cups
PKG_VERSION:=		1.7.1
PKG_RELEASE:=		4
PKG_HASH:=		f52bec893d9daf92b6029be79c07e6c516b4c85ffae3e6e01885cc85e9081681
PKG_DESCR:=		common unix printing system
PKG_SECTION:=		net/misc
PKG_DEPENDS:=		zlib
PKG_BUILDDEP:=		cups-host zlib
PKG_NEEDS:=		threads c++
PKG_URL:=		http://www.cups.org/
PKG_SITES:=		http://www.cups.org/software/${PKG_VERSION}/
PKG_OPTS:=		dev
PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}-source.tar.bz2

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,CUPS,cups,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,CUPS,cups,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

ifeq ($(ADK_PACKAGE_LIBICONV),y)
TARGET_LDFLAGS+=	-liconv
endif

ifneq ($(ADK_HOST_LINUX),y)
HOST_LINUX_ONLY:=	1
endif

HOST_CONFIGURE_ARGS+=	--disable-tcp-wrappers \
			--disable-webif \
			--disable-gssapi \
			--disable-avahi \
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
			--disable-ssl \
			--with-components=core \
			--with-rcdir=$(STAGING_HOST_DIR)/etc
CONFIGURE_ENV+=		ac_cv_func_sigset=no \
			OPTIM='-fPIC -std=c89' LSB_BUILD=y

CONFIGURE_ARGS+=	--with-cups-user=cups \
			--with-cups-group=cups \
			--libdir=/usr/lib \
			--disable-static \
			--disable-avahi \
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
			--disable-ssl \
			--with-components=core \
			--with-rcdir=$(STAGING_TARGET_DIR)/etc

FAKE_FLAGS+=		DSTROOT="${WRKINST}" STRIP="/bin/true"

cups-install:
	${INSTALL_DIR} ${IDIR_CUPS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcups*.so* ${IDIR_CUPS}/usr/lib/

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
