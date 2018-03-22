#!/bin/bash
# iatest=$(expr index "$-" i)

# type fish &> /dev/null && exec fish

# #######################################################
# # SOURCED ALIAS'S AND SCRIPTS
# #######################################################

# # Source global definitions
# if [ -f /etc/bashrc ]; then
#		. /etc/bashrc
# fi

# # Enable bash programmable completion features in interactive shells
# if [ -f /usr/share/bash-completion/bash_completion ]; then
#		. /usr/share/bash-completion/bash_completion
# elif [ -f /etc/bash_completion ]; then
#		. /etc/bash_completion
# fi

#######################################################
# EXPORTS
#######################################################

# Disable the bell
#if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

# Expand the history size
export HISTFILESIZE=
export HISTSIZE=

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace


# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
# shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
# shopt -s histappend
PROMPT_COMMAND='history -a'

# Allow ctrl-S for history navigation (with ctrl-R)
stty -ixon

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
# if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

cd() {
	if [ -z "$@" ]; then
		builtin cd - &> /dev/null
		true
	else
		builtin cd "$@"
	fi
}

edit() {
	nvim "$@" || vim "$@"
}

sedit() {
	sudo nvim "$@" || sudo vim "$@"
}

# Show auto-completion list automatically, without double tab
# if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi
alias e='edit'
alias se='sedit'


alias i='iverilog test.v && ./a.out'

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#######################################################
# MACHINE SPECIFIC ALIAS'S
#######################################################

# Alias's for SSH
# alias SERVERNAME='ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'

# Alias's to change the directory

# Alias's to mount ISO files
# mount -o loop /home/NAMEOFISO.iso /home/ISOMOUNTDIR/
# umount /home/NAMEOFISO.iso
# (Both commands done as root only.)

#######################################################
# GENERAL ALIAS'S
#######################################################
# To temporarily bypass an alias, we preceed the command with a \
# EG: the ls command is aliased, but to use the normal ls command you would type \ls

# Add an "alert" alias for long running commands.  Use like so:
#		sleep 10; alert
alias alert='play -q ~/.local/.notif.ogg && notify-send --urgency=critical -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\''; date)" && sendNotification "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\''; date) "'

# Edit this .bashrc file
alias eb='e ~/.bashrc'

ec() {
	nvim ~/.config/"$@"
}

archInit() {
	sudo pacman -Syuw
	cat ~/.local/.packlist | xargs -n 5 sudo pacman --noconfirm -S --needed
}

# Show help for this .bashrc file
alias hlp='less /etc/bash.bashrc_help'

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'
alias cal='cal -m'

alias abs='abduco -A sudo sudo su'
alias m='mntd; abduco -A m cmus'
alias iCheck='abduco -n -A iCheck iC'
# alias y5='(abduco -n WaiFai sudo create_ap --hidden --no-virt --dhcp-dns 8.8.8.8,8.8.4.4 wlan0 eth0 WaiFai wayifive) || (abduco -A WaiFai sudo create_ap --hidden --no-virt --dhcp-dns 8.8.8.8,8.8.4.4 wlan0 eth0 WaiFai wayifive)'
# alias y5='(abduco -n WaiFai sudo create_ap --hidden --no-virt wlan0 eth0 WaiFai wayifive) || (abduco -A WaiFai sudo create_ap --hidden --no-virt wlan0 eth0 WaiFai wayifive)'
alias y5='tmux a -t y5 || tmux new-session -s y5 sudo create_ap --no-virt --dhcp-dns 192.168.12.1,8.8.4.4 wlan1 eth0 y5 whyyphyy'
alias vmux="abduco -e '^g' -A nvim-session nvim"
alias smn='ssh -Y root@mnHost'
alias spi='ssh -Y root@192.168.1.200 || ssh -Y root@192.168.1.10'

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv2
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh

alias py2on='workon py2env'
alias py2off='deactivate'
# alias gdrived=''

pacInstall() {
	# Create a tmp-working-dir and navigate into it
	mkdir -p /tmp/pacaur_install
	cd /tmp/pacaur_install

	# If you didn't install the "base-devel" group,
	# we'll need those.
	sudo pacman -S binutils make gcc fakeroot pkg-config --noconfirm --needed

	# Install pacaur dependencies from arch repos
	sudo pacman -S expac yajl git --noconfirm --needed

	# Install "cower" from AUR
	if [ ! -n "$(pacman -Qs cower)" ]; then
		curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
		makepkg PKGBUILD --skippgpcheck --install --needed --noconfirm
	fi

	# Install "pacaur" from AUR
	if [ ! -n "$(pacman -Qs pacaur)" ]; then
		curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
		makepkg PKGBUILD --install --needed --noconfirm
	fi

	# Clean up...
	cd ~
	rm -r /tmp/pacaur_install
}

gdrived() {
	gdrive sync upload "$@" 0Bzq5TQN2ywxsNFhtaU1LUWNWQTQ
}

adbp() {
	sudo adb push "$@" /sdcard/GG/
}

adbps() {
	sudo adb push "$@" /sdcard/
}

M() {
	cd /mnt/"$@"
	ls
}

C() {
	cd ~/"$@"
	ls
}

fz() {
	"$@" "$(fzf)"
}

alias zathura="zathura --fork"

zat() {
	if [ -z "$@" ]; then
		a=$(find -regex '.*\.pdf' -type f | fzf)
		if [ $? -eq 0 ]; then
			zathura "$a"
		fi
	else
		zathura "$@"
	fi
}

alias systemctl='sudo systemctl'
alias srestart='systemctl restart'
alias status='systemctl status'
alias senable='systemctl enable'
alias netctl='sudo netctl'
alias dstart='sudo systemctl restart docker'
alias adb='sudo adb'
alias adbsh='sudo adb shell'
alias wifi-menu='sudo wifi-menu'
alias wireshark='sudo wireshark'
alias ip='sudo ip'
alias ipa='sudo ip a'
alias asdr='sudo systemctl restart asd-resync'
alias pipi='pip install --user'

#alias sudo='sudo -HE'
alias mv='mv -i'
alias rsync='rsync -aAXvrPh --info=progress2'
alias free='free -h'
alias rm='rm -v'
alias du='du -h'
alias ncdu='ncdu -xq'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias pacman='sudo pacman'
type powerpill &> /dev/null && alias pacman='sudo powerpill'
alias pac='pacaur --noedit -a -S'
alias pmm='pacman -S'
alias pm='pacman -Syu'
alias pmr='pacman -Rns'
alias pq='pacman -Q'
alias pr='pacman -R'


alias docker='sudo docker'
# alias dsh='sudo docker exec -it bash'
alias docker-compose='sudo docker-compose'
alias compose='sudo docker-compose'
alias cup='sudo systemctl start docker && sudo docker-compose up'
alias d='sudo docker'
# alias cp='cp --reflink=auto'

# (nohup bash -c 'systemctl status docker' &> /dev/null ) || (systemctl start docker) &

dsh() {
	sudo docker exec -it -u 0 "$@" bash
}

apack() {
	pacman -S --needed "$@" && (
	echo "$@" >> ~/.local/.packlist
	sort ~/.local/.packlist | uniq > ~/.local/.packlist.new
	mv -f ~/.local/.packlist.new ~/.local/.packlist
	)
}
alias epack='e ~/.local/.packlist'
alias restow='sudo stow -vvv -R -d /home g -t /root'


astack() {
	echo "$@" >> ~/.local/.stack
}
alias estack='e .local/.stack'

alias apt='sudo apt'
alias arch-chroot='sudo arch-chroot'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
alias svi='sudo vi'
alias reboot='sudo reboot'
alias susp='(sleep 2; systemctl suspend)&'
alias hibernate='(sleep 2; systemctl hibernate)&'
alias vis='vim "+set si"'

alias umnt='sudo umount'
alias mntd='sudo mount LABEL=D'
alias mntb='sudo mount LABEL=B'
alias mntw='sudo mount LABEL=W'

alias mntf='sudo mount /dev/sdc1 /mnt/1'
alias umntf='sudo umount /mnt/1 || (cd /; sudo umount /mnt/1)'

alias mntff='sudo mount /dev/sdc2 /mnt/2; sudo mount /dev/sdc1 /mnt/2/boot'
alias umntff='sudo umount -R /mnt/2'

alias umntall='for i in /mnt/*; do sudo umount $i; done;'


alias youtube-dl='youtube-dl --external-downloader aria2c'
alias yd='youtube-dl -o '"'"'/mnt/d/Music/%(title)s.%(ext)s'"'"' -x --audio-format mp3 --audio-quality 0'
alias ysync='yd -w $(cat /mnt/b/Backup/videos.txt)'
alias netre='systemctl restart dhcpcd@eth0'
alias eat='eatmydata'
alias tftp='secho "timeout 1\nrexmt 1\nmode octet" | tftp 127.0.0.1'
alias mpcr='mpc update; mpc crop; mpc ls | mpc add'

gitcl() {
	git clone ssh://git@github.com/"$@"
}

putf() {
	sudo cp -r "$@" /mnt/1
}

alias clone='git clone'
alias gitp='git push origin master'
alias gits='git status'
alias gita='git add'
alias gitc='git commit -a -m'

alias dot='git --git-dir=$HOME/.dot/ --work-tree=$HOME'
alias dots='dot status'
alias dota='dot add'
alias dotc='dot commit -m'
alias dotp='dot push origin master'

alias sdot='git --git-dir=$HOME/.sdot/ --work-tree=$HOME'
alias sdots='sdot status'
alias sdota='sdot add'
alias sdotc='sdot commit -m'
alias sdotp='sdot push origin master'

alias gdot='sudo git --git-dir=/.dot/ --work-tree=/'
alias gdots='gdot status'
alias gdota='gdot add'
alias gdotc='gdot commit -m'
alias gdotp='gdot push origin master'

# Change directory aliases
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# cd into the old directory
alias bd='cd "$OLDPWD"'

# Remove a directory and all files
alias rmd='rm  -rfv'

# Alias's for multiple directory listing commands
alias la='ls -Alh' # show hidden files
alias ls='ls -Fh --color=auto' # add colors and file type extensions
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias ll='ls -Fls' # long listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only
alias l='ls'

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Search command line history
alias h="history | grep "

# Search running processes
# alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

# Show current network connections to the server
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias df="df -hT"

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

alias sha1='openssl sha1'

#######################################################
# SPECIAL FUNCTIONS
#######################################################
secho()	{
	(echo -e "$@" && cat)
}

faketty() {
	script -qfc "$(printf "%q " "$@")" /dev/null;
}


# Searches for text in all files in the current folder
ftext ()
{
	# -i case-insensitive
	# -I ignore binary files
	# -H causes filename to be printed
	# -r recursive search
	# -n causes line number to be printed
	# optional: -F treat search term as a literal, not a regular expression
	# optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
	grep -iIHrn --color=always "$1" . | less -r
}

# Returns the last 2 fields of the working directory
pwdtail ()
{
	pwd|awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

# IP address lookup
whatsmyip() {
	# Dumps a list of all IP addresses for every device
	# /sbin/ifconfig |grep -B1 "inet addr" |awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' |awk -F: '{ print $1 ": " $3 }';

	# Internal IP Lookup
	echo -ne "Internal IP:\n" ; ip a | grep inet | awk '{print $2}'

	# External IP Lookup
	echo -ne "External IP:\n" ; curl ipecho.net/plain; echo
}

cl() {
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; ls
	else
		echo "bash: cl: $dir: Directory not found"
	fi
}

# For some reason, rot13 pops up everywhere
rot13 () {
	if [ $# -eq 0 ]; then
		tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
	else
		echo $* | tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
	fi
}

motd() {
	curl -s --connect-timeout 5 -A 'chrome' 'https://www.reddit.com/r/quotes/top.json?sort=top&t=week&limit=100' | \
	python2.7 -c 'import sys, random, json; randnum = random.randint(0,99); response = json.load(sys.stdin)["data"]["children"][randnum]["data"]; print response["title"].encode('"'"'ascii'"'"'); print "\n\n";'
}

motdupdate() {
	motd | sudo tee /etc/motd
}

# Trim leading and trailing spaces (for scripts)
trim() {
	local var=$@
	var="${var#"${var%%[![:space:]]*}"}"	# remove leading whitespace characters
	var="${var%"${var##*[![:space:]]}"}"	# remove trailing whitespace characters
	echo -n "$var"
}

fe() {
	local files
	IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
	[[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}


#######################################################
# Set the ultimate amazing command prompt
#######################################################
__setprompt() {
	local LAST_COMMAND=$? # Must come first!

	# Define colors
	local LIGHTGRAY="\033[0;37m"
	local WHITE="\033[1;37m"
	local BLACK="\033[0;30m"
	local DARKGRAY="\033[1;30m"
	local RED="\033[0;31m"
	local LIGHTRED="\033[1;31m"
	local GREEN="\033[0;32m"
	local LIGHTGREEN="\033[1;32m"
	local BROWN="\033[0;33m"
	local YELLOW="\033[1;33m"
	local BLUE="\033[0;34m"
	local LIGHTBLUE="\033[1;34m"
	local MAGENTA="\033[0;35m"
	local LIGHTMAGENTA="\033[1;35m"
	local CYAN="\033[0;36m"
	local LIGHTCYAN="\033[1;36m"
	local NOCOLOR="\033[0m"

	# Show error exit code if there is one
	if [[ $LAST_COMMAND != 0 ]]; then
		# PS1="\[${RED}\](\[${LIGHTRED}\]ERROR\[${RED}\])-(\[${LIGHTRED}\]Exit Code \[${WHITE}\]${LAST_COMMAND}\[${RED}\])-(\[${LIGHTRED}\]"
		PS1="\[${DARKGRAY}\](\[${LIGHTRED}\]ERROR\[${DARKGRAY}\])-(\[${RED}\]Exit Code \[${LIGHTRED}\]${LAST_COMMAND}\[${DARKGRAY}\])-(\[${RED}\]"
		if [[ $LAST_COMMAND == 1 ]]; then
			PS1+="General error"
		elif [ $LAST_COMMAND == 2 ]; then
			PS1+="Missing keyword, command, or permission problem"
		elif [ $LAST_COMMAND == 126 ]; then
			PS1+="Permission problem or command is not an executable"
		elif [ $LAST_COMMAND == 127 ]; then
			PS1+="Command not found"
		elif [ $LAST_COMMAND == 128 ]; then
			PS1+="Invalid argument to exit"
		elif [ $LAST_COMMAND == 129 ]; then
			PS1+="Fatal error signal 1"
		elif [ $LAST_COMMAND == 130 ]; then
			PS1+="Script terminated by Control-C"
		elif [ $LAST_COMMAND == 131 ]; then
			PS1+="Fatal error signal 3"
		elif [ $LAST_COMMAND == 132 ]; then
			PS1+="Fatal error signal 4"
		elif [ $LAST_COMMAND == 133 ]; then
			PS1+="Fatal error signal 5"
		elif [ $LAST_COMMAND == 134 ]; then
			PS1+="Fatal error signal 6"
		elif [ $LAST_COMMAND == 135 ]; then
			PS1+="Fatal error signal 7"
		elif [ $LAST_COMMAND == 136 ]; then
			PS1+="Fatal error signal 8"
		elif [ $LAST_COMMAND == 137 ]; then
			PS1+="Fatal error signal 9"
		elif [ $LAST_COMMAND -gt 255 ]; then
			PS1+="Exit status out of range"
		else
			PS1+="Unknown error code"
		fi
		PS1+="\[${DARKGRAY}\])\[${NOCOLOR}\]\n"
	else
		PS1=""
	fi

	# Date
	PS1+="\[${DARKGRAY}\](\[${CYAN}\]\$(date +%a), $(date +%B\ '%-d')" # Date
	PS1+="${BLUE} $(date +'%H':%M:%S)\[${DARKGRAY}\])-" # Time

	## CPU
	#PS1+="\[${MAGENTA}\]CPU $(cpu)%"

	# Jobs
	PS1+="\[${DARKGRAY}\](\[${MAGENTA}\]\j"

	## Network Connections (for a server - comment out for non-server)
	#PS1+="\[${DARKGRAY}\]:\[${MAGENTA}\]Net $(awk 'END {print NR}' /proc/net/tcp)"

	PS1+="\[${DARKGRAY}\])-"

	# User and server
	local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
	local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
	if [ $SSH2_IP ] || [ $SSH_IP ] ; then
		PS1+="(\[${RED}\]\u@\h"
	else
		PS1+="(\[${RED}\]\u"
	fi

	# Current directory
	PS1+="\[${DARKGRAY}\]:\[${BROWN}\]\w\[${DARKGRAY}\])-"

	# Total size of files in current directory
	PS1+="(\[${GREEN}\]$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')\[${DARKGRAY}\]:"

	# Number of files
	PS1+="\[${GREEN}\]\$(/bin/ls -A -1 | /usr/bin/wc -l)\[${DARKGRAY}\])"

	# Skip to the next line
	PS1+="\n"

	if [[ $EUID -ne 0 ]]; then
		PS1+="\[${GREEN}\]>\[${NOCOLOR}\] " # Normal user
	else
		PS1+="\[${RED}\]>\[${NOCOLOR}\] " # Root user
	fi

	# PS2 is used to continue a command using the \ character
	PS2="\[${DARKGRAY}\]>\[${NOCOLOR}\] "

	# PS3 is used to enter a number choice in a script
	PS3='Please enter a number from above list: '

	# PS4 is used for tracing a script in debug mode
	PS4='\[${DARKGRAY}\]+\[${NOCOLOR}\] '
}
PROMPT_COMMAND='__setprompt'

if type fzf > /dev/null ; then
	source /usr/share/fzf/key-bindings.bash
	source /usr/share/fzf/completion.bash
	if type rg > /dev/null; then
		export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
		export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
		# export FZF_ALT_C_COMMAND='rg --files --no-ignore --hidden --type d --follow -g "!{.git,node_modules}/*" 2> /dev/null'

	fi
fi
