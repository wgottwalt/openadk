# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		openjdk7
PKG_VERSION:=		2.3.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		e96e5e578d442d3ae56cd332e8dbc6b6
PKG_DESCR:=		OpenJDK 7 Java VM
PKG_SECTION:=		lang
PKG_BUILDDEP:=		alsa-lib xproto jpeg zlib giflib libpng freetype cups
PKG_BUILDDEP+=		libX11 libXt libXp libXinerama libXrender libXtst libiconv
PKG_DEPENDS:=		zlib libstdcxx libffi libpthread libxtst libxi libgcc
PKG_URL:=		http://openjdk.org/
PKG_SITES:=		http://icedtea.classpath.org/download/source/

DISTFILES:=		icedtea-$(PKG_VERSION).tar.gz
WRKDIST=		${WRKDIR}/icedtea-${PKG_VERSION}

PKG_HOST_DEPENDS:=	!darwin !cygwin !openbsd !netbsd !freebsd
PKG_ARCH_DEPENDS:=	arm mips x86 x86_64
PKG_SYSTEM_DEPENDS:=	!linksys-ag241 !fon-fon2100 !broadcom-bcm47xx

PKG_SUBPKGS:=		OPENJDK7
PKG_CHOICES_OPENJDK7:=	ZERO SHARK CACAO
PKGCD_ZERO:=		zero-assembly backend
PKGCD_SHARK:=		Shark JIT backend (needs eglibc/glibc)
PKGCB_SHARK:=		llvm
PKGCD_CACAO:=		Cacao JIT backend

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OPENJDK7,openjdk7,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# for UINTPTR_MAX in stdint.h
TARGET_CFLAGS+=		-D__STDC_LIMIT_MACROS
# segfaults with march=pentium-m/atom
TARGET_CFLAGS:=		$(subst march=pentium-m,march=i686,$(TARGET_CFLAGS))
TARGET_CFLAGS:=		$(subst march=atom,march=i686,$(TARGET_CFLAGS))
TARGET_CFLAGS:=         $(filter-out -fhonour-copts,$(TARGET_CFLAGS))
BOOTSTRAPJDK:=		${STAGING_JAVA_HOST_DIR}/bootstrap-jdk

JDKARCH:=		$(ARCH)
ifeq ($(ARCH),x86)
JDKARCH:=		i386
endif
ifeq ($(ADK_TARGET_SYSTEM_LEMOTE_YEELONG),y)
JDKARCH:=		mipsel
endif

ifeq ($(ADK_PACKAGE_OPENJDK7_ZERO),y)
CONFIGURE_BACKEND:=	--enable-zero
endif
ifeq ($(ADK_PACKAGE_OPENJDK7_SHARK),y)
CONFIGURE_BACKEND:=	--enable-shark \
			--with-llvm-config=$(STAGING_TARGET_DIR)/usr/bin/llvm-config
endif
ifeq ($(ADK_PACKAGE_OPENJDK7_CACAO),y)
CONFIGURE_BACKEND:=	--enable-cacao
endif

CONFIGURE_COMMON:=	--disable-docs \
			--with-jdk-home=$(BOOTSTRAPJDK) \
			--with-java=$(BOOTSTRAPJDK)/bin/java \
			--with-javac=$(BOOTSTRAPJDK)/bin/javac \
			--with-javah=$(BOOTSTRAPJDK)/bin/javah \
			--with-jar=$(BOOTSTRAPJDK)/bin/jar \
			--with-rmic=$(BOOTSTRAPJDK)/bin/rmic \
			--with-native2ascii=$(BOOTSTRAPJDK)/bin/native2ascii \
			--with-gcj=$(STAGING_JAVA_HOST_DIR)/usr/bin/gcj \
			--without-hotspot-build \
			--disable-system-jpeg \
			--disable-system-lcms \
			--disable-system-zlib \
			--disable-system-png \
			--disable-system-gif \
			--disable-system-gtk \
			--disable-system-gio \
			--disable-system-fontconfig \
			--disable-compile-against-syscalls \
			--without-rhino

CONFIGURE_ARGS+=	$(CONFIGURE_BACKEND)
CONFIGURE_ARGS+=	$(CONFIGURE_COMMON)
CONFIGURE_ARGS+=	--disable-bootstrap

CONFIGURE_ENV+=		PATH=$(STAGING_JAVA_HOST_DIR)/usr/bin:$${PATH}:${STAGING_TARGET_DIR}/usr/bin
MAKE_ENV+=		ALT_COMPILER_PATH=$(STAGING_HOST_DIR)/$(REAL_GNU_TARGET_NAME) \
			ALT_OPENWIN_HOME=$(STAGING_DIR)/usr/ \
			ALT_CUPS_HEADERS_PATH=$(STAGING_DIR)/usr/include/ \
			ALT_FREETYPE_HEADERS_PATH=$(STAGING_DIR)/usr/include/ \
			OTHER_CFLAGS='$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) $(TARGET_LDFLAGS)' \
			OTHER_CXXFLAGS='$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) $(TARGET_LDFLAGS)' \
			GCC_HONOUR_COPTS=s CROSS_COMPILE_ARCH=$(JDKARCH) QEMU=$(QEMU)

ALL_TARGET:=		icedtea

openjdk7-install:
	$(INSTALL_DIR) $(IDIR_OPENJDK7)/usr
	$(CP) $(WRKBUILD)/openjdk.build/j2re-image/* $(IDIR_OPENJDK7)/usr 
	rm -rf $(IDIR_OPENJDK7)/usr/man

include ${TOPDIR}/mk/pkg-bottom.mk
