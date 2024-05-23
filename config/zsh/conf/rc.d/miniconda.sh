init_conda() {
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  CONDA_PATH="${HOME}/opt/miniconda3"
  if [ ! -e "${CONDA_PATH}" ]; then
    exit 1
  fi
  unalias conda
  __conda_setup="$(${CONDA_PATH}/bin/conda 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    if [ -f "${CONDA_PATH}/etc/profile.d/conda.sh" ]; then
      . "${CONDA_PATH}/etc/profile.d/conda.sh"
    else
      export PATH="${CONDA_PATH}/bin:$PATH"
    fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<
}
alias conda="echo 'run \"init_conda\" to activate miniconda'"
