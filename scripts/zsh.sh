#!/bin/bash
# curl -L https://jturazzi.github.io/dotfiles-linux/scripts/zsh.sh | bash

CYAN="\e[36m"
GREEN="\e[32m"
MAGENTA="\e[35m"
RED="\e[31m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"

echo -e "${CYAN}[Lancement du script zsh.sh]${ENDCOLOR}"
sleep 3
echo
#-------------------------------------------------------------------------------------------------------
echo -e "- ${YELLOW}[1/5]${ENDCOLOR} Installation de ZSH [${RED}✗${ENDCOLOR}]"
sleep 2
sudo apt install zsh -y
echo -e "- ${YELLOW}[1/5]${ENDCOLOR} Installation de ZSH [${GREEN}✓${ENDCOLOR}]"
echo
#-------------------------------------------------------------------------------------------------------
echo -e "- ${YELLOW}[2/5]${ENDCOLOR} Installation Oh My Zsh [${RED}✗${ENDCOLOR}]"
sleep 2
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo -e "- ${YELLOW}[2/5]${ENDCOLOR} Installation Oh My Zsh [${GREEN}✓${ENDCOLOR}]"
echo
#-------------------------------------------------------------------------------------------------------
echo -e "- ${YELLOW}[3/5]${ENDCOLOR} Definition du shell ZSH par default [${RED}✗${ENDCOLOR}]"
sleep 2
sudo chsh --shell /bin/zsh jeremy
echo -e "- ${YELLOW}[3/5]${ENDCOLOR} Definition du shell ZSH par default [${GREEN}✓${ENDCOLOR}]"
echo
#-------------------------------------------------------------------------------------------------------
echo -e "- ${YELLOW}[4/5]${ENDCOLOR} Installation du theme powerlevel10k et des plugins tierces [${RED}✗${ENDCOLOR}]"
sleep 2
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo -e "- ${YELLOW}[4/5]${ENDCOLOR} Installation du theme powerlevel10k et des plugins tierces [${GREEN}✓${ENDCOLOR}]"
echo
#-------------------------------------------------------------------------------------------------------
echo -e "- ${YELLOW}[5/5]${ENDCOLOR} Copie des configurations ZSH [${RED}✗${ENDCOLOR}]"
sleep 2
curl -s https://jturazzi.github.io/dotfiles-linux/aliases > ~/.aliases
curl -s https://jturazzi.github.io/dotfiles-linux/functions > ~/.functions
curl -s https://jturazzi.github.io/dotfiles-linux/p10k.zsh > ~/.p10k.zsh
curl -s https://jturazzi.github.io/dotfiles-linux/zshrc > ~/.zshrc
curl -s https://jturazzi.github.io/dotfiles-linux/selected_editor > ~/.selected_editor
echo -e "- ${YELLOW}[5/5]${ENDCOLOR} Copie des configurations ZSH [${GREEN}✓${ENDCOLOR}]"
echo
#-------------------------------------------------------------------------------------------------------
echo
echo -e "${CYAN}[Fin du script zsh.sh]${ENDCOLOR}"




