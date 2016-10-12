function rp
	set dir (pwd)
  echo (cd (dirname $argv); pwd)/(basename $argv)
  #TODO KW this changes the current path of the caller
end
