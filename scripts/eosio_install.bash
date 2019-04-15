#!/usr/bin/env bash
set -eo pipefail
##########################################################################
# This is the EOSIO automated install script for Linux and Mac OS.
# This file was downloaded from https://github.com/EOSIO/eos
#
# Copyright (c) 2017, Respective Authors all rights reserved.
#
# After June 1, 2018 this software is available under the following terms:
# 
# The MIT License
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
# https://github.com/EOSIO/eos/blob/master/LICENSE.txt
##########################################################################

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="${SCRIPT_DIR}/.."
BUILD_DIR="${REPO_ROOT}/build"

# Load bash script helper functions
. ./scripts/lib/helpers.bash

# Load eosio specific helper functions
. ./scripts/lib/eosio.bash

OPT_LOCATION=$HOME/opt
BIN_LOCATION=$HOME/bin
LIB_LOCATION=$HOME/lib
mkdir -p $LIB_LOCATION

CMAKE_BUILD_TYPE=Release
TIME_BEGIN=$( date -u +%s )
INSTALL_PREFIX=$OPT_LOCATION/eosio
VERSION=1.2

txtbld=$(tput bold)
bldred=${txtbld}$(tput setaf 1)
txtrst=$(tput sgr0)

[[ ! -d $BUILD_DIR ]] && printf "${COLOR_RED}Please run ./eosio_build.sh first!${COLOR_NC}" && exit 1

pushd "${BUILD_DIR}" 1>/dev/null
execute make install
popd &> /dev/null 

printf "\n${COLOR_RED}      ___           ___           ___                       ___\n"
printf "     /  /\\         /  /\\         /  /\\        ___          /  /\\ \n"
printf "    /  /:/_       /  /::\\       /  /:/_      /  /\\        /  /::\\ \n"
printf "   /  /:/ /\\     /  /:/\\:\\     /  /:/ /\\    /  /:/       /  /:/\\:\\ \n"
printf "  /  /:/ /:/_   /  /:/  \\:\\   /  /:/ /::\\  /__/::\\      /  /:/  \\:\\ \n"
printf " /__/:/ /:/ /\\ /__/:/ \\__\\:\\ /__/:/ /:/\\:\\ \\__\\/\\:\\__  /__/:/ \\__\\:\\ \n"
printf " \\  \\:\\/:/ /:/ \\  \\:\\ /  /:/ \\  \\:\\/:/~/:/    \\  \\:\\/\\ \\  \\:\\ /  /:/ \n"
printf "  \\  \\::/ /:/   \\  \\:\\  /:/   \\  \\::/ /:/      \\__\\::/  \\  \\:\\  /:/ \n"
printf "   \\  \\:\\/:/     \\  \\:\\/:/     \\__\\/ /:/       /__/:/    \\  \\:\\/:/ \n"
printf "    \\  \\::/       \\  \\::/        /__/:/        \\__\\/      \\  \\::/ \n"
printf "     \\__\\/         \\__\\/         \\__\\/                     \\__\\/ \n\n${COLOR_NC}"

printf "==============================================================================================\\n"
printf "${COLOR_GREEN}EOSIO has been installed into ${OPT_LOCATION}/eosio/bin!${COLOR_NC}"
printf "\\n${COLOR_YELLOW}Uninstall with: ./scripts/eosio_uninstall.bash${COLOR_NC}\\n"
printf "==============================================================================================\\n\\n"
resources
