cmake_minimum_required(VERSION 3.5)

include(ExternalProject)

option(BUILD_LLVM "build clang tools" off)
option(BUILD_VIM "build vim8.1" off)

set(LLVM_PREFIX "${CMAKE_BINARY_DIR}/external/llvmproj")

ExternalProject_Add(llvmproj
  PREFIX ${LLVM_PREFIX}
  URL "https://github.com/llvm/llvm-project/releases/download/llvmorg-8.0.1/llvm-8.0.1.src.tar.xz"
  UPDATE_COMMAND ""
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
  CMAKE_ARGS -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=on -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
  LOG_DOWNLOAD 1
  LOG_INSTALL 1
  )


set(NCURSES_PREFIX "${CMAKE_BINARY_DIR}/external/ncurses")
ExternalProject_Add(ncurses
  PREFIX ${NCURSES_PREFIX}
  URL "ftp://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz"
  UPDATE_COMMAND ""
  BUILD_IN_SOURCE True
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
  CONFIGURE_COMMAND ${NCURSES_PREFIX}/src/ncurses/configure --prefix=${CMAKE_INSTALL_PREFIX}
  LOG_DOWNLOAD 1
  LOG_INSTALL 1
  )

#set(VIM_PREFIX "${CMAKE_BINARY_DIR}/external/vim")
#ExternalProject_Add(vim
  #PREFIX ${VIM_PREFIX}
  #GIT_REPOSITORY "https://github.com/vim/vim.git"
  #GIT_TAG "v8.1.2113"
  #UPDATE_COMMAND ""
  #BUILD_IN_SOURCE True
  #INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
  #CONFIGURE_COMMAND ${VIM_PREFIX}/src/vim/src/configure --with-features=huge --enable-multibyte --enable-pythoninterp=dynamic --enable-python3interp=dynamic --enable-luainterp=yes --enable-cscope --prefix=$${CMAKE_INSTALL_PREFIX}
  #LOG_DOWNLOAD 1
  #LOG_INSTALL 1
  #)
