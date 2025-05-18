#!/bin/bash
# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH based on architecture
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'export PATH=$PATH:/opt/homebrew/bin' >> ~/.zshrc
    else
        echo 'export PATH=$PATH:/usr/local/bin' >> ~/.zshrc
    fi
    
    # Source zshrc to update PATH in current session
    source ~/.zshrc
    
    echo "Homebrew has been installed and added to PATH"
else
    echo "Homebrew already installed, updating..."
    brew update
fi

# Install command line tools
echo "Installing development tools..."
brew install git
brew install gh

# Install applications using Homebrew Cask
echo "Installing applications..."
brew install --cask obsidian
brew install --cask things
brew install --cask rewind
brew install --cask shortcat
brew install --cask raycast
brew install --cask fantastical
brew install --cask pycharm
brew install --cask datagrip
brew install --cask github
brew install --cask iterm2
brew install --cask nordvpn
brew install --cask bitwarden
brew install --cask steptwo
brew install --cask okta-verify
brew install --cask opal
brew install --cask signal
brew install --cask slack
brew install --cask bartender
brew install --cask spotify
brew install --cask arc
brew install --cask synology-drive
brew install --cask google-drive

# Install mas-cli and App Store apps
brew install mas
mas install 1121012695  # WaterMinder app ID

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed"
fi

# Install Powerlevel10k theme
echo "Installing Powerlevel10k theme..."
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
    echo "Powerlevel10k theme is already installed"
fi

# Modify .zshrc to use Powerlevel10k theme
if grep -q "ZSH_THEME=\"powerlevel10k/powerlevel10k\"" "$HOME/.zshrc"; then
    echo "Powerlevel10k theme is already configured"
else
    sed -i '' 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$HOME/.zshrc"
    echo "Powerlevel10k theme has been configured"
fi

echo "Installation complete! Please restart your terminal and run 'p10k configure' to set up your terminal theme."