function findmnt
  if command -s findmnt > /dev/null
    echo fish: Unknown command \'findmnt\'
  else
    if isatty 1
      grc (command -s findmnt) $argv
    else
      command findmnt $argv
    end
  end
end
