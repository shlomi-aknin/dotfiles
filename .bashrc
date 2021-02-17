alias ls="exa-linux-x86_64 -alF --icons --group-directories-first"
eval "$(starship init bash)"
exec {BASH_XTRACEFD}>/dev/null
export EDITOR='nvim'
export LANG=en_US.UTF-8
set -o vi
shopt -s autocd
