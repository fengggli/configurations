help([[essential tools in stalled in software]])
whatis("Name: devtools")
whatis("Version: 1")
family("devtools")

local base_dir = pathJoin( os.getenv("HOME"), "software/install")

prepend_path("PATH", pathJoin( base_dir , "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin( base_dir , "lib"))

local vim_dir = pathJoin( os.getenv("HOME"), "configurations/build/external/vim/install")
prepend_path("PATH", pathJoin( vim_dir , "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin( vim_dir , "lib"))

local gnu_dir = pathJoin( os.getenv("HOME"), "configurations/build/external/gnu/install")
prepend_path("PATH", pathJoin( gnu_dir , "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin( gnu_dir , "lib64"))
setenv("CC","gcc")
setenv("CXX","g++")

local llvmproj_dir = pathJoin( os.getenv("HOME"), "configurations/build/external/llvmproj/install")
prepend_path("PATH", pathJoin( llvmproj_dir , "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin( llvmproj_dir , "lib"))


