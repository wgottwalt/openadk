# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		icedtea6
PKG_VERSION:=		1.10
PKG_RELEASE:=		1
PKG_MD5SUM:=		fd3f35e8a8a2ef9a64c035ed66cea06d 2d2bbbb0f9b81f1fec41ec730da8a933
PKG_DESCR:=		OpenJDK Java VM
PKG_SECTION:=		lang
PKG_URL:=		http://icedtea.classpath.org/
PKG_SITES:=		http://icedtea.classpath.org/download/source/ \
			http://download.java.net/openjdk/jdk6/promoted/b22/

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz openjdk-6-src-b22-28_feb_2011.tar.gz

PKG_SUBPKGS:=		OPENJDK

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
			--with-jdk-home=$(STAGING_HOST_DIR)/lib/jvm \
			--with-xalan2-jar=/opt/local/share/java/xalan.jar \
			--with-xalan2-serializer-jar=/opt/local/share/java/serializer.jar \
			--with-xerces2-jar=/opt/local/share/java/xercesImpl.jar \
			--with-openjdk-src-zip=$(TOPDIR)/dl/openjdk-6-src-b22-28_feb_2011.tar.gz \
			--with-ecj-jar=$(TOPDIR)/dl/ecj.jar \
			--with-gcj \
			--without-rhino \
			--disable-xrender \
			--disable-nss

openjdk-install:
	$(INSTALL_DIR) $(IDIR_OPENJDK)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
