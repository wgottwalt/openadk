# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		opensips
PKG_VERSION:=		1.4.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		d7f0c867d797525635f157b65bb45129
PKG_VARIANT:=		tls
MASTER_SITES:=		http://opensips.org/pub/opensips/$(PKG_VERSION)/src/
DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION)-$(PKG_VARIANT)_src.tar.gz
WRKDIST=		${WRKDIR}/$(PKG_NAME)-$(PKG_VERSION)-$(PKG_VARIANT)

include $(TOPDIR)/mk/package.mk

define PKG_mod_template

INSTALL_MODS_$${ADK_PACKAGE_${1}}+=    ${2}-install

${2}-install:
	[ -z "$(2)" ] || install -d -m 0755 $$(IDIR_$(1))/usr/lib/opensips/modules/
	$(CP) $(WRKBUILD)/modules/$(2)/$(2).so \
			$$(IDIR_$(1))/usr/lib/opensips/modules/

endef

$(eval $(call PKG_template,OPENSIPS,opensips,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_ACCOUNTING,opensips-mod-acc,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_AUTH,opensips-mod-auth,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_AUTH_DB,opensips-mod-auth-db,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_AVPOPS,opensips-mod-avpops,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_DISPATCHER,opensips-mod-dispatcher,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_DIVERSION,opensips-mod-diversion,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_FLATSTORE,opensips-mod-flatstore,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_GFLAGS,opensips-mod-gflags,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_GROUP,opensips-mod-group,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_MEDIAPROXY,opensips-mod-mediaproxy,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_MSILO,opensips-mod-msilo,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_NATHELPER,opensips-mod-nathelper,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_OPTIONS,opensips-mod-options,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_PDT,opensips-mod-pdt,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_PERMISSIONS,opensips-mod-permissions,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_PIKE,opensips-mod-pike,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_SMS,opensips-mod-sms,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_UAC,opensips-mod-uac,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_UAC_REDIRECT,opensips-mod-uac-redirect,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_URI,opensips-mod-uri,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_URI_DB,opensips-mod-uri-db,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,OPENSIPS_MOD_XLOG,opensips-mod-xlog,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

$(eval $(call PKG_mod_template,OPENSIPS_MOD_ACCOUNTING,acc))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_AUTH,auth))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_AUTH_DB,auth_db))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_AVPOPS,avpops))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_DISPATCHER,dispatcher))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_DIVERSION,diversion))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_FLATSTORE,db_flatstore))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_GFLAGS,gflags))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_GROUP,group))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_MEDIAPROXY,mediaproxy))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_MSILO,msilo))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_NATHELPER,nathelper))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_OPTIONS,options))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_PDT,pdt))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_PERMISSIONS,permissions))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_PIKE,pike))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_SMS,sms))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_SPEEDIAL,speeddial))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_UAC,uac))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_UAC_REDIRECT,uac_redirect))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_URI,uri))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_URI_DB,uri_db))
$(eval $(call PKG_mod_template,OPENSIPS_MOD_XLOG,xlog))

# Select here the modules for the ipk package
OPENSIPS_MODULES:=	sl tm rr maxfwd usrloc registrar db_text textops exec mi_fifo

OPENSIPS_MODULE_FILES:=	$(foreach module,$(OPENSIPS_MODULES),modules/$(module)/$(module).so)
OPENSIPS_MODULES:=	$(patsubst %,modules/%,$(OPENSIPS_MODULES))

post-extract:
	@rm -f ${WRKDIST}/modules/dialog/dlg_handlers.c.rej

do-build:
	$(MAKE) -C $(WRKBUILD) \
		prefix=/ \
		extra_defs="-DUSE_PTHREAD_MUTEX" \
		TLS=1 \
		NO_EPOLL=1 \
		CC="$(TARGET_CC)" \
		ARCH="$(ARCH)"  \
		CFLAGS="$(TARGET_CFLAGS)" \
		LOCALBASE="$(STAGING_DIR)/usr" \
		all modules

do-install: ${INSTALL_MODS_y} ${INSTALL_MODS_m}
	${INSTALL_DIR} $(IDIR_OPENSIPS)/etc/init.d
	${INSTALL_DIR} $(IDIR_OPENSIPS)/etc/opensips
	${INSTALL_DIR} $(IDIR_OPENSIPS)/usr/sbin
	${INSTALL_DIR} $(IDIR_OPENSIPS)/usr/lib/opensips/modules
	$(CP) $(WRKBUILD)/$(PKG_NAME) $(IDIR_OPENSIPS)/usr/sbin/
	(cd $(WRKBUILD);\
		$(CP) $(OPENSIPS_MODULE_FILES) $(IDIR_OPENSIPS)/usr/lib/opensips/modules/; \
	)
	$(CP) ./files/opensips.cfg $(IDIR_OPENSIPS)/etc/opensips/
	${INSTALL_DATA} ./files/opensips.init $(IDIR_OPENSIPS)/etc/init.d/opensips

include ${TOPDIR}/mk/pkg-bottom.mk
