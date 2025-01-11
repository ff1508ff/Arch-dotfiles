#!/bin/bash

# Update system
echo "========== Update =========="
sudo pacman -Syu

# Config

## Git (version manager)(https://git-scm.com/)
echo "========== Installing git =========="
sudo pacman -S git

## ssh for git
echo "========== Seting up ssh for git =========="
echo "# Private
Host github.com
        Hostname github.com
        IdentityFile=~/.ssh/githubff
" | cat >>~/.ssh/config

### creating ssh key for github
echo -e ~/.ssh/githubff | ssh-keygen -t ed25519 -C "111969821+ff1508ff@users.noreply.github.com"

### adding ssh key to github
wl-coppy <~/.ssh/githubff.pub
echo "https://github.com/settings/keys (key in clipboard)"

read -r -p "Press ENTER to continue"
read -r -p "you sure?"

## geting config files from repo
git clone git@github.com:ff1508ff/Arch-dotfiles.git ~/projects/Arch-dotfiles

## moving existing configs
mv ~/.config/* ~/projects/Arch-dotfiles/.config

## remove existing files/folde
echo "========== Removing existing config files =========="
rm -rf ~/.config
rm ~/.bashrc

## Stow (creates symlinks in the /home direcotory to the config files in this directory)(https://www.gnu.org/software/stow/)
echo "========== Stow and symlinks =========="
sudo pacman -S stow
cd ~/projects/Arch-dotfiles/
stow . -t ~/

## symlinks
### C/C++ "default" format config
sudo ln -s ~/.config/nvim/lsp-conf/c/.clang-format /.clang-format

# Programs

## yay (AUR helper)(https://github.com/Jguer/yay)
echo "========== Installing yay =========="
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
rm -rf ./yay

## Discord (comunication app)(https://discord.com/)
echo "========== Installing discord =========="
sudo pacman -S discord

## Chrome (browser)(https://www.google.com/chrome/)
echo "========== Installing google-chrome =========="
yay -S google-chrome

## Zsh (better shell)(https://zsh.sourceforge.io/)
echo "========== Installing zsh =========="
sudo pacman -S zsh
chsh -s $(which zsh) # make Zsh default shell

## Neovim (code Editor)(https://github.com/neovim/neovim)
echo "========== Installing neovim =========="
sudo pacman -S neovim
sudo pacman -S wl-clipboard # access to system clipboard (for Wayland)(https://github.com/bugaevc/wl-clipboard)
sudo pacman -S ripgrep      # used for fuzzyfinder plugin in Neovim(https://github.com/BurntSushi/ripgrep)

## Zoxide (nice tool to quicly jump from folder to folder)(https://github.com/ajeetdsouza/zoxide)
echo "========== Installing zoxide =========="
sudo pacman -S zoxide

## C/C++ (programming Language)
echo "========== Installing c/c++ tools =========="
sudo pacman -S gcc        # compiler
sudo pacman -S cmake make # build tools

## Rust (programming Language)(https://www.rust-lang.org/)
echo "========== Installing rust =========="
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh # install everything
. "$HOME/.cargo/env"                                           # make cargo accessible
rustup component add rust-analyzer                             # LSP (Language Server Protocol)

## Zellij (terminal multiplexer)(https://github.com/zellij-org/zellij)
echo "========== Installing zellij =========="
cargo install --locked zellij

## fzf (fuzzy finder)(https://github.com/junegunn/fzf)
echo "========== Installing fzf =========="
sudo pacman -S fzf

## cargo-update (Cargo executables updater)(https://crates.io/crates/cargo-update)
echo "========== Installing cargo-update =========="
cargo install cargo-update
cargo install-update -a

## Python (programming Language)(https://www.python.org/)
echo "========== Installing python =========="
sudo pacman -S python     # interpreter
sudo pacman -S python-pip # package manager

## Node (programming Language)(https://nodejs.org/en)
echo "========== Installing node =========="
curl -o- https://fnm.vercel.app/install | bash
fnm install 22

## Docker (container manager/hoster)(https://www.docker.com/)
echo "========== Installing docker =========="
sudo pacman -S docker

## Lazygit (TUI(Terminal User Interface) for git)(https://github.com/jesseduffield/lazygit)
echo "========== Installing lazygit =========="
sudo pacman -S lazygit

## Lazydocker (TUI(Terminal User Interface) for docker)(https://github.com/jesseduffield/lazydocker)
echo "========== Installing lazydocker =========="
yay -S lazydocker

## Zathura (pdf viewer)(https://github.com/pwmt/zathura)
echo "========== Installing zathura =========="
sudo pacman -S zathura

## Starship (make the terminal look good)(https://github.com/starship/starship)
echo "========== Installing starship =========="
sudo pacman -S starship
