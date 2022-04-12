help([[cmake building tool]])
whatis("Name: cmake")
whatis("Version: 3.20")
family("cmake")

local base_dir = "/ocean/projects/asc170035p/fli5/software/CMake/"

prepend_path("PATH", pathJoin( base_dir , "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin( base_dir , "lib"))
