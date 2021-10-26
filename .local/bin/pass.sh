#!/usr/bin/env bash

# set -x

# Config file format
# - value represents the token name for pass script
# 
# $ cat ~/.pass_sites
# [sites]
# key=value
# 
# [apps]
# anotherkey=anothervalue
config_file=~/.pass_sites

set_pass_to_clipboard()
{
    # Save data to clipboard
    #
    # Input: pass identifier

    local pass_identifier=$1
    #pass adm/pass | tee >( xclip -selection clipboard ) >( xclip ) >/dev/null
    pass ${pass_identifier} | xclip -selection clipboard
    pass ${pass_identifier} | xclip
}

get_last_site() 
{
    # Get last accessed url from Google Chrome
    # 
    # Output: site name

    # local site=$(strings ~/.config/google-chrome/Default/Current\ Session | grep -E '^https?://' | tail -n 1 | sed -r 's/^https?:\/\/([^.]+)\..*/\1/g')
    local site=$(strings ~/.config/google-chrome/Default/Sessions/Session_* | grep -E '^https?://' | tail -n 1 | sed -r 's/^https?:\/\/([^.]+)\..*/\1/g')
    echo $site
}

get_active_window() 
{
    # Get active window
    #
    # Output: window name

    local win=$(xprop -id $(xdotool getactivewindow) | grep 'WM_CLASS(STRING)' | cut -d'"' -f2)
    echo $win
}

main()
{
    # Read config file
    while read line; do 
        if [[ $line =~ ^"["(.+)"]"$ ]]; then 
            arrname=${BASH_REMATCH[1]}
            declare -A $arrname
        elif [[ $line =~ ^(.*)"="(.*) ]]; then 
            declare ${arrname}[${BASH_REMATCH[1]}]="${BASH_REMATCH[2]}"
        fi
    done < ${config_file}

    local win=$(get_active_window)

    case $win in
        "google-chrome")
                local last_site=$(get_last_site)
                for site in "${!sites[@]}"; do
                    if [ "$site" = "$last_site" ]; then
                          set_pass_to_clipboard "${sites[$site]}"
                    fi
                done
            ;;
        "xfce4-terminal") set_pass_to_clipboard ${apps[xfce4-terminal]}
            ;;
        "st-256color") set_pass_to_clipboard ${apps[st-256color]}
            ;;
        *) set_pass_to_clipboard ${apps[default]} 
            ;;
    esac
}

main $@

exit 0
