# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.
# Comments:
# * pre/do/post-foo are always defined here, but empty. This is so
#   that we can call it (BSD make has .if target(foo) but GNU not)
#   and it won't error out.
# * ${_foo_COOKIE} are the actual targets
# * default is "auto" 
# * define "manual" if you need your own method
#   -> define a do-foo: target in the Makefile
# * if you have a style -> define a pre-foo: and post-foo: if they
#   are required, but the do-foo: magic is done here

pre-configure:
do-configure:
post-configure:
${_CONFIGURE_COOKIE}: ${_PATCH_COOKIE}
	mkdir -p ${WRKBUILD}
	@${MAKE} pre-configure $(MAKE_TRACE)

ifneq ($(filter autogen,${AUTOTOOL_STYLE}),)
	cd ${WRKBUILD}; \
		./autogen.sh $(MAKE_TRACE)
endif
ifneq ($(filter autotool,${AUTOTOOL_STYLE}),)
	cd ${WRKBUILD}; \
		autoreconf -vf;libtoolize $(MAKE_TRACE)
endif
ifneq ($(filter autoconf,${AUTOTOOL_STYLE}),)
	cd ${WRKBUILD}; autoconf $(MAKE_TRACE)
endif
ifneq ($(filter manual,${CONFIG_STYLE}),)
	env ${CONFIGURE_ENV} ${MAKE} do-configure $(MAKE_TRACE)
else ifneq ($(filter minimal,${CONFIG_STYLE}),)
	@$(CMD_TRACE) "configuring... "
	@cd ${WRKBUILD}; \
	    for i in $$(find . -name config.sub);do \
		if [ -f $$i ]; then \
			${CP} $$i $$i.bak; \
			${CP} ${SCRIPT_DIR}/config.sub $$i; \
		fi; \
	    done; \
	    for i in $$(find . -name config.guess);do \
		if [ -f $$i ]; then \
			${CP} $$i $$i.bak; \
			${CP} ${SCRIPT_DIR}/config.guess $$i; \
		fi; \
	    done;
	cd ${WRKBUILD}; rm -f config.{cache,status}; \
	    env ${CONFIGURE_ENV} \
	    ${BASH} ${WRKSRC}/${CONFIGURE_PROG} \
	    ${CONFIGURE_ARGS} $(MAKE_TRACE)
else ifeq ($(strip ${CONFIG_STYLE}),)
	@$(CMD_TRACE) "configuring... "
	@cd ${WRKBUILD}; \
	    for i in $$(find . -name config.sub);do \
		if [ -f $$i ]; then \
			${CP} $$i $$i.bak; \
			${CP} ${SCRIPT_DIR}/config.sub $$i; \
		fi; \
	    done; \
	    for i in $$(find . -name config.guess);do \
		if [ -f $$i ]; then \
			${CP} $$i $$i.bak; \
			${CP} ${SCRIPT_DIR}/config.guess $$i; \
		fi; \
	    done;
	cd ${WRKBUILD}; rm -f config.{cache,status}; \
	    env ${CONFIGURE_ENV} \
	    ${BASH} ${WRKSRC}/${CONFIGURE_PROG} \
	    --build=${GNU_HOST_NAME} \
	    --host=${GNU_TARGET_NAME} \
	    --target=${GNU_TARGET_NAME} \
	    --program-prefix= \
	    --program-suffix= \
	    --prefix=/usr \
	    --datadir=/usr/share \
	    --mandir=/usr/share/man \
	    --libexecdir=/usr/libexec \
	    --localstatedir=/var \
	    --sysconfdir=/etc \
	    --disable-nls \
	    --enable-shared \
	    --enable-static \
	    --disable-dependency-tracking \
	    --disable-libtool-lock \
	    ${CONFIGURE_ARGS} $(MAKE_TRACE)
else
	@echo "Invalid CONFIG_STYLE '${CONFIG_STYLE}'" >&2
	@exit 1
endif
	@${MAKE} post-configure $(MAKE_TRACE)
	touch $@

# do a parallel build if requested && package doesn't force disable it
ifeq (${ADK_MAKE_PARALLEL},y)
ifeq ($(strip ${PKG_NOPARALLEL}),)
MAKE_FLAGS+=		-j${ADK_MAKE_JOBS}
endif
endif

pre-build:
do-build:
post-build:
${_BUILD_COOKIE}: ${_CONFIGURE_COOKIE}
	@env ${MAKE_ENV} ${MAKE} pre-build $(MAKE_TRACE)
	@$(CMD_TRACE) "compiling... "

ifneq ($(filter manual,${BUILD_STYLE}),)
	env ${MAKE_ENV} ${MAKE} do-build $(MAKE_TRACE)
else ifeq ($(strip ${BUILD_STYLE}),)
	cd ${WRKBUILD} && env ${MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
	    ${MAKE_FLAGS} ${ALL_TARGET} $(MAKE_TRACE)
else
	@echo "Invalid BUILD_STYLE '${BUILD_STYLE}'" >&2
	@exit 1
endif
	@env ${MAKE_ENV} ${MAKE} post-build $(MAKE_TRACE)
	touch $@

pre-install:
do-install:
post-install:
${_FAKE_COOKIE}: ${_BUILD_COOKIE}
	-rm -f ${_ALL_CONTROLS}
	@mkdir -p '${STAGING_PARENT}/pkg' ${WRKINST} '${STAGING_DIR}/scripts'
	@mkdir -p ${WRKINST}/{sbin,bin,etc,lib}
	@mkdir -p ${WRKINST}/usr/{sbin,bin,etc,lib}
	@${MAKE} ${_ALL_CONTROLS} $(MAKE_TRACE)
	@env ${MAKE_ENV} ${MAKE} pre-install $(MAKE_TRACE)
ifneq ($(filter manual,${INSTALL_STYLE}),)
	env ${MAKE_ENV} ${MAKE} do-install $(MAKE_TRACE)
else ifeq ($(strip ${INSTALL_STYLE}),)
	cd ${WRKBUILD} && env ${MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
	    DESTDIR='${WRKINST}' ${FAKE_FLAGS} ${INSTALL_TARGET} $(MAKE_TRACE)
ifeq (,$(filter libonly,${PKG_OPTS}))
	env ${MAKE_ENV} ${MAKE} post-install $(MAKE_TRACE)
endif
else
	@echo "Invalid INSTALL_STYLE '${INSTALL_STYLE}'" >&2
	@exit 1
endif
	@for a in ${WRKINST}/usr/{bin/*-config,lib/pkgconfig/*.pc}; do \
		[[ -e $$a ]] || continue; \
		$(SED) "s,^prefix=.*,prefix=${STAGING_DIR}/usr," $$a; \
	done
ifeq (,$(filter noremove,${PKG_OPTS}))
	@if test -s '${STAGING_PARENT}/pkg/${PKG_NAME}'; then \
		cd '${STAGING_DIR}'; \
		while read fn; do \
			rm -f "$$fn"; \
		done <'${STAGING_PARENT}/pkg/${PKG_NAME}'; \
	fi
endif
	@rm -f '${STAGING_PARENT}/pkg/${PKG_NAME}'
	@-cd ${WRKINST}; \
	    if [ "${PKG_NAME}" != "uClibc" -a "${PKG_NAME}" != "eglibc" -a "${PKG_NAME}" != "glibc" -a "${PKG_NAME}" != "libpthread" -a "${PKG_NAME}" != "libstdcxx" -a "${PKG_NAME}" != "libthread-db" ];then \
	    find lib \( -name lib\*.so\* -o -name lib\*.a \) \
	    	-exec echo 'WARNING: ${PKG_NAME} installs files in /lib -' \
		' fix this!' >&2 \; -quit 2>/dev/null; fi;\
	    find usr ! -type d 2>/dev/null | \
	    grep -v -e '^usr/share' -e '^usr/man' -e '^usr/info' | \
	    tee '${STAGING_PARENT}/pkg/${PKG_NAME}' | \
	    cpio -padlmuv '${STAGING_DIR}'
	@cd '${STAGING_DIR}'; grep 'usr/lib/.*\.la$$' \
	    '${STAGING_PARENT}/pkg/${PKG_NAME}' | while read fn; do \
		chmod u+w $$fn; \
		$(SED) "s,\(^libdir='\| \|-L\|^dependency_libs='\)/usr/lib,\1$(STAGING_DIR)/usr/lib,g" $$fn; \
	done
ifeq (,$(filter noscripts,${PKG_OPTS}))
	@cd '${STAGING_DIR}'; grep 'usr/s*bin/' \
	    '${STAGING_PARENT}/pkg/${PKG_NAME}' | \
	    while read fn; do \
		b="$$(dd if="$$fn" bs=2 count=1 2>/dev/null)"; \
		[[ $$b = '#!' ]] || continue; \
		cp "$$fn" scripts/; \
		echo "scripts/$$(basename "$$fn")" \
		    >>'${STAGING_PARENT}/pkg/${PKG_NAME}'; \
	done
endif
	touch $@

${_IPKGS_COOKIE}:
	@clean=0; \
	for f in ${ALL_IPKGS}; do \
		[[ -e $$f ]] && clean=1; \
	done; \
	[[ $$clean = 0 ]] || ${MAKE} clean
	exec ${MAKE} package

package: ${ALL_IPKGS}
	@cd ${WRKDIR}/fake-${CPU_ARCH} || exit 1; \
	y=; sp=; for x in ${ALL_IDIRS}; do \
		y="$$y$$sp$${x#$(WRKDIR)/fake-${CPU_ARCH}/}"; \
		sp=' '; \
	done; ls=; ln=; x=1; [[ -z $$y ]] || \
	    md5sum $$(find $$y -type f) | sed -e "s/*//" | \
	    while read sum name; do \
		inode=$$(ls -i "$$name"); \
		echo "$$sum $${inode%% *} $$name"; \
	    done | sort | while read sum inode name; do \
		if [[ $$sum = $$ls ]]; then \
			[[ $$li = $$inode ]] && continue; \
			case $$x in \
			1)	echo 'WARNING: duplicate files found in' \
				    'package "${PKG_NAME}"! Fix them.' >&2; \
				echo -n "> $$ln "; \
				;; \
			2)	echo -n "> $$ln "; \
				;; \
			3)	echo -n ' '; \
				;; \
			esac; \
			echo -n "$$name"; \
			x=3; \
		else \
			case $$x in \
			3)	echo; \
				x=2; \
				;; \
			esac; \
		fi; \
		ls=$$sum; \
		ln=$$name; \
		li=$$inode; \
	done
	touch ${_IPKGS_COOKIE}

clean-targets: clean-dev-generic

clean-dev-generic:
ifeq (,$(filter noremove,${PKG_OPTS}))
	@if test -s '${STAGING_PARENT}/pkg/${PKG_NAME}'; then \
		cd '${STAGING_DIR}'; \
		while read fn; do \
			rm -f "$$fn"; \
		done <'${STAGING_PARENT}/pkg/${PKG_NAME}'; \
	fi
endif
	@rm -f '${STAGING_PARENT}/pkg/${PKG_NAME}'
