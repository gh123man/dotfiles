export PATH=$PATH:/home/brian/Android/Sdk/platform-tools


export ANDROID_EMULATOR_FORCE_32BIT=true

alias ll="ls -l"
alias sshschool="~/school/ssh.sh"
alias :q="exit"
alias quit="exit"
alias explorer="nemo"
alias files="nemo"
bind '"\027":"exit\n"'
alias serv="ssh serv"
alias cb="xclip -selection c"
alias cbv="cb -o"

set fish_greeting "its ok to panic :)
"

set -gx FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
