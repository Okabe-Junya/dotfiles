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
    xcode-select --install 2> /dev/null
else
    sleep 1
    echo "Xcode Command Line Tools is already installed!"
fi

# Install Homebrew
# TODO: Check if Homebrew is already installed
# M1とx86でインストール方法が違うので，M1の場合は別の方法でインストールする

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 2> /dev/null
