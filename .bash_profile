eval $(/opt/homebrew/bin/brew shellenv)
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
. "$HOME/.cargo/env"
