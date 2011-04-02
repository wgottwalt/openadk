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
PKG_BUILDDEP:=		xproto jpeg zlib libX11 libpng freetype
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

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION)-src-$(PKG_EXTRAVER).tar.gz \
			$(ICEDTEA_NAME)-$(ICEDTEA_VERSION).tar.gz \
			jaxp144_01.zip \
			jdk6-jaf-b20.zip \
			jdk6-jaxws-b20.zip
			${XALAN_NAME}_${XALAN_VERSION}-bin.tar.gz
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
			--with-xalan2-jar=${WRKBUILD}/${XALAN_NAME}_${XALAN_VERSION}/xalan.jar \
			--with-xalan2-serializer-jar=${WRKBUILD}/${XALAN_NAME}_${XALAN_VERSION}/serializer.jar \
			--with-xerces2-jar=${WRKBUILD}/${XALAN_NAME}_${XALAN_VERSION}/xercesImpl.jar \
			--with-ecj-jar=$(TOPDIR)/dl/ecj.jar \
			--without-rhino \
			--disable-xrender \
			--disable-nss

do-extract:
	(cd ${WRKBUILD}; mkdir $(PKG_NAME)-$(PKG_VERSION) ; tar xzf $(TOPDIR)/dl/$(PKG_NAME)-$(PKG_VERSION)-src-$(PKG_EXTRAVER).tar.gz -C $(PKG_NAME)-$(PKG_VERSION))
	(cd $(WRKBUILD); tar xzf $(TOPDIR)/dl/$(ICEDTEA_NAME)-$(ICEDTEA_VERSION).tar.gz)
	cd ${WRKBUILD}; tar xzf ${TOPDIR}/dl/${XALAN_NAME}_${XALAN_VERSION}-bin.tar.gz
	cd ${TOPDIR}/dl; cp jaxp144_01.zip jdk6-jaf-b20.zip jdk6-jaxws-b20.zip \
	    ${WRKBUILD}/${ICEDTEA_NAME}-${ICEDTEA_VERSION}/drops/

pre-configure:
	cd ${WRKBUILD}/$(ICEDTEA_NAME)-$(ICEDTEA_VERSION); rm -rf config.{cache,status};\
		env JAVACFLAGS="-cp ${STAGING_JAVA_HOST_DIR}/usr/share/java/libgcj-4.5.2.jar" \
		DYLD_LIBRARY_PATH=$(STAGING_JAVA_HOST_DIR)/usr/lib:$(STAGING_JAVA_HOST_DIR)/usr/lib64 \
		LD_LIBRARY_PATH=$(STAGING_JAVA_HOST_DIR)/usr/lib:$(STAGING_JAVA_HOST_DIR)/usr/lib64 \
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
			--with-xalan2-jar=${WRKBUILD}/${XALAN_NAME}_${XALAN_VERSION}/xalan.jar \
			--with-xalan2-serializer-jar=${WRKBUILD}/${XALAN_NAME}_${XALAN_VERSION}/serializer.jar \
			--with-xerces2-jar=${WRKBUILD}/${XALAN_NAME}_${XALAN_VERSION}/xercesImpl.jar \
			--without-rhino \
			--disable-xrender \
			--disable-nss \
		&& ${MAKE}

openjdk-install:
	$(INSTALL_DIR) $(IDIR_OPENJDK)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
