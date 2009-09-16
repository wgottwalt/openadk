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

DISTFILES=		Python-${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/Python-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PYTHON,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

MAKE_ENV+=		OPT="$(TARGET_CFLAGS)" \
			HOSTPYTHON=./hostpython \
			HOSTPGEN=./hostpgen \
			CROSS_COMPILE=yes

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		OPT="$(TARGET_CFLAGS)"
CONFGIURE_ARGS:=	--with-threads \
			--with-system-ffi \
			--without-cxx-main
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

pre-configure:
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		OPT="$(HOSTCFLAGS)" \
		./configure --without-cxx-main --without-threads \
		--prefix=$(STAGING_TOOLS) \
	);
	$(MAKE) -C ${WRKBUILD} python Parser/pgen
	(cd $(WRKBUILD);mv Parser/pgen hostpgen)
	${CP} ${WRKBUILD}/python ${WRKBUILD}/hostpython
	$(MAKE) -C ${WRKBUILD} HOSTPYTHON="./hostpython" sharedmods install
	$(MAKE) -C ${WRKBUILD} distclean

post-install:
	${INSTALL_DIR} ${IDIR_PYTHON}/usr/bin ${IDIR_PYTHON}/usr/lib
	${INSTALL_DIR} ${IDIR_PYTHON}/usr/lib/python3.1
	${INSTALL_BIN} ${WRKINST}/usr/bin/python3 ${IDIR_PYTHON}/usr/bin
	${CP} ${WRKINST}/usr/lib/libpython*.so* ${IDIR_PYTHON}/usr/lib
	cd ${IDIR_PYTHON}/usr/bin && ln -s python3 python
	${CP} ${WRKINST}/usr/lib/python3.1/* ${IDIR_PYTHON}/usr/lib/python3.1

include ${TOPDIR}/mk/pkg-bottom.mk
