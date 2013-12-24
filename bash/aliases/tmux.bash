alias t='tmux -S ~/.tmux.socket'
alias ta='t attach -t'
alias tn='t new -s'
alias tap='ta pair'
alias tnp='ssh-agent tn pair'
alias tls='t list-sessions'
alias trm='t kill-session -t'

function _tmux_complete_session() {
    local IFS=$'\n'
    local cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( ${COMPREPLY[@]:-} $(compgen -W "$(tls | cut -f 1 -d ':')" -- "${cur}") )
}

complete -F _tmux_complete_session ta
