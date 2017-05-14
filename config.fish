set fish_color_command --bold
set fish_greeting
set FISH_CLIPBOARD_CMD cat

set FZF_HOME $HOME/.fzf
if set -q TMUX
  set FZF_TMUX 1
end

function save_history --on-event fish_preexec
  history --save
end

function record_runtime --on-event fish_postexec
  set -l duration (echo $CMD_DURATION | humanize_duration)
  echo "$argv       ($duration)" >> $HOME/.commandlog
end

set -x RUST_SRC_PATH /usr/src/rust/src
set -x TERMINFO $HOME/share/terminfo
set -x FZF_DEFAULT_OPTS "--multi --bind=ctrl-v:half-page-down,alt-v:half-page-up,ctrl-l:accept"
set -x LD_RUN_PATH "$HOME/lib64:$HOME/lib"
set -x LIBRARY_PATH "$HOME/lib64:$HOME/lib"
set -x GOPATH $HOME/go
set -x CARGO_HOME $HOME/.cargo
set -x CABAL_HOME $HOME/.cabal
set -x EDITOR vim
set -x VISUAL vim
set -x GTAGSFORCECPP true
set -x GTK_IM_MODULE fcitx
set -x XMODIFIERS @im=fcitx
set -x QT_IM_MODULE fcitx
set -x ASAN_OPTIONS "handle_segv=0:detect_leaks=0"
set -x USE_GOLD_LINKER true
set -x DIRENV_LOG_FORMAT ""

status --is-interactive; and . (jump shell fish | psub)
eval (direnv hook fish)

# prepend path
set -U fish_user_paths $HOME/scripts $FZF_HOME/bin $GOPATH/bin $CARGO_HOME/bin $CABAL_HOME/bin $HOME/bin /usr/local/go/bin /bin /sbin
