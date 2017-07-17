function traceroute
  if command -s traceroute > /dev/null
    echo fish: Unknown command \'traceroute\'
  else
    if isatty 1
      grc (command -s traceroute) $argv
    else
      command traceroute $argv
    end
  end
end
