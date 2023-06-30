eval "$(starship init zsh)"

source "$XDG_CONFIG_HOME/shell/aliasrc"

wiki()
{
	for url in $@
	do
		firefox -private-window "https://wiki.archlinux.org/index.php?search=$url"
	done
}

yt()
{
	for url in $@
	do 
		firefox -private-window "https://youtube.com/results?search_query=$url"
	done
}

fcd()
{
    cd "$(find -type d | fzf)"
}
open()
{
    xdg-open "$(find -type f | fzf)"
}
pdf()
{
    cd && zathura "$(find -type f -iname "*.pdf" | fzf)"
}

# Add countdown and timer
