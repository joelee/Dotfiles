
#if [ -z `command -v colorls` ]; then
#  alias l="ls"
#  alias ll="ls -hlG"
#  alias lll="ls -halG"
#else
#  alias l="colorls --sd"
#  alias ll="colorls -l --sd"
#  alias lll="colorls -lA --sd"
#fi
#alias llll="ls -hailG"

# https://github.com/eza-community/eza
# brew install eza
EZA_CMD="eza --group-directories-first --icons=auto --time-style relative"
alias l="$EZA_CMD"
alias ls="eza"
alias la="$EZA_CMD -a"
alias ll="$EZA_CMD -lh --git"
alias lll="$EZA_CMD -lha --git"
alias llll="$EZA_CMD -lhaiHgM --git --extended --context"

alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."
alias -g NUL="> /dev/null 2>&1"
alias -g NULL="> /dev/null 2>&1"



alias du="du -h"
alias duu="du -d1 -h"
alias nn="lsof -i | grep LISTEN"
alias nnn="lsof -i"

alias df="df -Phl"
alias pp="ps awux"
alias ppl="ps awux | less"
alias sl="screen -list"
alias sr="screen -r"
alias sdr="screen -d -r"
alias w="who"
alias cb="cd .."
alias cd..="cd .."
alias d="pwd"
alias si="uname -a; echo '---'; echo 'Uptime:'; uptime; echo '---'; free -m; echo '---';  df -kTh"
alias super="sudo zsh"
alias mkdir="mkdir -p"
alias h="history"
alias j="jobs -l"
alias which="type -a"
alias x="exit"
alias more="less"
alias path='echo -e ${PATH//:/\\n}'
alias pingg='ping -c 5'
alias pingoo='ping -c 5 google.com'

# App specific aliases
alias vi=nvim
alias vim=nvim
alias nv=neovide
alias gvim=neovide

# Docker Aliases
alias dk="docker"
alias dki="docker images"
alias dkps="docker ps"
alias dkpa="docker ps -a"
alias dkr="docker run"
alias dks="docker start"
alias dkx="docker stop"
alias dkrm="docker rm"
alias dkrmi="docker rmi"
alias dkcr="docker create"
alias dkb="docker build"
alias dkt="docker tag"
alias dkpull="docker pull"
alias dkpush="docker push"
alias dkh="alias | grep '^dk'"




alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

alias rsync-av="rsync -avh --progress --partial"

# My additional GIT aliases
alias g="git"
alias gst="git status"
alias gpoh="git push origin HEAD"
alias ga.="git add ."
alias gcm="git commit -m"
alias gfop="git fetch origin -p"
alias gdf="git diff"
alias gdfs="git diff --staged"
alias grbm="git rebase origin/master"
alias gmomm="git merge origin/master -m 'Merge remote-tracking branch origin/master'"
alias pcr="pre-commit run -a"

alias awsid='echo "$(aws sts get-caller-identity)"'

## GCP aliases
alias gcp-functions="$(which functions | grep .nvm | awk '{print $3}')"

## OS specific aliases
OS_UNAME="$(uname -s)"
### MacOS
if [ "${OS_UNAME}" == "Darwin" ]; then
    ## Emulate Linux commands
    alias lsusb="ioreg -p IOUSB"
    alias lsusb-v="system_profiler SPUSBDataType"

    ## HomeBrew aliases
    alias b="brew"
    alias bu="brew update"
    alias bo="brew outdated"
    alias bupgrade="brew upgrade"
    alias bdoc="brew doctor"
    alias bi="brew info"

    ## Apps
    alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox-bin"

    ## Yabai aliases
    alias yabai-active-apps="yabai -m query --windows | jq -r '[.[].app] | unique | sort'"

### Linux
elif [ "${OS_UNAME}" == "Linux" ]; then
    alias free="free -m"

###
else
    echo "If you are serious about using a computer that is reliable, secure, and open, then you should consider switching to Linux or Mac."
    echo "Microsoft has a long history of messing up common standards to supress competition, aggrasive marketing techniques, bundling bloatwares, and pushing users to use them."
    echo "Switch to Linux or MacOS, and be free!"
fi
