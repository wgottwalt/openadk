# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		python2
PKG_VERSION:=		2.7.1
PKG_RELEASE:=		3
PKG_MD5SUM:=		15ed56733655e3fab785e49a7278d2fb
PKG_DESCR:=		Python scripting language (Version 2)
PKG_SECTION:=		lang
PKG_BUILDDEP:=		zlib libffi openssl readline bzip2
PKG_DEPENDS:=		libpthread zlib libffi libopenssl
PKG_URL:=		http://www.python.org/
PKG_SITES:=		http://www.python.org/ftp/python/${PKG_VERSION}/
PKG_OPTS:=		noscripts

PKG_HOST_DEPENDS:=	!netbsd !openbsd !cygwin

DISTFILES=		Python-${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/Python-${PKG_VERSION}

PKG_SUBPKGS:=		PYTHON2 PYTHON2_READLINE PYTHON2_BZIP2
PKGSS_PYTHON2_READLINE:=libreadline
PKGSS_PYTHON2_BZIP2:=	bzip2

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PYTHON2,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,PYTHON2_BZIP2,${PKG_NAME}-bzip2,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_PYTHON2_BZIP2},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))
$(eval $(call PKG_template,PYTHON2_READLINE,${PKG_NAME}-readline,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_PYTHON2_READLINE},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

TARGET_CFLAGS+=		-fPIC
TARGET_LDFLAGS+=	-L.
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
	$(CP) ${WRKBUILD}/setup.py ${WRKBUILD}/setup.py.sav
	$(CP) ./files/setup.py ${WRKBUILD}/setup.py
	$(CP) ./files/posixmodule.c ${WRKBUILD}/Modules/posixmodule.c
	$(CP) ./files/python-config.in ${WRKBUILD}/Misc/python-config.in
	$(CP) ./files/build_scripts.py ${WRKBUILD}/Lib/distutils/command/build_scripts.py
	$(CP) ./files/sysconfig.py ${WRKBUILD}/Lib/distutils/sysconfig.py
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		OPT="$(CFLAGS_FOR_BUILD)" \
		./configure --without-cxx-main --with-threads \
		--prefix=$(STAGING_HOST_DIR)/usr \
	);
	$(MAKE) -C ${WRKBUILD} python Parser/pgen
	$(MAKE) -C ${WRKBUILD} install
	${CP} ${WRKBUILD}/Parser/pgen ${STAGING_HOST_DIR}/usr/bin/pgen
	${CP} ${WRKBUILD}/python ${STAGING_HOST_DIR}/usr/bin/hostpython
	${CP} ${WRKBUILD}/Parser/pgen ${WRKBUILD}/Parser/hostpgen
	${CP} ${WRKBUILD}/python ${WRKBUILD}/hostpython
	$(MAKE) -C ${WRKBUILD} distclean
	$(CP) ${WRKBUILD}/setup.py.sav ${WRKBUILD}/setup.py

pre-configure:
	$(SED) "s#@@CPU_ARCH@@#$(CPU_ARCH)#" ${WRKBUILD}/configure
	$(SED) "s#@@STAGING_DIR@@#$(STAGING_DIR)#" ${WRKBUILD}/setup.py

post-install:
	${INSTALL_DIR} ${IDIR_PYTHON2}/usr/bin ${IDIR_PYTHON2}/usr/lib
	${INSTALL_DIR} ${IDIR_PYTHON2}/usr/lib/python2.7
	${INSTALL_DIR} ${IDIR_PYTHON2}/usr/include/python2.7
	${INSTALL_BIN} ${WRKINST}/usr/bin/python ${IDIR_PYTHON2}/usr/bin
	${CP} ${WRKINST}/usr/lib/libpython*.so* ${IDIR_PYTHON2}/usr/lib
	${CP} ${WRKINST}/usr/lib/python2.7/* ${IDIR_PYTHON2}/usr/lib/python2.7
	${CP} ${WRKINST}/usr/include/python2.7/* ${IDIR_PYTHON2}/usr/include/python2.7
	-find ${IDIR_PYTHON2} -name "\*.pyc" -o -name "*\.pyo" -exec rm {} \;
	-rm ${IDIR_PYTHON2}/usr/lib/python2.7/lib-dynload/readline.so
	-rm ${IDIR_PYTHON2}/usr/lib/python2.7/lib-dynload/bz2.so
	# workaround, copy host python-config to target scripts directory
	${CP} ${STAGING_HOST_DIR}/usr/bin/python*-config ${STAGING_DIR}/scripts
	(cd ${STAGING_DIR}/usr/bin/ && ln -sf $(STAGING_HOST_DIR)/usr/bin/hostpython hostpython)

python2-readline-install:
	${INSTALL_DIR} ${IDIR_PYTHON2_READLINE}/usr/lib/python2.7/lib-dynload
	${CP} ${WRKINST}/usr/lib/python2.7/lib-dynload/readline.so \
		${IDIR_PYTHON2_READLINE}/usr/lib/python2.7/lib-dynload

python2-bzip2-install:
	${INSTALL_DIR} ${IDIR_PYTHON2_BZIP2}/usr/lib/python2.7/lib-dynload
	${CP} ${WRKINST}/usr/lib/python2.7/lib-dynload/bz2.so \
		${IDIR_PYTHON2_BZIP2}/usr/lib/python2.7/lib-dynload

include ${TOPDIR}/mk/pkg-bottom.mk
