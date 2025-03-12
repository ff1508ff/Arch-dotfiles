# update pacman packages
echo "========== pacman =========="
sudo pacman -Syu

# update yay(AUR) packages
echo "========== yay =========="
sudo yay -Syu

# update rust
echo "========== rust =========="
rustup self update
rustup update stable

# update cargo executables (e.g. zellij)
echo "========== rust executables =========="
cargo install-update -a
