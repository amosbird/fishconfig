set fish_greeting
set FISH_CLIPBOARD_CMD cat

set FZF_HOME $HOME/.fzf
if set -q TMUX
  set FZF_TMUX 1
end

set -x TERMINFO $HOME/share/terminfo
set -x FZF_DEFAULT_OPTS "--multi --bind=ctrl-v:half-page-down,alt-v:half-page-up,ctrl-l:accept"
set -x LD_RUN_PATH "$HOME/lib64:$HOME/lib"
set -x GOPATH $HOME/go
set -x CARGO_HOME $HOME/.cargo
set -x EDITOR vim
set -x VISUAL vim
set -x GTAGSFORCECPP true
set -x JAVA_HOME /usr/lib/jvm/java-8-jdk/
set -x GTK_IM_MODULE fcitx
set -x XMODIFIERS @im=fcitx
set -x QT_IM_MODULE fcitx

set PATH $HOME/scripts $FZF_HOME/bin $GOPATH/bin $CARGO_HOME/bin $HOME/bin $PATH
set PATH $HOME/idea-IU-162.2032.8/bin $PATH

status --is-interactive; and . (jump shell fish | psub)
