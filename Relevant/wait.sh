#!/bin/bash

show_progress()
{
  local -r pid="${1}"
  local -r delay='0.75'
  local spinstr='\|/-'
  local temp
  while true; do
    sudo grep -i "done" /opt/$1 &> /dev/null
    if [[ "$?" -ne 0 ]]; then
      temp="${spinstr#?}"
      printf " [%c]  " "${spinstr}"
      spinstr=${temp}${spinstr%"${temp}"}
      sleep "${delay}"
      printf "\b\b\b\b\b\b"
    else
      break
    fi
  done
  printf "    \b\b\b\b"
}

printf "\033[0;32mPreparing your environment... \033[0m\n"
printf "\033[0;32mStep 1 of 7 \033[0m"
show_progress step1
printf "\033[0;32mcomplete! \033[0m\n"
printf "\033[0;32mStep 2 of 7 \033[0m"
show_progress step2
printf "\033[0;32mcomplete! \033[0m\n"
printf "\033[0;32mStep 3 of 7 \033[0m"
show_progress step3
printf "\033[0;32mcomplete! \033[0m\n"
printf "\033[0;32mStep 4 of 7 \033[0m"
show_progress step4
printf "\033[0;32mcomplete! \033[0m\n"
printf "\033[0;32mStep 5 of 7 (this step takes some time, so please be patient) \033[0m"
show_progress step5
printf "\033[0;32mcomplete! \033[0m\n"
printf "\033[0;32mcomplete! \033[0m\n"
printf "\033[0;32mStep 6 of 7 (this step also takes some time, so please be patient) \033[0m"
show_progress step6
printf "\033[0;32mcomplete! \033[0m\n"
printf "\033[0;32mStep 7 of 7 \033[0m"
show_progress step7
printf "\033[0;32mcomplete! \033[0m\n"
clear
printf "\033[0;32mYour Interactive Bash Terminal.\033[0m\n"
