# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		rrs
PKG_VERSION:=		1.70
PKG_RELEASE:=		2
PKG_MD5SUM:=		b400d03c0e39e3e78a7327ba78f789f0
MASTER_SITES:=		http://www.cycom.se/uploads/36/19/
PKG_DEPEND:=		libopenssl zlib
PKG_DEPEND_NOSSL:=	zlib
ifeq ($(ADK_COMPILE_RRS_WITH_UCLIBCXX),y)
PKG_DEPEND+=		uclibc++
PKG_DEPEND_NOSSL+=	uclibc++
else
PKG_DEPEND+=		libstdcxx
PKG_DEPEND_NOSSL+=	libstdcxx
endif

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RRS,rrs,${PKG_VERSION}-${PKG_RELEASE},${ARCH},${PKG_DEPEND}))
$(eval $(call PKG_template,RRS_NOSSL,rrs-nossl,${PKG_VERSION}-${PKG_RELEASE},${ARCH},${PKG_DEPEND_NOSSL}))

ifeq ($(ADK_COMPILE_RRS_WITH_UCLIBCXX),y)
PKG_CFLAGS=-fno-builtin -fno-rtti -nostdinc++
PKG_LDFLAGS=-nodefaultlibs -luClibc++ -lc -lm
else
PKG_CFLAGS=
PKG_LDFLAGS=-shared
endif


do-configure:
ifneq (${ADK_PACKAGE_RRS},)
	${MAKE} -C ${WRKBUILD} \
		CC="${TARGET_CC}" \
		CFLAGS="${TARGET_CFLAGS} -I${STAGING_DIR}/usr/include ${PKG_FLAGS}" \
		LDFLAGS="-L${STAGING_DIR}/usr/lib -L${STAGING_DIR}/lib ${PKG_LDFLAGS} -lutil -lssl -lcrypto -lz" \
		generic
	{ cd ${WRKBUILD}; mv rrs rrs-ssl; }
	-${MAKE} -C ${WRKBUILD} \
		clean
endif
ifneq (${ADK_PACKAGE_RRS_NOSSL},)
	${MAKE} -C ${WRKBUILD} \
		CC="${TARGET_CC}" \
		CFLAGS="${TARGET_CFLAGS} -I${STAGING_DIR}/usr/include ${PKG_FLAGS}" \
		LDFLAGSNOSSL="-L${STAGING_DIR}/usr/lib -L${STAGING_DIR}/lib ${PKG_LDFLAGS} -lutil" \
		generic-nossl
	{ cd ${WRKBUILD}; mv rrs rrs-nossl; }
endif

do-install:
ifneq (${ADK_PACKAGE_RRS},)
	${INSTALL_DIR} ${IDIR_RRS}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/rrs-ssl ${IDIR_RRS}/usr/bin/rrs
endif
ifneq (${ADK_PACKAGE_RRS_NOSSL},)
	${INSTALL_DIR} ${IDIR_RRS_NOSSL}/usr/bin
	${INSTALL_BIN} ${WRKBUILD}/rrs-nossl ${IDIR_RRS_NOSSL}/usr/bin/rrs
endif

include ${TOPDIR}/mk/pkg-bottom.mk
