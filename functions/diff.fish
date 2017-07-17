function diff
  if type -q diff
    echo fish: Unknown command \'diff\'
  else
    if isatty 1
      grc (command -s diff) $argv
    else
      command diff $argv
    end
  end
end
