#!/usr/bin/env bash

# First created: 
# Last modified: 2018 Jan 26

# Author: Feng Li
# email: fengggli@yahoo.com
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

USER_FONT_DIR=${HOME}/.local/share/fonts/
mkdir -pv ${USER_FONT_DIR}
mv PowerlineSymbols.otf ${USER_FONT_DIR}
fc-cache -vf ${USER_FONT_DIR}

FONTS_CONF=${HOME}/.config/fontconfig/conf.d/
mkdir -pv $FONTS_CONF
mv 10-powerline-symbols.conf $FONTS_CONF 
