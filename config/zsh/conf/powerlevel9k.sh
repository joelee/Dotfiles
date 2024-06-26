# Customise the Powerlevel9k prompts
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  ssh root_indicator dir dir_writable vcs
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  status command_execution_time background_jobs virtualenv pyenv aws
)

# https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
POWERLEVEL9K_MODE="nerdfont-complete"

# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="☁️ 云臻 "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="⛵️福顺"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="💠  "
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

POWERLEVEL9K_ANACONDA_FOREGROUND='229'
POWERLEVEL9K_ANACONDA_BACKGROUND='033'
POWERLEVEL9K_USER_DEFAULT_FOREGROUND='088'
POWERLEVEL9K_USER_DEFAULT_BACKGROUND='231'
POWERLEVEL9K_USER_ROOT_FOREGROUND='088'
POWERLEVEL9K_USER_ROOT_BACKGROUND='226'
POWERLEVEL9K_USER_SUDO_FOREGROUND='088'
POWERLEVEL9K_USER_SUDO_BACKGROUND='222'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='252'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='018'
POWERLEVEL9K_DIR_HOME_FOREGROUND='154'
POWERLEVEL9K_DIR_HOME_BACKGROUND='018'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='226'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='018'
POWERLEVEL9K_DIR_ETC_FOREGROUND='009'
POWERLEVEL9K_DIR_ETC_BACKGROUND='018'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_RAM_FOREGROUND='081'
POWERLEVEL9K_RAM_BACKGROUND='238'

POWERLEVEL9K_CUSTOM_CLOUDREACH="echo -n 云臻"
POWERLEVEL9K_CUSTOM_CLOUDREACH_FOREGROUND="222"
POWERLEVEL9K_CUSTOM_CLOUDREACH_BACKGROUND="160"

POWERLEVEL9K_USER_ICON="\uF415" # 
POWERLEVEL9K_ROOT_ICON="#"
POWERLEVEL9K_SUDO_ICON=$'\uF09C' # 
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=false
