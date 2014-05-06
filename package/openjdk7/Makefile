# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		openjdk7
PKG_VERSION:=		2.4.7
PKG_RELEASE:=		1
PKG_MD5SUM:=		f6b28633b9978fadc724247cfc264ff0
PKG_DESCR:=		OpenJDK 7 Java VM
PKG_SECTION:=		lang
PKG_BUILDDEP:=		openjdk7-host alsa-lib xproto libjpeg-turbo zlib giflib libpng freetype cups
PKG_BUILDDEP+=		libX11 libXt libXp libXinerama libXrender libXtst libiconv-tiny
PKG_BUILDDEP+=		libpng giflib gtk+ glib fontconfig nss
HOST_BUILDDEP:=		fastjar-host gcj-host ecj-host classpath-host jamvm-host
HOST_BUILDDEP+=		jikes-host ant-host libXtst-host libXt-host libXinerama-host
HOST_BUILDDEP+=		cups-host qemu-host alsa-lib-host
PKG_DEPENDS:=		zlib libstdcxx libffi libpthread libxtst libxi libgcc cups
PKG_DEPENDS+=		libfreetype libxrender libx11 libxext libpthread nss libjpeg-turbo
PKG_DEPENDS+=		libpng giflib libgtk glib fontconfig
PKG_URL:=		http://openjdk.org/
PKG_SITES:=		http://icedtea.classpath.org/download/source/

DISTFILES:=		icedtea-$(PKG_VERSION).tar.xz
WRKDIST=		${WRKDIR}/icedtea-${PKG_VERSION}

GCJ_VER:=		4.8.2

PKG_HOST_DEPENDS:=	linux
PKG_ARCH_DEPENDS:=	arm mips ppc x86 x86_64
PKG_LIBC_DEPENDS:=	uclibc glibc
PKG_SYSTEM_DEPENDS:=	!lemote-yeelong

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk
include $(TOPDIR)/mk/qemu.mk

$(eval $(call HOST_template,OPENJDK7,openjdk7,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,OPENJDK7,openjdk7,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# for UINTPTR_MAX in stdint.h
TARGET_CFLAGS+=		-D__STDC_LIMIT_MACROS
# segfaults with march=pentium-m/atom
TARGET_CFLAGS:=		$(subst march=pentium-m,march=i686,$(TARGET_CFLAGS))
TARGET_CFLAGS:=		$(subst march=atom,march=i686,$(TARGET_CFLAGS))
TARGET_CFLAGS:=         $(filter-out -fhonour-copts,$(TARGET_CFLAGS))
BOOTSTRAPJDK:=		${STAGING_HOST_DIR}/bootstrap-jdk

JDKARCH:=		$(CPU_ARCH)
ifeq ($(ARCH),x86)
JDKARCH:=		i386
endif
ifeq ($(CPU_ARCH),x86_64)
JDKARCH:=		amd64
endif

CONFIGURE_BACKEND:=	--enable-zero
CONFIGURE_COMMON:=	--disable-docs \
			--with-jdk-home=$(BOOTSTRAPJDK) \
			--with-java=$(BOOTSTRAPJDK)/bin/java \
			--with-javac=$(BOOTSTRAPJDK)/bin/javac \
			--with-javah=$(BOOTSTRAPJDK)/bin/javah \
			--with-jar=$(BOOTSTRAPJDK)/bin/jar \
			--with-rmic=$(BOOTSTRAPJDK)/bin/rmic \
			--with-native2ascii=$(BOOTSTRAPJDK)/bin/native2ascii \
			--with-gcj=$(STAGING_HOST_DIR)/usr/bin/gcj \
			--without-hotspot-build \
			--enable-nss \
			--enable-system-zlib \
			--enable-system-jpeg \
			--enable-system-png \
			--enable-system-gif \
			--enable-system-gtk \
			--enable-system-gio \
			--enable-system-fontconfig \
			--disable-system-lcms \
			--disable-system-kerberos \
			--disable-compile-against-syscalls \
			--without-rhino

CONFIGURE_ARGS+=	$(CONFIGURE_BACKEND)
CONFIGURE_ARGS+=	$(CONFIGURE_COMMON)
CONFIGURE_ARGS+=	--disable-bootstrap

CONFIGURE_ENV+=		LD_LIBRARY_PATH=$(STAGING_HOST_DIR)/usr/lib
MAKE_ENV+=		ALT_COMPILER_PATH=$(TOOLCHAIN_DIR)/usr/$(GNU_TARGET_NAME)/bin \
			ALT_OPENWIN_HOME=$(STAGING_TARGET_DIR)/usr/ \
			ALT_CUPS_HEADERS_PATH=$(STAGING_TARGET_DIR)/usr/include/ \
			ALT_FREETYPE_HEADERS_PATH=$(STAGING_TARGET_DIR)/usr/include/ \
			OTHER_CFLAGS='$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) $(TARGET_LDFLAGS)' \
			OTHER_CXXFLAGS='$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) $(TARGET_LDFLAGS)' \
			OTHER_LDFLAGS='$(TARGET_LDFLAGS)' \
			GCC_HONOUR_COPTS=s CROSS_COMPILE_ARCH=$(JDKARCH) QEMU=$(QEMU) \
			LD_LIBRARY_PATH=$(STAGING_HOST_DIR)/usr/lib

ALL_TARGET:=		icedtea

# host stuff
OPENJDK_NATIVE_ENV+=	JAVACFLAGS="-cp ${STAGING_HOST_DIR}/usr/share/java/libgcj-$(GCJ_VER).jar"
OPENJDK_NATIVE_ENV+=	LD_LIBRARY_PATH=$(STAGING_HOST_DIR)/usr/lib:$(STAGING_HOST_DIR)/usr/lib64
OPENJDK_NATIVE_ENV+=	ADK_ECJ=$(STAGING_HOST_DIR)/usr/bin/ecj
OPENJDK_NATIVE_ENV+=	BOOTCLASSPATH="$(STAGING_HOST_DIR)/usr/share/jamvm/classes.zip:$(STAGING_HOST_DIR)/usr/share/classpath/glibj.zip"
OPENJDK_NATIVE_ENV+=	FFI_LDFLAGS="$(LDFLAGS_FOR_BUILD)" \
			OTHER_LDFLAGS='$(LDFLAGS_FOR_BUILD)' \
			ALT_CUPS_HEADERS_PATH="$(STAGING_HOST_DIR)/usr/include" \
			ALT_FREETYPE_HEADERS_PATH="$(STAGING_HOST_DIR)/usr/include" \
			ALT_FREETYPE_LIB_PATH="$(STAGING_HOST_DIR)/usr/lib"
			

HOST_STYLE:=		auto
HOST_CONFIGURE_ENV+=	$(OPENJDK_NATIVE_ENV)
HOST_MAKE_ENV+=		$(OPENJDK_NATIVE_ENV)
HOST_ALL_TARGET:=	icedtea-boot

HOST_CONFIGURE_ARGS+=\
		--enable-bootstrap \
		--enable-zero \
		--with-jdk-home=$(STAGING_HOST_DIR)/usr/lib/jvm \
		--with-java=$(STAGING_HOST_DIR)/usr/bin/java \
		--with-javac=$(STAGING_HOST_DIR)/usr/bin/ecj \
		--with-ecj-jar=${DL_DIR}/ecj.jar \
		--without-hotspot-build \
                --disable-system-zlib \
                --disable-system-jpeg \
                --disable-system-lcms \
                --disable-system-png \
                --disable-system-gif \
                --disable-system-gtk \
                --disable-system-gio \
                --disable-system-kerberos \
                --disable-system-fontconfig \
                --disable-compile-against-syscalls \
		--without-rhino \
		--disable-docs

hostpost-install:
	-rm -rf $(STAGING_HOST_DIR)/bootstrap-jdk
	$(CP) $(WRKBUILD)/openjdk.build-boot/j2sdk-image $(STAGING_HOST_DIR)/bootstrap-jdk

openjdk7-install:
	$(INSTALL_DIR) $(IDIR_OPENJDK7)/usr/lib/jvm/jre
	$(INSTALL_DIR) $(IDIR_OPENJDK7)/usr/bin
	$(CP) $(WRKBUILD)/openjdk.build/j2re-image/bin $(IDIR_OPENJDK7)/usr/lib/jvm/jre
	$(CP) $(WRKBUILD)/openjdk.build/j2re-image/lib $(IDIR_OPENJDK7)/usr/lib/jvm/jre
	(cd $(IDIR_OPENJDK7)/usr/bin && ln -sf ../lib/jvm/jre/bin/java .)
	(cd $(IDIR_OPENJDK7)/usr/lib/jvm/jre/lib/$(JDKARCH) && ln -sf server/libjvm.so .)

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
