alias root='cd /'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'

alias ls='ls --color=auto -XF --group-directories-first'
alias lh='ls -AX | GREP_COLOR="01;36" grep -P "(?<=\.).+@|$" --color=always | grep --color=always "^\." | grep --color=always "/\|" | ccolumn'
alias lh='ls -AX --color=always | grep -P "^(\x1b\[[^mK]*(m|K))?\." --color=no | ccolumn'
alias ld='ls --color=always -Xp | grep --color=always "/" | ccolumn'
alias lhd='ls -AX --color=always | grep -P "^(\x1b\[[^mK]*(m|K))?\." --color=no | grep --color=no "/$" | ccolumn'
alias lhf='ls -AX --color=always | grep -P "^(\x1b\[[^mK]*(m|K))?\." --color=no | grep -v --color=no "/$" | ccolumn'
alias lss='ls -la | grep -oP --color=never "[\w.]+ -> /?[\w+.]+(/[\w+.]*)*$" | GREP_COLOR="01;36" grep -P --color=always "^.+(?= ->)" | ccolumn'

alias tree='tree -L 2'
alias ltree='tree -L 2 -C|less -R'

alias chmod='chmod -v'

alias cp='cp -ivr'
alias mv='mv -iv'
alias rm='rm -Iv'

alias sources='source ~/.bashrc'
alias aliases='less ~/.bash_aliases'
alias gnomeextensioninstall='gnome-shell-extension-tool -e'

alias umount='sudo umount'
alias unmount='sudo umount'
alias unmountwindows='cd ~ && sudo umount /media/$USER/windows && back'
alias windows='. windows'
alias gordon='smbclient //192.168.0.15/Media -Ujustin%'

alias sublime='subl'
alias pyunit='python -m unittest'
alias haskell='ghci'

alias javac='javac -g'
alias gcc='gcc -g -Wall -Wextra'
alias g++='g++ --std=c++11 -g -Wall -Wextra'

alias npm-exec='PATH=$(npm bin):$PATH'
alias yarn-exec='PATH=$(yarn bin):$PATH'

alias vlc='vlc --started-from-file --playlist-enqueue'

alias install='sudo apt install'
alias update='sudo apt update'
alias remove='sudo apt remove'

alias back='cd $OLDPWD'
alias Documents='cd ~/Documents'
alias Downloads='cd ~/Downloads'
alias Code='cd ~/Code'
alias Pictures='cd ~/Pictures'
alias Music='cd ~/Music'
alias Videos='cd ~/Videos'
alias Books='cd ~/Books'

alias shutdown='sudo poweroff'
alias poweroff='sudo poweroff'
alias restart='sudo reboot'
alias reboot='sudo reboot'
alias lock='gnome-screensaver-command -l'
alias signout='gnome-session-quit'

alias whoareyou='echo $HOSTNAME'
alias getmac='ifconfig | grep "HWaddr"'
alias checknetwork='arp -a'

alias version='lsb_release -a'
alias changejava='sudo update-alternatives --config java'

alias wifi='sudo iwlist wlp4s0 scan| grep --color=always "ESSID: *"|sort|uniq'
alias espeak='espeak -ven-us+f3 -s 140'

alias gbpurge='git branch --merged | grep -v "\*" | grep -v "master" | grep -v "develop" | grep -v "staging" | xargs -n 1 git branch -d'

alias docker-image-purge='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
