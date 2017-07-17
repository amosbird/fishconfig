function mount
  if type -q mount
    echo fish: Unknown command \'mount\'
  else
    if isatty 1
      grc (command -s mount) $argv
    else
      command mount $argv
    end
  end
end
