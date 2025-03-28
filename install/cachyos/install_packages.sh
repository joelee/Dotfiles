#!/bin/bash
#

BASE_PATH="$(dirname $0)"
source "${BASE_PATH}/../../common/common_functions.bash"

PACMAN="$(which pacman)"
if [ -z "${PACMAN}" ]; then
	echo "pacman not found. This script only works on Arch Linux based distribution"
	exit 1
fi

if [ -z "$(which cachyos-hello)" ]; then
	echo "CachyOS is not detected. This install script is meant for CachyOS distribution only."
	exit 1
fi

echo "# CachyOS package installation"
echo "## Updating packages..."
sudo pacman -Syu

echo ""
echo "## Installing tty packages..."
# Tty packages only. No Kernel and GUI packages.
sudo pacman -S --noconfirm \
	btop \
	certbot \
	curl \
	eza \
	direnv \
	fastfetch \
	fd \
	ffmpeg \
	fish \
	fisher \
	fzf \
	jq \
	git \
	go \
	gnupg \
	helix \
	hugo \
	jdk21-openjdk \
	lsof \
	neovim \
	nerd-fonts \
	nodejs \
	npm \
	nvm \
	docker \
	docker-compose \
	pre-commit \
	pyenv \
	python \
	python-neovim \
	python-pip \
	python-pipx \
	python-poetry \
	rclone \
	ruby \
	rustup \
	starship \
	sxhkd \
	tk \
	tmux \
	tree-sitter \
	wget \
	yay \
	zoxide 

echo ""
echo "Install App packages..."
# App packages from Arch repos
sudo pacman -S --noconfirm \
	alacritty \
	bitwarden \
	chromium \
	dbeaver \
	discord \
	firefox \
	kitty \
	libreoffice-fresh \
	neovide \
	rofi \
	rofi-calc \
	rofimoji \
	syncthing \
	telegram-desktop \
	thunar \
	vlc \
	vscodium

# Required to run certain AppImages (eg. Bambu Studio)
# sudo pacman -S fuse2 webkit2gtk webkit2gtk-4.1


# Required to enable Yubikey authentication
sudo pacman -S pam-u2f yubikey-manager yubico-pam


# Hardware specific installation

# For CUDA supported system
# sudo pacman -S noconfirm ollama-cuda

# For non-CUDA supported system
# sudo pacman -S noconfirm ollama


# App packages I use: installed by yay
#
# yay -S --noconfirm novelwriter
# yay -S --noconfirm orca-slicer
# yay -S --noconfirm bambustudio-bin
# yay -S --noconfirm pycharm-professional
# yay -S --noconfirm logseq-desktop
# yay -S --noconfirm obsidian
# yay -S --noconfirm ticktick


# Enable services
sudo systemctl enable docker.service
sudo systemctl enable containerd.service


touch "${DOTFILES_LOCAL_PATH}/packages_installed"
echo ""
echo "Package installation completed."
echo ""


