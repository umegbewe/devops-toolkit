#!/bin/bash

# Copyright (c) 2021 Umegbewe Nwebedu

# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:

# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

set -euo pipefail


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



## banner 
header() {
echo "
		${GREENS} ____              ___              _____           _ _    _ _   
		${ORANGE}|  _ \  _____   __/ _ \ _ __  ___  |_   _|__   ___ | | | _(_) |_               
		${GREENS}| | | |/ _ \ \ / / | | | '_ \/ __|   | |/ _ \ / _ \| | |/ / | __|            
		${ORANGE}| |_| |  __/\ V /| |_| | |_) \__ \   | | (_) | (_) | |   <| | |_ 
		${GREENS}|____/ \___| \_/  \___/| .__/|___/   |_|\___/ \___/|_|_|\_\_|\__|   
		${ORANGE}                       |_|                              
		${ORANGE}                ${RED}Version : 1.0

		${GREEN}[${WHITE}-${GREENS}]${GREENS} Tool Created by great ${WHITE}
"
}

	
menu() {
	{ clear; header; echo; }
	cat <<- EOF
		${RED}[${WHITE}::${RED}]${ORANGE} Select a tool to install ${RED}[${WHITE}::${RED}]${ORANGE}

		${RED}[${WHITE}01${RED}]${ORANGE} Docker        ${RED}[${WHITE}08${RED}]${ORANGE} AWS Cli   	${RED}[${WHITE}15${RED}]${ORANGE} Nomad
		${RED}[${WHITE}02${RED}]${ORANGE} Vagrant       ${RED}[${WHITE}09${RED}]${ORANGE} Gcloud Cli      ${RED}[${WHITE}16${RED}]${ORANGE} Ngrok
		${RED}[${WHITE}03${RED}]${ORANGE} Ansible       ${RED}[${WHITE}10${RED}]${ORANGE} Azure Cli       ${RED}[${WHITE}17${RED}]${ORANGE} Helm
		${RED}[${WHITE}04${RED}]${ORANGE} Terraform	   ${RED}[${WHITE}11${RED}]${ORANGE} Circleci Cli    ${RED}[${WHITE}18${RED}]${ORANGE} Terragrunt
		${RED}[${WHITE}05${RED}]${ORANGE} Kubectl	   ${RED}[${WHITE}12${RED}]${ORANGE} Github Cli 	${RED}[${WHITE}19${RED}]${ORANGE} Kubeadm
		${RED}[${WHITE}06${RED}]${ORANGE} Minikube      ${RED}[${WHITE}13${RED}]${ORANGE} Packer		${RED}[${WHITE}20${RED}]${ORANGE} Kubelet
		${RED}[${WHITE}07${RED}]${ORANGE} Kind	   ${RED}[${WHITE}14${RED}]${ORANGE} Waypoint	${RED}[${WHITE}21${RED}]${ORANGE} Krew
		
		${RED}[${WHITE}q${RED}]${ORANGE} Exit

		EOF
		
	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"
		if [[ "$REPLY" == 1 || "$REPLY" == 01 ]]; then
			docker --version && echo ${RED} "Docker already installed" && sleep 2 && menu || dockerin
		elif [[ "$REPLY" == 2 || "$REPLY" == 02 ]]; then
			vagrant --version && echo ${RED} "Vagrant already installed" && sleep 2 && menu || vagrantin
		elif [[ "$REPLY" == 3 || "$REPLY" == 03 ]]; then
			ansible --version && echo ${RED} "Ansible already installed" && sleep 2 && menu || ansiblein
		elif [[ "$REPLY" == 4 || "$REPLY" == 04 ]]; then
			terraform --version && echo ${RED} "Terraform already installed" && sleep 2 && menu || terraformin
		elif [[ "$REPLY" == 5 || "$REPLY" == 05 ]]; then
			kubectl version --short && echo ${RED} "Kubectl already installed" && sleep 2 && menu || kubectlin
		elif [[ "$REPLY" == 6 || "$REPLY" == 06 ]]; then
			minikube version --short && echo ${RED} "Minikube already installed" && sleep 2 && menu || minikubein
		elif [[ "$REPLY" == 7 || "$REPLY" == 07 ]]; then
			kind --version && echo ${RED} "Kind already installed" && sleep 2 && menu || kindin
		elif [[ "$REPLY" == 8 || "$REPLY" == 08 ]]; then
			aws --version && echo ${RED} "AWS Cli already installed" && sleep 2 && menu || awsclin
		elif [[ "$REPLY" == 9 || "$REPLY" == 09 ]]; then
			gcloud --version && echo ${RED} "Gloud Cli already installed" && sleep 2 && menu || gloudsdkin
		elif [[ "$REPLY" == 10 || "$REPLY" == 010 ]]; then
			az --version && echo ${RED} "Azure Cli already installed" && sleep 2 && menu || azureclin
		elif [[ "$REPLY" == 11 || "$REPLY" == 011 ]]; then
			circleci version && echo ${RED} "CircleCI Cli already installed" && sleep 2 && menu || circleclin
		elif [[ "$REPLY" == 12 || "$REPLY" == 012 ]]; then
			gh --version && echo ${RED} "Github Cli already installed" && sleep 2 && menu || githubclin
		elif [[ "$REPLY" == 13 || "$REPLY" == 013 ]]; then
			packer --version && echo ${RED} "Packer already installed" && sleep 2 && menu || packerin
		elif [[ "$REPLY" == 14 || "$REPLY" == 014 ]]; then
			waypoint --version && echo ${RED} "Waypoint already installed" && sleep 2 && menu || waypointin
		elif [[ "$REPLY" == 15 || "$REPLY" == 015 ]]; then
			nomad --version && echo ${RED} "Nomad already installed" && sleep 2 && menu || nomadin
		elif [[ "$REPLY" == 16 || "$REPLY" == 016 ]]; then
			ngrok --version && echo ${RED} "Ngrok already installed" && sleep 2 && menu || ngrokin
		elif [[ "$REPLY" == 17 || "$REPLY" == 017 ]]; then
			helm version && echo ${RED} "Helm already installed" && sleep 2 && menu || helmin
		elif [[ "$REPLY" == 18 || "$REPLY" == 018 ]]; then
			terragrunt -v && echo ${RED} "Terragrunt already installed" && sleep 2 && menu || terragruntin
		elif [[ "$REPLY" == 19 || "$REPLY" == 019 ]]; then
			kubeadm version && echo ${RED} "Kubeadm already installed" && sleep 2 && menu || kubeadmin
		elif [[ "$REPLY" == 20 || "$REPLY" == 020 ]]; then
			kubelet version && echo ${RED} "Kubelet already installed" && sleep 2 && menu || kubeletin
		elif [[ "$REPLY" == 21 || "$REPLY" == 021 ]]; then
			kubectl krew version | sed '2q;d' && echo ${RED} "Krew already installed" && sleep 2 && menu || krewin
		elif [[ "$REPLY" == q ]]; then
			clear && exit
		else
		echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
				{ sleep 1; menu; }
		fi
}

function dockerin {
	if [[ `cat /etc/os-release | grep 'Ubuntu\|ID_LIKE=ubuntu'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Ubuntu detected installing docker.........."
	sleep 1
	sudo apt-get update && sudo apt-get install -y docker.io
	menu
	elif [[ `cat /etc/os-release | grep 'ID=debian\|ID_LIKE=debian'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Debian detected installing docker.........."
	sudo apt remove docker docker-engine docker.io && \
	sudo apt-get update && \
	sudo apt-get install apt-transport-https ca-certificates software-properties-common curl gnupg lsb-release && \
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - && \
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" && \
	sudo apt-get update && sudo apt install -y docker-ce docker-ce-cli containerd.io && echo ${RED} "Docker installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'Rhel\|ID=centos\|ID_LIKE=rhel'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum detected installing docker.........."
	sudo yum remove docker \
             	  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine && \
	sudo yum install -y yum-utils && \
	sudo yum-config-manager \
    	--add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
	sudo yum install docker-ce docker-ce-cli containerd.io && echo ${RED} "Docker installed!!!"
	sleep 3
	menu
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager" && sleep 2 && menu;
	fi
	}

function vagrantin {
	if [[ `cat /etc/os-release | grep 'Ubuntu\|ID_LIKE=ubuntu\|Debian\|ID_LIKE=debian'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Ubuntu/Debian based detected installing Vagrant.........."
	sleep 1
	curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
	sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
	sudo apt-get update && sudo apt-get install vagrant && echo ${RED} "Vagrant installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'Rhel\|ID_LIKE=centos\|Centos\|ID_LIKE=rhel'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum detected installing Vagrant.........."
	sleep 1
	sudo yum install -y yum-utils && \
	sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && \
	sudo yum -y install vagrant && echo ${RED} "Vagrant installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'ID="amzn"'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum detected installing Vagrant.........."
	sleep 1
	sudo yum install -y yum-utils && \
	sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo && \
	sudo yum -y install vagrant && echo ${RED} "Vagrant installed!!!"
	sleep 3
	menu
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager" && sleep 2 && menu;
	fi
}

function ansiblein {
	if [[ `cat /etc/os-release | grep 'Ubuntu\|ID_LIKE=ubuntu'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Ubuntu/Debian based detected installing Ansible.........."
	sleep 1
	sudo apt install software-properties-common && \
	sudo add-apt-repository --yes --update ppa:ansible/ansible && \
	sudo apt install ansible && echo ${RED} "Ansible installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'Debian\|ID_LIKE=debian'` ]]; then
	sudo apt-get install ansible && echo ${RED} "Ansible installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'Centos'` ]]; then
	sudo yum install epel-release && sudo yum install ansible && echo ${RED} "Ansible installed!!!"
	elif [[ `cat /etc/os-release | grep 'ID="rhel"'` ]]; then
	sudo yum install ansible && echo ${RED} "Ansible installed!!!"
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager" && sleep 2 && menu;
	fi
}

function terraformin {
	if [[ `cat /etc/os-release | grep 'Ubuntu\|ID_LIKE=ubuntu\|Debian\|ID_LIKE=debian'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Ubuntu/Debian based detected installing Terraform.........."
	sleep 1
	sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl && \
	curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && \
	sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
	sudo apt-get update && sudo apt-get install terraform && echo ${RED} "Terraform installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'Rhel\|ID_LIKE=centos\|Centos\|ID_LIKE=rhel'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum detected installing Vagrant.........."
	sleep 1
	sudo yum install -y yum-utils && \
	sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && \
	sudo yum -y install terraform && echo ${RED} "Vagrant installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'ID="amzn"'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum detected installing Vagrant.........."
	sleep 1
	sudo yum install -y yum-utils && \
	sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo && \
	sudo yum -y install terraform && echo ${RED} "Vagrant installed!!!"
	sleep 3
	menu
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager" && sleep 2 && menu;
	fi
	
}


function kubeadmin {
	if [[ `cat /etc/os-release | grep 'Ubuntu\|ID_LIKE=ubuntu\|Debian\|ID_LIKE=debian'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Ubuntu/Debian based detected installing Kubeadm.........."
	sleep 1
	sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl && \
	sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg && \
	echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list && \
	sudo apt-get update && sudo apt-get install -y kubeadm && echo ${RED} "Kubeadm installed!!!"
	sleep 3
	menu
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager" && sleep 2 && menu;
	fi
}

function kubeletin {
	if [[ `cat /etc/os-release | grep 'Ubuntu\|ID_LIKE=ubuntu\|Debian\|ID_LIKE=debian'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Ubuntu/Debian based detected installing Kubelet.........."
	sleep 1
	sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl && \
	sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg && \
	echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list && \
	sudo apt-get update && sudo apt-get install -y kubelet && echo ${RED} "Kubelet installed!!!"
	sleep 3
	menu
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager" && sleep 2 && menu;
	fi
}




function kubectlin {
	if [[ `cat /etc/os-release | grep 'Ubuntu\|ID_LIKE=ubuntu\|Debian\|ID_LIKE=debian'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Ubuntu/Debian based detected installing Kubectl.........."
	sleep 1
	sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl && \
	sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg && \
	echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list && \
	sudo apt-get update && sudo apt-get install -y kubectl && echo ${RED} "Kubectl installed!!!"
	sleep 3
	menu
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager" && sleep 2 && menu;
	fi
}

function krewin {
	cd "$(mktemp -d)" &&
      OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
      ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
      KREW="krew-${OS}_${ARCH}" &&
      curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
      tar zxvf "${KREW}.tar.gz" &&
      ./"${KREW}" install krew

      export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

      if [ -f "~/.bashrc" ]; then
        echo 'export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"' >> ~/.bashrc
      fi

      if [ -f "~/.zshrc" ]; then
        echo 'export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"' >> ~/.zshrc
      fi
}

function minikubein {
	if [[ `cat /etc/os-release | grep 'Ubuntu\|ID_LIKE=ubuntu\|Debian\|ID_LIKE=debian'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Ubuntu/Debian based detected installing Minikube.........."
	sleep 1
	curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
	sudo dpkg -i minikube_latest_amd64.deb && echo ${RED} "Minikube installed!!!"
	sleep 3
	menu
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager" && sleep 2 && menu;
	fi
}

function kindin {
	if [[ `uname -a | grep "Linux"` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Linux detected installing Kind.........."
	sleep 1
	curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64 && \
	sudo chmod +x ./kind && \
	sudo mv ./kind /usr/bin/kind && echo ${RED} "Kind installed!!!"
	sleep 3
	menu
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported operating system" && sleep 2 && menu;
	fi
}

function awsclin {
	if [[ `uname -a | grep "Linux"` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Linux OS detected installing AWS Cli.........."
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip" && \
	sudo apt-get install unzip && \
	unzip awscliv2.zip && \
	sudo ./aws/install && echo ${RED} "AWS CLI installed!!!"
	sleep 3
	menu
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported operating system" && sleep 2 && menu;
	fi
}

function gloudsdkin {
	if [[ `cat /etc/os-release | grep 'Ubuntu\|ID_LIKE=ubuntu\|Debian\|ID_LIKE=debian'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Ubuntu/Debian based detected installing Gcloud SDK.........."
	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
	echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
	sudo apt-get update && sudo apt-get install -y google-cloud-sdk && echo ${RED} "Gcloud SDK installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'amzn\|ID_LIKE=centos\|Centos\|ID_LIKE=rhel'` ]]; then
	sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el8-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM
sudo yum install google-cloud-sdk
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager" && sleep 2 && menu;
	fi
}

function azureclin {
	if [[ `cat /etc/os-release | grep 'Ubuntu\|ID_LIKE=ubuntu\|Debian\|ID_LIKE=debian'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Ubuntu/Debian based detected installing Azure Cli.........."
	sudo apt-get update && sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg && \
	curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null && \
	AZ_REPO=$(lsb_release -cs)
	echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list && \
	sudo apt-get update && sudo apt-get install azure-cli && echo ${RED} "Azure Cli installed!!!"
	sleep 3
	menu
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager" && sleep 2 && menu;
	fi
}

function circleclin {
	if [[ `uname -a | grep "Linux"` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Linux OS detected installing Cirlceci Cli.........."
	curl -fLSs https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh | sudo bash && echo ${RED} "CircleCI Cli installed!!!"
	sleep 3
	menu
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported operating system" && sleep 2 && menu;
	fi
}

function githubclin {
	if [[ `cat /etc/os-release | grep 'Ubuntu\|ID_LIKE=ubuntu\|Debian\|ID_LIKE=debian'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Ubuntu/Debian based detected installing Github Cli.........."
	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg && \
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
	sudo apt update && sudo apt install gh && echo ${RED} "Github Cli installed!!!"
	sleep 3
	
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported operating system" && sleep 2 && menu;
	fi

}

function packerin {
	if [[ `cat /etc/os-release | grep 'Ubuntu\|ID_LIKE=ubuntu\|Debian\|ID_LIKE=debian'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Ubuntu/Debian based detected installing Packer.........."
	curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && \
	sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
	sudo apt-get update && sudo apt-get install packer && echo ${RED} "Packer installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'Rhel\|ID_LIKE=centos\|Centos\|ID_LIKE=rhel'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum detected installing Packer.........."
	sleep 1
	sudo yum install -y yum-utils && \
	sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && \
	sudo yum -y install packer && echo ${RED} "Packer installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'ID="amzn"'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum detected installing Packer.........."
	sleep 1
	sudo yum install -y yum-utils && \
	sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo && \
	sudo yum -y install packer && echo ${RED} "Packer installed!!!"
	sleep 3
	menu
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported operating system" && sleep 2 && menu;
	fi
	
}

function waypointin {
	if [[ `cat /etc/os-release | grep 'Ubuntu\|ID_LIKE=ubuntu\|Debian\|ID_LIKE=debian'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Ubuntu/Debian based detected installing Waypoint.........."
	curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && \
	sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
	sudo apt-get update && sudo apt-get install waypoint && echo ${RED} "Waypoint installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'Rhel\|ID_LIKE=centos\|Centos\|ID_LIKE=rhel'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum detected installing Waypoint.........."
	sleep 1
	sudo yum install -y yum-utils && \
	sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && \
	sudo yum -y install waypoint && echo ${RED} "Waypoint installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'ID="amzn"'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum detected installing Waypoint.........."
	sleep 1
	sudo yum install -y yum-utils && \
	sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo && \
	sudo yum -y install waypoint && echo ${RED} "Waypoint installed!!!"
	sleep 3
	menu
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported operating system" && sleep 2 && menu;
	fi
}

function nomadin {
	if [[ `cat /etc/os-release | grep 'Ubuntu\|ID_LIKE=ubuntu\|Debian\|ID_LIKE=debian'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Ubuntu/Debian based detected installing Nomad........."
	curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && \
	sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
	sudo apt-get update && sudo apt-get install nomad && echo ${RED} "Nomad installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'Rhel\|ID_LIKE=centos\|Centos\|ID_LIKE=rhel'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum detected installing Nomad.........."
	sleep 1
	sudo yum install -y yum-utils && \
	sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && \
	sudo yum -y install nomad && echo ${RED} "Nomad installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'ID="amzn"'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum detected installing Nomad.........."
	sleep 1
	sudo yum install -y yum-utils && \
	sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo && \
	sudo yum -y install nomad && echo ${RED} "Nomad installed!!!"
	sleep 3
	menu
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported operating system" && sleep 2 && menu;
	fi
}

function ngrokin {
	if [[ `uname -a | grep "Linux"` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Linux OS detected installing Ngrok.........."
	sudo apt-get install unzip && wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -o ngrok.zip && \
	unzip ngrok.zip && \
	sudo mv ./ngrok /usr/bin/ngrok && echo ${RED} "Ngrok installed!!!"
	sleep 3
	menu
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported operating system" && sleep 2 && menu;
	fi
}

function helmin {
	if [[ `cat /etc/os-release | grep 'Ubuntu\|ID_LIKE=ubuntu\|Debian\|ID_LIKE=debian'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Ubuntu/Debian based detected installing Helm.........."
	sleep 1
	sudo curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
	sudo apt-get install apt-transport-https -y
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
	sudo apt-get update -y && sudo apt-get install helm -y && echo ${RED} "Helm installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'Rhel\|ID_LIKE=centos\|Centos\|ID_LIKE=rhel'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum detected installing Helm.........."
	sleep 1
	sudo curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash && \
	echo ${RED} "Helm installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'ID="amzn"'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum detected installing Helm.........."
	sleep 1
	sudo curl -fsSL -o https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash && \
	echo ${RED} "Helm installed!!!"
	sleep 3
	menu
	elif [[ "$(uname)" == "Darwin" ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Mac OS detected installing Helm.........."
	sleep 1
	sudo curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
	echo ${RED} "Helm installed!!!"
	sleep 3
	menu
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager" && sleep 2 && menu;
	fi
}

function terragruntin {
	if [[ `cat /etc/os-release | grep 'Ubuntu\|ID_LIKE=ubuntu\|Debian\|ID_LIKE=debian'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Ubuntu/Debian based detected installing terragrunt.........."
	sleep 1
	curl -o terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.38.6/terragrunt_linux_arm64
	sudo chmod u+x terragrunt && sudo mv terragrunt /usr/local/bin/terragrunt && echo ${RED} "Terragrunt installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'Rhel\|ID_LIKE=centos\|Centos\|ID_LIKE=rhel'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum detected installing Helm.........."
	sleep 1
	curl -o terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.38.6/terragrunt_linux_arm64
	sudo chmod u+x terragrunt && sudo mv terragrunt /usr/local/bin/terragrunt && echo ${RED} "Terragrunt installed!!!"
	sleep 3
	menu
	elif [[ `cat /etc/os-release | grep 'ID="amzn"'` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum detected installing Helm.........."
	sleep 1
	curl -o terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.38.6/terragrunt_linux_arm64
	sudo chmod u+x terragrunt && sudo mv terragrunt /usr/local/bin/terragrunt && echo ${RED} "Terragrunt installed!!!"
	sleep 3
	menu
	elif [[ "$(uname)" == "Darwin" ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Mac OS detected installing Helm.........."
	sleep 1
	curl -o terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.38.6/terragrunt_linux_arm64
	chmod u+x terragrunt && sudo mv terragrunt /usr/local/bin/terragrunt && echo ${RED} "Terragrunt installed!!!"
	sleep 3
	menu
	else
	echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager" && sleep 2 && menu;
	fi
}


header
#update
menu
