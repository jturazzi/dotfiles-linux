#!/bin/bash
# curl -L https://jturazzi.github.io/dotfiles-linux/motd.sh | bash

CYAN="\e[36m"
GREEN="\e[32m"
MAGENTA="\e[35m"
RED="\e[31m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"

# Vérification que le script bash est lancer en root
if [[ $(id -u) -ne 0 ]] ; then echo "Veuillez exécuter en mode root" ; exit 1 ; fi

echo -e "${CYAN}[Lancement du script motd.sh]${ENDCOLOR}"
sleep 3
echo
#-------------------------------------------------------------------------------------------------------
echo -e "- ${YELLOW}[1/2]${ENDCOLOR} Installation du MOTD [${RED}✗${ENDCOLOR}]"
sleep 2
mkdir -p /etc/neofetch
curl -s https://jturazzi.github.io/dotfiles-linux/neofetch.conf > /etc/neofetch/config.conf
echo -e "- ${YELLOW}[1/2]${ENDCOLOR} Installation du MOTD [${GREEN}✓${ENDCOLOR}]"
echo
#-------------------------------------------------------------------------------------------------------
echo -e "- ${YELLOW}[2/2]${ENDCOLOR} Configuration du MOTD [${RED}✗${ENDCOLOR}]"
sleep 2
rm -rf /etc/motd /etc/update-motd.d/*
tee -a /etc/update-motd.d/00-motd > /dev/null <<EOT 
#!/bin/sh
neofetch --config /etc/neofetch/config.conf
EOT
chmod +x /etc/update-motd.d/00-motd
echo -e "- ${YELLOW}[2/2]${ENDCOLOR} Configuration du MOTD [${GREEN}✓${ENDCOLOR}]"
echo
#-------------------------------------------------------------------------------------------------------
echo
echo -e "${CYAN}[Fin du script motd.sh]${ENDCOLOR}"