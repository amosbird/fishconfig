alias cc gcc
alias c++ g++
alias sudo 'sudo -Es'
alias ssh 'ssh -i ~/.ssh/id_rsa'

# wget sucks with certificates. Let's keep it simple.
alias wget "curl -O"

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

set -x RUST_SRC_PATH /home/amos/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
set -x TERMINFO $HOME/share/terminfo
set -x FZF_DEFAULT_OPTS "--ansi --multi --bind=ctrl-v:half-page-down,alt-v:half-page-up,ctrl-l:accept"
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
set -x SHELL (which fish)

status --is-interactive; and . (jump shell fish | psub)
eval (direnv hook fish)

set -U grc_plugin_execs cvs df diff dig gcc g++ ifconfig make mount netstat ping ps tail traceroute \
wdiff blkid du dnf docker docker-machine env id ip iostat last lsblk lspci lsmod lsof getfacl getsebool uptime nmap \
findmnt free semanage sar ss sysctl systemctl stat showmount tune2fs vmstat w who

# pipe color?
# cat

# doesn't work
# ls ulimit tcpdump fdisk lsattr mtr

for executable in $grc_plugin_execs
  if type -q $executable
    alias $executable "grc $executable"
  end
end


# prepend path
set -U fish_user_paths $HOME/scripts $FZF_HOME/bin $GOPATH/bin $CARGO_HOME/bin $CABAL_HOME/bin $HOME/.local/bin $HOME/bin
