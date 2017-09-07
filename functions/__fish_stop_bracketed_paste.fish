# Defined in /tmp/fish.nRQOVY/__fish_stop_bracketed_paste.fish @ line 2
function __fish_stop_bracketed_paste
	# Restore the last bind mode.
    set fish_bind_mode $__fish_last_bind_mode
    set -e __fish_paste_quoted
    commandline -r (printf "%s" (string trim -- (commandline)))
    commandline -f force-repaint
end
