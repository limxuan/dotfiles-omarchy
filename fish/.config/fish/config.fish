alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git checkout"
alias gcc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias c="clear"
alias v="nvim"
alias ls="eza -l -g --icons"
alias lst="eza -g --icons --tree --level=2 -a"
alias ll="displayplacer \"degree:270\""
alias oo="displayplacer \"degree:0\""
alias rr="displayplacer \"degree:90\""
alias t="tmux"
alias tks="tmux kill-server"
alias trs=tmux_reset
alias db="nvim -c \"DBUI\""
alias pbcp="pbcopy"
set fish_greeting


# Setting PATH for Python 3.10
# The original version is saved in /Users/limxuan/.config/fish/config.fish.pysave
 set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"
 set -g -x NODE_ENV "development"
set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME $HOME/.config
bind \cn open_nvim
bind \co open_lazygit
bind \cg edit_command 
bind \cs check_tmux
bind \ce edit_clipboard

zoxide init fish | source
starship init fish | source

mkdir -p $XDG_CONFIG_HOME/fish/completions
mkdir -p $XDG_CONFIG_HOME/fish/functions
mkdir -p $XDG_CONFIG_HOME/fish/conf.d
