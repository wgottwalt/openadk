# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		python2
PKG_VERSION:=		2.7.13
PKG_RELEASE:=		1
PKG_HASH:=		a4f05a0720ce0fd92626f0278b6b433eee9a6173ddf2bced7957dfb599a5ece1
PKG_DESCR:=		python2 script interpreter
PKG_SECTION:=		dev/lang
PKG_DEPENDS:=		libffi
PKG_BUILDDEP:=		libffi python2-host 
HOST_BUILDDEP:=		libffi-host libressl-host
PKG_NEEDS:=		threads
PKG_URL:=		http://www.python.org/
PKG_SITES:=		http://www.python.org/ftp/python/${PKG_VERSION}/
PKG_OPTS:=		dev

DISTFILES:=		Python-${PKG_VERSION}.tgz
WRKDIST=		${WRKDIR}/Python-${PKG_VERSION}

PKG_FLAVOURS_PYTHON2:=	MOD_ZLIB MOD_BZ2 MOD_EXPAT MOD_SQLITE MOD_GDBM
PKG_FLAVOURS_PYTHON2+=	MOD_NCURSES MOD_SSL MOD_READLINE
			
PKGFD_MOD_ZLIB:=	zlib support
PKGFB_MOD_ZLIB:=	zlib
PKGFS_MOD_ZLIB:=	zlib
PKGFD_MOD_BZ2:=		bzip2 support
PKGFB_MOD_BZ2:=		bzip2
PKGFS_MOD_BZ2:=		libbz2
PKGFD_MOD_EXPAT:=	xml support
PKGFB_MOD_EXPAT:=	expat
PKGFS_MOD_EXPAT:=	libexpat
PKGFD_MOD_SQLITE:=	sqlite support
PKGFB_MOD_SQLITE:=	sqlite
PKGFS_MOD_SQLITE:=	libsqlite
PKGFD_MOD_GDBM:=	gdbm support
PKGFB_MOD_GDBM:=	gdbm
PKGFS_MOD_GDBM:=	libgdbm
PKGFD_MOD_NCURSES:=	ncurses support
PKGFB_MOD_NCURSES:=	ncurses
PKGFS_MOD_NCURSES:=	libncurses
PKGFD_MOD_READLINE:=	readline support
PKGFB_MOD_READLINE:=	readline
PKGFS_MOD_READLINE:=	libreadline
PKGFD_MOD_SSL:=		ssl support
PKGFB_MOD_SSL:=		libressl
PKGFS_MOD_SSL:=		libressl

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,PYTHON2,python2,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,PYTHON2,python2,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

define PKG_mod_template

INSTALL_MODS_$${ADK_PACKAGE_${1}}+=    ${2}-install

${2}-install:
	${INSTALL_DIR} $$(IDIR_$(1))/usr/lib/python2.7/lib-dynload
	for m in ${2}; do \
		${INSTALL_DATA} $(WRKINST)/usr/lib/python2.7/lib-dynload/$$$${m}*.so $$(IDIR_$(1))/usr/lib/python2.7/lib-dynload ;\
	done
endef

$(eval $(call PKG_template,PYTHON2_MOD_ZLIB,python2-mod-zlib,$(PKG_VERSION)-${PKG_RELEASE},${PKGFS_MOD_ZLIB},${PKGFD_MOD_ZLIB},${PKG_SECTION}))
$(eval $(call PKG_template,PYTHON2_MOD_BZ2,python2-mod-bz2,$(PKG_VERSION)-${PKG_RELEASE},${PKGFS_MOD_BZ2},${PKGFD_MOD_BZ2},${PKG_SECTION}))
$(eval $(call PKG_template,PYTHON2_MOD_EXPAT,python2-mod-expat,$(PKG_VERSION)-${PKG_RELEASE},${PKGFS_MOD_EXPAT},${PKGFD_MOD_EXPAT},${PKG_SECTION}))
$(eval $(call PKG_template,PYTHON2_MOD_SQLITE,python2-mod-sqlite,$(PKG_VERSION)-${PKG_RELEASE},${PKGFS_MOD_SQLITE},${PKGFD_MOD_SQLITE},${PKG_SECTION}))
$(eval $(call PKG_template,PYTHON2_MOD_GDBM,python2-mod-gdbm,$(PKG_VERSION)-${PKG_RELEASE},${PKGFS_MOD_GDBM},${PKGFD_MOD_GDBM},${PKG_SECTION}))
$(eval $(call PKG_template,PYTHON2_MOD_NCURSES,python2-mod-ncurses,$(PKG_VERSION)-${PKG_RELEASE},${PKGFS_MOD_NCURSES},${PKGFD_MOD_NCURSES},${PKG_SECTION}))
$(eval $(call PKG_template,PYTHON2_MOD_SSL,python2-mod-ssl,$(PKG_VERSION)-${PKG_RELEASE},${PKGFS_MOD_SSL},${PKGFD_MOD_SSL},${PKG_SECTION}))
$(eval $(call PKG_template,PYTHON2_MOD_READLINE,python2-mod-readline,$(PKG_VERSION)-${PKG_RELEASE},${PKGFS_MOD_READLINE},${PKGFD_MOD_READLINE},${PKG_SECTION}))

$(eval $(call PKG_mod_template,PYTHON2_MOD_ZLIB,zlib))
$(eval $(call PKG_mod_template,PYTHON2_MOD_BZ2,bz2))
$(eval $(call PKG_mod_template,PYTHON2_MOD_EXPAT,pyexpat))
$(eval $(call PKG_mod_template,PYTHON2_MOD_SQLITE,_sqlite))
$(eval $(call PKG_mod_template,PYTHON2_MOD_GDBM,gdbm))
$(eval $(call PKG_mod_template,PYTHON2_MOD_NCURSES,_curses))
$(eval $(call PKG_mod_template,PYTHON2_MOD_SSL,_ssl))
$(eval $(call PKG_mod_template,PYTHON2_MOD_READLINE,readline))

ifeq ($(ADK_TARGET_USE_STATIC_LIBS_ONLY),y)
CONFIGURE_ARGS+=	--disable-shared
endif

HOST_CFLAGS+=		-fPIC

AUTOTOOL_STYLE:=	autoreconf
CONFIGURE_ENV+=         ac_cv_have_long_long_format=yes \
			ac_cv_file__dev_ptmx=yes \
			ac_cv_file__dev_ptc=no
CONFIGURE_ARGS+=	--with-threads \
			--disable-toolbox-glue \
			--disable-ipv6 \
			--with-system-ffi \
			--without-cxx-main

HOST_CONFIGURE_ENV+=	MACOSX_DEPLOYMENT_TARGET=10.9
HOST_CONFIGURE_ARGS+=	--with-threads \
			--with-system-ffi \
			--disable-ipv6 \
			--disable-toolbox-glue \
			--without-cxx-main

hostpre-configure:
	$(CP) $(ADK_TOPDIR)/package/python2/files/patch-Lib_distutils_sysconfig_py $(WRKBUILD)
	$(SED) "s#@@STAGING_TARGET_DIR@@#$(STAGING_TARGET_DIR)#" $(WRKBUILD)/patch-Lib_distutils_sysconfig_py
	$(SED) "s#@@STAGING_HOST_DIR@@#$(STAGING_HOST_DIR)#" $(WRKBUILD)/patch-Lib_distutils_sysconfig_py
	(cd $(WRKBUILD) && ${PATCHP0} < patch-Lib_distutils_sysconfig_py)	
	$(SED) "s#@EXENAME@#$(STAGING_HOST_DIR)/usr/bin/python#" \
		$(WRKBUILD)/Misc/python-config.in

hostpost-install:
	$(CP) $(ADK_TOPDIR)/package/python2/files/python-config.patch $(WRKBUILD)/
	$(SED) "s#@@STAGING_TARGET_DIR@@#$(STAGING_TARGET_DIR)#" $(WRKBUILD)/python-config.patch
	$(SED) "s#@@STAGING_HOST_DIR@@#$(STAGING_HOST_DIR)#" $(WRKBUILD)/python-config.patch
	(cd $(STAGING_HOST_DIR)/usr/bin && \
		${PATCHP0} < $(WRKBUILD)/python-config.patch)

pre-configure:
	$(CP) $(ADK_TOPDIR)/package/python2/files/patch-Lib_distutils_sysconfig_py $(WRKBUILD)
	$(SED) "s#@@STAGING_TARGET_DIR@@#$(STAGING_TARGET_DIR)#" $(WRKBUILD)/patch-Lib_distutils_sysconfig_py
	$(SED) "s#@@STAGING_HOST_DIR@@#$(STAGING_HOST_DIR)#" $(WRKBUILD)/patch-Lib_distutils_sysconfig_py
	(cd $(WRKBUILD) && ${PATCHP0} <$(WRKBUILD)/patch-Lib_distutils_sysconfig_py)	
	$(SED) "s#@EXENAME@#$(STAGING_HOST_DIR)/usr/bin/python#" \
		$(WRKBUILD)/Misc/python-config.in

ifeq ($(ADK_TARGET_USE_STATIC_LIBS_ONLY),y)
python2-install:
else
python2-install: ${INSTALL_MODS_y} ${INSTALL_MODS_m}
endif
	${INSTALL_DIR} ${IDIR_PYTHON2}/usr/bin ${IDIR_PYTHON2}/usr/lib
	${INSTALL_DIR} ${IDIR_PYTHON2}/usr/include/python2.7
	${INSTALL_BIN} ${WRKINST}/usr/bin/python ${IDIR_PYTHON2}/usr/bin
	${INSTALL_DIR} ${IDIR_PYTHON2}/usr/lib/python2.7
	${CP} ${WRKINST}/usr/lib/libpython*.* ${IDIR_PYTHON2}/usr/lib
	${CP} ${WRKINST}/usr/lib/python2.7/* ${IDIR_PYTHON2}/usr/lib/python2.7
	${CP} ${WRKINST}/usr/include/python2.7/pyconfig.h \
		${IDIR_PYTHON2}/usr/include/python2.7
	@-for i in zlib bz2 _curses _ssl gdbm _sqlite pyexpat readline; do \
		rm ${IDIR_PYTHON2}/usr/lib/python2.7/lib-dynload/$${i}*so 2>/dev/null; \
	done

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
