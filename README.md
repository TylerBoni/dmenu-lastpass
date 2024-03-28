#  dmenu-lastpass
This project aims to be a read-only interface for LastPass exclusively for the Linux + X11 | Wayland desktop environment. It uses dmenu/bemenu to search for your passwords and copy them to the clipboard.

![screenshot](https://i.imgur.com/kzPdrfu.png)

## Features
- UI: uses dmenu/bemenu for a simple, fast, familar, and keyboard-driven interface.
- Security: uses the ['SECONDARY' clipboard](https://specifications.freedesktop.org/clipboards-spec/clipboards-latest.txt). Does not use your regular (Ctrl-C,Ctrl-V) clipboard and clears the password after the first use. 
- Works with both X11 and Wayland.

## Requirements
### X11
- `dmenu`
- `xsel`

### Wayland
- `bemenu`
- `wl-clipboard`

## Usage
1. Run `lpass login` in your terminal to authenticate.
2. Run `./lastpass-dmenu.sh` in your terminal to search for your password.
3. Select the password you want to copy to the clipboard.
4. Paste the password into the desired field. The password will be cleared from the clipboard after the first use.


## LICENCE
MIT
