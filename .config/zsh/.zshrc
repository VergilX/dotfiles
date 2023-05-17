eval "$(starship init zsh)"

source "$XDG_CONFIG_HOME/shell/aliasrc"

function wiki()
{
	for url in $@
	do
		firefox -private-window "https://wiki.archlinux.org/index.php?search=$url"
	done
}

function yt()
{
	for url in $@
	do 
		firefox -private-window "https://youtube.com/results?search_query=$url"
	done
}

function set_res()
{
	# For using custom res: https://unix.stackexchange.com/questions/227876/how-to-set-custom-resolution-using-xrandr-when-the-resolution-is-not-available-i
	# Might have to change as this is
	# done for virtualbox
	xrandr --output Virtual1 --primary --mode $1 --pos 0x0 --rotate normal --output Virtual2 --off --output Virtual3 --off --output Virtual4 --off --output Virtual5 --off --output Virtual6 --off --output Virtual7 --off --output Virtual8 --off 

}

# Add countdown and timer
