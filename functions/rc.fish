function rc -d "rsync a file over a cluster" --argument-names 'filename'
  if not test -e $filename
    echo "file not exist"
    return 1
  end
  for host in "nobida144" "nobida145" "nobida146" "nobida148"
    rsync -a $filename $host:(realpath $filename)
  end
end
