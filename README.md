# My dotfiles
<b>Author:</b> Robin Jonsson<br>
<b>Created:</b> 2017-08-05 (YYYY-MM-DD)

## Software List
- Zsh
- NeoVim
- Tmux
- Alacritty (https://github.com/jwilm/alacritty)

## Installation
1. Set up folder structure
```
mkdir -p ~/Git/Github/Robin-Jonsson
git clone https://github.com/Robin-Jonsson/dotfiles ~/Git/Github/Robin-Jonsson/dotfiles
```
2. Source the files, ex.
```
mv ~/.zshrc ~/.zshrc.OLD
echo "source ~/Git/Github/Robin-Jonsson/dotfiles/Zsh/.zshrc" > ~/.zshrc
```
or:
```
mv ~/.zshrc ~/.zshrc.OLD
ln -s ~/Git/Github/Robin-Jonsson/dotfiles/Zsh/.zshrc ~/.zshrc
```
I like to source files when possible, so I'm reminded to edit the git repo and not just the local file.

## Screenshot
![Screenshot of Zsh Prompt](https://raw.githubusercontent.com/Robin-Jonsson/dotfiles/master/screenshot.png)

## Colors
https://coolors.co/dadcd8-746560-0f1218-edbe2c-6a70d9

`#DADCD8` - "Timberwolf"

`#746560` - "Dim Gray"

`#0F1218` - "Rich Black FOGRA 29"

`#EDBE2C` - "Saffron"

`#6A70D9` - "Violet Blue Crayola"

## Known Issues
### Powerline symbols
- use the [NerdFont](https://github.com/ryanoasis/nerd-fonts) patched variant of Ubuntu Mono
