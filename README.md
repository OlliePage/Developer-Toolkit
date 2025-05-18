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

### [Shortcat](https://shortcat.app/) - Keyboard Shortcuts
Shortcat lets you control your Mac with the keyboard, reducing dependency on the mouse or trackpad.

**Why I use it:** Saves time by allowing me to navigate and interact with applications using keyboard shortcuts instead of mouse movements.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask shortcat
```

### [Raycast](https://raycast.com/) - Productivity Launcher
A powerful launcher that helps you get things done faster on your Mac.

**Why I use it:** Superior replacement for Spotlight with customizable extensions, snippets, and workflows.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask raycast
```

### [Fantastical](https://flexibits.com/fantastical) - Calendar App
A powerful calendar app with natural language processing.

**Why I use it:** Intuitive interface with natural language event creation and excellent multi-calendar management.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask fantastical
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

### [GitHub Desktop](https://desktop.github.com/) - Git Client
User-friendly GitHub client with visual interface.

**Why I use it:** Simplifies Git operations with visual diffs and easy branch management for those times when CLI isn't necessary.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask github
```

### [GitHub CLI](https://cli.github.com/) - Command Line Interface for GitHub
GitHub's official command line tool.

**Why I use it:** Streamlines GitHub workflows like creating PRs, issues, and reviewing code directly from the terminal.

**Installation:**
```bash
# macOS (using Homebrew)
brew install gh
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

### [Step Two](https://steptwo.app/) - Two-Factor Authentication
A simple and secure two-factor authentication app.

**Why I use it:** Clean interface with iCloud sync, making 2FA management seamless across Apple devices.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask steptwo
```

### [Okta Verify](https://www.okta.com/products/okta-verify/) - Identity Verification
Multi-factor authentication app from Okta.

**Why I use it:** Secure push notifications and integrations with corporate identity systems.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask okta-verify
```

### [Opal](https://www.opal.so/) - Digital Wellbeing
App blocker and screen time manager for focused work.

**Why I use it:** Helps maintain focus by intelligently managing distractions and creating healthy digital boundaries.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask opal
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

### [Slack](https://slack.com/) - Team Communication
Real-time messaging platform for team collaboration.

**Why I use it:** Industry standard for workplace communication with robust integrations and features.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask slack
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

### [Spotify](https://www.spotify.com/) - Music Streaming
Music streaming service to keep me in the zone while coding.

**Why I use it:** Extensive music library with great discovery features and focus playlists for productive work sessions.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask spotify
```

### [Arc Browser](https://arc.net/) - Web Browser
A modern browser reimagined from the ground up.

**Why I use it:** Innovative workspace management with spaces, split view, and command bar for efficient web navigation.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask arc
```

### [Synology Drive](https://www.synology.com/en-global/dsm/feature/drive) - File Synchronization
Client for syncing files with Synology NAS devices.

**Why I use it:** Reliable file synchronization with my personal NAS for secure cloud-like storage.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask synology-drive
```

### [Google Drive](https://www.google.com/drive/) - Cloud Storage
Google's cloud storage and file synchronization service.

**Why I use it:** Seamless integration with Google Workspace and great for collaboration.

**Installation:**
```bash
# macOS (using Homebrew)
brew install --cask google-drive
```

## Complete Setup Script

Here's a complete script to install all the command-line installable tools mentioned above:

```bash
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
```

---

## How I Maintain This List

This list is regularly updated as I discover new tools or change my workflow. If you have suggestions or questions about any of these tools, feel free to open an issue or reach out to me directly.

## License

This documentation is open-source and available under the [MIT License](LICENSE).
