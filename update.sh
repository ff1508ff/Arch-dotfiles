# update pacman packages
sudo pacman -Syu

# update yay(AUR) packages
sudo yay -Syu

# update rust
rustup self update
rustup update stable

# update cargo executables (e.g. zellij)
cargo install-update -a
