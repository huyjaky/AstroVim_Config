# zmodload zsh/zprof
# export TERM=screen-256color

export LUA_PATH="/usr/bin/lua/5.1/lua"
export LUA_CPATH="/usr/bin/lua/5.1/luac"

SESSION_NAME="duckq"

# Check if already inside a tmux session
if [ -n "$TMUX" ]; then
  echo ""
else
  # Check if the tmux session already exists
  if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    # Attach to the existing tmux session
    tmux attach-session -t $SESSION_NAME
  else
    # Start a new tmux session
    tmux new-session -d -s $SESSION_NAME
    tmux attach-session -t $SESSION_NAME
  fi
fi


# HACK: config brew beacause i install zsh by brew
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# HACK: Config auto-suggestion as well as oh-my-posh
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/montys.omp.json)"

# HACK: Export ENV
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# HACK: Config Zinit
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# HACK: NVM config init
# Initialize fast node manager (fnm)
export NVM_LAZY=1
export NVM_AUTO_USE=false

[[ $(command -v "fnm") ]] && eval "$(fnm env --use-on-cd --log-level=quiet)"
# load my nvm to fnm shim
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# These additions to PATH cannot be in zshenv due to order of execution.
export PATH="$(brew --prefix)/opt/util-linux/sbin:$(brew --prefix)/opt/util-linux/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
if [[ $(command -v "jenv") ]]; then
  function jenv() {
    unset -f jenv
    eval "$(command jenv init -)"
    jenv "$@"
  }
fi

# HACK: >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# conda config --set auto_activate_base false
# <<< conda initialize <<<

# HACK: Shell intergrations
eval eval "$(fzf --zsh)"

# NOTE: Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# HACK: Load completions
autoload -U compinit && compinit

# HACK: Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# End of lines configured by zsh-newuser-install

# HACK: Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# HACK: Alias config area 
alias rs='zsh'
alias nv='nvim'
alias lz='lazygit'
alias cls='clear'
alias la='eza --color=always --long --git --no-filesize --icons=always --no-time --no-permissions'
alias hh='cd ~'
alias tmat='tmux at -t'
alias tmdt='tmux detach'
alias showport='sudo lsof -i -P -n | grep LISTEN'
alias shutdown='sudo shutdown -h +60'

# HACK: init tmux
# tmat duckq

# HACK: Init command
neofetch
cat ~/.conda/environments.txt
echo ~/usr/base

# HACK: Keybindings
bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
# zprof
# conda env list
