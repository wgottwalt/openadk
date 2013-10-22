# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		python
PKG_VERSION:=		3.2.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		3c63a6d97333f4da35976b6a0755eb67
PKG_DESCR:=		Python scripting language (Version 3)
PKG_SECTION:=		lang
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://www.python.org/
PKG_SITES:=		http://www.python.org/ftp/python/${PKG_VERSION}/

PKG_HOST_DEPENDS:=	!netbsd !openbsd !cygwin

DISTFILES=		Python-${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/Python-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PYTHON,python,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# disable honour cflags stuff
XAKE_FLAGS+=		GCC_HONOUR_COPTS=s

MAKE_ENV+=		OPT="$(TARGET_CFLAGS)" \
			HOSTPYTHON=./hostpython \
			HOSTPGEN=./Parser/hostpgen
CONFIGURE_ARGS:=	--with-threads \
			--with-system-ffi \
			--without-cxx-main
CONFIGURE_ENV+=		ac_cv_have_long_long_format=yes

post-extract:
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		OPT="$(CFLAGS_FOR_BUILD)" \
		./configure --without-cxx-main --without-threads \
		--prefix=$(STAGING_HOST_DIR) \
	);
	$(MAKE) -C ${WRKBUILD} python Parser/pgen
	$(MAKE) -C ${WRKBUILD} install
	${CP} ${WRKBUILD}/Parser/pgen ${STAGING_HOST_DIR}/bin/pgen
	${CP} ${WRKBUILD}/python ${STAGING_HOST_DIR}/bin/hostpython
	${CP} ${WRKBUILD}/Parser/pgen ${WRKBUILD}/Parser/hostpgen
	${CP} ${WRKBUILD}/python ${WRKBUILD}/hostpython
	$(MAKE) -C ${WRKBUILD} distclean

pre-configure:
	$(SED) "s#@@CPU_ARCH@@#$(CPU_ARCH)#" ${WRKBUILD}/configure

python-install:
	${INSTALL_DIR} ${IDIR_PYTHON}/usr/bin ${IDIR_PYTHON}/usr/lib
	${INSTALL_DIR} ${IDIR_PYTHON}/usr/lib/python3.2
	${INSTALL_DIR} ${IDIR_PYTHON}/usr/include/python3.2m
	${INSTALL_BIN} ${WRKINST}/usr/bin/python3 ${IDIR_PYTHON}/usr/bin
	${CP} ${WRKINST}/usr/lib/libpython*.so* ${IDIR_PYTHON}/usr/lib
	cd ${IDIR_PYTHON}/usr/bin && ln -s python3 python
	${CP} ${WRKINST}/usr/lib/python3.2/* ${IDIR_PYTHON}/usr/lib/python3.2
	${CP} ${WRKINST}/usr/include/python3.2m/* ${IDIR_PYTHON}/usr/include/python3.2m

include ${TOPDIR}/mk/pkg-bottom.mk
