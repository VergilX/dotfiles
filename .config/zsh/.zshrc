# Where starship takes over
eval "$(starship init zsh)"

source "$XDG_CONFIG_HOME/shell/aliasrc"

# Bindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

yt-mp3()
{
    # Modify code to take --name argument to give output of filenmaae
    # Right now, the default is filename in youtube
    echo -n "Are you sure to download? This replaces existing filenames (y/n): " 
    read ch

    if [ "$ch" = 'y' ]; then
        for url in $@
        do
            yt-dlp -x $url -P $HOME/moosic/
            # yt-dlp -x $url -P $HOME/moosic/ -o "name"

            if [ $? -eq 0 ]; then
                echo "Da DJ is in the house!"
            else
                echo "ERROR: You got a false ID, biatch"
            fi
        done
    elif [ "$ch" = 'n' ]; then
        echo "Why'd you bother me then, you dipshit?"
    else
        echo "Where'd you learn to read?"
    fi
}

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
    cd && zathura "$(find -type f -iname "*.pdf" | fzf)" && cd -
}

# Add countdown and timer

# Add a song end of playlist using substring
mpcadd()
{
    mpc add "$(mpc ls | grep -i "$1")";
    if [ $? -eq 0 ]; then
        echo "Successfully added!\nPlaylist:"
        mpc playlist | cat -n
    else
        echo "Failed to add to playlist"
    fi
}
