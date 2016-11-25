#!/bin/bash

#-----------------------------------
# Глобальные определения
#-----------------------------------
if [ -f /etc/bashrc ]; then
        . /etc/bashrc   # --> Прочитать настройки из /etc/bashrc, если таковой имеется.
fi

TXTRED='\e[0;31m'       # red
TXTGRN='\e[0;32m'       # green
TXTYLW='\e[0;33m'       # yellow
TXTBLU='\e[0;34m'       # blue
TXTPUR='\e[0;35m'       # purple
TXTCYN='\e[0;36m'       # cyan
TXTWHT='\e[0;37m'       # white
BLDRED='\e[1;31m'       # red    - Bold
BLDGRN='\e[1;32m'       # green
BLDYLW='\e[1;33m'       # yellow
BLDBLU='\e[1;34m'       # blue
BLDPUR='\e[1;35m'       # purple
BLDCYN='\e[1;36m'       # cyan
BLDWHT='\e[1;37m'       # white
TXTRST='\e[0m'          # Text reset
NC='\e[0m'              # No Color (нет цвета)

# di = directory
# fi = file
# ln = symbolic link
# pi = fifo file
# so = socket file
# bd = block (buffered) special file
# cd = character (unbuffered) special file
# or = symbolic link pointing to a non-existent file (orphan)
# mi = non-existent file pointed to by a symbolic link (visible when you type ls -l)
# ex = file which is executable (ie. has 'x' set in permissions).
# *.rpm = files with the ending .rpm

# 0   = default colour
# 1   = bold
# 4   = underlined
# 5   = flashing text
# 7   = reverse field
# 40  = black background
# 41  = red background
# 42  = green background
# 43  = orange background
# 44  = blue background
# 45  = purple background
# 46  = cyan background
# 47  = grey background
# 100 = dark grey background
# 101 = light red background
# 102 = light green background
# 103 = yellow background
# 104 = light blue background
# 105 = light purple background
# 106 = turquoise background

# Blue = 34
# Green = 32
# Light Green = 1;32
# Cyan = 36
# Red = 31
# Purple = 35
# Brown = 33
# Yellow = 1;33
# white = 1;37
# Light Grey = 0;37
# Black = 30
# Dark Grey= 1;30

#directory is Blue
LS_COLORS=$LS_COLORS:'di=34' ; export LS_COLORS
#file is Black
LS_COLORS=$LS_COLORS:'fi=47;30' ; export LS_COLORS
#symbolic link is white
LS_COLORS=$LS_COLORS:'ln=1;37' ; export LS_COLORS
#executable is 
LS_COLORS=$LS_COLORS:'ex=33' ; export LS_COLORS


echo -e "${TXTYLW}This is BASH ${TXTYLW}${BASH_VERSION%.*}${TXTYLW} ${NC} $(date)"

echo -e ""


# function __prompt_command_generator() {
#     PS1=""
#     PS1+='$(__LAST_EXIT="$?";'        # This needs to be first

#     #mark root as red
#     PS1+='[[ $UID -eq 0 ]] && echo -n "'$BLDWHT'" || echo -n "'$BLDWHT'";'
#     PS1+='echo -n "\u'$BLDWHT'";'

#     #hide host name if we are on a local machine
#     if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]; then
#         PS1+='echo -n "@'$BLDYLW'\h'$BLDYLW'";'
#     fi

#     #append current path
#     PS1+='echo -n " '$BLDWHT'\W";'

#     #append git branch
#     if type -p git>/dev/null; then
#         PS1+='__GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2> /dev/null);'
#         PS1+='[[ -n "$__GIT_BRANCH" ]] && echo -n "'$BLDWHT'(${__GIT_BRANCH})";'
#         PS1+='unset __GIT_BRANCH;'
#     fi

#     #show exit code
#     PS1+='[[ $__LAST_EXIT -eq 0 ]] && echo -n "'$BLDWHT'" || echo -n "'$BLDWHT'";';
#     PS1+='unset __LAST_EXIT)'

#     PS1+="\\\$ $TXTWHT"
# }

# #do not use this in e.g. scp
# if [ -z "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
#     __prompt_command_generator
# fi
# unset __prompt_command_generator

#-------------------
# Псевдонимы
#-------------------

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# -> Предотвращает случайное удаление файлов.
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias r='rlogin'
alias which='type -all'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias print='/usr/bin/lp -o nobanner -d $LPDEST'   # Предполагается, что LPDEST определен
alias pjet='enscript -h -G -fCourier9 -d $LPDEST'  # Печать через enscript
alias background='xv -root -quit -max -rmode 5'    # Положить картинку в качестве фона
alias du='du -kh'
alias df='df -kTh'

# Различные варианты 'ls' (предполагается, что установлена GNU-версия ls)
alias la='ls -Al'               # показать скрытые файлы
alias ls='ls -hF --color'       # выделить различные типы файлов цветом
alias lx='ls -lXB'              # сортировка по расширению
alias lk='ls -lSr'              # сортировка по размеру
alias lc='ls -lcr'              # сортировка по времени изменения
alias lu='ls -lur'              # сортировка по времени последнего обращения
alias lr='ls -lR'               # рекурсивный обход подкаталогов
alias lt='ls -ltr'              # сортировка по дате
alias lm='ls -al |more'         # вывод через 'more'
alias tree='tree -Csu'          # альтернатива 'ls'

# подготовка 'less'
alias more='less'
export PAGER=less
export LESSCHARSET='latin1'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-' # если существует lesspipe.sh
export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \
:stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'

# проверка правописания - настоятельно рекомендую :-)
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'

go_libs="-lm"
go_flags="-g -Wall -include stdio.h -O2"
alias go_c="c99 -xc '-' $go_libs $go_flags"

alias st="sublime_text"

function sth() {
    sublime_text "$HOME/$1";
}

function ll(){ ls -l "$@"| egrep "^d" ; ls -lXB "$@" 2>&-| egrep -v "^d|total "; }

#-----------------------------------
# Функции для работы с файлами и строками:
#-----------------------------------

# Поиск файла по шаблону:
function ff() { find . -type f -iname '*'$*'*' -ls ; }
# Поиск файла по шаблону в $1 и запуск команды в $2 с ним:
function fe() { find . -type f -iname '*'$1'*' -exec "${2:-file}" {} \;  ; }
# поиск строки по файлам:
function fstr()
{
    OPTIND=1
    local case=""
    local usage="fstr: поиск строки в файлах.
Порядок использования: fstr [-i] \"шаблон\" [\"шаблон_имени_файла\"] "
    while getopts :it opt
    do
        case "$opt" in
        i) case="-i " ;;
        *) echo "$usage"; return;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    local SMSO=$(tput smso)
    local RMSO=$(tput rmso)
    find . -type f -name "${2:-*}" -print0 | xargs -0 grep -sn ${case} "$1" 2>&- | \
sed "s/$1/${SMSO}\0${RMSO}/gI" | more
}

function cuttail() # удалить последние n строк в файле, по-умолчанию 10
{
    nlines=${2:-10}
    sed -n -e :a -e "1,${nlines}!{P;N;D;};N;ba" $1
}

function lowercase()  # перевести имя файла в нижний регистр
{
    for file ; do
        filename=${file##*/}
        case "$filename" in
        */*) dirname==${file%/*} ;;
        *) dirname=.;;
        esac
        nf=$(echo $filename | tr A-Z a-z)
        newname="${dirname}/${nf}"
        if [ "$nf" != "$filename" ]; then
            mv "$file" "$newname"
            echo "lowercase: $file --> $newname"
        else
            echo "lowercase: имя файла $file не было изменено."
        fi
    done
}

#-----------------------------------
# Функции для работы с процессами/системой:
#-----------------------------------

function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }
function pp() { my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }

function my_ip() # IP адрес
{
    MY_IP=$(/sbin/ifconfig ppp0 | awk '/inet/ { print $2 } ' | sed -e s/addr://)
    MY_ISP=$(/sbin/ifconfig ppp0 | awk '/P-t-P/ { print $3 } ' | sed -e s/P-t-P://)
}

function ii()   # Дополнительные сведения о системе
{
    echo -e "\nВы находитесь на ${RED}$HOST"
    echo -e "\nДополнительная информация:$NC " ; uname -a
    echo -e "\n${RED}В системе работают пользователи:$NC " ; w -h
    echo -e "\n${RED}Дата:$NC " ; date
    echo -e "\n${RED}Время, прошедшее с момента последней перезагрузки :$NC " ; uptime
    echo -e "\n${RED}Память :$NC " ; free
    my_ip 2>&-;
    echo -e "\n${RED}IP адрес:$NC" ; echo ${MY_IP:-"Соединение не установлено"}
    echo -e "\n${RED}Адрес провайдера (ISP):$NC" ; echo ${MY_ISP:-"Соединение не установлено"}
    echo
}

shopt -s extglob        # необходимо
set +o nounset          # иначе некоторые дополнения не будут работать

complete -A hostname   rsh rcp telnet rlogin r ftp ping disk
complete -A export     printenv
complete -A variable   export local readonly unset
complete -A enabled    builtin
complete -A alias      alias unalias
complete -A function   function
complete -A user       su mail finger

complete -A helptopic  help
complete -A shopt      shopt
complete -A stopped -P '%' bg
complete -A job -P '%'     fg jobs disown

complete -A directory  mkdir rmdir
complete -A directory   -o default cd

# Архивация
complete -f -o default -X '*.+(zip|ZIP)'  zip
complete -f -o default -X '!*.+(zip|ZIP)' unzip
complete -f -o default -X '*.+(z|Z)'      compress
complete -f -o default -X '!*.+(z|Z)'     uncompress
complete -f -o default -X '*.+(gz|GZ)'    gzip
complete -f -o default -X '!*.+(gz|GZ)'   gunzip
complete -f -o default -X '*.+(bz2|BZ2)'  bzip2
complete -f -o default -X '!*.+(bz2|BZ2)' bunzip2
# Postscript,pdf,dvi.....
complete -f -o default -X '!*.ps'  gs ghostview ps2pdf ps2ascii
complete -f -o default -X '!*.dvi' dvips dvipdf xdvi dviselect dvitype
complete -f -o default -X '!*.pdf' acroread pdf2ps
complete -f -o default -X '!*.+(pdf|ps)' gv
complete -f -o default -X '!*.texi*' makeinfo texi2dvi texi2html texi2pdf
complete -f -o default -X '!*.tex' tex latex slitex
complete -f -o default -X '!*.lyx' lyx
complete -f -o default -X '!*.+(htm*|HTM*)' lynx html2ps
# Multimedia
complete -f -o default -X '!*.+(jp*g|gif|xpm|png|bmp)' xv gimp
complete -f -o default -X '!*.+(mp3|MP3)' mpg123 mpg321
complete -f -o default -X '!*.+(ogg|OGG)' ogg123



complete -f -o default -X '!*.pl'  perl perl5

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

complete -o default -F _my_command nohup exec eval trace truss strace sotruss gdb
complete -o default -F _my_command command type which man nice

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export NDK_HOME=$HOME/Android/Sdk/ndk-bundle
export ANDROID_NDK_HOME=$HOME/Android/Sdk/ndk-bundle
export ANDROID_HOME=$HOME/Android/Sdk

export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$HOME/Android/Sdk/ndk-bundle
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$PATH:$HOME/bin

export HTTP_PROXY=http:10.13.11.50:8080
export HTTPS_PROXY=https:10.13.11.50:8080

export USE_CCACHE=1
export CCACHE_DIR=$HOME/.ccache

#export ADB_TRACE=all
export DMC_RPI_TOOLS=$HOME/raspberrypi-tools

#GO
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$GOROOT

#Dart
export PATH=$PATH:/opt/dart/dart-sdk/bin


#export PATH=$PATH:/opt/qnx650/host/linux/x86/usr/bin
#export PATH=$PATH:/usr/bin/gcc
export QNX_CONFIGURATION=$HOME/qnx660/host/linux/x86/usr/bin

#sublime_text
export PATH=$PATH:/home/ruabezruko/sublime_text

#nodejs
export PATH=$PATH:/home/ruabezruko/nodejs/bin

#Valgrind
#export PATH=$PATH:/home/ruabezruko/programs/valgrind-3.11.0/coregrind

