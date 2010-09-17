# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dansguardian
PKG_VERSION:=		2.10.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		0987a1c9bfbdf398118386f10279611a
PKG_DESCR:=		web content filter proxy
PKG_SECTION:=		proxy
PKG_DEPENDS:=		libpcre zlib
PKG_BUILDDEP:=		pcre zlib
PKG_URL:=		http://dansguardian.org/
PKG_SITES:=		http://dansguardian.org/downloads/2/Stable/
PKG_CXX:=		DANSGUARDIAN

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DANSGUARDIAN,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_COMPILE_DANSGUARDIAN_WITH_UCLIBCXX),y)
CONFIGURE_ENV+=		CXXFLAGS="-fno-threadsafe-statics -fno-builtin -nostdinc++ \
			-I${STAGING_DIR}/usr/include/uClibc++" \
			LIBS="-nodefaultlibs -luClibc++ -lgcc -lm"
endif

CONFIGURE_ARGS+=	--enable-orig-ip \
			--with-proxyuser=proxy \
			--with-proxygroup=proxy

post-install:
	${INSTALL_DIR} ${IDIR_DANSGUARDIAN}/usr/sbin \
		${IDIR_DANSGUARDIAN}/etc/dansguardian \
		${IDIR_DANSGUARDIAN}/usr/share/dansguardian/languages/ukenglish
	${CP} ${WRKINST}/usr/share/dansguardian/languages/ukenglish/* \
		${IDIR_DANSGUARDIAN}/usr/share/dansguardian/languages/ukenglish
	${CP} ${WRKINST}/usr/share/dansguardian/transparent1x1.gif \
		${IDIR_DANSGUARDIAN}/usr/share/dansguardian
	${CP} ${WRKINST}/etc/dansguardian/* \
		${IDIR_DANSGUARDIAN}/etc/dansguardian
	${INSTALL_BIN} ${WRKINST}/usr/sbin/dansguardian \
		${IDIR_DANSGUARDIAN}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
