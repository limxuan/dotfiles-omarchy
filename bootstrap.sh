#!/usr/bin/env bash
set -e

# Always run from repo root
cd "$(dirname "$(realpath "$0")")"

echo "[+] Starting bootstrap..."

# --- Sanity checks -----------------------------------------------------------
[[ -f packages/pacman.txt ]] || { echo "[!] Missing packages/pacman.txt"; exit 1; }
[[ -f packages/aur.txt ]]    || { echo "[!] Missing packages/aur.txt"; exit 1; }

# --- Package installation ----------------------------------------------------
echo "[+] Installing pacman packages..."
sudo pacman -S --needed --noconfirm - < packages/pacman.txt

if ! command -v yay &>/dev/null; then
  echo "[+] Installing yay..."
  rm -rf /tmp/yay
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  (cd /tmp/yay && makepkg -si --noconfirm)
  rm -rf /tmp/yay
fi

echo "[+] Installing AUR packages with yay..."
yay -S --needed --noconfirm - < packages/aur.txt

# --- Cleanup conflicting configs --------------------------------------------
echo "[+] Cleaning conflicting config directories..."

remove_if_real() {
  local path="$1"
  if [ -e "$path" ] && [ ! -L "$path" ]; then
    echo "  - Removing $path"
    rm -rf "$path"
  fi
}

remove_if_real /etc/keyd
remove_if_real /etc/libinput
remove_if_real ~/.config/starship.toml
remove_if_real ~/.config/nvim
remove_if_real ~/.config/fish
remove_if_real ~/.config/hypr
remove_if_real ~/.config/tmux
remove_if_real ~/.config/waybar
remove_if_real ~/.config/alacritty
remove_if_real ~/.config/omarchy/themes
remove_if_real ~/.local/share/applications

# --- Stow system-level configs ----------------------------------------------
echo "[+] Stowing keyd..."
sudo stow -t / keyd
sudo systemctl enable --now keyd.service

# --- Stow user dotfiles ------------------------------------------------------
echo "[+] Stowing dotfiles..."
stow \
  alacritty \
  desktop-applications \
  fish \
  hypr \
  nvim \
  omarchy-themes \
  scripts \
  tmux \
  waybar

# --- Restart Waybar safely ---------------------------------------------------
echo "[+] Restarting Waybar..."
pkill waybar || true
waybar > ~/.cache/waybar.log 2>&1 & disown

# --- Reboot prompt -----------------------------------------------------------
echo
echo "[i] A reboot is recommended for keyd, compositor, and desktop changes."
read -rp "Reboot now to apply all changes? [y/N]: " answer

case "$answer" in
  [yY]|[yY][eE][sS])
    echo "[+] Rebooting..."
    sudo reboot
    ;;
  *)
    echo "[i] Reboot skipped. You may need to reboot manually later."
    ;;
esac
