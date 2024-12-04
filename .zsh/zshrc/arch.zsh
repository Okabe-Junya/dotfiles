#!/usr/bin/env zsh

ARCH=$(uname -m)
if [ "$ARCH" = "arm64" ]; then
    PR_ARCH="ARM"
    export BREWx86_BASE=/opt/brew_x86
    export BREW_BASE=/opt/homebrew
    export PATH=${BREWx86_BASE}/bin:${BREWx86_BASE}/sbin${PATH:+:${PATH}}
    export PATH=${BREW_BASE}/bin:${BREW_BASE}/sbin${PATH:+:${PATH}}
else
    export BREW_BASE=/opt/brew_x86
    # export PATH=${BREW_BASE}/bin:${BREW_BASE}/sbin${PATH:+:${PATH}}
    export PATH=${PATH//¥/homebrew¥//¥/brew_x86¥/}
fi
