# Setups
## 1. Setup Bitwarden SSH Agent
### Bitwarden Settings
- Show Tray Icon
- Close to Tray
- Start automatically on login

#### SSH Setup
- Enable SSH Agent in Settings > SSH Agent
- Ask authorisation > Remember until vault is locked
## 2. Launch 🚀
```
sudo pacman -Syyu
git clone git@github.com:limxuan/dotfiles-omarchy.git
cd dotfiles-omarchy
chmod 777 bootstrap.sh
sudo ./bootstrap.sh
```

## Scripts

### `install-packages.sh`
Install or update packages from `packages/pacman.txt` (official repos) and `packages/aur.txt` (AUR via yay). Also regenerates desktop entries.
```bash
./install-packages.sh
```

### `setup-desktop-entries.sh`
Generate `.desktop` files from declarative definitions in `packages/apps.sh`. Edit `packages/apps.sh` to add/remove web apps, TUI apps, or omarchy shortcuts, then run:
```bash
./setup-desktop-entries.sh
```

## Omarchy
- Disable screensaver: Omarchy Menu > Trigger > Toggle > Screensaver

## Alacritty
- Install > Terminal > Alacritty

## Chromium
### Extensions
- [Bitwarden](https://chromewebstore.google.com/detail/bitwarden-password-manage/nngceckbapebfimnlniiiahkandclblb?hl=en)
- [Close Other Tabs+](https://chromewebstore.google.com/detail/close-other-tabs+/higiahnfphokonkjalljdfgjhafdjbil?hl=en)
- [Dark Reader](https://chromewebstore.google.com/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh?hl=en) → Toggle current site `alt+d`
- [uBlock Origin Lite](https://chromewebstore.google.com/detail/ublock-origin-lite/ddkjiahejlhfcafbddmgiahcphecmpfh?hl=en)
- [Vimium C](https://chromewebstore.google.com/detail/vimium-c-all-by-keyboard/hfjbmagddngcpeloejdejnfgbamkjaeg?hl=en)
- [SponsorBlock](https://chromewebstore.google.com/detail/sponsorblock-for-youtube/mnjggcdmjocbbbhaepdhchncahnbgone?hl=en)

## Limine Setup
#### For dualbooting
- To prevent limine from having a timeout edit `/boot/limine.conf`
```
timeout: 0
default_entry: none
```
