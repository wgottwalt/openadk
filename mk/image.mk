# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

imageprepare: kernel-install image-prepare-post extra-install

# if an extra directory exist in TOPDIR, copy all content over the 
# root directory, do the same if make extra=/dir/to/extra is used
extra-install:
	@if [ -d $(TOPDIR)/extra ];then $(CP) $(TOPDIR)/extra/* ${TARGET_DIR};fi
	@if [ ! -z $(extra) ];then $(CP) $(extra)/* ${TARGET_DIR};fi

image-prepare-post:
	rng=/dev/arandom; test -e $$rng || rng=/dev/urandom; \
	    dd if=$$rng bs=512 count=1 >>${TARGET_DIR}/etc/.rnd 2>/dev/null; \
	    chmod 600 ${TARGET_DIR}/etc/.rnd
	# Sanity checks
	@cd ${TARGET_DIR}; ls=; ln=; li=; x=1; md5sum $$(find . -type f) | \
	    sed -e "s/*//" | \
	    while read sum name; do \
		inode=$$(ls -i "$$name"); \
		echo "$$sum $${inode%% *} $$name"; \
	    done | sort | while read sum inode name; do \
		if [[ $$sum = $$ls ]]; then \
			[[ $$li = $$inode ]] && continue; \
			case $$x in \
			1)	echo 'WARNING: duplicate files found' \
				    'in filesystem! Please fix them.' >&2; \
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
	chmod 4511 ${TARGET_DIR}/bin/busybox
	chmod 1777 ${TARGET_DIR}/tmp

INITRAMFS=	${ADK_TARGET}-${ARCH}-${FS}
ROOTFSSQUASHFS=	${ADK_TARGET}-${ARCH}-${FS}.img
ROOTFSTARBALL=	${ADK_TARGET}-${ARCH}-${FS}.tar.gz
INITRAMFS_PIGGYBACK=	${ADK_TARGET}-${ARCH}-${FS}.cpio

${BIN_DIR}/${ROOTFSTARBALL}: ${TARGET_DIR}
	cd ${TARGET_DIR}; tar -cf - --owner=0 --group=0 . | gzip -n9 >$@

${BIN_DIR}/${INITRAMFS}: ${TARGET_DIR}
	cd ${TARGET_DIR}; find . | sed -n '/^\.\//s///p' | sort | \
	    cpio -R 0:0 --quiet -oC512 -Mdist -Hnewc | ${ADK_COMPRESSION_TOOL} >$@

${BUILD_DIR}/${INITRAMFS_PIGGYBACK}: ${TARGET_DIR}
	cd ${TARGET_DIR}; find . | sed -n '/^\.\//s///p' | sort | \
	    cpio -R 0:0 --quiet -oC512 -Mdist -Hnewc >$@

${BIN_DIR}/${ROOTFSSQUASHFS}: ${TARGET_DIR}
	PATH='${TARGET_PATH}' \
	mksquashfs ${TARGET_DIR} ${BUILD_DIR}/root.squashfs \
		-nopad -noappend -root-owned $(MAKE_TRACE)
	cat ${BIN_DIR}/${ADK_TARGET}-${ARCH}-kernel ${BUILD_DIR}/root.squashfs > \
		${BUILD_DIR}/${ROOTFSSQUASHFS}
	# padding of images is required
	dd if=${BUILD_DIR}/${ROOTFSSQUASHFS} of=${BIN_DIR}/${ROOTFSSQUASHFS} \
		bs=4063232 conv=sync $(MAKE_TRACE)

imageclean:
	rm -f $(BIN_DIR)/$(ADK_TARGET)-* ${BUILD_DIR}/$(ADK_TARGET)-*
