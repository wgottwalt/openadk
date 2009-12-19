# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		cryptsetup
PKG_VERSION:=		1.0.7
PKG_RELEASE:=		1
PKG_BUILDDEP+=		libgcrypt popt e2fsprogs lvm
PKG_MD5SUM:=		5eea2a77391a8a1a651b31cbaef59e22
PKG_DESCR:=		LUKS cryptsetup tools
PKG_SECTION:=		crypto
PKG_DEPENDS:=		libgcrypt device-mapper libuuid libpopt
PKG_URL:=		http://cryptsetup.googlecode.com
PKG_SITES:=		http://cryptsetup.googlecode.com/files/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,CRYPTSETUP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--disable-static
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

# hackish way to although build the static libraries for cryptinit
pre-configure:
	(cd ${WRKBUILD}; \
		env ${CONFIGURE_ENV} \
		./configure --enable-static --disable-nls \
			--build=${GNU_HOST_NAME} \
			--host=${GNU_TARGET_NAME} \
			--target=${GNU_TARGET_NAME} \
	);
	$(MAKE) -C $(WRKBUILD) CC="$(TARGET_CC)"
	$(MAKE) -C $(WRKBUILD) CC="$(TARGET_CC)" DESTDIR='${WRKINST}' install
	$(MAKE) -C $(WRKBUILD) CC="$(TARGET_CC)" clean

post-install:
	${INSTALL_DIR} ${IDIR_CRYPTSETUP}/usr/sbin ${IDIR_CRYPTSETUP}/usr/lib
	${CP} ${WRKINST}/usr/lib/libcryptsetup.so.* \
		${IDIR_CRYPTSETUP}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/sbin/cryptsetup \
		${IDIR_CRYPTSETUP}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
