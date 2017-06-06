function server -d 'Start a HTTP server in the current dir, optionally specifying the port'
  if test $argv[1]
    set port $argv[1]
  else
    set port 8000
  end
  echo -e "0.0.0.0:$port\nfilemanager {\nshow ./\n allow_new      false\n allow_edit     false\n allow_commands false\n}" | caddy -conf stdin
end
