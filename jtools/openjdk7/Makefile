# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		icedtea
PKG_VERSION:=		2.3.9
PKG_RELEASE:=		1
PKG_MD5SUM:=		e96e5e578d442d3ae56cd332e8dbc6b6
PKG_DESCR:=		OpenJDK 7 Java VM
PKG_SECTION:=		lang
PKG_URL:=		http://openjdk.org/
PKG_SITES:=		http://icedtea.classpath.org/download/source/

include ../rules.mk

OPENJDK_NATIVE_ENV+=	JAVACFLAGS="-cp ${STAGING_JAVA_HOST_DIR}/usr/share/java/libgcj-$(GCJ_VER).jar"
OPENJDK_NATIVE_ENV+=	DYLD_LIBRARY_PATH=$(STAGING_JAVA_HOST_DIR)/usr/lib:$(STAGING_JAVA_HOST_DIR)/usr/lib64
OPENJDK_NATIVE_ENV+=	LD_LIBRARY_PATH=$(STAGING_JAVA_HOST_DIR)/usr/lib:$(STAGING_JAVA_HOST_DIR)/usr/lib64
OPENJDK_NATIVE_ENV+=	ADK_ECJ=$(STAGING_JAVA_HOST_DIR)/usr/bin/ecj PATH=$$PATH:$(STAGING_JAVA_HOST_DIR)/usr/bin
OPENJDK_NATIVE_ENV+=	BOOTCLASSPATH="$(STAGING_JAVA_HOST_DIR)/usr/share/jamvm/classes.zip:$(STAGING_JAVA_HOST_DIR)/usr/share/classpath/glibj.zip"

install: ${STAGING_JAVA_HOST_DIR}/bootstrap-jdk/bin/java

CONFIGURE_ARGS+=\
		--enable-bootstrap \
		--enable-zero \
		--with-jdk-home=$(STAGING_JAVA_HOST_DIR)/usr/lib/jvm \
		--with-java=$(STAGING_JAVA_HOST_DIR)/usr/bin/java \
		--with-javac=$(STAGING_JAVA_HOST_DIR)/usr/bin/ecj \
		--with-ecj-jar=${STAGING_JAVA_HOST_DIR}/usr/share/java/ecj.jar \
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
		--without-rhino \
		--disable-docs

$(WRKDIST)/.configured: ${WRKDIST}/.prepared
	(cd ${WRKBUILD}; export ${OPENJDK_NATIVE_ENV}; ./configure ${CONFIGURE_ARGS})
	touch $@

$(WRKBUILD)/.compiled: ${WRKDIST}/.configured
	export ${OPENJDK_NATIVE_ENV}; $(MAKE) -C $(WRKBUILD) icedtea-boot
	touch $@

${STAGING_JAVA_HOST_DIR}/bootstrap-jdk/bin/java: $(WRKBUILD)/.compiled
	$(CP) $(WRKSRC)/openjdk.build-boot/j2sdk-image $(STAGING_JAVA_HOST_DIR)/bootstrap-jdk
	touch $@

include ${TOPDIR}/mk/pkg-bottom.mk
