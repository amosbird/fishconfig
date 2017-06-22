function mount
  if isatty 1
    grc /usr/bin/mount $argv
  else
    /usr/bin/mount $argv
  end
end
