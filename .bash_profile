export PS1="\h:\W 😈  "
export CLICOLOR=1
export AWS_PROFILE=temp

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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/Users/koenweyn/.sdkman"
#[[ -s "/Users/koenweyn/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/koenweyn/.sdkman/bin/sdkman-init.sh"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
