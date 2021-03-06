#!/bin/sh
# Ansible managed
alias findtextfiles='find . -type f \! -regex ".*\.\(jpg\|ico\|bmp\|jpeg\|png\|svg\|psd\|swf\|z\|tar\|zip\|bz2\|7z\|gz\|tgz\|phar\|jar\)" \! -path "*svn*" \! -path "*.git/*"'
alias todosr='find . -type f \! -regex ".*\.\(jpg\|ico\|bmp\|jpeg\|png\|svg\|psd\|swf\|z\|tar\|zip\|bz2\|7z\|gz\|tgz\|phar\|jar\)" \! -path "*svn*" \! -path "*.git/*" -exec todos {} \;'
alias rmt='trash-put'
alias wanhost='curl -s ipinfo.io | jq -r .hostname'
alias vi='vim'
alias tmls='tmux ls'
alias dkrmorph='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias findtilde='find . -name "*~"'
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias pip3upgrade='sudo pip3 freeze --local | grep -v '\''^\-e'\'' | cut -d = -f 1  | sudo xargs pip3 install -U'
alias wanip2='dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | tr -d "\""'
alias egrep='egrep --color=auto'
alias la='ls -lhAF'
alias ll='ls -lhaF'
alias bc='bc -l'
alias ack='ack-grep'
alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'''
alias rmgit='rm -rf `find . -type d -name .git`'
alias dufr='du -sk * | sort -nr | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'''
alias tm='tmux'
alias emacs='emacs -nw'
alias ls='ls --color=auto'
alias fromdosr='find . -type f \! -regex ".*\.\(jpg\|ico\|bmp\|jpeg\|png\|svg\|psd\|swf\|z\|tar\|zip\|bz2\|7z\|gz\|tgz\|phar\|jar\)" \! -path "*svn*" \! -path "*.git/*" -exec fromdos {} \;'
alias wanhost2='curl ifconfig.me/host'
alias dus='du -s'
alias fgrep='fgrep --color=auto'
alias clr='clear'
alias ackp='ack-grep --nocolor --pager="less -r"'
alias dkrmexit='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'
alias dk='docker'
alias vdir='ls --color=auto --format=long'
alias df='df -hT --total'
alias findsvn='find . -type d -name .svn'
alias screen='screen -'
alias findcrlf='find . -not -type d -exec file "{}" ";" | grep CRLF'
alias dkrmvol='docker volume rm $(docker volume ls -q --filter "dangling=true")'
alias rmmac='rm -rf `find . \( -type d -name "__MACOSX" \) -o \( -type f -name ".DS_Store" \)`'
alias rmtilde='rm -f `find . -name "*~"`'
alias suvi='sudo vim'
alias du='du -h'
alias findmac='find . \( -type d -name "__MACOSX" \) -o \( -type f -name ".DS_Store" \)'
alias l='ls -CF'
alias rmsvn='rm -rf `find . -type d -name .svn`'
alias grep='grep --color=auto'
alias scdr='screen -dR'
alias rmkeepgit='rm -rf `find . -not \( -name '.git' -type d -prune \) -type f `'
alias rmkeepsvn='rm -rf `find . -not \( -name '.svn' -type d -prune \) -type f `'
alias lr='ll -R'
alias scls='screen -ls'
alias suemacs='sudo emacs -nw'
alias dkc='docker-compose'
alias sc='screen'
alias dkm='docker-machine'
alias tman='if tmux has; then tmux attach -d; else tmux new; fi'
alias pip2upgrade='sudo pip2 freeze --local | grep -v '\''^\-e'\'' | cut -d = -f 1  | sudo xargs pip2 install -U'
alias dir='ls --color=auto --format=vertical'
alias jupyter='~/.local/bin/jupyter'
alias jn='jupyter notebook'
alias dkrmexit='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'
alias dkrmorph='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias dkrmvol='docker volume rm $(docker volume ls -q --filter "dangling=true")'
alias codev='make git cmd="checkout develop"'
alias pl='make git cmd="pull"'
alias logs='make logs svc="engine-async" | sed "s/\(.* |\)/\s/g" | sed "s/\(.*\}\)/\s/g" | sed "s/\(.*\]\)/\s/g"'
alias restart-engine='docker-compose restart engine-async engine-sync' 
alias gps='nvidia-smi -lms 500'

# Show git branch name
force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt
