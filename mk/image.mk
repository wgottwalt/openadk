# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

# relative paths, like 'mksh' or '../usr/bin/foosh'
ifeq (${ADK_BINSH_ASH},y)
BINSH:=ash
else ifeq (${ADK_BINSH_BASH},y)
BINSH:=bash
else ifeq (${ADK_BINSH_MKSH},y)
BINSH:=mksh
else ifeq (${ADK_BINSH_ZSH},y)
BINSH:=zsh
else
$(error No /bin/sh configured!)
endif

# absolute paths
ifeq (${ADK_ROOTSH_ASH},y)
ROOTSH:=/bin/ash
else ifeq (${ADK_ROOTSH_BASH},y)
ROOTSH:=/bin/bash
else ifeq (${ADK_ROOTSH_MKSH},y)
ROOTSH:=/bin/mksh
else ifeq (${ADK_ROOTSH_TCSH},y)
ROOTSH:=/usr/bin/tcsh
else ifeq (${ADK_ROOTSH_ZSH},y)
ROOTSH:=/bin/zsh
else
$(error No login shell configured!)
endif

imageprepare: image-prepare-post extra-install

# if an extra directory exist in TOPDIR, copy all content over the 
# root directory, do the same if make extra=/dir/to/extra is used
extra-install:
	@if [ -d $(TOPDIR)/extra ];then $(CP) $(TOPDIR)/extra/* ${TARGET_DIR};fi
	@if [ ! -z $(extra) ];then $(CP) $(extra)/* ${TARGET_DIR};fi

image-prepare-post:
	rng=/dev/arandom; test -e $$rng || rng=/dev/urandom; \
	    dd if=$$rng bs=512 count=1 >>${TARGET_DIR}/etc/.rnd 2>/dev/null; \
	    chmod 600 ${TARGET_DIR}/etc/.rnd
	chmod 4511 ${TARGET_DIR}/bin/busybox
	chmod 1777 ${TARGET_DIR}/tmp
	@if [ -d ${TARGET_DIR}/usr/share/fonts/X11 ];then \
		for i in $$(ls ${TARGET_DIR}/usr/share/fonts/X11/);do \
			mkfontdir ${TARGET_DIR}/usr/share/fonts/X11/$${i}; \
		done; \
	fi
	sed -i '/^root:/s!:/bin/sh$$!:${ROOTSH}!' ${TARGET_DIR}/etc/passwd
	-rm -f ${TARGET_DIR}/bin/sh
	ln -sf ${BINSH} ${TARGET_DIR}/bin/sh

KERNEL_PKGDIR:=$(LINUX_BUILD_DIR)/kernel-pkg
KERNEL_PKG:=$(PACKAGE_DIR)/kernel_$(KERNEL_VERSION)_$(CPU_ARCH).$(PKG_SUFFIX)

kernel-package: $(KERNEL)
	$(TRACE) target/$(ADK_TARGET_ARCH)-create-kernel-package
	rm -rf $(KERNEL_PKGDIR)
	@mkdir -p $(KERNEL_PKGDIR)/boot
	cp $(KERNEL) $(KERNEL_PKGDIR)/boot/kernel
	@${BASH} ${SCRIPT_DIR}/make-ipkg-dir.sh ${KERNEL_PKGDIR} \
	    ../linux/kernel.control ${KERNEL_VERSION} ${CPU_ARCH}
	$(PKG_BUILD) $(KERNEL_PKGDIR) $(PACKAGE_DIR) $(MAKE_TRACE)
	$(TRACE) target/$(ADK_TARGET_ARCH)-install-kernel-package
	$(PKG_INSTALL) $(KERNEL_PKG) $(MAKE_TRACE)

TARGET_KERNEL=		${ADK_TARGET_SYSTEM}-${ADK_TARGET_ARCH}-${ADK_TARGET_FS}-kernel
INITRAMFS=		${ADK_TARGET_SYSTEM}-${ADK_TARGET_ARCH}-${ADK_TARGET_LIBC}-${ADK_TARGET_FS}
ROOTFSSQUASHFS=		${ADK_TARGET_SYSTEM}-${ADK_TARGET_ARCH}-${ADK_TARGET_LIBC}-${ADK_TARGET_FS}.img
ROOTFSTARBALL=		${ADK_TARGET_SYSTEM}-${ADK_TARGET_ARCH}-${ADK_TARGET_LIBC}-${ADK_TARGET_FS}+kernel.tar.gz
ROOTFSUSERTARBALL=	${ADK_TARGET_SYSTEM}-${ADK_TARGET_ARCH}-${ADK_TARGET_LIBC}-${ADK_TARGET_FS}.tar.gz
INITRAMFS_PIGGYBACK=	${ADK_TARGET_SYSTEM}-${ADK_TARGET_ARCH}-${ADK_TARGET_LIBC}-${ADK_TARGET_FS}.cpio

${BIN_DIR}/${ROOTFSTARBALL}: ${TARGET_DIR} kernel-package
	cd ${TARGET_DIR}; find . | sed -n '/^\.\//s///p' | \
		sed "s#\(.*\)#:0:0::::::\1#" | sort | \
		${TOOLS_DIR}/cpio -o -Hustar -P | gzip -n9 >$@

${BIN_DIR}/${ROOTFSUSERTARBALL}: ${TARGET_DIR}
	cd ${TARGET_DIR}; find . | grep -v ./boot/ | sed -n '/^\.\//s///p' | \
		sed "s#\(.*\)#:0:0::::::\1#" | sort | \
		${TOOLS_DIR}/cpio -o -Hustar -P | gzip -n9 >$@

${BIN_DIR}/${INITRAMFS}: ${TARGET_DIR}
	cd ${TARGET_DIR}; find . | sed -n '/^\.\//s///p' | \
		sed "s#\(.*\)#:0:0::::::\1#" | sort | \
	    ${TOOLS_DIR}/cpio -o -C512 -Hnewc -P | \
		lzma -9 >$@ 2>/dev/null

${BUILD_DIR}/${INITRAMFS_PIGGYBACK}: ${TARGET_DIR}
	$(SED) 's#^CONFIG_INITRAMFS_SOURCE.*#CONFIG_INITRAMFS_SOURCE="${BUILD_DIR}/${INITRAMFS_PIGGYBACK}"#' \
		$(LINUX_DIR)/.config
	cd ${TARGET_DIR}; find . | sed -n '/^\.\//s///p' | \
		sed "s#\(.*\)#:0:0::::::\1#" | sort | \
	    ${TOOLS_DIR}/cpio -o -C512 -Hnewc -P >$@ 2>/dev/null

${BIN_DIR}/${ROOTFSSQUASHFS}: ${TARGET_DIR}
	${STAGING_HOST_DIR}/bin/mksquashfs ${TARGET_DIR} \
		${BUILD_DIR}/root.squashfs \
		-nopad -noappend -root-owned $(MAKE_TRACE)
	cat ${BUILD_DIR}/${TARGET_KERNEL} ${BUILD_DIR}/root.squashfs > \
		${BUILD_DIR}/${ROOTFSSQUASHFS}

createinitramfs:
	@-rm $(LINUX_DIR)/usr/initramfs_data.cpio* $(MAKE_TRACE)
	echo N | \
	$(MAKE) -C $(LINUX_DIR) V=1 CROSS_COMPILE="$(TARGET_CROSS)" \
		ARCH=$(ARCH) CC="$(TARGET_CC)" oldconfig $(MAKE_TRACE) 
	$(MAKE) -C $(LINUX_DIR) V=1 CROSS_COMPILE="$(TARGET_CROSS)" \
		ARCH=$(ARCH) CC="$(TARGET_CC)" $(MAKE_TRACE)

imageclean:
	rm -f $(BIN_DIR)/$(ADK_TARGET_SYSTEM)-* ${BUILD_DIR}/$(ADK_TARGET_SYSTEM)-*
