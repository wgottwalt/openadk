# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

PKG_NAME:=		llvm
PKG_VERSION:=		3.8.0
PKG_HASH:=		555b028e9ee0f6445ff8f949ea10e9cd8be0d084840e21fbbe1d31d51fc06e46
PKG_SITES:=		http://llvm.org/releases/3.8.0/
PKG_RELEASE:=		1
DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.src.tar.xz
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}.src
