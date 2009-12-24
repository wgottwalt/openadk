# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.
# must work with both BSD and GNU make

${TOPDIR}/.cfg/ADK_HAVE_DOT_CONFIG: ${TOPDIR}/.config \
    ${TOPDIR}/mk/split-cfg.mk ${TOPDIR}/scripts/split-cfg.sh
	mksh ${TOPDIR}/scripts/split-cfg.sh '${TOPDIR}'
