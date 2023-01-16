echo "Checking OS..."

if [ "$(uname)" != "Darwin" ]; then
    echo "This script is only for Mac OS X"
    exit 1
else
    sleep 1
    echo "This OS is Mac OS X!"
fi

# Install Xcode Command Line Tools
echo "Checking Xcode Command Line Tools..."
if [ ! -d "/Library/Developer/CommandLineTools" ]; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install 2>/dev/null
else
    sleep 1
    echo "Xcode Command Line Tools is already installed!"
fi

# Install Homebrew
if [ "$(uname -m)" = "arm64" ]; then
    if [ ! -d "/opt/homebrew" ]; then
        echo "Installing Homebrew for Apple Silicon..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 2>/dev/null
    else
        sleep 1
        echo "Homebrew for Apple Silicon is already installed!"
    fi
else
    if [ ! -d "/usr/local/Homebrew" ]; then
        echo "Installing Homebrew for Intel..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 2>/dev/null
    else
        sleep 1
        echo "Homebrew for Intel is already installed!"
    fi
fi

source ~/.dotfiles/.zsh/init/arch.sh

