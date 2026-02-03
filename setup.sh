#!/bin/bash
# New Mac Setup Script

echo "=== Installing Homebrew ==="
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "=== Adding Homebrew taps ==="
xargs brew tap < brew/taps

echo "=== Installing formulas ==="
xargs brew install < brew/formulas

echo "=== Installing casks ==="
xargs brew install --cask < brew/casks

echo "=== Linking Python ==="
ln -sf /opt/homebrew/bin/python3.13 /opt/homebrew/bin/python3
ln -sf /opt/homebrew/bin/pip3.13 /opt/homebrew/bin/pip3

echo "=== Installing global npm packages ==="
xargs npm install -g < npm-global.txt

echo "=== Installing VS Code extensions ==="
cat vscode/extensions.txt | xargs -L 1 code --install-extension

echo "=== Copying dotfiles ==="
cp .zshrc ~/.zshrc
cp .gitconfig ~/.gitconfig
cp .vimrc ~/.vimrc

echo "=== Setting up Ghostty ==="
mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty
cp ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config

echo "=== Setting up VS Code ==="
mkdir -p ~/Library/Application\ Support/Code/User
cp vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

echo "=== Done! Restart terminal ==="
