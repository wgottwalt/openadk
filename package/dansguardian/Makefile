# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		dansguardian
PKG_VERSION:=		2.12.0.3
PKG_RELEASE:=		2
PKG_HASH:=		c74e9a32b97f9a9a056fced3da23fe48fca2bc6aa9af670afe9a53dc819414f5
PKG_DESCR:=		web content filter proxy
PKG_SECTION:=		net/proxy
PKG_DEPENDS:=		libpcre zlib
PKG_BUILDDEP:=		pcre zlib
PKG_URL:=		http://dansguardian.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=dansguardian/}
PKG_CXX:=		DANSGUARDIAN

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DANSGUARDIAN,dansguardian,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq ($(ADK_COMPILE_DANSGUARDIAN_WITH_UCLIBCXX),y)
LIBRARIES:=		-nodefaultlibs -luClibc++ -lm -lc -lgcc
ifeq ($(ADK_TARGET_USE_SSP),y)
LIBRARIES+=		-lssp
endif
endif

ifeq ($(ADK_COMPILE_DANSGUARDIAN_WITH_UCLIBCXX),y)
CONFIGURE_ENV+=		CXXFLAGS="-fno-threadsafe-statics -fno-builtin -nostdinc++ \
			-I${STAGING_TARGET_DIR}/usr/include/uClibc++" \
			LIBS="$(LIBRARIES)"
endif

CONFIGURE_ARGS+=	--enable-orig-ip \
			--with-proxyuser=proxy \
			--with-proxygroup=proxy

dansguardian-install:
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

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
