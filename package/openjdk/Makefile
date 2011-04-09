# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		openjdk
PKG_VERSION:=		6
PKG_EXTRAVER:=		b22-28_feb_2011
PKG_RELEASE:=		1
PKG_MD5SUM:=		2d2bbbb0f9b81f1fec41ec730da8a933 \
			fd3f35e8a8a2ef9a64c035ed66cea06d \
			ef7a8b3624ea904bf584bc46d79b5e75 \
			bc95c133620bd68c161cac9891592901 \
			91adfd41e6f001add4f92ae31216b1e3 \
			d526d0848c88607ce4e3a0a4edb75d50
PKG_DESCR:=		OpenJDK Java VM
PKG_SECTION:=		lang
PKG_BUILDDEP:=		alsa-lib xproto jpeg zlib giflib libpng freetype cups
PKG_BUILDDEP+=		libX11 libXt libXp libXinerama libXrender libXtst
PKG_URL:=		http://openjdk.org/
PKG_SITES:=		http://download.java.net/openjdk/jdk6/promoted/b22/ \
			http://mirror.netcologne.de/apache.org/xml/xalan-j/binaries/ \
			http://icedtea.classpath.org/download/drops/ \
			http://icedtea.classpath.org/download/source/

# autotools infrastructure for OpenJDK
ICEDTEA_NAME:=		icedtea6
ICEDTEA_VERSION:=	1.10

# bootstrap JARs
XALAN_NAME=		xalan-j
XALAN_VERSION=		2_7_0

# override generic extraction
EXTRACT_OVERRIDE:=	1
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION)-src-$(PKG_EXTRAVER).tar.gz \
			$(ICEDTEA_NAME)-$(ICEDTEA_VERSION).tar.gz \
			jaxp144_01.zip \
			jdk6-jaf-b20.zip \
			jdk6-jaxws-b20.zip \
			${XALAN_NAME}_${XALAN_VERSION}-bin.tar.gz

WRKDIST=		${WRKDIR}
WRKSRC=			${WRKDIST}/${ICEDTEA_NAME}-${ICEDTEA_VERSION}

PKG_SUBPKGS:=		OPENJDK
PKG_CHOICES_OPENJDK:=	ZERO SHARK CACAO JAMVM
PKGCD_ZERO:=		zero-assembly backend
PKGCD_SHARK:=		JIT backend
PKGCD_CACAO:=		Cacao JIT backend
PKGCD_JAMVM:=		JamVM backend

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OPENJDK,openjdk,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_CFLAGS:=         $(filter-out -fhonour-copts,$(TARGET_CFLAGS))
BOOTSTRAPJDK:=		${STAGING_JAVA_HOST_DIR}/bootstrap-jdk

ifeq ($(ADK_PACKAGE_OPENJDK_ZERO),y)
CONFIGURE_ARGS+=	--enable-zero
endif
ifeq ($(ADK_PACKAGE_OPENJDK_SHARK),y)
CONFIGURE_ARGS+=	--enable-shark
endif

CONFIGURE_ARGS+=	--disable-docs \
			--enable-bootstrap \
			--enable-openjdk-cross-compilation \
			--with-cc-for-build=$(CC_FOR_BUILD) \
			--with-openjdk-src-dir=$(WRKDIST)/$(PKG_NAME)-$(PKG_VERSION) \
			--with-xalan2-jar=${WRKDIST}/${XALAN_NAME}_${XALAN_VERSION}/xalan.jar \
			--with-xalan2-serializer-jar=${WRKDIST}/${XALAN_NAME}_${XALAN_VERSION}/serializer.jar \
			--with-xerces2-jar=${WRKDIST}/${XALAN_NAME}_${XALAN_VERSION}/xercesImpl.jar \
			--with-jdk-home=$(BOOTSTRAPJDK) \
			--with-java=$(BOOTSTRAPJDK)/bin/java \
			--with-javac=$(BOOTSTRAPJDK)/bin/javac \
			--with-javah=$(BOOTSTRAPJDK)/bin/javah \
			--with-jar=$(BOOTSTRAPJDK)/bin/jar \
			--with-rmic=$(BOOTSTRAPJDK)/bin/rmic \
			--with-native2ascii=$(BOOTSTRAPJDK)/bin/native2ascii \
			--without-rhino

MAKE_ENV+=		ALT_COMPILER_PATH=$(STAGING_HOST_DIR)/$(REAL_GNU_TARGET_NAME) \
			GCC_HONOUR_COPTS=s

do-extract:
	cd ${WRKDIST}; mkdir $(PKG_NAME)-$(PKG_VERSION); \
		tar xzf $(TOPDIR)/dl/$(PKG_NAME)-$(PKG_VERSION)-src-$(PKG_EXTRAVER).tar.gz -C $(PKG_NAME)-$(PKG_VERSION)
	cd $(WRKDIST); tar xzf $(TOPDIR)/dl/$(ICEDTEA_NAME)-$(ICEDTEA_VERSION).tar.gz
	cd ${WRKDIST}; tar xzf ${TOPDIR}/dl/${XALAN_NAME}_${XALAN_VERSION}-bin.tar.gz
	mkdir -p ${WRKBUILD}/drops
	cd ${TOPDIR}/dl; cp jaxp144_01.zip jdk6-jaf-b20.zip jdk6-jaxws-b20.zip ${WRKBUILD}/drops

openjdk-install:
	$(INSTALL_DIR) $(IDIR_OPENJDK)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
