# CUSTOM FUNCTIONS
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
                notify-send "youtube to mp3 conversion successful!"
                echo "Da DJ is in the house!"
            else
                notify-send "youtube to mp3 conversion failed"
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


# Markdownview
view-mark() {
    OUTPUT_FILE="parsed-readme.html"
    if [[ $# -eq 0 ]]; then
        echo "Give an input you dummy";
    else
        for file in $@; do
            echo "Giving sequentially generated output in single HTML file"
            if [ -f $file ]; then
                echo "<br><h2>$file</h2>" >> $OUTPUT_FILE
                cat $file | cmark >> $OUTPUT_FILE;
            else
                echo "$file doesn't exist"
                return
            fi
        done
    fi
    
    if [ -f $OUTPUT_FILE ]; then
        echo "\nOpening browser"
        $BROWSER $OUTPUT_FILE

        sleep 5 # So that browser can find the file
        echo "Removing output html file"
        rm $OUTPUT_FILE
    else
        echo "No files could be parsed"
    fi
}
