# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		gnutls
PKG_VERSION:=		2.6.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		ca2489e29f9dc313a79b9747bb1090e5
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2
MASTER_SITES:=		${MASTER_SITE_GNU:=gnutls/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,LIBGNUTLS,libgnutls,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,GNUTLS_UTILS,gnutls-utils,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,LIBGNUTLS_EXTRA,libgnutls-extra,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,LIBGNUTLS_OPENSSL,libgnutls-openssl,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,LIBGNUTLSXX,libgnutlsxx,${PKG_VERSION}-${PKG_RELEASE},${ARCH},${PKG_DEPENDS}))

ifeq (${ADK_COMPILE_GNUTLS_WITH_UCLIBCXX},y)
TCXXFLAGS+=		-fno-builtin -nostdinc++ -nodefaultlibs -I${STAGING_DIR}/usr/include/uClibc++
TLDFLAGS+=		-nodefaultlibs -luClibc++
PKG_DEPENDS:=		uclibc++
else
PKG_DEPENDS:=		libstdcxx
endif

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS+=	--without-libopencdk-prefix \
			--without-libz-prefix
BUILD_STYLE=		auto
INSTALL_STYLE=		auto

ifeq (${ADK_COMPILE_GNUTLS_WITH_UCLIBCXX},y)
# add workaround because libtool tries to link libstdc++
post-configure:
	${SED} 's#postdeps="-lstdc.*#postdeps="-lm"#' \
	    ${WRKBUILD}/libtool
endif

post-install:
	${INSTALL_DIR} ${IDIR_LIBGNUTLS}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgnutls.so.* ${IDIR_LIBGNUTLS}/usr/lib
	${INSTALL_DIR} ${IDIR_LIBGNUTLS_EXTRA}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgnutls-extra.so.* ${IDIR_LIBGNUTLS_EXTRA}/usr/lib
	${INSTALL_DIR} ${IDIR_LIBGNUTLS_OPENSSL}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgnutls-openssl.so.* ${IDIR_LIBGNUTLS_OPENSSL}/usr/lib
	${INSTALL_DIR} ${IDIR_GNUTLS_UTILS}/usr/bin
	${CP} ${WRKINST}/usr/bin/{{cert,srp,psk}tool,gnutls-{cli,serv}} \
	    ${IDIR_GNUTLS_UTILS}/usr/bin
ifeq ($(ADK_CXX),y)
	${INSTALL_DIR} ${IDIR_LIBGNUTLSXX}/usr/lib
	${CP} ${WRKINST}/usr/lib/libgnutlsxx.so.* ${IDIR_LIBGNUTLSXX}/usr/lib
endif

include ${TOPDIR}/mk/pkg-bottom.mk
