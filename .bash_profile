export PS1="\h:\W 😈  "

##aliases

#reapplies the last command with sudo
alias fuck='sudo $(history -p \!\!)'

#start IntelliJ diff
alias idiff='/Applications/IntelliJ\ IDEA\ 13.app/Contents/MacOS/idea diff &'
alias idiff14='/Applications/IntelliJ\ IDEA\ 14.app/Contents/MacOS/idea diff &'

#start chrome without extensions and a clean profile
alias chromedev='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-extensions --user-data-dir=/tmp &'

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

