function get_git_status -d "Gets the current git status"
	# Copied from https://github.com/oh-my-fish/theme-cmorrell.com
  if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set -l dirty (command git status -s --ignore-submodules=dirty | wc -l | sed -e 's/^ *//' -e 's/ *$//' 2> /dev/null)
    set -l ref (command git describe --tags --exact-match ^/dev/null ; or command git symbolic-ref --short HEAD 2> /dev/null ; or command git rev-parse --short HEAD 2> /dev/null)

    set_color normal

    if [ "$dirty" != "0" ]
      set_color -b red
    else
      set_color -b cyan
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

	echo -n -s "$USER" @ "$__fish_prompt_hostname" ' ' (set_color $color_cwd) (prompt_pwd) ' ' (get_git_status) "$suffix "
end
