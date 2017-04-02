# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		openjdk7
PKG_VERSION:=		2.6.9
PKG_RELEASE:=		1
PKG_HASH:=		8e4f3eb8d41ef66f1797825343141046973c124b18bf7d4698fae0a9a25495ea
PKG_DESCR:=		java virtual machine
PKG_SECTION:=		dev/lang
PKG_BUILDDEP:=		openjdk7-host alsa-lib xproto libjpeg-turbo zlib giflib libpng freetype cups
PKG_BUILDDEP+=		libX11 libXt libXp libXinerama libXrender libXtst
PKG_BUILDDEP+=		libpng giflib libgtk2 glib fontconfig nss gconf ncurses
HOST_BUILDDEP:=		fastjar-host gcj-host ecj-host unzip-host ant-host libXcomposite-host
HOST_BUILDDEP+=		libXtst-host libXt-host libXinerama-host libXrender-host
HOST_BUILDDEP+=		cups-host qemu-host alsa-lib-host freetype-host	libxslt-host
PKG_DEPENDS:=		zlib libffi libxtst libxi cups gconf
PKG_DEPENDS+=		libfreetype libxrender libx11 libxext nss libjpeg-turbo
PKG_DEPENDS+=		libpng giflib libgtk2 glib fontconfig libncurses
PKG_NEEDS:=		threads c++
PKG_URL:=		http://openjdk.org/
PKG_SITES:=		http://icedtea.classpath.org/download/source/

DISTFILES:=		icedtea-$(PKG_VERSION).tar.xz
WRKDIST=		${WRKDIR}/icedtea-${PKG_VERSION}

GCJ_VER:=		5.4.0

PKG_HOST_DEPENDS:=	linux
PKG_ARCH_DEPENDS:=	arm mips ppc x86 x86_64

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk
include $(ADK_TOPDIR)/mk/qemu.mk

$(eval $(call HOST_template,OPENJDK7,openjdk7,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,OPENJDK7,openjdk7,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		basic

# uclibc with iconv-tiny/libiconv needs -liconv
ifeq ($(ADK_TARGET_LIBC_ICONV),)
ifeq ($(ADK_TARGET_LIB_UCLIBC_NG),y)
TARGET_LIBS:=		-liconv -lm
endif
endif

# for UINTPTR_MAX in stdint.h
TARGET_CFLAGS+=		-D__STDC_LIMIT_MACROS
# segfaults with march=pentium-m/atom
TARGET_CFLAGS:=		$(subst march=pentium-m,march=i686,$(TARGET_CFLAGS))
TARGET_CFLAGS:=		$(subst march=atom,march=i686,$(TARGET_CFLAGS))

BOOTSTRAPJDK:=		${STAGING_HOST_DIR}/bootstrap-jdk

JDKARCH:=		$(ADK_TARGET_CPU_ARCH)
ifeq ($(ADK_TARGET_ARCH),x86)
JDKARCH:=		i386
endif
ifeq ($(ADK_TARGET_CPU_ARCH),x86_64)
JDKARCH:=		amd64
endif

CONFIGURE_ARGS:=	--enable-zero \
			--disable-docs \
			--with-jdk-home=$(BOOTSTRAPJDK) \
			--with-java=$(BOOTSTRAPJDK)/bin/java \
			--with-javac=$(BOOTSTRAPJDK)/bin/javac \
			--with-javah=$(BOOTSTRAPJDK)/bin/javah \
			--with-jar=$(BOOTSTRAPJDK)/bin/jar \
			--with-rmic=$(BOOTSTRAPJDK)/bin/rmic \
			--with-native2ascii=$(BOOTSTRAPJDK)/bin/native2ascii \
			--without-gcj \
			--without-hotspot-build \
			--enable-nss \
			--enable-system-zlib \
			--enable-system-jpeg \
			--enable-system-png \
			--enable-system-gif \
			--enable-system-gtk \
			--enable-system-gio \
			--enable-system-fontconfig \
			--enable-system-gconf \
			--disable-system-sctp \
			--disable-system-pcsc \
			--disable-system-lcms \
			--disable-system-kerberos \
			--disable-compile-against-syscalls \
			--without-rhino \
			--disable-bootstrap

CONFIGURE_ENV+=		LD_LIBRARY_PATH=$(STAGING_HOST_DIR)/usr/lib
MAKE_ENV+=		ALT_COMPILER_PATH=$(TOOLCHAIN_DIR)/usr/$(GNU_TARGET_NAME)/bin \
			ALT_OPENWIN_HOME=$(STAGING_TARGET_DIR)/usr/ \
			ALT_CUPS_HEADERS_PATH=$(STAGING_TARGET_DIR)/usr/include/ \
			ALT_FREETYPE_HEADERS_PATH=$(STAGING_TARGET_DIR)/usr/include/ \
			OTHER_CFLAGS='$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) $(TARGET_LDFLAGS)' \
			OTHER_CXXFLAGS='$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) $(TARGET_LDFLAGS)' \
			OTHER_LDFLAGS='$(TARGET_LDFLAGS)' \
			OTHER_LDLIBS='$(TARGET_LIBS)' \
			NO_DOCS=true \
			GCC_HONOUR_COPTS=s CROSS_COMPILE_ARCH=$(JDKARCH) QEMU=$(QEMU) \
			LD_LIBRARY_PATH=$(STAGING_HOST_DIR)/usr/lib

ALL_TARGET:=		icedtea

# host stuff
OPENJDK_NATIVE_ENV:=	JAVACFLAGS="-cp ${STAGING_HOST_DIR}/usr/share/java/libgcj-$(GCJ_VER).jar" \
			NO_DOCS=true \
			LD_LIBRARY_PATH=$(STAGING_HOST_DIR)/usr/lib:$(STAGING_HOST_DIR)/usr/lib64 \
			BOOTCLASSPATH="$(STAGING_HOST_DIR)/usr/share/jamvm/classes.zip:$(STAGING_HOST_DIR)/usr/share/classpath/glibj.zip" \
			OTHER_CPPFLAGS='$(HOST_CPPFLAGS)' \
			OTHER_LDFLAGS='$(HOST_LDFLAGS)' \
			ALSA_CPPFLAGS='$(HOST_CPPFLAGS)' \
			LIBFFI_CFLAGS='-I$(STAGING_HOST_DIR)/usr/include -L$(STAGING_HOST_DIR)/usr/lib' \
			ALT_OPENWIN_HOME='$(STAGING_HOST_DIR)/usr' \
			ALT_CUPS_HEADERS_PATH="$(STAGING_HOST_DIR)/usr/include" \
			ALT_FREETYPE_HEADERS_PATH="$(STAGING_HOST_DIR)/usr/include" \
			ALT_FREETYPE_LIB_PATH="$(STAGING_HOST_DIR)/usr/lib"
			
HOST_CONFIGURE_ENV+=	$(OPENJDK_NATIVE_ENV)
HOST_MAKE_ENV+=		$(OPENJDK_NATIVE_ENV)
HOST_ALL_TARGET:=	icedtea-boot
HOST_CONFIGURE_ARGS+=	--enable-bootstrap \
			--enable-zero \
			--with-jdk-home=$(STAGING_HOST_DIR)/usr/lib/jvm \
			--with-java=$(STAGING_HOST_DIR)/usr/bin/hostjava \
			--with-javac=$(STAGING_HOST_DIR)/usr/bin/ecj \
			--with-ecj-jar=${DL_DIR}/ecj-4.9.jar \
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
			--disable-system-gconf \
			--disable-system-pcsc \
			--disable-system-sctp \
                	--disable-compile-against-syscalls \
			--without-rhino \
			--enable-systemtap=no \
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
	$(CP) ./files/nss.cfg $(IDIR_OPENJDK7)/usr/lib/jvm/jre/lib/security

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
