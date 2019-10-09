help([[essential tools in stalled in software]])
whatis("Name: devtools")
whatis("Version: 1")
family("devtools")

local base_dir = pathJoin( os.getenv("HOME"), "software/install")
local brew_dir = pathJoin( os.getenv("HOME"), "configurations/build/external/vim/install")

prepend_path("PATH", pathJoin( base_dir , "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin( base_dir , "lib"))

prepend_path("PATH", pathJoin( brew_dir , "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin( brew_dir , "lib"))
