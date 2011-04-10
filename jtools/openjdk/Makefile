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
DISTFILES:=		openjdk-$(PKG_VERSION)-src-$(PKG_EXTRAVER).tar.gz \
			$(ICEDTEA_NAME)-$(ICEDTEA_VERSION).tar.gz \
			jaxp144_01.zip \
			jdk6-jaf-b20.zip \
			jdk6-jaxws-b20.zip \
			${XALAN_NAME}_${XALAN_VERSION}-bin.tar.gz

WRKDIST=		${WRKDIR}
WRKSRC=			${WRKDIST}/${ICEDTEA_NAME}-${ICEDTEA_VERSION}

include ../rules.mk

OPENJDK_NATIVE_ENV+=	JAVACFLAGS="-cp ${STAGING_JAVA_HOST_DIR}/usr/share/java/libgcj-4.5.2.jar"
OPENJDK_NATIVE_ENV+=	DYLD_LIBRARY_PATH=$(STAGING_JAVA_HOST_DIR)/usr/lib:$(STAGING_JAVA_HOST_DIR)/usr/lib64
OPENJDK_NATIVE_ENV+=	LD_LIBRARY_PATH=$(STAGING_JAVA_HOST_DIR)/usr/lib:$(STAGING_JAVA_HOST_DIR)/usr/lib64
OPENJDK_NATIVE_ENV+=	ADK_ECJ=$(STAGING_JAVA_HOST_DIR)/usr/bin/ecj PATH=$$PATH:$(STAGING_JAVA_HOST_DIR)/usr/bin

install: ${STAGING_JAVA_HOST_DIR}/bootstrap-jdk/bin/java

$(WRKDIST)/.extract: $(WRKDIST)/.extract_done
	cd ${WRKDIST}; mkdir openjdk-$(PKG_VERSION); \
		tar xzf $(TOPDIR)/dl/openjdk-$(PKG_VERSION)-src-$(PKG_EXTRAVER).tar.gz -C openjdk-$(PKG_VERSION)
	cd $(WRKDIST); tar xzf $(TOPDIR)/dl/$(ICEDTEA_NAME)-$(ICEDTEA_VERSION).tar.gz
	cd ${WRKDIST}; tar xzf ${TOPDIR}/dl/${XALAN_NAME}_${XALAN_VERSION}-bin.tar.gz
	mkdir -p ${WRKBUILD}/drops
	cd ${TOPDIR}/dl; cp jaxp144_01.zip jdk6-jaf-b20.zip jdk6-jaxws-b20.zip ${WRKBUILD}/drops
	cd $(WRKDIST); patch -p0 < ${TOPDIR}/jtools/openjdk/patches/*.patch
	touch $@

$(WRKDIST)/.configured: ${WRKDIST}/.extract
	cd ${WRKBUILD}; rm -rf config.{cache,status}; \
	export ${OPENJDK_NATIVE_ENV}; ./configure \
		--enable-bootstrap \
		--enable-zero \
		--disable-openjdk-cross-compilation \
		--with-openjdk-src-dir=$(WRKDIST)/$(PKG_NAME)-$(PKG_VERSION) \
		--with-jdk-home=$(STAGING_JAVA_HOST_DIR)/usr/lib/jvm \
		--with-java=$(STAGING_JAVA_HOST_DIR)/usr/bin/java \
		--with-javac=$(STAGING_JAVA_HOST_DIR)/usr/bin/ecj \
		--with-gcj=$(STAGING_JAVA_HOST_DIR)/usr/bin/gcj \
		--with-ecj-jar=${STAGING_JAVA_HOST_DIR}/usr/share/ecj.jar \
		--with-xalan2-jar=${WRKDIST}/${XALAN_NAME}_${XALAN_VERSION}/xalan.jar \
		--with-xalan2-serializer-jar=${WRKDIST}/${XALAN_NAME}_${XALAN_VERSION}/serializer.jar \
		--with-xerces2-jar=${WRKDIST}/${XALAN_NAME}_${XALAN_VERSION}/xercesImpl.jar \
		--without-rhino \
		--disable-docs
	touch $@

$(WRKBUILD)/.compiled: ${WRKDIST}/.configured
	export ${OPENJDK_NATIVE_ENV}; $(MAKE) -C $(WRKBUILD)
	touch $@

${STAGING_JAVA_HOST_DIR}/bootstrap-jdk/bin/java: $(WRKBUILD)/.compiled
	$(CP) $(WRKSRC)/openjdk.build/j2sdk-image $(STAGING_JAVA_HOST_DIR)/bootstrap-jdk
	touch $@

include ${TOPDIR}/mk/pkg-bottom.mk
