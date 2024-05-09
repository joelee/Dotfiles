#!/bin/bash
#

pacman -Syu

# Tty packages only. No Kernel and GUI packages.
pacman -S --noconfirm \
	btop \
	certbot \
	curl \
	eza \
	direnv \
	fastfetch \
	ffmpeg \
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
	rclone \
	rustup \
	starship \
	sxhkd \
	wget \
	zoxide \
	zsh \
	zsh-autosuggestions \
	zsh-completions \
	zsh-history-substring-search \
	zsh-syntax-highlighting

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
