# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		boost
PKG_VERSION:=		1.55.0
PKG_RELEASE:=		4
PKG_MD5SUM:=		93780777cfbf999a600f62883bd54b17
PKG_DESCR:=		boost C++ library
PKG_SECTION:=		libs
PKG_BUILDDEP:=		autotool bzip2-host python2-host
PKG_URL:=		http://www.boost.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=boost/}
PKG_OPTS:=		dev

PKG_ARCH_DEPENDS:=	!m68k

DISTFILES:=		boost_1_55_0.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}_1_55_0

PKG_FLAVOURS_BOOST:=	DATE_TIME GRAPH GRAPH_PARALLEL IOSTREAMS MATH PROGRAM_OPTIONS PYTHON REGEX SERIALIZATION SIGNALS SYSTEM TEST THREAD WAVE

PKGFD_DATE_TIME:=	with date-time
PKGFD_PYTHON:=		with Python
PKGFB_PYTHON:=		python2
PKGFS_PYTHON:=		python2
PKGFD_IOSTREAMS:=	with iostreams
PKGFD_GRAPH:=	with graph
PKGFD_GRAPH_PARALLEL:=	with graph_parallel
PKGFD_MATH:=	with math
PKGFD_PROGRAM_OPTIONS:=	with program_options
PKGFD_REGEX:=	with regex
PKGFD_SERIALIZATION:=	with serialization
PKGFD_SIGNALS:=	with signals
PKGFD_SYSTEM:=	with system
PKGFD_TEST:=	with test
PKGFD_THREAD:=	with thread
PKGFD_WAVE:=	with wave

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BOOST,boost,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},${PKG_OPTS}))

include ${TOPDIR}/mk/python.mk

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
	CONFIGURE_ARGS += -sNO_BZIP2=1 -sZLIB_INCLUDE=${STAGING_TARGET_DIR}/usr/include -sZLIB_LIBPATH=${STAGING_TARGET_DIR}/usr/lib
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

ifeq ($(ARCH),x86_64)
BOOST_ARCH:=	x86
else
BOOST_ARCH:=	$(ARCH)
endif

# some variables for build
GPP_PATH:=	${STAGING_HOST_DIR}/bin/${GNU_TARGET_NAME}-g++
GPP_VERSION:=	"`${GPP_PATH} -v 2>&1 | tail -1 | awk '{print $$3}'`"
BJAM_PATH:=	"`find ${WRKBUILD} -type f -name "bjam$(EXEEXT)"`"
PYTHON_PATH:=	${STAGING_HOST_DIR}/usr/bin/python
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
			-d 2 \
			target-os=linux \
			architecture=$(BOOST_ARCH) \
			binary-format=elf \
			toolset=gcc-${GPP_VERSION} \
			--build-type=minimal \
			--layout=versioned \
			--disable-long-double \
			--without-mpi \
			--debug-configuration \
			${CONFIGURE_ARGS} \
			install \
	)

boost-install:
	${INSTALL_DIR} ${IDIR_BOOST}/usr/lib
	${CP} ${WRKINST}/usr/lib/*.so* ${IDIR_BOOST}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
