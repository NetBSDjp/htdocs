alias l='ls -F'
alias ls='ls -F'
alias ll='ls -lF'
alias la='ls -Fa'
alias lla='ls -lFa'
alias llt='ls -lFt'
#alias emacs='emacs `case $DISPLAY"x" in x) ;; *) echo -fn tiny ;; esac`'
alias standby='(sudo ifconfig ne0 down && zzz) && sleep 2 && sudo ifconfig ne0 up'

MAILPATH=/var/mail/$USER
PS1='\t \u@\h[\w]$ '
export PS1 MAILPATH

stty crt
