#!/bin/sh
rm -rf host_x86_64-linux-gnu target_sparc_glibc
rm -rf gcc-*
mkdir host_x86_64-linux-gnu
mkdir target_sparc_glibc

tar xvf binutils-2.24.tar.bz2
cd binutils-2.24
./configure \
		--prefix=/home/wbx/smoke/host_x86_64-linux-gnu \
		--target=sparc-openadk-linux-gnu \
		--with-sysroot=/home/wbx/smoke/target_sparc_glibc \
		--disable-dependency-tracking \
		--disable-libtool-lock \
		--disable-nls \
		--disable-werror \
		--disable-plugins \
		--disable-libssp --disable-multilib
make -j4 all
make install
cd ..

tar xvf gmp-5.1.3.tar.xz
cd gmp-5.1.3
cp configfsf.guess config.guess
PATH="/home/wbx/smoke/host_x86_64-linux-gnu/usr/bin:$PATH" \
		./configure \
		--prefix=/home/wbx/smoke/host_x86_64-linux-gnu \
		--with-pic \
		--disable-shared \
		--enable-static
make -j4 all
make install
cd ..

tar xvf mpfr-3.1.2.tar.xz
cd mpfr-3.1.2
./configure \
		--prefix=/home/wbx/smoke/host_x86_64-linux-gnu \
		--with-gmp-build=/home/wbx/smoke/gmp-5.1.3 \
		--disable-shared \
		--enable-static
make -j4 all
make install
cd ..

tar xvf mpc-0.8.2.tar.gz
cd mpc-0.8.2
./configure \
		--prefix=/home/wbx/smoke/host_x86_64-linux-gnu \
		--with-gmp=/home/wbx/smoke/host_x86_64-linux-gnu \
		--disable-shared \
		--enable-static
make -j4 all
make install
make install
cd ..

tar xvf libelf-0.8.13.tar.gz
cd libelf-0.8.13
./configure \
		--prefix=/home/wbx/smoke/host_x86_64-linux-gnu \
		--disable-nls \
		--disable-shared \
		--enable-static
make -j4 all
make install
cd ..

rm -rf host_x86_64-linux-gnu/sparc-openadk-linux-gnu/{lib,sys-include}
cd host_x86_64-linux-gnu/sparc-openadk-linux-gnu/
ln -sf ../../target_sparc_glibc/usr/include sys-include
ln -sf ../../target_sparc_glibc/lib lib
cd -

mkdir gcc-minimal
cd gcc-minimal
CFLAGS="-O0 -g0" \
CXXFLAGS="-O0 -g0" \
PATH="/home/wbx/smoke/host_x86_64-linux-gnu/bin:$PATH" \
../gcc/configure \
	--prefix=/home/wbx/smoke/host_x86_64-linux-gnu --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=sparc-openadk-linux-gnu --with-gmp=/home/wbx/smoke/host_x86_64-linux-gnu --with-mpfr=/home/wbx/smoke/host_x86_64-linux-gnu --with-libelf=/home/wbx/smoke/host_x86_64-linux-gnu --disable-__cxa_atexit --with-gnu-ld --with-gnu-as --enable-tls --disable-libsanitizer --disable-libitm --disable-libmudflap --disable-libgomp --disable-decimal-float --disable-libstdcxx-pch --disable-ppl-version-check --disable-cloog-version-check --without-system-zlib --without-ppl --without-cloog --without-isl --disable-nls --enable-target-optspace \
			--enable-languages=c \
			--disable-multilib \
			--disable-lto \
			--disable-libssp \
			--disable-shared \
			--without-headers
PATH="/home/wbx/smoke/host_x86_64-linux-gnu/bin:$PATH" make -j4 all-gcc
if [ $? -ne 0 ];then
	echo failed
	exit
fi
PATH="/home/wbx/smoke/host_x86_64-linux-gnu/bin:$PATH" make install-gcc
if [ $? -ne 0 ];then
	echo failed
	exit
fi
cd ..

cd linux-3.13.6
make V=1 ARCH=sparc CROSS_COMPILE="/home/wbx/smoke/host_x86_64-linux-gnu/bin/sparc-openadk-linux-gnu-" CC="/home/wbx/smoke/host_x86_64-linux-gnu/bin/sparc-openadk-linux-gnu-gcc" HOSTCC="cc" CONFIG_SHELL='/bin/bash' HOSTCFLAGS='-O2 -Wall' INSTALL_HDR_PATH=/home/wbx/smoke/target_sparc_glibc/usr headers_install
cd ..

cd glibc-2.19-header
libc_cv_forced_unwind=yes \
libc_cv_cc_with_libunwind=yes \
libc_cv_c_cleanup=yes \
libc_cv_gnu99_inline=yes \
libc_cv_initfini_array=yes \
PATH="/home/wbx/smoke/host_x86_64-linux-gnu/bin:$PATH" ../glibc-2.19/configure \
	--prefix=/home/wbx/smoke/target_sparc_glibc/usr \
	--with-sysroot=/home/wbx/smoke/target_sparc_glibc \
	--build=x86_64-linux-gnu --host=sparc-openadk-linux-gnu --with-headers=/home/wbx/smoke/target_sparc_glibc/usr/include --disable-sanity-checks --disable-nls --without-cvs --disable-profile --disable-debug --without-gd --disable-nscd --with-__thread --with-tls --enable-kernel="2.6.32" --enable-add-ons
PATH="/home/wbx/smoke/host_x86_64-linux-gnu/bin:$PATH" make cross-compiling=yes PARALLELMFLAGS="-j1" install-headers
if [ $? -ne 0 ];then
	echo failed
	exit
fi
cd ..
touch target_sparc_glibc/usr/include/gnu/stubs.h

mkdir gcc-initial
cd gcc-initial
CFLAGS="-O0 -g0" \
CXXFLAGS="-O0 -g0" \
PATH="/home/wbx/smoke/host_x86_64-linux-gnu/bin:$PATH" ../gcc/configure \
	--prefix=/home/wbx/smoke/host_x86_64-linux-gnu --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=sparc-openadk-linux-gnu --with-gmp=/home/wbx/smoke/host_x86_64-linux-gnu --with-mpfr=/home/wbx/smoke/host_x86_64-linux-gnu --with-libelf=/home/wbx/smoke/host_x86_64-linux-gnu --disable-__cxa_atexit --with-gnu-ld --with-gnu-as --enable-tls --disable-libsanitizer --disable-libitm --disable-libmudflap --disable-libgomp --disable-decimal-float --disable-libstdcxx-pch --disable-ppl-version-check --disable-cloog-version-check --without-system-zlib --without-ppl --without-cloog --without-isl --disable-nls --enable-target-optspace \
			 --disable-biarch --disable-multilib --enable-libssp --enable-lto \
			--enable-languages=c \
			--disable-shared \
			--disable-threads \
			--with-sysroot=/home/wbx/smoke/target_sparc_glibc
PATH="/home/wbx/smoke/host_x86_64-linux-gnu/bin:$PATH" make all-gcc
if [ $? -ne 0 ];then
	echo failed
	exit
fi
PATH="/home/wbx/smoke/host_x86_64-linux-gnu/bin:$PATH" make all-target-libgcc
if [ $? -ne 0 ];then
	echo failed
	exit
fi
PATH="/home/wbx/smoke/host_x86_64-linux-gnu/bin:$PATH" make install-gcc install-target-libgcc
if [ $? -ne 0 ];then
	echo failed
	exit
fi
cd ..

cd glibc-2.19-final
PATH="/home/wbx/smoke/host_x86_64-linux-gnu/bin:$PATH" SHELL='/bin/bash' BUILD_CC=cc CFLAGS="-mcpu=v8 -fwrapv -fno-ident -fomit-frame-pointer -O2 -pipe -fno-unwind-tables -fno-asynchronous-unwind-tables -g3" CC="/home/wbx/smoke/host_x86_64-linux-gnu/bin/sparc-openadk-linux-gnu-gcc" CXX="/home/wbx/smoke/host_x86_64-linux-gnu/bin/sparc-openadk-linux-gnu-g++" AR="/home/wbx/smoke/host_x86_64-linux-gnu/bin/sparc-openadk-linux-gnu-ar" RANLIB="/home/wbx/smoke/host_x86_64-linux-gnu/bin/sparc-openadk-linux-gnu-ranlib" libc_cv_forced_unwind=yes libc_cv_cc_with_libunwind=yes libc_cv_c_cleanup=yes libc_cv_gnu99_inline=yes libc_cv_initfini_array=yes  \
../glibc-2.19/configure \
	--prefix=/usr \
	--enable-shared \
	--enable-stackguard-randomization \
	--build=x86_64-linux-gnu --host=sparc-openadk-linux-gnu --with-headers=/home/wbx/smoke/target_sparc_glibc/usr/include --disable-sanity-checks --disable-nls --without-cvs --disable-profile --disable-debug --without-gd --disable-nscd --with-__thread --with-tls --enable-kernel="2.6.32" --enable-add-ons 
PATH="/home/wbx/smoke/host_x86_64-linux-gnu/bin:$PATH" make all
PATH="/home/wbx/smoke/host_x86_64-linux-gnu/bin:$PATH" make install_root=/home/wbx/smoke/target_sparc_glibc install
if [ $? -ne 0 ];then
	echo failed
	exit
fi
cd ..

mkdir gcc-final
cd gcc-final
../gcc/configure \
	--prefix=/home/wbx/smoke/host_x86_64-linux-gnu --with-bugurl="http://www.openadk.org/" --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=sparc-openadk-linux-gnu --with-gmp=/home/wbx/smoke/host_x86_64-linux-gnu --with-mpfr=/home/wbx/smoke/host_x86_64-linux-gnu --with-libelf=/home/wbx/smoke/host_x86_64-linux-gnu --disable-__cxa_atexit --with-gnu-ld --with-gnu-as --enable-tls --disable-libsanitizer --disable-libitm --disable-libmudflap --disable-libgomp --disable-decimal-float --disable-libstdcxx-pch --disable-ppl-version-check --disable-cloog-version-check --without-system-zlib --without-ppl --without-cloog --without-isl --disable-nls --enable-target-optspace \
			 --disable-biarch --disable-multilib --enable-libssp --enable-lto \
			--enable-languages=c,c++ \
			--with-build-sysroot='${prefix}/../target_sparc_glibc' \
			--with-sysroot='${prefix}/../target_sparc_glibc' \
			--enable-shared
make -j4 all
if [ $? -ne 0 ];then
	echo failed
	exit
fi
make install
if [ $? -ne 0 ];then
	echo failed
	exit
fi
cd ..

cd linux-3.13.6/
cat > mini.config <<EOF
CONFIG_SPARC=y
CONFIG_SPARC32=y
CONFIG_SBUS=y
CONFIG_SBUSCHAR=y
CONFIG_PCI=y
CONFIG_PCI_SYSCALL=y
CONFIG_PCIC_PCI=y
CONFIG_OF=y
CONFIG_NET_VENDOR_AMD=y
CONFIG_SUNLANCE=y
CONFIG_SERIAL_CONSOLE=y
CONFIG_SERIAL_SUNCORE=y
CONFIG_SERIAL_SUNZILOG=y
CONFIG_SERIAL_SUNZILOG_CONSOLE=y
EOF

PATH="/home/wbx/smoke/host_x86_64-linux-gnu/bin:$PATH" make V=1 ARCH=sparc CROSS_COMPILE="/home/wbx/smoke/host_x86_64-linux-gnu/bin/sparc-openadk-linux-gnu-" CC="/home/wbx/smoke/host_x86_64-linux-gnu/bin/sparc-openadk-linux-gnu-gcc" HOSTCC="cc" CONFIG_SHELL='/bin/bash' HOSTCFLAGS='-O2 -Wall' KCONFIG_ALLCONFIG=mini.config allnoconfig 
PATH="/home/wbx/smoke/host_x86_64-linux-gnu/bin:$PATH" make V=1 ARCH=sparc CROSS_COMPILE="/home/wbx/smoke/host_x86_64-linux-gnu/bin/sparc-openadk-linux-gnu-" CC="/home/wbx/smoke/host_x86_64-linux-gnu/bin/sparc-openadk-linux-gnu-gcc" HOSTCC="cc" CONFIG_SHELL='/bin/bash' HOSTCFLAGS='-O2 -Wall' -j4 zImage
