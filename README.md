# Setups
## Launch 🚀
```
git clone https://github.com/limxuan/dotfiles-omarchy
cd dotfiles-omarchy
chmod 777 bootstrap.sh
./bootstrap.sh
```
## Omarchy
- Disable screensaver: Omarchy Menu > Trigger > Toggle > Screensaver

## Alacritty
- Install > Terminal > Alacritty

## Bitwarden
- Show Tray Icon
- Close to Tray
- Start automatically on login

#### SSH Setup
- Enable SSH Agent in Settings > SSH Agent
- Ask authorisation > Remember until vault is locked

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
