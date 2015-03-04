# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

# operating system quirks
ifeq (${OStype},Darwin)
HOST_CC:=clang -fbracket-depth=1024
HOST_CXX:=clang++ -fbracket-depth=1024
else
HOST_CC:=${CC}
HOST_CXX:=${CXX}
endif
