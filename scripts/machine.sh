#!/bin/bash
# curl -L https://jturazzi.github.io/dotfiles-linux/scripts/machine.sh | bash

CYAN="\e[36m"
GREEN="\e[32m"
MAGENTA="\e[35m"
RED="\e[31m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"

# Vérification que le script bash est lancer en root
if [[ $(id -u) -ne 0 ]] ; then echo "Veuillez exécuter en mode root" ; exit 1 ; fi

echo -e "${CYAN}[Lancement du script machine.sh]${ENDCOLOR}"
sleep 3
echo
#-------------------------------------------------------------------------------------------------------
echo -e "- ${YELLOW}[1/7]${ENDCOLOR} Installation du dépot Backports Debian 11 [${RED}✗${ENDCOLOR}]"
sleep 2
echo "deb http://deb.debian.org/debian bullseye-backports main contrib non-free" > /etc/apt/sources.list.d/backports.list
echo -e "- ${YELLOW}[1/7]${ENDCOLOR} Installation du dépot Backports Debian 11 [${GREEN}✓${ENDCOLOR}]"
echo
#-------------------------------------------------------------------------------------------------------
echo -e "- ${YELLOW}[2/7]${ENDCOLOR} MAJ des paquets [${RED}✗${ENDCOLOR}]"
sleep 2
apt upgrade -y
echo -e "- ${YELLOW}[2/7]${ENDCOLOR} MAJ des paquets [${GREEN}✓${ENDCOLOR}]"
echo
#-------------------------------------------------------------------------------------------------------
echo -e "- ${YELLOW}[3/7]${ENDCOLOR} MAJ des dépots de Debian [${RED}✗${ENDCOLOR}]"
sleep 2
apt update
echo -e "- ${YELLOW}[3/7]${ENDCOLOR} MAJ des dépots de Debian [${GREEN}✓${ENDCOLOR}]"
echo
#-------------------------------------------------------------------------------------------------------
echo -e "- ${YELLOW}[4/7]${ENDCOLOR} Installation de paquets complémentaires [${RED}✗${ENDCOLOR}]"
sleep 2
apt install bat btop curl figlet git htop neofetch nmap sudo wget -y
echo -e "- ${YELLOW}[4/7]${ENDCOLOR} Installation de paquets complémentaires [${GREEN}✓${ENDCOLOR}]"
echo
#-------------------------------------------------------------------------------------------------------
echo -e "- ${YELLOW}[5/7]${ENDCOLOR} Ajout d'un utilisateur jeremy [${RED}✗${ENDCOLOR}]"
sleep 2
adduser jeremy
echo -e "- ${YELLOW}[5/7]${ENDCOLOR} Ajout d'un utilisateur jeremy [${GREEN}✓${ENDCOLOR}]"
echo
#-------------------------------------------------------------------------------------------------------
echo -e "- ${YELLOW}[6/7]${ENDCOLOR} Ajout de l'utilisateur « jeremy » au groupe « sudo » [${RED}✗${ENDCOLOR}]"
sleep 2
usermod -aG sudo jeremy
echo -e "- ${YELLOW}[6/7]${ENDCOLOR} Ajout de l'utilisateur « jeremy » au groupe « sudo » [${GREEN}✓${ENDCOLOR}]"
echo
#-------------------------------------------------------------------------------------------------------
echo -e "- ${YELLOW}[7/7]${ENDCOLOR} Définition du locale fr_FR.UTF-8 [${RED}✗${ENDCOLOR}]"
sleep 2
localectl set-locale LANG=fr_FR.UTF-8
echo -e "- ${YELLOW}[7/7]${ENDCOLOR} Définition du locale fr_FR.UTF-8 [${GREEN}✓${ENDCOLOR}]"
echo
#-------------------------------------------------------------------------------------------------------
echo
echo -e "${CYAN}[Fin du script machine.sh]${ENDCOLOR}"