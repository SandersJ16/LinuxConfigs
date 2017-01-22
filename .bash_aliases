alias root='cd /'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ls='ls --color=auto -XF --group-directories-first'
alias lh='ls -AX | grep --color=always "^\." | grep --color=always "/\|" | ccolumn'
alias ld='ls --color=always -AXp |grep --color=always "/" | ccolumn'
alias lhd='ls -AX | grep --color=always "^\." | grep --color=always "/" | sort | ccolumn'
alias ldh='lhd'

alias tree='tree -L 2'
alias ltree='tree -L 2 -C|less -R'

alias chmod='chmod -v'

alias cp='cp -ivr'
alias mv='mv -iv'

alias sources='source ~/.bashrc'
alias aliases='less ~/.bash_aliases'

alias umount='sudo umount'
alias unmount='sudo umount'
alias unmountwindows='cd ~ && sudo umount /media/$USER/windows && back'
alias windows='. windows'

#alias searchtext='grep -nr . 2>/dev/null -Pe'

alias sublime='subl'
#alias python='python3'
alias pyunit='python -m unittest'
alias pyunit3='python3 -m unittest'

alias javac='javac -g'
alias gcc='gcc -g -Wall -Wextra'
alias g++='g++ --std=c++11 -g -Wall -Wextra'
alias mysql='mysql -u root -p'

alias vlc='vlc --started-from-file --playlist-enqueue'

alias install='sudo apt-get install'
alias update='sudo apt-get update'

alias back='cd $OLDPWD'
alias Documents='cd ~/Documents'
alias Downloads='cd ~/Downloads'
alias Code='cd ~/Code'
alias Pictures='cd ~/Pictures'
alias Music='cd ~/Music'
alias Scripts='cd ~/Code/Scripts'
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
