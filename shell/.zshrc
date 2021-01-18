export ZSH="/home/nat/.oh-my-zsh"
export PATH=~/code/ext/kotlin-language-server/server/build/install/server/bin:$PATH
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='emacs'
fi

source ~/.config/aliases

fix_wsl2_interop() {
    for i in $(pstree -np -s $$ | grep -o -E '[0-9]+'); do
        if [[ -e "/run/WSL/${i}_interop" ]]; then
            export WSL_INTEROP=/run/WSL/${i}_interop
        fi
    done
}

