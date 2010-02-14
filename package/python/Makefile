# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		python
PKG_VERSION:=		3.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		f1317dbb2398374d6691edd5bff1b91d
PKG_DESCR:=		Python scripting language
PKG_SECTION:=		lang
PKG_URL:=		http://www.python.org
PKG_SITES:=		http://www.python.org/ftp/python/3.1.1/

PKG_HOST_DEPENDS:=	!netbsd

DISTFILES=		Python-${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/Python-${PKG_VERSION}

DISMOD:=		readline _curses _curses_panel _tkinter nis

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PYTHON,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

MAKE_ENV+=		OPT="$(TARGET_CFLAGS)" \
			HOSTPYTHON=./hostpython \
			HOSTPGEN=./Parser/hostpgen \
			PYTHON_DISABLE_MODULES="$(DISMOD)"
CONFIGURE_ENV+=		OPT="$(TARGET_CFLAGS)"
CONFIGURE_ARGS:=	--with-threads \
			--with-system-ffi \
			--without-cxx-main

pre-configure:
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		OPT="$(HOSTCFLAGS)" \
		./configure --without-cxx-main --without-threads \
		--prefix=$(STAGING_TOOLS) \
	);
	$(MAKE) -C ${WRKBUILD} python Parser/pgen
	${CP} ${WRKBUILD}/Parser/pgen ${STAGING_TOOLS}/bin/pgen
	${CP} ${WRKBUILD}/python ${STAGING_TOOLS}/bin/hostpython
	${CP} ${WRKBUILD}/Parser/pgen ${WRKBUILD}/Parser/hostpgen
	${CP} ${WRKBUILD}/python ${WRKBUILD}/hostpython
	$(MAKE) -C ${WRKBUILD} distclean

post-install:
	${INSTALL_DIR} ${IDIR_PYTHON}/usr/bin ${IDIR_PYTHON}/usr/lib
	${INSTALL_DIR} ${IDIR_PYTHON}/usr/lib/python3.1
	${INSTALL_BIN} ${WRKINST}/usr/bin/python3 ${IDIR_PYTHON}/usr/bin
	${CP} ${WRKINST}/usr/lib/libpython*.so* ${IDIR_PYTHON}/usr/lib
	cd ${IDIR_PYTHON}/usr/bin && ln -s python3 python
	${CP} ${WRKINST}/usr/lib/python3.1/* ${IDIR_PYTHON}/usr/lib/python3.1

include ${TOPDIR}/mk/pkg-bottom.mk
