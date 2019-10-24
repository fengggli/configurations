set(GNU_PREFIX "${CMAKE_BINARY_DIR}/external/gnu")
set(flags ${CMAKE_C_FLAGS_RELEASE})

# https://linuxhostsupport.com/blog/how-to-install-gcc-on-centos-7/
ExternalProject_Add(gnu
  PREFIX ${GNU_PREFIX}
  URL "http://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-7.3.0/gcc-7.3.0.tar.gz"
  UPDATE_COMMAND ""
  SOURCE_DIR ${GNU_PREFIX}/src/gnu/gcc-7.3.0
  INSTALL_DIR ${GNU_PREFIX}/install
  CONFIGURE_COMMAND cd <SOURCE_DIR> && contrib/download_prerequisites COMMAND cd <BINARY_DIR> && env "CFLAGS=${flags}" <SOURCE_DIR>/configure --disable-multilib --enable-languages=c,c++ --prefix=<INSTALL_DIR>
  LOG_DOWNLOAD 1
  LOG_INSTALL 1
  )

set(LLVM_PREFIX "${CMAKE_BINARY_DIR}/external/llvmproj")
#http://llvm.org/docs/GettingStarted.html#checkout
ExternalProject_Add(llvmproj
  PREFIX ${LLVM_PREFIX}
  GIT_REPOSITORY "https://github.com/llvm/llvm-project"
  GIT_TAG "llvmorg-8.0.1"
  UPDATE_COMMAND ""
  SOURCE_DIR ${LLVM_PREFIX}/src/llvmproj/llvm/llvm
  INSTALL_DIR ${LLVM_PREFIX}/install
  CMAKE_ARGS -DLLVM_ENABLE_PROJECTS=clang -DCMAKE_CXX_LINK_FLAGS=-Wl,-rpath,${GNU_PREFIX}/install/lib64 -L${GNU_PREFIX}/install/lib64  -DCMAKE_C_COMPILER=${GNU_PREFIX}/install/bin/gcc -DCMAKE_CXX_COMPILER=${GNU_PREFIX}/install/bin/g++ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
  LOG_DOWNLOAD 1
  LOG_INSTALL 1
  )

add_dependencies(llvmproj gnu)

if(BUILD_VIM)
set(NCURSES_PREFIX "${CMAKE_BINARY_DIR}/external/ncurses")

ExternalProject_Add(ncurses
  PREFIX ${NCURSES_PREFIX}
  URL "ftp://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz"
  UPDATE_COMMAND ""
  INSTALL_DIR ${NCURSES_PREFIX}/install
  CONFIGURE_COMMAND env "CFLAGS=${flags}" <SOURCE_DIR>/configure --prefix=<INSTALL_DIR>
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
  CONFIGURE_COMMAND  env "LDFLAGS=-L${NCURSES_PREFIX}/install/lib" "CFLAGS=${flags}" ./configure --with-features=huge --enable-multibyte --enable-pythoninterp=dynamic --enable-python3interp=dynamic --enable-luainterp=yes --enable-cscope --prefix=<INSTALL_DIR>
  LOG_DOWNLOAD 2
  LOG_INSTALL 1
  )

add_dependencies(vim ncurses)

endif()
