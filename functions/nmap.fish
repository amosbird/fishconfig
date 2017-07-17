function nmap
  if type -q nmap
    echo fish: Unknown command \'nmap\'
  else
    if isatty 1
      grc (command -s nmap) $argv
    else
      command nmap $argv
    end
  end
end
