# Set up command history.
export HISTSIZE=100000
export HISTFILESIZE=100000
# Make shells write to history immediately instead of on exit.
shopt -s histappend
export PROMPT_COMMAND='history -a'

set -o emacs
# set -o vi

# Set up prompt.
export PS1="[\$(date +%Y%m%d_%H%M%S)] \u@\h:\w\n\$ "
export PS1="\[\033[01;32m\][\$(date +%Y%m%d_%H%M%S)] \u@\h\[\033[00m\]:\[\033[01;34m\]\w\n\[\033[00m\]\$ "

# Set up "less".
export LESS='-r-i-P%f (%i/%m) Line %lt/%L' #Better prompt, case-insensitive search by default.

#Aliases.
alias be='bundle exec'
alias bi='bundle install --quiet'
alias l='ls -alF'

#Functions.
function latest {
    ls -t $1/* | head -n 1
}
function toss {
    for filename; do
        if [ -e $HOME/.Trash/$filename ]; then
            mv "${filename}" "${HOME}/.Trash/${filename}$(date +%Y%m%d%H%M%S)"
        else
            mv "${filename}" "${HOME}/.Trash"
        fi
    done
}
