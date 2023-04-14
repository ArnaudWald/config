# Set up the prompt

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[OA" history-beginning-search-backward-end # or "^[[A" depending on your terminal
bindkey "^[OB" history-beginning-search-forward-end  # or "^[[B" depending on your terminal

# Load plugins
source ~/.oh-my-zsh/plugins/git/git.plugin.zsh
source ~/.oh-my-zsh/plugins/rand-quote/rand-quote.plugin.zsh
source ~/.oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh
source ~/.oh-my-zsh/plugins/wd/wd.plugin.zsh
source ~/.oh-my-zsh/plugins/web-search/web-search.plugin.zsh
source ~/.oh-my-zsh/plugins/vscode/vscode.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-shift-select/zsh-shift-select.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/ls/ls.plugin.zsh
plugins=(
    git
    ls
    common-aliases
    rand-quote
    wd
    web-search
    vscode
    zsh-shift-select
    zsh-syntax-highlighting
    zsh-autosuggestions
)

# Define some aliases
alias k=kubectl 
alias kns=kubens
alias kx=kubectx
alias d=docker
alias eit=exit # my x key is broken

# Define some environment variables
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5C6370"
export CLOUDSDK_PYTHON_SITEPACKAGES=1
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-beginning-search-backward-end history-beginning-search-forward-end)

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit


zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

emulate sh -c 'source /etc/profile'
# source ~/.zsh_plugins.sh
# source <(antibody init)

eval "$(oh-my-posh init zsh --config ~/.oh-my-posh.omp.json)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/awald/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/awald/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/awald/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/awald/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

cd ~/work_space
