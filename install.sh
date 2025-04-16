#!/bin/bash

# ---- Colors ----
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}🔧 Dotfiles Bootstrap Script${NC}"

# ---- Ensure Homebrew is Installed and in PATH ----
echo -e "${YELLOW}Checking 🍺 Homebrew...${NC}"

if ! command -v brew &> /dev/null; then
  echo -e "${GREEN}Installing 🍺 Homebrew...${NC}"
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo -e "${GREEN}🍺 Homebrew is already installed ✅${NC}"
fi

# ---- Prompt Options ----
echo
echo -e "${YELLOW}Select tools to install (separate numbers with space):${NC}"
echo "1) Oh My Zsh (and .zshrc)"
echo "2) Zplug"
echo "3) Starship (and starship.toml)"
echo "4) Mise (and config)"
echo "5) Bat"
echo "6) Skip all installs"
read -p "Your choices: " choices

for choice in $choices; do
  case $choice in
    1)
      echo -e "${GREEN}Installing 🐚 Oh My Zsh (manual method)...${NC}"
      if [ ! -d "$HOME/.oh-my-zsh" ]; then
        git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
        cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
        echo -e "${GREEN}Linked default .zshrc template.${NC}"
      fi

      echo -e "${GREEN}Linking your custom .zshrc...${NC}"
      ln -sf ~/dotfiles/.zshrc ~/.zshrc
      ;;
    2)
      echo -e "${GREEN}Installing 🔌 zplug...${NC}"
      git clone https://github.com/zplug/zplug ~/.zplug
      ;;
    3)
      echo -e "${GREEN}Installing 🚀 Starship...${NC}"
      brew install starship

      echo -e "${GREEN}Linking starship.toml...${NC}"
      mkdir -p ~/.config
      ln -sf ~/dotfiles/.config/starship.toml ~/.config/starship.toml
      ;;
    4)
      echo -e "${GREEN}Installing 🛠 Mise...${NC}"
      brew install mise

      echo -e "${GREEN}Linking mise config...${NC}"
      mkdir -p ~/.config
      ln -sf ~/dotfiles/.config/mise ~/.config/mise
      ;;
    5)
      echo -e "${GREEN}Installing 🦇 Bat...${NC}"
      brew install bat
      ;;
    6)
      echo -e "${YELLOW}Skipping installations.${NC}"
      break
      ;;
    *)
      echo -e "${RED}Invalid option: $choice${NC}"
      ;;
  esac
done

# ---- Done ----
echo
echo -e "${GREEN}🎉 All done! Restart your terminal or run 'source ~/.zshrc' to apply changes.${NC}"
