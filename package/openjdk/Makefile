# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		openjdk
PKG_VERSION:=		6
PKG_EXTRAVER:=		b22-28_feb_2011
PKG_RELEASE:=		1
PKG_MD5SUM:=		2d2bbbb0f9b81f1fec41ec730da8a933 fd3f35e8a8a2ef9a64c035ed66cea06d
PKG_DESCR:=		OpenJDK Java VM
PKG_SECTION:=		lang
PKG_BUILDDEP:=		xproto jpeg zlib libX11 libpng freetype
PKG_URL:=		http://openjdk.org/
PKG_SITES:=		http://download.java.net/openjdk/jdk6/promoted/b22/ \
			http://icedtea.classpath.org/download/source/

# autotools infrastructure for OpenJDK
ICEDTEA_NAME:=		icedtea6
ICEDTEA_VERSION:=	1.10

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION)-src-$(PKG_EXTRAVER).tar.gz $(ICEDTEA_NAME)-$(ICEDTEA_VERSION).tar.gz
NO_DISTFILES:=		1
WRKDIST=		${WRKDIR}

PKG_SUBPKGS:=		OPENJDK
PKG_CFLINE_OPENJDK:=	select ADK_TOOLCHAIN_GCC_JAVA

PKG_CHOICES_OPENJDK:=	ZERO SHARK CACAO JAMVM
PKGCD_ZERO:=		zero-assembly backend
PKGCD_SHARK:=		JIT backend
PKGCD_CACAO:=		Cacao JIT backend
PKGCD_JAMVM:=		JamVM backend

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OPENJDK,openjdk,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))


ifeq ($(ADK_PACKAGE_OPENJDK_ZERO),y)
CONFIGURE_ARGS+=	--enable-zero
endif
ifeq ($(ADK_PACKAGE_OPENJDK_SHARK),y)
CONFIGURE_ARGS+=	--enable-shark 
endif

CONFIGURE_ARGS+=	--disable-docs \
			--enable-bootstrap \
			--disable-openjdk-cross-compilation \
			--with-jdk-home=$(STAGING_HOST_DIR)/lib/jvm \
			--with-xalan2-jar=/usr/share/java/xalan.jar \
			--with-xalan2-serializer-jar=/usr/share/java/serializer.jar \
			--with-xerces2-jar=/usr/share/java/xercesImpl.jar \
			--with-ecj-jar=$(TOPDIR)/dl/ecj.jar \
			--without-rhino \
			--disable-xrender \
			--disable-nss

do-extract:
	(cd ${WRKBUILD}; mkdir $(PKG_NAME)-$(PKG_VERSION) ; tar xzf $(TOPDIR)/dl/$(PKG_NAME)-$(PKG_VERSION)-src-$(PKG_EXTRAVER).tar.gz -C $(PKG_NAME)-$(PKG_VERSION))
	(cd $(WRKBUILD); tar xzf $(TOPDIR)/dl/$(ICEDTEA_NAME)-$(ICEDTEA_VERSION).tar.gz)

pre-configure:
	(cd ${WRKBUILD}/$(ICEDTEA_NAME)-$(ICEDTEA_VERSION); rm -rf config.{cache,status};\
		export PATH="${PATH}:${STAGING_JAVA_HOST_DIR}/usr/bin"; \
		export CLASSPATH="${STAGING_JAVA_HOST_DIR}/usr/share/java/libgcj-4.5.2.jar:${STAGING_JAVA_HOST_DIR}/usr/share/java/ecj.jar";\
		./configure \
			--enable-bootstrap \
			--enable-zero \
			--with-jdk-home=$(STAGING_JAVA_HOST_DIR)/usr/lib/jvm \
			--with-java=$(STAGING_JAVA_HOST_DIR)/usr/bin/jamvm \
			--with-javac=$(STAGING_JAVA_HOST_DIR)/usr/bin/ecj \
			--with-gcj=$(STAGING_JAVA_HOST_DIR)/usr/bin/gcj \
			--with-openjdk-src-dir=$(WRKBUILD)/$(PKG_NAME)-$(PKG_VERSION) \
			--with-ecj-jar=${STAGING_JAVA_HOST_DIR}/usr/share/ecj.jar \
			--disable-docs \
			--disable-openjdk-cross-compilation \
			--with-xalan2-jar=/usr/share/java/xalan.jar \
			--with-xalan2-serializer-jar=/usr/share/java/serializer.jar \
			--with-xerces2-jar=/usr/share/java/xercesImpl.jar \
			--without-rhino \
			--disable-xrender \
			--disable-nss \
	);
	(cd $(WRKBUILD)/$(ICEDTEA_NAME)-$(ICEDTEA_VERSION) ; ${MAKE})

openjdk-install:
	$(INSTALL_DIR) $(IDIR_OPENJDK)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
