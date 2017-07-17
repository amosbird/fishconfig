function traceroute
  if type -q traceroute
    echo fish: Unknown command \'traceroute\'
  else
    if isatty 1
      grc (command -s traceroute) $argv
    else
      command traceroute $argv
    end
  end
end
