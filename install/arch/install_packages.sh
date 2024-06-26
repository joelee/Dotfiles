#!/bin/bash
#

source "$DOTFILES_HOME/init.sh"

PACMAN="$(which pacman)"
if [ -z "${PACMAN}" ]; then
	echo "pacman not found. This script only works on Arch Linux based distribution"
	exit 1
fi

echo "# Arch Linux package installation"
echo "## Updating packages..."
pacman -Syu

echo ""
echo "## Installing tty packages..."
# Tty packages only. No Kernel and GUI packages.
pacman -S --noconfirm \
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
	lsof \
	neovim \
	nerd-fonts \
	nodejs \
	npm \
	ollama \
	podman \
	podman-compose \
	podman-docker \
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
	tmux \
	tree-sitter \
	wget \
	zoxide \
	zsh \
	zsh-autosuggestions \
	zsh-completions \
	zsh-history-substring-search \
	zsh-syntax-highlighting

echo ""
echo "Install App packages..."
# App packages from Arch repos
pacman -S --noconfirm \
	alacritty \
	bitwarden \
	chromium \
	conky \
	discord \
	firefox \
	kitty \
	neovide \
	telegram-desktop \
	thunar \
	vlc

# App packages from flatpak
#
# trilium-notes
# DBeaver Community
# Podman Desktop
# VSCodium
#

touch "${DOTFILES_LOCAL_PATH}/packages_installed"
echo ""
echo "Package installation completed."
