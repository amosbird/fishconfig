function injectenv -d "inject a new environment into a running process"
  set -l proc %self
  set -q argv[2]; and set proc $argv[2]
  gdb --batch -ex "call putenv(\"$argv[1]\")" -p "$proc"
end
