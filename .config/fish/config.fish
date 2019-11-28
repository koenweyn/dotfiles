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

################################################################################
### system

# bigger open file limit
ulimit -n 65536
ulimit -u 2048

################################################################################
### exports

# Language Default
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

set -x P4CONFIG ".p4"
set -x CLICOLOR "1"
set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)

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

set PATH $PATH ~/.yarn/bin
