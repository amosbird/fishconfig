function findmnt
  if type -q findmnt
    echo fish: Unknown command \'findmnt\'
  else
    if isatty 1
      grc (command -s findmnt) $argv
    else
      command findmnt $argv
    end
  end
end
