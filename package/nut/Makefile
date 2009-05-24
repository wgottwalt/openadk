# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		nut
PKG_VERSION:=		2.0.5
PKG_RELEASE:=		1
PKG_MD5SUM:=		b08fde86191154bbcfda860f95a5dca2
MASTER_SITES:=		http://www.networkupstools.org/source/2.0/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,NUT,nut,${PKG_VERSION}-${PKG_RELEASE}))

define DRIVER_template

DRIVERS_$${ADK_PACKAGE_NUT_DRIVER_${1}}+=${2}

endef

DRIVERS_y:=
$(eval $(call DRIVER_template,BESTUPS,bestups))
$(eval $(call DRIVER_template,FENTONUPS,fentonups))
$(eval $(call DRIVER_template,APCSMART,apcsmart))
$(eval $(call DRIVER_template,EVERUPS,everups))
$(eval $(call DRIVER_template,BELKIN,belkin))
$(eval $(call DRIVER_template,MASTERGUARD,masterguard))
$(eval $(call DRIVER_template,POWERCOM,powercom))
$(eval $(call DRIVER_template,CYBERPOWER,cyberpower))
$(eval $(call DRIVER_template,TRIPPLITE,tripplite))
$(eval $(call DRIVER_template,VICTRONUPS,victronups))
$(eval $(call DRIVER_template,GENERICUPS,genericups))
$(eval $(call DRIVER_template,MGE_UTALK,mge-utalk))
$(eval $(call DRIVER_template,BESTUFERRUPS,bestuferrups))
$(eval $(call DRIVER_template,ISBMEX,isbmex))
$(eval $(call DRIVER_template,ETAPRO,etapro))
$(eval $(call DRIVER_template,LIEBERT,liebert))
$(eval $(call DRIVER_template,SMS,sms))
$(eval $(call DRIVER_template,ESUPSSMART,esupssmart))
$(eval $(call DRIVER_template,TRIPPLITESU,tripplitesu))
$(eval $(call DRIVER_template,BLAZER,blazer))
$(eval $(call DRIVER_template,SAFENET,safenet))
$(eval $(call DRIVER_template,BELKINUNV,belkinunv))
$(eval $(call DRIVER_template,ONEAC,oneac))
$(eval $(call DRIVER_template,IPPON,ippon))
$(eval $(call DRIVER_template,CPSUPS,cpsups))
$(eval $(call DRIVER_template,MUSTEK,mustek))
$(eval $(call DRIVER_template,METASYS,metasys))
$(eval $(call DRIVER_template,BESTFCOM,bestfcom))
$(eval $(call DRIVER_template,UPSCODE2,upscode2))
$(eval $(call DRIVER_template,SOLIS,solis))
$(eval $(call DRIVER_template,GAMATRONIC,gamatronic))
$(eval $(call DRIVER_template,MEGATEC,megatec))
$(eval $(call DRIVER_template,RHINO,rhino))

CONFIG_DRIVERS=$(shell echo ${DRIVERS_y} | tr ' ' ',')

INSTALL_DRIVERS_tmp=${DRIVERS_y}
ifneq (${ADK_PACKAGE_NUT_USB},)
INSTALL_DRIVERS_tmp+=	hidups energizerups newhidups tripplite_usb
endif
ifneq (${ADK_PACKAGE_NUT_SNMP},)
INSTALL_DRIVERS_tmp+=	snmp-ups
endif
INSTALL_DRIVERS=$(shell echo ${INSTALL_DRIVERS_tmp} | tr ' ' ',')

CONFIGURE_STYLE:=	gnu
CONFIGURE_ARGS+=	--with-linux-hiddev=${LINUX_DIR}/include/linux/hiddev.h \
			--without-cgi \
			--with-drivers=${INSTALL_DRIVERS} \
			--with-user=root
IPKG_DEPEND_tmp:=
ifneq (${ADK_PACKAGE_NUT_SSL},)
CONFIGURE_ARGS+=	--with-ssl
CONFIGURE_ENV+=		CPPFLAGS="${TCPPFLAGS} ${TLDFLAGS}"
MAKE_FLAGS+=		SSL_CFLAGS="${TCPPFLAGS}" SSL_LDFLAGS="${TLDFLAGS} -lssl -lcrypto"
IPKG_DEPEND_tmp+=	libopenssl
endif
BUILD_STYLE:=		auto
ALL_TARGET:=		all 
INSTALL_STYLE:=		auto
INSTALL_TARGET:=	install
ifneq (${ADK_PACKAGE_NUT_USB},)
ALL_TARGET+=		usb
INSTALL_TARGET+=	install-usb
IPKG_DEPEND_tmp+=	libusb
endif
ifneq (${ADK_PACKAGE_NUT_SNMP},)
ALL_TARGET+=		snmp
INSTALL_TARGET+=	install-snmp
IPKG_DEPEND_tmp+=	libnetsnmp
endif
IPKG_DEPEND=$(shell echo ${IPKG_DEPEND_tmp} | tr ' ' ',')

post-install:
	${INSTALL_DIR} ${IDIR_NUT}/usr/{s,}bin
	${INSTALL_DIR} ${IDIR_NUT}/etc/init.d
	${INSTALL_BIN} ./files/upsd.init \
		${IDIR_NUT}/etc/init.d/upsd
	${INSTALL_BIN} ${WRKINST}/usr/sbin/ups{d,mon,sched} \
		${IDIR_NUT}/usr/sbin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/{${INSTALL_DRIVERS}} \
		${IDIR_NUT}/usr/bin/
	${INSTALL_BIN} ${WRKINST}/usr/bin/ups{c,cmd,drvctl,log,rw} \
		${IDIR_NUT}/usr/bin/
	${INSTALL_DATA} ./files/ups{d,}.conf ${IDIR_NUT}/etc/
	echo "Depends: ${IPKG_DEPEND}" >> ${IDIR_NUT}/CONTROL/control
ifneq (${ADK_PACKAGE_NUT_VARDESC},)
	${INSTALL_DIR} ${IDIR_NUT}/usr/share
	${INSTALL_DATA} ${WRKINST}/usr/share/cmdvartab \
		${IDIR_NUT}/usr/share/
endif

include ${TOPDIR}/mk/pkg-bottom.mk
