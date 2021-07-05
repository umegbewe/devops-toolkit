#!/bin/bash

## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREENS="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

## Script termination
exit_on_signal_SIGINT() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Interrupted." 2>&1; reset_color; }
    exit 0
}

exit_on_signal_SIGTERM() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Terminated." 2>&1; reset_color; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
    return
}
## Banner
echo "
		${GREENS} ____              ___              _____           _ _    _ _   
		${ORANGE}|  _ \  _____   __/ _ \ _ __  ___  |_   _|__   ___ | | | _(_) |_               
		${GREENS}| | | |/ _ \ \ / / | | | '_ \/ __|   | |/ _ \ / _ \| | |/ / | __|            
		${ORANGE}| |_| |  __/\ V /| |_| | |_) \__ \   | | (_) | (_) | |   <| | |_ 
		${GREENS}|____/ \___| \_/  \___/| .__/|___/   |_|\___/ \___/|_|_|\_\_|\__|   
		${ORANGE}                       |_|                              
		${ORANGE}                ${RED}Version : 1.0

		${GREEN}[${WHITE}-${GREENS}]${GREENS} Tool Created by ${RED}mosthated ${GREENS}(umegbewe nwebedu)${WHITE}
"
update() {
if [[ `command -v apt-get` ]]; then
echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Running sudo apt-get update..."
	sudo apt-get update
elif [[ `command -v yum` ]]; then
echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Running sudo yum update..."
	sudo yum update
elif [[ `command -v pacman` ]]; then
echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Running sudo pacman update..."
	sudo pacman -Syy
fi
}



update


