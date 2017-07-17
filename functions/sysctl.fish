function sysctl
  if type -q sysctl
    echo fish: Unknown command \'sysctl\'
  else
    if isatty 1
      grc (command -s sysctl) $argv
    else
      command sysctl $argv
    end
  end
end
