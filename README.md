#  dmenu-lastpass
This project aims to be a read-only interface for LastPass exclusively for the Linux + X11 or Wayland desktop environment. It uses dmenu/bemenu to search for your passwords and copy them to the clipboard.

![screenshot](https://i.imgur.com/kzPdrfu.png)

## Features
- UI: uses dmenu/bemenu for a simple, fast, familar, and keyboard-driven interface.
- Security: passwords are cleared from the clipboard after the first use.
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
2. Copy the `lastpass-dmenu.sh` script to your PATH (ie: ~/.local/bin/)
2. Run `lastpass-dmenu.sh` in your terminal to search for your password.
3. Select the password you want to copy to the clipboard.
4. Paste the password into the desired field. The password will be cleared from the clipboard after the first use.

## TroubleShooting
- If you are having trouble with the clipboard, try running `wl-clipboard` or `xsel` in the terminal to see if they are working correctly.
- If you are having trouble with the login, try running `lpass login` in the terminal to see if it is working correctly.
- If the menu is not showing up, try running bemenu or dmenu in the terminal to see if they are working correctly.

## Sidenote
Yes, I know that bemenu also works on X11, but most people already use dmenu, so I included it as the default.

## License
MIT
