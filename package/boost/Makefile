# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		boost
PKG_VERSION:=		1.54.0
PKG_RELEASE:=		2
PKG_MD5SUM:=		efbfbff5a85a9330951f243d0a46e4b9
PKG_DESCR:=		boost C++ library
PKG_SECTION:=		libs
PKG_URL:=		http://www.boost.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=boost/}

PKG_ARCH_DEPENDS:=	!avr32 !m68k

DISTFILES:=		boost_1_54_0.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}_1_54_0

PKG_SUBPKGS:=		BOOST BOOST_DEV
PKGSD_BOOST_DEV:=	boost header files
PKGSC_BOOST_DEV:=	devel

PKG_FLAVOURS_BOOST:=	date_time graph graph_parallel iostreams math program_options python regex serialization signals system test thread wave

PKGFD_date_time:=	with date-time
PKGFD_python:=	with Python
PKGFB_python:=	python2
PKGFS_python:=	python2
PKGFD_iostreams:=	with iostreams
PKGFD_graph:=	with graph
PKGFD_graph_parallel:=	with graph_parallel
PKGFD_math:=	with math
PKGFD_program_options:=	with program_options
PKGFD_regex:=	with regex
PKGFD_serialization:=	with serialization
PKGFD_signals:=	with signals
PKGFD_system:=	with system
PKGFD_test:=	with test
PKGFD_thread:=	with thread
PKGFD_wave:=	with wave

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BOOST,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,BOOST_DEV,boost-dev,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_BOOST_DEV},${PKGSC_BOOST_DEV}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

CONFIGURE_ARGS += \
	--target=$(GNU_TARGET_NAME) \
	--host=$(GNU_TARGET_NAME) \
	--build=$(GNU_HOST_NAME) \
	--prefix=${WRKINST}/usr \

CONFIGURE_ARGS+=--without-locale

ifneq (${ADK_PACKAGE_BOOST_IOSTREAMS},)
	CONFIGURE_ARGS += -sNO_BZIP2=1 -sZLIB_INCLUDE=${STAGING_DIR}/usr/include -sZLIB_LIBPATH=${STAGING_DIR}/usr/lib
else
	CONFIGURE_ARGS += --without-iostreams
endif
ifeq (${ADK_PACKAGE_BOOST_DATE_TIME},)
	CONFIGURE_ARGS+=--without-date_time
endif
ifeq (${ADK_PACKAGE_BOOST_PYTHON},)
	CONFIGURE_ARGS+=--without-python
endif
ifeq (${ADK_PACKAGE_BOOST_GRAPH},)
	CONFIGURE_ARGS+=--without-graph
endif
ifeq (${ADK_PACKAGE_BOOST_MATH},)
	CONFIGURE_ARGS+=--without-math
endif
ifeq (${ADK_PACKAGE_BOOST_PROGRAM_OPTIONS},)
	CONFIGURE_ARGS+=--without-program_options
endif
ifeq (${ADK_PACKAGE_BOOST_REGEX},)
	CONFIGURE_ARGS+=--without-regex
endif
ifeq (${ADK_PACKAGE_BOOST_SERIALIZATION},)
	CONFIGURE_ARGS+=--without-serialization
endif
ifeq (${ADK_PACKAGE_BOOST_SIGNALS},)
	CONFIGURE_ARGS+=--without-signals
endif
ifeq (${ADK_PACKAGE_BOOST_SYSTEM},)
	CONFIGURE_ARGS+=--without-system
endif
ifeq (${ADK_PACKAGE_BOOST_TEST},)
	CONFIGURE_ARGS+=--without-test
endif
ifeq (${ADK_PACKAGE_BOOST_THREAD},)
	CONFIGURE_ARGS+=--without-thread
endif
ifeq (${ADK_PACKAGE_BOOST_WAVE},)
	CONFIGURE_ARGS+=--without-wave
endif

# some variables for build
GPP_PATH:=	${STAGING_HOST_DIR}/bin/${GNU_TARGET_NAME}-g++
GPP_VERSION:=	"`${GPP_PATH} -v 2>&1 | tail -1 | awk '{print $$3}'`"
BJAM_PATH:=	"`find ${WRKBUILD} -type f -name "bjam"`"
PYTHON_PATH:=	${STAGING_TARGET_DIR}/usr/bin/python
PYTHON_INCLUDE:="`find ${STAGING_TARGET_DIR}/usr/include/ -maxdepth 1 -type d -name "python*" | head -1`"
PYTHON_LIB:=	"`find ${STAGING_TARGET_DIR}/usr/lib/ -maxdepth 1 -type d -name "python*" | head -1`"
USER_JAM:=	${WRKBUILD}/tools/build/v2/user-config.jam

pre-build:
	@echo "build bjam..."
	cd $(WRKBUILD)/tools/build/v2/engine; ./build.sh gcc

do-build:
	@echo "build boost library..."
# remove exisiting using gcc line from user.jam
	${SED} "/^using gcc/d" ${USER_JAM}
# add using gcc line with determined options to user.jam
	echo "using gcc : ${GPP_VERSION} : ${GPP_PATH} ;" >> ${USER_JAM};

# remove exisiting using python line from user.jam
	${SED} "/^using python/d" ${USER_JAM}
ifneq (${ADK_PACKAGE_BOOST_PYTHON},)
# add using python line with determined options to user.jam
	echo "using python : ${PYTHON_VERSION} : ${PYTHON_PATH} : ${PYTHON_INCLUDE} : ${PYTHON_LIB} ;" >> ${USER_JAM};
endif

# run bjam to build boost
	( cd ${WRKBUILD}; \
		${BJAM_PATH} \
			-sBUILD=release \
			--toolset=gcc-${GPP_VERSION} \
			--build-type=minimal \
			--layout=versioned \
			--disable-long-double \
			--without-mpi \
			${CONFIGURE_ARGS} \
			install \
	)

boost-install:
	${INSTALL_DIR} ${IDIR_BOOST}/usr/lib
	${CP} ${WRKINST}/usr/lib/*.so* ${IDIR_BOOST}/usr/lib

boost-dev-install:
	${INSTALL_DIR} ${IDIR_BOOST_DEV}/usr/include
	${CP} ${WRKINST}/usr/include/* ${IDIR_BOOST_DEV}/usr/include

include ${TOPDIR}/mk/pkg-bottom.mk
