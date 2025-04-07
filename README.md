# My Developer Toolkit

This is a curated list of software, tools, and applications I use daily in my tech workflow. I maintain this page both as a personal reference for setting up new machines and as a resource for others who might find these recommendations helpful.

## Table of Contents
- [Productivity](#productivity)
- [Development Tools](#development-tools)
- [Terminal Setup](#terminal-setup)
- [Security & Privacy](#security--privacy)
- [Communication](#communication)
- [Utilities](#utilities)

## Productivity

### [Obsidian](https://obsidian.md/) - Note Taking
Obsidian is my knowledge management system of choice. I use it for everything from daily notes to project documentation and personal knowledge management.

**Why I use it:** The local-first markdown approach means my notes are future-proof and portable. The graph view helps visualize connections between ideas, and the plugin ecosystem is incredibly powerful.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask obsidian
```

### [Things 3](https://culturedcode.com/things/) - Task Management
My preferred task management app for its clean design and thoughtful keyboard shortcuts.

**Why I use it:** Perfect balance of power and simplicity. The natural language date parsing and keyboard shortcuts make capturing tasks effortless.

**Installation:** 
```bash
# macOS (using Homebrew)
brew install --cask things
```

### [Rewind](https://www.rewind.ai/) - Memory Tool
Rewind acts as my second brain by automatically recording everything I see on my screen and making it searchable.

**Why I use it:** Helps me recall information from past meetings or research sessions that I might otherwise forget.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask rewind
```

### [CopyCat](https://github.com/copy-cat-app/copycat) - Keyboard Shortcuts
CopyCat streamlines my clipboard management with powerful text expansion capabilities.

**Why I use it:** Saves time by automating repetitive typing tasks with custom snippets and shortcuts.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask copycat
```

## Development Tools

### [PyCharm](https://www.jetbrains.com/pycharm/) - Python IDE
My primary IDE for Python development.

**Why I use it:** Comprehensive debugging tools, excellent code navigation, and intelligent code completion make Python development much more efficient.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask pycharm
```

### [DataGrip](https://www.jetbrains.com/datagrip/) - Database IDE
IDE for SQL development and database management.

**Why I use it:** Supports multiple database engines, has great schema visualization, and provides intelligent code completion for SQL.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask datagrip
```

### [GitHub](https://github.com/) - Version Control
Industry standard platform for hosting Git repositories.

**Why I use it:** The hub for open source collaboration, with excellent CI/CD integrations and project management tools.

**Setup:**
```bash
# Install Git
brew install git

# Configure Git
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Generate SSH key
ssh-keygen -t ed25519 -C "your.email@example.com"

# Add SSH key to ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copy SSH key to clipboard (to add to GitHub)
pbcopy < ~/.ssh/id_ed25519.pub
```

### [Claude](https://claude.ai/) - AI Assistant
My go-to AI assistant for writing, research, and creative thinking.

**Why I use it:** Helps me draft documents, brainstorm ideas, and get unstuck when problem-solving.

## Terminal Setup

### [iTerm2](https://iterm2.com/) - Terminal Emulator
A more powerful replacement for the default macOS Terminal.

**Why I use it:** Split panes, search functionality, and customizable profiles make it much more productive than the default Terminal.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask iterm2
```

### [Oh My Zsh](https://ohmyz.sh/) - Zsh Framework
Framework for managing Zsh configuration.

**Why I use it:** Provides helpful aliases, functions, and plugins that make command-line work more efficient.

**Installation:**
```bash
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - Zsh Theme
A highly customizable and performant Zsh theme.

**Why I use it:** Provides informative and visually appealing command prompts with Git status, execution time, and more.

**Installation:**
```bash
# Clone the repository
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Set the theme in your .zshrc file
# Open your .zshrc file
nano ~/.zshrc

# Change the ZSH_THEME line to:
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Then run the configuration wizard
p10k configure
```

## Security & Privacy

### [NordVPN](https://nordvpn.com/) - VPN Service
My preferred VPN provider for secure internet browsing.

**Why I use it:** Strong security features, good performance, and a no-logs policy.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask nordvpn
```

### [Bitwarden](https://bitwarden.com/) - Password Manager
Open-source password manager for generating and storing secure credentials.

**Why I use it:** Cross-platform, open-source, and offers a generous free tier with premium features at a reasonable price.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask bitwarden
```

## Communication

### [Signal](https://signal.org/) - Secure Messaging
End-to-end encrypted messaging service.

**Why I use it:** Strong privacy focus with excellent security practices and open-source code.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask signal
```

## Utilities

### [Bartender 5](https://www.macbartender.com/) - Menu Bar Management
Organizes and hides menu bar items on macOS.

**Why I use it:** Keeps my menu bar clean and organized, especially useful on MacBooks with notches.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask bartender
```

### [WaterMinder](https://waterminder.com/) - Hydration Tracker
Helps me track and maintain proper hydration throughout the day.

**Why I use it:** Visual reminders and tracking help ensure I'm drinking enough water during long coding sessions.

**Installation:**
```bash
# Available on the Mac App Store
# Or using mas-cli with Homebrew
brew install mas
mas install 1121012695  # WaterMinder app ID
```

## Complete Setup Script

Here's a complete script to install all the command-line installable tools mentioned above:

```bash
#!/bin/bash
# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed, updating..."
    brew update
fi

# Install command line tools
echo "Installing development tools..."
brew install git

# Install applications using Homebrew Cask
echo "Installing applications..."
brew install --cask obsidian
brew install --cask things
brew install --cask rewind
brew install --cask copycat
brew install --cask pycharm
brew install --cask datagrip
brew install --cask iterm2
brew install --cask nordvpn
brew install --cask bitwarden
brew install --cask signal
brew install --cask bartender

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
```

---

## How I Maintain This List

This list is regularly updated as I discover new tools or change my workflow. If you have suggestions or questions about any of these tools, feel free to open an issue or reach out to me directly.

## License

This documentation is open-source and available under the [MIT License](LICENSE).
