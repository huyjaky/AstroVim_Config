export QT_IM_MODULE=fcitx # For those who bundle qt im module, e.g. WPS, Anki, you should find a .so file with fcitx in the file name
export QT_IM_MODULE=ibus # For those who bundle ibus im module shipped with Qt, you should find libibusplatforminputcontextplugin.so in the package.
export QT_QPA_PLATFORM=xcb QT_IM_MODULE=ibus # Enforce it to run on X11/XWayland and use ibus im module
export QT_IM_MODULES="wayland;fcitx;ibus"
export SETUPTOOLS_USE_DISTUTILS=1
export DISABLE_AUTO_UPDATE="true"

# HACK: Export ENV
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
export PYOPENGL_PLATFORM=osmesa
export PRIMARY_MONITOR_WORKSPACE=1 
export SECONDARY_MONITOR_WORKSPACE=2
export VIRTUAL_ENV_DISABLE_PROMPT=1
export MYPYPATH="/home/duckq1u/miniconda3/envs/pytorch"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/duckq1u/.cache/lm-studio/bin"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/duckq1/.lmstudio/bin"

# HACK:: Show up startup packaging 
# zmodload zsh/zprof

# HACK: Config auto-suggestion as well as oh-my-posh
eval "$(oh-my-posh init zsh --config ~/montys.omp.json)"


# HACK: Config Zinit
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# NOTE: Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light agkozak/zsh-z


# HACK: NVM config init
# Initialize fast node manager (fnm)
[[ $(command -v "fnm") ]] && eval "$(fnm env --use-on-cd --log-level=quiet)"


# HACK: Shell intergrations
eval eval "$(fzf --zsh)"


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
zstyle ':completion:*' menu select

# HACK: Alias config area 
alias nv='nvim'
alias lz='lazygit'
# alias la='eza --color=always --long --git --no-filesize --icons=always --no-time --no-permissions -a'
alias ls='eza -a --icons=always --color=always --git'
alias hh='cd ~'
alias showport='sudo lsof -i -P -n | grep LISTEN'
alias shutdowntime='sudo shutdown -h +60'
alias docs='cd ~/Documents/'
alias zrok='~/Documents/appimage/zrok'

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

jointmux(){
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
}

appearance(){
  # pokemon-colorscripts -n charizard -f mega-x
  # pokemon-colorscripts -n darkrai --no-title
  cat ~/.conda/environments.txt
}

cls(){
  clear
  appearance
}

rs(){
  zsh
  appearance
}
reloadbar(){
  exec
  killall ags ydotool
  ags &
}
alias listpkg='pacman -Qm'
alias vesktop='vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime --wayland-text-input-v3' # bsidian --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime'
alias obsidian='obsidian --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime --wayland-text-input-v3'
alias llm='~/Documents/appimage/LM_Studio-0.3.5.AppImage'
alias via='~/Documents/appimage/via-3.0.0-linux.AppImage --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime --wayland-text-input-v3'
alias tmat='jointmux'
alias tmdt='tmux detach'

# HACK: Init command
appearance

# HACK: Keybindings
bindkey '^g' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey "^H" backward-delete-word
bindkey -s "^L" "/C-l"

# zprof
# conda env list

# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/duckq1/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/duckq1u/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/duckq1u/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/duckq1u/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup


# zprof
