set(LLVM_PREFIX "${CMAKE_BINARY_DIR}/external/llvmproj")
#set(EP_BASE "${CMAKE_BINARY_DIR}/external/")

#ExternalProject_Add(llvmproj
  #PREFIX ${LLVM_PREFIX}
  #URL "https://github.com/llvm/llvm-project/releases/download/llvmorg-8.0.1/llvm-8.0.1.src.tar.xz"
  #UPDATE_COMMAND ""
  #INSTALL_DIR ${LLVM_PREFIX}/install
  #CMAKE_ARGS -DLLVM_ENABLE_PROJECTS=clang -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=on -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
  #LOG_DOWNLOAD 1
  #LOG_INSTALL 1
  #)


#set(clangtools_PREFIX "${CMAKE_BINARY_DIR}/external/clangtools")
#ExternalProject_Add(clangtools
  #PREFIX ${clangtools_PREFIX}
  #URL "https://github.com/llvm/llvm-project/releases/download/llvmorg-8.0.1/clang-tools-extra-8.0.1.src.tar.xz"
  #UPDATE_COMMAND ""
  #INSTALL_DIR ${clangtools_PREFIX}/install
  #CMAKE_ARGS  -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
  #LOG_DOWNLOAD 1
  #LOG_INSTALL 1
  #)


if(BUILD_VIM)
set(NCURSES_PREFIX "${CMAKE_BINARY_DIR}/external/ncurses")

ExternalProject_Add(ncurses
  PREFIX ${NCURSES_PREFIX}
  URL "ftp://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz"
  UPDATE_COMMAND ""
  INSTALL_DIR ${NCURSES_PREFIX}/install
  CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=<INSTALL_DIR>
  LOG_DOWNLOAD 1
  LOG_INSTALL 1
  )

set(VIM_PREFIX "${CMAKE_BINARY_DIR}/external/vim")
ExternalProject_Add(vim
  PREFIX ${VIM_PREFIX}
  GIT_REPOSITORY "https://github.com/vim/vim.git"
  GIT_TAG "v8.1.2113"
  UPDATE_COMMAND ""
  BINARY_DIR ${VIM_PREFIX}/src/vim/src
  INSTALL_DIR ${VIM_PREFIX}/install
  CONFIGURE_COMMAND LDFLAGS=-L${NCURSES_PREFIX}/install/lib ./configure --with-features=huge --enable-multibyte --enable-pythoninterp=dynamic --enable-python3interp=dynamic --enable-luainterp=yes --enable-cscope --prefix=<INSTALL_DIR>
  LOG_DOWNLOAD 2
  LOG_INSTALL 1
  )

add_dependencies(vim ncurses)

endif()
