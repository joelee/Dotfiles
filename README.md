# Dotfiles
My personal dotfiles for Linux and MacOs


## Install Dotfiles
```bash
cd $HOME
git clone https://github.com/joelee/Dotfiles.git

cd Dotfiles
export DOTFILES_HOME="$(pwd)"

cp .env.sample .env
# Edit the .env file
vim .env

```

### Arch Linux based distributions
```bash
install/arch/configure.sh
```

### Mac OS
**Prerequisite:** [Homebrew](https://brew.sh/)
```bash
install/macos/configure.sh
```
