function get_git_status -d "Gets the current git status"
	# Copied from https://github.com/oh-my-fish/theme-cmorrell.com
  if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set -l dirty (command git status -s --ignore-submodules=dirty | wc -l | sed -e 's/^ *//' -e 's/ *$//' 2> /dev/null)
    set -l ref (command git describe --tags --exact-match ^/dev/null ; or command git symbolic-ref --short HEAD 2> /dev/null ; or command git rev-parse --short HEAD 2> /dev/null)

    if [ "$dirty" != "0" ]
      set_color -b red
      set_color white
    else
      set_color -b cyan
      set_color white
    end

    echo " $ref "
    set_color normal
   end
end

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

	echo -n -s "$USER" @ "$__fish_prompt_hostname" ' ' (set_color $color_cwd) (prompt_pwd) (set_color normal) ' ' (get_git_status) "$suffix "
end

# set -g pad " "
#
# ## Function to show a segment
# function prompt_segment -d "Function to show a segment"
#   # Get colors
#   set -l bg $argv[1]
#   set -l fg $argv[2]
#
#   # Set 'em
#   set_color -b $bg
#   set_color $fg
#
#   # Print text
#   if [ -n "$argv[3]" ]
#     echo -n -s $argv[3]
#   end
# end
#
# ## Function to show current status
# function show_status -d "Function to show the current status"
#   if [ $RETVAL -ne 0 ]
#     prompt_segment red white " ▲ "
#     set pad ""
#     end
#   if [ -n "$SSH_CLIENT" ]
#       prompt_segment blue white " SSH: "
#       set pad ""
#     end
# end
#
# function show_virtualenv -d "Show active python virtual environments"
#   if set -q VIRTUAL_ENV
#     set -l venvname (basename "$VIRTUAL_ENV")
#     prompt_segment normal white " ($venvname)"
#   end
# end
#
# ## Show user if not default
# function show_user -d "Show user"
#   if [ "$USER" != "$default_user" -o -n "$SSH_CLIENT" ]
#     set -l host (hostname -s)
#     set -l who (whoami)
#     prompt_segment normal yellow " $who"
#
#     # Skip @ bit if hostname == username
#     if [ "$USER" != "$HOST" ]
#       prompt_segment normal white "@"
#       prompt_segment normal green "$host "
#       set pad ""
#     end
#     end
# end
#
# # Show directory
# function show_pwd -d "Show the current directory"
#   set -l pwd (prompt_pwd)
#   prompt_segment normal blue "$pad$pwd "
# end
#
# # Show prompt w/ privilege cue
# function show_prompt -d "Shows prompt with cue for current priv"
#   set -l uid (id -u $USER)
#     if [ $uid -eq 0 ]
#     prompt_segment red white " ! "
#     set_color normal
#     echo -n -s " "
#   else
#     prompt_segment normal white " \$ "
#     end
#
#   set_color normal
# end
#
# ## SHOW PROMPT
# function fish_prompt
#   set -g RETVAL $status
#   show_status
#   show_virtualenv
#   show_user
#   show_pwd
#   show_prompt
# end
