# .bashrc

# test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
# test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Source global definitions
# if [ -f /etc/bashrc ]; then
#     . /etc/bashrc
# fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
#
# if [ -t 1 ]; then
#   exec zsh
# fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# if [ -d ~/.bashrc.d ]; then
#     for rc in ~/.bashrc.d/*; do
#         if [ -f "$rc" ]; then
#             . "$rc"
#         fi
#     done
# fi
# unset rc


# zsh

#
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/usr/etc/profile.d/conda.sh" ]; then
#         . "/usr/etc/profile.d/conda.sh"
#     else
#         export PATH="/usr/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<
. "$HOME/.cargo/env"
