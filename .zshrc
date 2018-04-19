

#
# User configuration sourced by interactive shells
#

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh
export TERM=xterm-256color
source ~/.local/share/icons-in-terminal/icons_bash.sh


POWERLEVEL9K_INSTALLATION_PATH=~/.zim/modules/prompt/external-themes/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_MODE='nerdfont-complete'

# Prompts
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir virtualenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status os_icon time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=..
#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B4'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭"
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_middle
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰\uF460\uF460\uF460 "


POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
# Colors
POWERLEVEL9K_VIRTUALENV_BACKGROUND=107
POWERLEVEL9K_VIRTUALENV_FOREGROUND='white'
POWERLEVEL9K_OS_ICON_BACKGROUND='black'
OS_ICON=''
POWERLEVEL9K_OS_ICON_FOREGROUND='white'
POWERLEVEL9K_TIME_BACKGROUND='black'
POWERLEVEL9K_TIME_FOREGROUND='white'

# Battery colors

# Virtualenv colors
POWERLEVEL9K_VIRTUALENV_FOREGROUND='black'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='cyan'
# VCS colors
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'


CASE_SENSITIVE=true

export ZIM_HOME=~/.zim
export PATH=$PATH:/home/luka/.cargo/bin
export RUST_SRC_PATH=~/.multirust/toolchains/stable_x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export SSH_KEY_PATH=~/.ssh/rsa_id
export HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS
export PGDATA=/var/lib/postgresql/data
export SKIM_DEFAULT_COMMAND="git ls-tree -r --name-only HEAD | rg . || fd -t f"
export SKIM_DEFAULT_OPTIONS='--preview "cat {}"'

export FZF_DEFAULT_COMMAND="git ls-tree -r --name-only HEAD | rg . || fd -t f"
export FZF_DEFAULT_OPTS='--preview "cat {}" --bind "f1:execute(view  -u NONE --cmd \"syntax on\" {})"'


alias ls="exa"
export XDG_RUNTIME_DIR=/tmp/user/1000
alias tb="nc termbin.com 9999"
alias ctrlc"=xclip -sel clip -i"
alias ctrlv="xclip -sel clip -o"
alias up="sudo xbps-install -Su"
alias v="vim"
