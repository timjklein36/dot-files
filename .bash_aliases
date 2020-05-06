# some ls aliases
alias ll='ls -alF'
alias la='ls -lah --group-directories-first'
alias l='ls -CF'

# Python aliases
alias virtualenv='python /home/tim/.local/lib/python2.7/site-packages/virtualenv.py'


alias pg_start='docker run --rm --name postgres -v postgres:/var/lib/postgresql/data -e POSTGRES_HOST_AUTH_METHOD=trust -p 4532:5432 -d postgres:latest'
alias pg_stop='docker stop postgres'

alias scripts='cd ~/scripts'

# Git aliases
alias pull='git pull'
alias status='git status'
alias log='git log --pretty=oneline'
alias pushy='$(git push 2>&1 | grep "git push")'

# tmux aliases
alias killme='tmux kill-session'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
