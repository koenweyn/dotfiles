export PS1="\h:\W 😈  "
export CLICOLOR=1

##aliases

#reapplies the last command with sudo
alias fuck='sudo $(history -p \!\!)'

#start IntelliJ diff
idiff() {
  # IntelliJ diff needs absolute pathnames
  file1=$(cd "$(dirname "$1")"; pwd)/$(basename "$1")
  file2=$(cd "$(dirname "$2")"; pwd)/$(basename "$2")
  /Applications/IntelliJ\ IDEA\ 13.app/Contents/MacOS/idea diff $file1 $file2 &
}

#start chrome without extensions and a clean profile
alias chromedev='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-extensions --user-data-dir=/tmp 2>/dev/null &'

#general
alias ll='ls -alh'

## bigger open file limit
ulimit -n 65536
ulimit -u 2048

## exports
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_20.jdk/Contents/Home
export P4CONFIG=~/.p4config
export P4PORT=localhost:1777
export P4USER=kweyn

