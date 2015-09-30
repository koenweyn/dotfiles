################################################################################
### fish config

#prompt
function fish_prompt --description "Write out the prompt (based on classic)"
	# Just calculate this once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

	set -l color_cwd
	set -l suffix
	switch $USER
	case root toor
		if set -q fish_color_cwd_root
			set color_cwd $fish_color_cwd_root
		else
			set color_cwd $fish_color_cwd
		end
	case '*'
		set color_cwd $fish_color_cwd
	end

  set suffix ' 😈 '

	echo -n -s "$USER" @ "$__fish_prompt_hostname" ' ' (set_color $color_cwd) (prompt_pwd) (set_color normal) "$suffix "
end

#welcome message
set fish_greeting ""

################################################################################
### functions and aliases


alias fuck="sudo (history | head -1)" #reapplies the last command with sudo
alias psg="ps -ef | grep "
alias lssh="lsof -i 4tcp -P | grep 'ssh'"

function rp
  set dir (pwd)
  echo (cd (dirname $argv); pwd)/(basename $argv)
  #TODO KW this changes the current path of the caller
end
funcsave rp

#start IntelliJ diff
function idiff
  /Applications/IntelliJ\ IDEA\ 13.app/Contents/MacOS/idea diff $argv &
end
funcsave idiff

#start chrome without extensions and a clean profile
function chromedev
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --profile-directory="Profile 1" $argv 2>/dev/null &
end
funcsave chromedev

################################################################################
### system

# bigger open file limit
ulimit -n 65536
ulimit -u 2048

################################################################################
### exports

set -x P4CONFIG ".p4"
set -x CLICOLOR "1"
set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_20.jdk/Contents/Home"

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
