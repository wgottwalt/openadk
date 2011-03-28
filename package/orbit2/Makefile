# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		ORBit2
PKG_VERSION:=		2.14.19
PKG_EXTRAVER:=		2.14
PKG_RELEASE:=		1
PKG_MD5SUM:=		87c69c56c6d0bdafa4de5e18ae115cc9
PKG_DESCR:=		a CORBA 2.4-compliant Object Request Broker
PKG_SECTION:=		libs
PKG_BUILDDEP:=		libIDL
PKG_URL:=		http://projects.gnome.org/ORBit2/
PKG_SITES:=		ftp://ftp.gnome.org//pub/gnome/sources/ORBit2/${PKG_EXTRAVER}/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ORBIT2,orbit2,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CFLAGS_FOR_BUILD+=	$(shell ${BUILD_LIBIDL_CONFIG} --cflags)
LDFLAGS_FOR_BUILD+=	$(shell ${BUILD_LIBIDL_CONFIG} --libs)
LDFLAGS_FOR_BUILD+=	-lgmodule-2.0
CONFIGURE_ENV+=		ac_cv_alignof_CORBA_octet=1 \
			ac_cv_alignof_CORBA_boolean=1 \
			ac_cv_alignof_CORBA_char=1 \
			ac_cv_alignof_CORBA_wchar=2 \
			ac_cv_alignof_CORBA_short=2 \
			ac_cv_alignof_CORBA_long=4 \
			ac_cv_alignof_CORBA_long_long=4 \
			ac_cv_alignof_CORBA_float=4 \
			ac_cv_alignof_CORBA_double=4 \
			ac_cv_alignof_CORBA_long_double=4 \
			ac_cv_alignof_CORBA_struct=1 \
			ac_cv_alignof_CORBA_pointer=4

orbit2-install:
	$(INSTALL_DIR) $(IDIR_ORBIT2)/usr/lib
	$(INSTALL_BIN) $(WRKINST)/usr/lib/libORBit*.so* \
		$(IDIR_ORBIT2)/usr/lib
	$(INSTALL_DIR) $(STAGING_DIR)/usr/bin
	$(CP) $(WRKINST)/usr/bin/orbit-idl-2 \
		$(STAGING_DIR)/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
