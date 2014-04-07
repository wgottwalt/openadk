# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

CP=			cp -fpR
INSTALL_DIR=		install -d -m0755
INSTALL_DATA=		install -m0644
INSTALL_BIN=		install -m0755
INSTALL_SCRIPT=		install -m0755
MAKEFLAGS=		$(EXTRA_MAKEFLAGS)
BUILD_USER=		$(shell id -un)
BUILD_GROUP=		$(shell id -gn)

# some global dirs
BASE_DIR:=		$(TOPDIR)
ifeq ($(ADK_DL_DIR),)
DL_DIR?=		$(BASE_DIR)/dl
else
DL_DIR?=		$(ADK_DL_DIR)
endif
SCRIPT_DIR:=		$(BASE_DIR)/scripts
STAGING_HOST_DIR:=	${BASE_DIR}/host_${GNU_HOST_NAME}
TOOLCHAIN_DIR:=		${BASE_DIR}/toolchain_${GNU_HOST_NAME}
HOST_BUILD_DIR:=	${BASE_DIR}/host_build_${GNU_HOST_NAME}

# dirs for cleandir
FW_DIR_PFX:=		$(BASE_DIR)/firmware
BUILD_DIR_PFX:=		$(BASE_DIR)/build_*
STAGING_PKG_DIR_PFX:=	${BASE_DIR}/pkg_*
STAGING_TARGET_DIR_PFX:=${BASE_DIR}/target_*
TOOLCHAIN_DIR_PFX=	$(BASE_DIR)/toolchain_*
STAGING_HOST_DIR_PFX:=	${BASE_DIR}/host_*
TARGET_DIR_PFX:=	$(BASE_DIR)/root_*

ifeq ($(ADK_TARGET_ABI),)
TARGET_DIR:=		$(BASE_DIR)/root_${ADK_TARGET_SYSTEM}_${CPU_ARCH}_${ADK_TARGET_LIBC}
FW_DIR:=		$(BASE_DIR)/firmware/${ADK_TARGET_SYSTEM}_${CPU_ARCH}_${ADK_TARGET_LIBC}
BUILD_DIR:=		${BASE_DIR}/build_${ADK_TARGET_SYSTEM}_${CPU_ARCH}_${ADK_TARGET_LIBC}
STAGING_TARGET_DIR:=	${BASE_DIR}/target_${CPU_ARCH}_${ADK_TARGET_LIBC}
STAGING_PKG_DIR:=	${BASE_DIR}/pkg_${ADK_TARGET_SYSTEM}_${CPU_ARCH}_${ADK_TARGET_LIBC}
STAGING_HOST2TARGET:=	../../target_${CPU_ARCH}_${ADK_TARGET_LIBC}
TOOLCHAIN_BUILD_DIR=	$(BASE_DIR)/toolchain_build_${CPU_ARCH}_${ADK_TARGET_LIBC}
else
TARGET_DIR:=		$(BASE_DIR)/root_${ADK_TARGET_SYSTEM}_${CPU_ARCH}_${ADK_TARGET_LIBC}_${ADK_TARGET_ABI}
FW_DIR:=		$(BASE_DIR)/firmware/${ADK_TARGET_SYSTEM}_${CPU_ARCH}_${ADK_TARGET_LIBC}_${ADK_TARGET_ABI}
BUILD_DIR:=		${BASE_DIR}/build_${ADK_TARGET_SYSTEM}_${CPU_ARCH}_${ADK_TARGET_LIBC}_${ADK_TARGET_ABI}
STAGING_TARGET_DIR:=	${BASE_DIR}/target_${CPU_ARCH}_${ADK_TARGET_LIBC}_${ADK_TARGET_ABI}
STAGING_PKG_DIR:=	${BASE_DIR}/pkg_${ADK_TARGET_SYSTEM}_${CPU_ARCH}_${ADK_TARGET_LIBC}_${ADK_TARGET_ABI}
STAGING_HOST2TARGET:=	../../target_${CPU_ARCH}_${ADK_TARGET_LIBC}_${ADK_TARGET_ABI}
TOOLCHAIN_BUILD_DIR=	$(BASE_DIR)/toolchain_build_${CPU_ARCH}_${ADK_TARGET_LIBC}_${ADK_TARGET_ABI}
endif

PACKAGE_DIR:=		$(FW_DIR)/packages
SCRIPT_TARGET_DIR:=	${STAGING_TARGET_DIR}/scripts

# PATH variables
TARGET_PATH=		${SCRIPT_DIR}:${STAGING_TARGET_DIR}/scripts:${TOOLCHAIN_DIR}/usr/bin:${STAGING_HOST_DIR}/usr/bin:${_PATH}
HOST_PATH=		${SCRIPT_DIR}:${TOOLCHAIN_DIR}/usr/bin:${STAGING_HOST_DIR}/usr/bin:${_PATH}
AUTOTOOL_PATH=		${TOOLCHAIN_DIR}/usr/bin:${STAGING_HOST_DIR}/usr/bin:${STAGING_TARGET_DIR}/scripts:${_PATH}

ifeq ($(ADK_DISABLE_HONOUR_CFLAGS),)
GCC_CHECK:=		GCC_HONOUR_COPTS=2
else
GCC_CHECK:=
endif

GNU_TARGET_NAME:=	$(CPU_ARCH)-$(ADK_VENDOR)-linux-$(ADK_TARGET_SUFFIX)
TARGET_CROSS:=		$(TOOLCHAIN_DIR)/usr/bin/$(GNU_TARGET_NAME)-
TARGET_COMPILER_PREFIX?=${TARGET_CROSS}
CONFIGURE_TRIPLE:=	--build=${GNU_HOST_NAME} \
			--host=${GNU_TARGET_NAME} \
			--target=${GNU_TARGET_NAME}

ifneq ($(strip ${ADK_USE_CCACHE}),)
TARGET_COMPILER_PREFIX=$(STAGING_HOST_DIR)/usr/bin/ccache ${TARGET_CROSS}
endif

# target tools
TARGET_CC:=		${TARGET_COMPILER_PREFIX}gcc
TARGET_CXX:=		${TARGET_COMPILER_PREFIX}g++
TARGET_LD:=		${TARGET_COMPILER_PREFIX}ld
TARGET_AR:=		${TARGET_COMPILER_PREFIX}ar
TARGET_RANLIB:=		${TARGET_COMPILER_PREFIX}ranlib

ifneq ($(ADK_TARGET_ABI_CFLAGS),)
TARGET_CC+=		$(ADK_TARGET_ABI_CFLAGS)
TARGET_CXX+=		$(ADK_TARGET_ABI_CFLAGS)
endif

MODE_FLAGS:=
ifeq ($(ADK_LINUX_ARM),y)
ifeq ($(ADK_LINUX_ARM_WITH_THUMB),y)
MODE_FLAGS:=		-mthumb
else
MODE_FLAGS:=		-marm
endif
endif

TARGET_CPPFLAGS:=	
TARGET_CFLAGS:=		$(TARGET_CFLAGS_ARCH) -fwrapv -fno-ident -fhonour-copts
TARGET_CXXFLAGS:=	$(TARGET_CFLAGS_ARCH) -fwrapv -fno-ident
TARGET_LDFLAGS:=	-L$(STAGING_TARGET_DIR)/lib -L$(STAGING_TARGET_DIR)/usr/lib \
			-Wl,-O1 -Wl,-rpath -Wl,/usr/lib \
			-Wl,-rpath-link -Wl,${STAGING_TARGET_DIR}/usr/lib

# security optimization, see http://www.akkadia.org/drepper/dsohowto.pdf
TARGET_LDFLAGS+=	-Wl,-z,relro,-z,now
# needed for musl ppc 
ifeq ($(ADK_LINUX_PPC),y)
ifeq ($(ADK_TARGET_LIB_MUSL),y)
TARGET_LDFLAGS+=	-Wl,--secure-plt
endif
endif

ifeq ($(ADK_STATIC),y)
TARGET_CFLAGS+=		-static
TARGET_CXXFLAGS+=	-static
TARGET_LDFLAGS+=	-static
endif

ifneq ($(ADK_TOOLCHAIN_USE_SSP),)
TARGET_CFLAGS+=		-fstack-protector
TARGET_CXXFLAGS+=	-fstack-protector
TARGET_LDFLAGS+=	-fstack-protector
endif

ifneq ($(ADK_TOOLCHAIN_USE_LTO),)
TARGET_CFLAGS+=		-flto
TARGET_CXXFLAGS+=	-flto
TARGET_LDFLAGS+=	-flto
endif

ifeq ($(ADK_LINUX_MICROBLAZE),y)
TARGET_CFLAGS+=		-mxl-barrel-shift
TARGET_CXX_FLAGS+=	-mxl-barrel-shift
endif

ifneq ($(ADK_DEBUG),)
ifeq ($(ADK_DEBUG_OPTS),y)
TARGET_CFLAGS+=		-g3 -fno-omit-frame-pointer $(ADK_TARGET_CFLAGS_OPT)
else
TARGET_CFLAGS+=		-g3 -fno-omit-frame-pointer
endif
else
TARGET_CPPFLAGS+=	-DNDEBUG
TARGET_CFLAGS+=		-fomit-frame-pointer $(ADK_TARGET_CFLAGS_OPT)
# stop generating eh_frame stuff
TARGET_CFLAGS+=		-fno-unwind-tables -fno-asynchronous-unwind-tables
# always add debug information
TARGET_CFLAGS+=		-g3
endif

ifneq ($(MODE_FLAGS),)
TARGET_CFLAGS+=		$(MODE_CFLAGS)
TARGET_CXXFLAGS+=	$(MODE_CFLAGS)
endif

# A nifty macro to make testing gcc features easier (from uClibc project)
check_gcc=$(shell \
        if $(CC_FOR_BUILD) $(1) -Werror -S -o /dev/null -xc /dev/null > /dev/null 2>&1; \
        then echo "$(1)"; else echo "$(2)"; fi)

CF_FOR_BUILD=$(call check_gcc,-fhonour-copts,)

# host compiler flags
CPPFLAGS_FOR_BUILD?=	-I$(STAGING_HOST_DIR)/usr/include
CFLAGS_FOR_BUILD=	-O2 -Wall $(CF_FOR_BUILD)
CXXFLAGS_FOR_BUILD?=    -O2 -Wall
LDFLAGS_FOR_BUILD?= 	-L$(STAGING_HOST_DIR)/usr/lib
FLAGS_FOR_BUILD=	${CPPFLAGS_FOR_BUILD} ${CFLAGS_FOR_BUILD} ${LDFLAGS_FOR_BUILD}

PATCH=			${BASH} $(SCRIPT_DIR)/patch.sh
SED:=			PATH=${HOST_PATH} sed -i -e
LINUX_DIR:=		$(BUILD_DIR)/linux
KERNEL_MODULE_FLAGS:=	ARCH=${ARCH} \
			KERNEL_PATH=${LINUX_DIR} \
			KERNELDIR=${LINUX_DIR} \
			KERNEL_DIR=${LINUX_DIR} \
			PREFIX=/usr CROSS_COMPILE="${TARGET_CROSS}" \
			CFLAGS_MODULE="-fhonour-copts" V=1

TARGET_CONFIGURE_OPTS=	PATH='${TARGET_PATH}' \
			AR='$(TARGET_CROSS)ar' \
			AS='$(TARGET_CROSS)as' \
			LD='$(TARGET_CROSS)ld' \
			NM='$(TARGET_CROSS)nm' \
			RANLIB='$(TARGET_CROSS)ranlib' \
			STRIP='${TARGET_CROSS}strip' \
			OBJCOPY='${TARGET_CROSS}objcopy' \
			CC='$(TARGET_CC)' \
			GCC='$(TARGET_CC)' \
			CXX='$(TARGET_CXX)' \
			CROSS='$(TARGET_CROSS)' \
			CROSS_COMPILE='$(TARGET_CROSS)'

HOST_CONFIGURE_OPTS=	CC_FOR_BUILD='${CC_FOR_BUILD}' \
			CXX_FOR_BUILD='${CXX_FOR_BUILD}' \
			CPPFLAGS_FOR_BUILD='${CPPFLAGS_FOR_BUILD}' \
			CFLAGS_FOR_BUILD='${CFLAGS_FOR_BUILD}' \
			CXXFLAGS_FOR_BUILD='${CXXFLAGS_FOR_BUILD}' \
			LDFLAGS_FOR_BUILD='${LDFLAGS_FOR_BUILD}'

PKG_SUFFIX:=		$(strip $(subst ",, $(ADK_PACKAGE_SUFFIX)))

ifeq ($(ADK_TARGET_PACKAGE_IPKG),y)
PKG_BUILD:=		PATH='${TARGET_PATH}' \
			${BASH} ${SCRIPT_DIR}/ipkg-build
PKG_INSTALL:=		IPKG_TMP=$(BUILD_DIR)/tmp \
			IPKG_INSTROOT=$(TARGET_DIR) \
			IPKG_CONF_DIR=$(STAGING_TARGET_DIR)/etc \
			IPKG_OFFLINE_ROOT=$(TARGET_DIR) \
			BIN_DIR=$(STAGING_HOST_DIR)/usr/bin \
			${BASH} ${SCRIPT_DIR}/ipkg \
			-force-defaults -force-depends install
PKG_STATE_DIR:=		$(TARGET_DIR)/usr/lib/ipkg
else
PKG_BUILD:=		${BASH} ${SCRIPT_DIR}/tarpkg build
PKG_INSTALL:=		PKG_INSTROOT=$(TARGET_DIR) \
			${BASH} ${SCRIPT_DIR}/tarpkg install
PKG_STATE_DIR:=		$(TARGET_DIR)/usr/lib/pkg
endif

RSTRIP:=		PATH="$(TARGET_PATH)" prefix='${TARGET_CROSS}' ${BASH} ${SCRIPT_DIR}/rstrip.sh

STATCMD:=$(shell if stat -qs .>/dev/null 2>&1; then echo 'stat -f %z';else echo 'stat -c %s';fi)
	
EXTRACT_CMD=		PATH='${HOST_PATH}'; mkdir -p ${WRKDIR}; \
			cd ${WRKDIR} && \
			for file in ${FULLDISTFILES}; do case $$file in \
			*.cpio) \
				cat $$file | cpio -i -d ;; \
			*.tar) \
				tar -xf $$file ;; \
			*.cpio.Z | *.cpio.gz | *.cgz | *.mcz) \
				gzip -dc $$file | cpio -i -d ;; \
			*.tar.xz | *.txz) \
				xz -dc $$file | tar -xf - ;; \
			*.tar.Z | *.tar.gz | *.taz | *.tgz) \
				gzip -dc $$file | tar -xf - ;; \
			*.cpio.bz2 | *.cbz) \
				bzip2 -dc $$file | cpio -i -d ;; \
			*.tar.bz2 | *.tbz | *.tbz2) \
				bzip2 -dc $$file | tar -xf - ;; \
			*.zip) \
				cat $$file | cpio -ivd -H zip ;; \
			*.arm) \
				cp $$file ${WRKDIR} ;; \
			*) \
				echo "Cannot extract '$$file'" >&2; \
				false ;; \
			esac; done

ifeq ($(VERBOSE),1)
QUIET:=
else
QUIET:=			--quiet
endif
FETCH_CMD?=		wget --timeout=$(ADK_WGET_TIMEOUT) -t 3 --no-check-certificate $(QUIET)

ifeq ($(ADK_HOST_CYGWIN),y)
EXEEXT:=		.exe
endif

include $(TOPDIR)/mk/mirrors.mk
