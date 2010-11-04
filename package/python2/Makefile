# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		python2
PKG_VERSION:=		2.7
PKG_RELEASE:=		4
PKG_MD5SUM:=		35f56b092ecf39a6bd59d64f142aae0f
PKG_DESCR:=		Python scripting language (Version 2)
PKG_SECTION:=		lang
PKG_DEPENDS:=		libpthread zlib
PKG_BUILDDEP:=		zlib
PKG_URL:=		http://www.python.org/
PKG_SITES:=		http://www.python.org/ftp/python/${PKG_VERSION}/

PKG_HOST_DEPENDS:=	!netbsd !openbsd !cygwin

DISTFILES=		Python-${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/Python-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PYTHON2,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

MAKE_ENV+=		OPT="$(TARGET_CFLAGS)" \
			RANLIB="${TARGET_CROSS}ranlib" \
			HOSTPYTHON=./hostpython \
			HOSTPGEN=./Parser/hostpgen
CONFIGURE_ENV+=		OPT="$(TARGET_CFLAGS)" \
			ac_cv_have_long_long_format=yes
CONFIGURE_ARGS:=	--with-threads \
			--disable-toolbox-glue \
			--with-system-ffi \
			--without-cxx-main

post-extract:
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		OPT="$(HOSTCFLAGS)" \
		./configure --without-cxx-main --without-threads \
		--prefix=$(STAGING_TOOLS) \
	);
	$(MAKE) -C ${WRKBUILD} python Parser/pgen
	$(MAKE) -C ${WRKBUILD} install
	${CP} ${WRKBUILD}/Parser/pgen ${STAGING_TOOLS}/bin/pgen
	${CP} ${WRKBUILD}/python ${STAGING_TOOLS}/bin/hostpython
	${CP} ${WRKBUILD}/Parser/pgen ${WRKBUILD}/Parser/hostpgen
	${CP} ${WRKBUILD}/python ${WRKBUILD}/hostpython
	$(MAKE) -C ${WRKBUILD} distclean

pre-configure:
	$(SED) "s#@@CPU_ARCH@@#$(CPU_ARCH)#" ${WRKBUILD}/configure

post-install:
	${INSTALL_DIR} ${IDIR_PYTHON2}/usr/bin ${IDIR_PYTHON2}/usr/lib
	${INSTALL_DIR} ${IDIR_PYTHON2}/usr/lib/python2.7
	${INSTALL_DIR} ${IDIR_PYTHON2}/usr/include/python2.7
	${INSTALL_BIN} ${WRKINST}/usr/bin/python ${IDIR_PYTHON2}/usr/bin
	${CP} ${WRKINST}/usr/lib/libpython*.so* ${IDIR_PYTHON2}/usr/lib
	${CP} ${WRKINST}/usr/lib/python2.7/* ${IDIR_PYTHON2}/usr/lib/python2.7
	${CP} ${WRKINST}/usr/include/python2.7/* ${IDIR_PYTHON2}/usr/include/python2.7
	-find ${IDIR_PYTHON2} -name \*.pyo -exec rm {} \;

include ${TOPDIR}/mk/pkg-bottom.mk
