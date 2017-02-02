set fish_greeting
set FISH_CLIPBOARD_CMD cat

set FZF_HOME $HOME/.fzf
if set -q TMUX
  set FZF_TMUX 1
end

set -x FZF_DEFAULT_OPTS "--multi --bind=ctrl-v:half-page-down,alt-v:half-page-up"
set -x GOPATH $HOME/go
set -x CARGO_HOME $HOME/.cargo
set -x EDITOR nvim
set -x VISUAL nvim
set -x GTAGSFORCECPP true
set -x JAVA_HOME /usr/lib/jvm/java-8-jdk/
set -x GTK_IM_MODULE fcitx
set -x XMODIFIERS @im=fcitx
set -x QT_IM_MODULE fcitx
set -x DOWNLOAD_CDH_COMPONENTS true

set fish_user_paths $HOME/scripts $FZF_HOME/bin $GOPATH/bin $CARGO_HOME/bin $HOME/bin
set fish_user_paths $HOME/idea-IU-162.2032.8/bin $fish_user_paths

status --is-interactive; and . (jump shell fish | psub)
