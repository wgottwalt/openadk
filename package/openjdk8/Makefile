# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		openjdk8
PKG_VERSION:=		8u121-b13
PKG_RELEASE:=		1
PKG_HASH:=		1e681ea5db9feec8ed65acef5b60555dddd8297143b3858e0e3f148f1772dc0d
PKG_DESCR:=		java virtual machine
PKG_SECTION:=		dev/lang
PKG_DEPENDS:=		alsa-lib freetype libx11 libxext libxrender libxtst
PKG_DEPENDS+=		libxt libffi zlib
PKG_BUILDDEP:=		openjdk7-host libX11 libXext libXrender libXtst libXt
PKG_BUILDDEP+=		freetype alsa-lib cups libffi zlib
PKG_NEEDS:=             threads c++
PKG_URL:=		http://openjdk.org/
PKG_HG:=		http://hg.openjdk.java.net/jdk8u/jdk8u
PKG_SITES:=		${PKG_HG}/archive/
PKG_NOPARALLEL:=	1
ICEDTEA_VERSION:=	3.3.0

PKG_HOST_DEPENDS:=	linux
PKG_ARCH_DEPENDS:=	arm mips ppc x86 x86_64

DISTFILES:=		jdk$(PKG_VERSION).tar.bz2
WRKSRC=			${WRKDIST}/openjdk

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OPENJDK8,openjdk8,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

JDKARCH:=		$(ADK_TARGET_CPU_ARCH)
ifeq ($(ADK_TARGET_ARCH),x86)
JDKARCH:=		i386
endif
ifeq ($(ADK_TARGET_CPU_ARCH),x86_64)
JDKARCH:=		amd64
endif

TARGET_LDFLAGS:=	-lm -liconv

CONFIG_STYLE:=		basic
CONFIGURE_ARGS+=	--prefix=$(WRKINST)/usr \
			--with-jvm-variants=zero \
			--with-stdc++lib=dynamic \
			--enable-unlimited-crypto \
			--disable-debug-symbols \
			--with-debug-level=release \
			--with-zlib=system \
			--enable-freetype-bundling \
			--with-freetype=$(STAGING_TARGET_DIR)/usr \
			--with-freetype-include=$(STAGING_TARGET_DIR)/usr/include/freetype2 \
			--with-boot-jdk=$(STAGING_HOST_DIR)/bootstrap-jdk \
			--with-extra-cflags="$(TARGET_CFLAGS)" \
			--with-extra-cxxflags="$(TARGET_CXXFLAGS)" \
			--with-extra-ldflags="$(TARGET_LDFLAGS)" \
			--with-cups=$(STAGING_TARGET_DIR)/usr \
			--with-alsa=$(STAGING_TARGET_DIR) \
			--with-x=$(STAGING_TARGET_DIR)/usr \
			--x-includes=$(STAGING_TARGET_DIR)/usr/include \
			--x-libraries=$(STAGING_TARGET_DIR)/usr/lib
CONFIGURE_ENV:=		BUILD_CC=/usr/bin/gcc \
			BUILD_CXX=/usr/bin/g++ \
			BUILD_LD=/usr/bin/ld \
			ac_cv_path_POTENTIAL_CC=$(TARGET_CC) \
			ac_cv_path_POTENTIAL_CXX=$(TARGET_CXX) \
			LD=$(TARGET_CC) \
			OBJCOPY='$(TARGET_CROSS)objcopy' \
			STRIP='$(TARGET_CROSS)strip' \
			LIBFFI_CFLAGS="$(TARGET_CPPFLAGS)" \
			LIBFFI_LIBS="$(TARGET_LDFLAGS) -lffi"

XAKE_FLAGS+=		LD='$(TARGET_CC)' \
			STRIP='$(TARGET_CROSS)strip' \
			BUILD_CC='$(HOST_CC)' \
			BUILD_LD='$(HOST_CC)' \
			LOG=debug \
			JOBS="4"

post-extract:
	(cd $(DL_DIR); \
	for file in jdk corba hotspot jaxp jaxws langtools nashorn; do \
		if [ ! -f openjdk8-$${file}$(PKG_VERSION).tar.bz2 ]; then \
			wget -c -O openjdk8-$${file}$(PKG_VERSION).tar.bz2 $(PKG_HG)/$${file}/archive/jdk$(PKG_VERSION).tar.bz2 ; \
		fi; \
	done; \
	if [ ! -f icedtea-$(ICEDTEA_VERSION).tar.xz ]; then \
		wget -O icedtea-$(ICEDTEA_VERSION).tar.xz http://icedtea.classpath.org/download/source/icedtea-$(ICEDTEA_VERSION).tar.xz; \
	fi; \
	)
	mkdir -p $(WRKDIST)/openjdk
	(cd $(WRKDIST); \
		tar --strip-components=1 -xvf $(DL_DIR)/icedtea-$(ICEDTEA_VERSION).tar.bz2; \
		tar --strip-components=1 -C $(WRKDIST)/openjdk -xvf $(DL_DIR)/jdk$(PKG_VERSION).tar.bz2; \
		for file in jdk corba hotspot jaxp jaxws langtools nashorn; do \
			mkdir -p $(WRKDIST)/openjdk/$${file}; \
			tar --strip-components=1 -C $(WRKDIST)/openjdk/$${file} -xvf $(DL_DIR)/openjdk8-$${file}$(PKG_VERSION).tar.bz2 ; \
		done; \
	)
	(cd $(WRKDIST)/openjdk; patch -p1 < $(ADK_TOPDIR)/package/openjdk8/files/openadk.patch) 
	(cd $(WRKDIST); \
		PATH=$(HOST_PATH) sed -e 's|@abs_top_srcdir@|$(WRKDIST)|g' -e '/^patch.*/d' fsg.sh.in > fsg.sh; \
		${BASH} fsg.sh; \
	)
	cat $(WRKDIST)/openjdk/common/autoconf/configure.ac | PATH=$(HOST_PATH) sed -e "s|@DATE_WHEN_GENERATED@|`LC_ALL=C date +%s`|" | $(STAGING_HOST_DIR)/usr/bin/autoconf \
		-W all -I$(WRKDIST)/openjdk/common/autoconf - > $(WRKDIST)/openjdk/common/autoconf/generated-configure.sh

openjdk8-install:
	$(INSTALL_DIR) $(IDIR_OPENJDK8)/usr/bin
	$(INSTALL_DIR) $(IDIR_OPENJDK8)/usr/lib/jvm
	$(CP) $(WRKINST)//usr/jvm/openjdk-1.8.0-internal/* \
		$(IDIR_OPENJDK8)/usr/lib/jvm
	(cd $(IDIR_OPENJDK8)/usr/bin && ln -sf ../lib/jvm/jre/bin/java .)
	(cd $(IDIR_OPENJDK8)/usr/lib/jvm/jre/lib/$(JDKARCH) && ln -sf server/libjvm.so .)

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
