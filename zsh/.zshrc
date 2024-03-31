# Joseph Lee's .zshrc
# https://github.com/joelee/Dotfiles
#

INIT_PATH="${HOME}/.dotfiles/zsh"
if [ -e "${INIT_PATH}/init.sh" ]; then
  source "${INIT_PATH}/init.sh"
else
  echo "ERROR: ZSH init script not found!"
fi
