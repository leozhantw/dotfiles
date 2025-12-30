# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Options
setopt AUTO_CD

# History search with arrow keys
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Word navigation (Ctrl+←/→)
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Fzf history search (Ctrl+R)
fzf-history-widget() {
  local selected=$(fc -rln 1 | fzf --height 40% --reverse)
  if [[ -n "$selected" ]]; then
    LBUFFER="$selected"
  fi
  zle redisplay
}
zle -N fzf-history-widget
bindkey "^R" fzf-history-widget

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Plugins (via Homebrew)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# PATH
PATH="/opt/homebrew/bin:$PATH"
PATH="/Users/leozhan/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# Environment
export HOMEBREW_CASK_OPTS="--appdir=/Users/leozhan/Applications"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Modern CLI tools
alias reload="source ~/.zshrc"
alias zshhelp='bat ~/.dotfiles/zsh-help.md'
alias ls='eza'
alias l='eza -lbF --git'
alias ll='eza -lbGF --git'
alias la='eza -labF --git'
alias cat='bat'

# Git
alias git='LANG=en_GB git'
alias ghclear='git pl && git fp && git branch --merged | egrep -v "(\\*|staging|testing|master|main)" | xargs git branch -d'
alias ghbr='git switch $(git branch --format="%(if)%(HEAD)%(then)* %(else)  %(end)%(refname:short)" | fzf | sed "s/^..//")'

# Kubernetes
alias kc="kubectl"
alias kcx="kubectx"
alias kcns="kubens"
kcsh() {
  kubectl exec -it $1 -- sh
}

# Tools
alias claude="$HOME/.claude/local/claude"

# Google Cloud SDK
[[ -f ~/google-cloud-sdk/path.zsh.inc ]] && source ~/google-cloud-sdk/path.zsh.inc
[[ -f ~/google-cloud-sdk/completion.zsh.inc ]] && source ~/google-cloud-sdk/completion.zsh.inc

# fnm (Fast Node Manager)
eval "$(fnm env --use-on-cd)"

# Local config
[[ -f ~/.customrc ]] && source ~/.customrc

# Starship prompt (must be at the end)
eval "$(starship init zsh)"
