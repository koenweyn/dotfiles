################################################################################
### fish config

#welcome message
set fish_greeting ""

################################################################################
### functions and aliases


alias fuck="sudo (history | head -1)" #reapplies the last command with sudo
alias psg="ps -ef | grep "
alias lssh="lsof -i 4tcp -P | grep 'ssh'"
alias npmi="npm install $0 --save-dev --save-exact"
alias gc="git checkout"
alias gp="git pull"

alias python="python3"
alias pip="pip3"

################################################################################
### system

# bigger open file limit
# ulimit -n 65536
# ulimit -u 2048

################################################################################
### exports

# Language Default
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

set -x AWS_PROFILE temp
set -x CLICOLOR "1"
set -x JAVA_HOME /Users/koenweyn/.sdkman/candidates/java/current

# other files containing environment variables in the form 'name=val'
for file in ~/.environment/*
	if test -e $file
		# echo "Reading variables from $file"
    for var in (cat $file)
			set name (echo $var | cut -d= -f1)
			set val (echo $var | cut -d= -f2)
			# echo "export $name"
			set -x $name $val
		end
	else
		echo "File does not exist: $file"
	end
end

# Path

set PATH $HOME/.local/bin /opt/homebrew/Caskroom/sqlcl/26.1.0.086.1709/sqlcl/bin /opt/homebrew/bin $PATH ~/.yarn/bin

# Homebrew

if test -d (brew --prefix)"/share/fish/completions"
    set -p fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

# use default node version
nvm use default --silent
source /opt/homebrew/Cellar/chruby-fish/1.0.0/share/fish/vendor_functions.d/chruby.fish
source /opt/homebrew/Cellar/chruby-fish/1.0.0/share/fish/vendor_conf.d/chruby_auto.fish
chruby ruby-3.3.5

