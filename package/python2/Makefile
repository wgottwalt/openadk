# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		python2
PKG_VERSION:=		2.6.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		17dcac33e4f3adb69a57c2607b6de246
PKG_DESCR:=		Python scripting language (Version 2)
PKG_SECTION:=		lang
PKG_URL:=		http://www.python.org
PKG_SITES:=		http://www.python.org/ftp/python/${PKG_VERSION}/

PKG_HOST_DEPENDS:=	!netbsd !openbsd !cygwin

DISTFILES=		Python-${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/Python-${PKG_VERSION}

DISMOD:=		readline _curses _curses_panel _tkinter nis

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PYTHON2,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

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
	${INSTALL_DIR} ${IDIR_PYTHON2}/usr/bin ${IDIR_PYTHON2}/usr/lib
	${INSTALL_DIR} ${IDIR_PYTHON2}/usr/lib/python2.6
	${INSTALL_BIN} ${WRKINST}/usr/bin/python ${IDIR_PYTHON2}/usr/bin
	${CP} ${WRKINST}/usr/lib/libpython*.so* ${IDIR_PYTHON2}/usr/lib
	${CP} ${WRKINST}/usr/lib/python2.6/* ${IDIR_PYTHON2}/usr/lib/python2.6
	-find ${IDIR_PYTHON2} -name \*.pyo -exec rm {} \;

include ${TOPDIR}/mk/pkg-bottom.mk
