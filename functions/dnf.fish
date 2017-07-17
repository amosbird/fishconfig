function dnf
  if type -q dnf
    echo fish: Unknown command \'dnf\'
  else
    if isatty 1
      grc (command -s dnf) $argv
    else
      command dnf $argv
    end
  end
end
