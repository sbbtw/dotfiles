#!/usr/bin/env bash

set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo $SCRIPT_DIR

install_packages() {
    local name="$1"

    echo "==> Installing ${name} packages..."
    sudo pacman -S --needed $(<"$SCRIPT_DIR/packages/${name}.txt")
}

install_packages system
install_packages core
install_packages fonts

if [[ "$1" == "i3" ]]; then
    echo "Installing i3 packages..."
    install_packages i3
    ln -sf "$SCRIPT_DIR/configs/x11/.xinitrc" ~/.xinitrc
    ln -sf "$SCRIPT_DIR/configs/x11/.Xresources" ~/.Xresources
    ln -sf "$SCRIPT_DIR/configs/i3" ~/.config/i3
    ln -sf "$SCRIPT_DIR/configs/picom" ~/.config/picom
fi

ln -sf "$SCRIPT_DIR/configs/nvim" ~/.config/nvim
