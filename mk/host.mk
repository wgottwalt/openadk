# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

# This is where all package operation is done in
ifneq (,$(findstring hostpackage,$(MAKECMDGOALS)))
WRKDIR?=		${WRKDIR_BASE}/w-${PKG_NAME}-${PKG_VERSION}-${PKG_RELEASE}-host
endif

HOST_CONFIGURE_ENV+=	AUTOM4TE=${STAGING_HOST_DIR}/usr/bin/autom4te \
			CONFIG_SHELL='$(strip ${SHELL})' \
			PKG_CONFIG_LIBDIR='${STAGING_HOST_DIR}/usr/lib/pkgconfig' \
			PATH='${HOST_PATH}' \
			CFLAGS='$(strip ${CFLAGS_FOR_BUILD})' \
			CXXFLAGS='$(strip ${CXXFLAGS_FOR_BUILD})' \
			CPPFLAGS='$(strip ${CPPFLAGS_FOR_BUILD})' \
			LDFLAGS='$(strip ${LDFLAGS_FOR_BUILD})'

# this is environment for 'make all' and 'make install'
HOST_MAKE_ENV?=
# this is arguments for 'make all' and 'make install'
HOST_XAKE_FLAGS?=
# this is arguments for 'make all' ONLY
HOST_MAKE_FLAGS?=
# this is arguments for 'make install' ONLY
HOST_FAKE_FLAGS?=
HOST_ALL_TARGET?=	all
HOST_INSTALL_TARGET?=	install

HOST_MAKE_ENV+=		PATH='${HOST_PATH}' \
			PKG_CONFIG_LIBDIR='${STAGING_HOST_DIR}/usr/lib/pkgconfig' \
			CFLAGS='$(strip ${CFLAGS_FOR_BUILD})' \
			CXXFLAGS='$(strip ${CXXFLAGS_FOR_BUILD})' \
			CPPFLAGS='$(strip ${CPPFLAGS_FOR_BUILD})' \
			LDFLAGS='$(strip ${LDFLAGS_FOR_BUILD})'
HOST_MAKE_FLAGS+=	${HOST_XAKE_FLAGS} V=1
HOST_FAKE_FLAGS+=	${HOST_XAKE_FLAGS}

HOST_WRKINST=		${WRKDIR}/fake

_HOST_EXTRACT_COOKIE=	${WRKDIST}/.extract_done
_HOST_PATCH_COOKIE=	${WRKDIST}/.prepared
_HOST_CONFIGURE_COOKIE=	${WRKDIR}/.host_configure_done
_HOST_BUILD_COOKIE=	${WRKDIR}/.host_build_done
_HOST_FAKE_COOKIE=	${HOST_WRKINST}/.host_fake_done
_HOST_COOKIE=		${STAGING_PKG_DIR}/stamps/${PKG_NAME}${PKG_VERSION}-${PKG_RELEASE}-host

hostextract: ${_HOST_EXTRACT_COOKIE}
hostpatch: ${_HOST_PATCH_COOKIE}
hostconfigure: ${_HOST_CONFIGURE_COOKIE}
hostbuild: ${_HOST_BUILD_COOKIE}
hostfake: ${_HOST_FAKE_COOKIE}

# there are some parameters to the HOST_template function
# 1.) Config.in identifier ADK_PACKAGE_$(1)
# 2.) name of the package, for single package mostly $(PKG_NAME)
# 3.) package version (upstream version) and package release (adk version),
#     always $(PKG_VERSION)-$(PKG_RELEASE)

define HOST_template
ALL_PKGOPTS+=	$(1)
PKGNAME_$(1)=	$(2)
HOSTDIR_$(1)=	$(WRKDIR)/fake
ALL_HOSTDIRS+=	$${HOSTDIR_$(1)}
ALL_HOSTINST+=	$(2)-hostinstall

$$(HOSTDIR_$(1)): ${_HOST_PATCH_COOKIE} ${_HOST_FAKE_COOKIE}

endef

.PHONY:	all hostextract hostpatch hostconfigure \
	hostbuild hostpackage hostfake
