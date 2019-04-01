#!/bin/bash

# *deprecated* for latex server-side compile
# alias vim='vim --servername viserver0'             # use improved vi editor

source ~/configurations/hosts.conf

CONDA_PATH=$HOME/software/anaconda3
if [ -d $CONDA_PATH ]; then
    export PATH=$CONDA_PATH/bin:$PATH
    python --version
fi

export MANPATH=/home/lifen/software/texlive17/texmf-dist/doc/man:$MANPATH
export INFOPATH=/home/lifen/software/texlive17/texmf-dist/doc/info:$INFOPATH
export PATH=/home/lifen/software/texlive17/bin/x86_64-linux:/home/lifen/software/tau/x86_64/bin:$PATH
