#start chrome without extensions and a clean profile

function chromedev
	/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --profile-directory="Profile 1" $argv 2>/dev/null &
end
