#!/bin/bash

# Install homebrew if not installed
if ! command -v brew &>/dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew already installed"
fi

# Install Zsh, Oh My Zsh and plugins
echo "🐚 Installing Zsh & Oh My Zsh..."
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Zplug
echo "🔌 Installing zplug..."
git clone https://github.com/zplug/zplug ~/.zplug

# Install Starship
echo "🚀 Installing Starship..."
brew install starship

# Install Mise
echo "🛠 Installing Mise..."
brew install mise

# Install Bat
echo "🦇 Installing bat..."
brew install bat

# Symlink dotfiles
echo "🔗 Linking dotfiles..."
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.config/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/.config/mise ~/.config/mise

# Reload shell
echo "✅ Setup complete! Restart your terminal."
exec zsh