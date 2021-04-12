
scpfs()
{   
    sshfs $1:/home/$2 $HOME/$1_mnt; 
    vifm $HOME/$1_mnt; 
    fusermount -u $HOME/$1_mnt;
}

translate()
{   
    : '
    Translate from Romanian to English
    '

    args="${@}"
    trans -brief ro:en ${args}
}

###################################
# TMUX
###################################

dev()
{   
    : '
    Create windows setup for dev work
    '

    tmux split-window -c "#{pane_current_path}" ; 
    tmux resize-pane -D 15 ; 
    tmux split-window -h -c "#{pane_current_path}" ; 
    tmux last-pane ;
    tmux select-pane -U ;
    nvim .
}

###################################
# WebCam
###################################

camera()
{   
    : '
    View Webcam in vlc
    '

    vlc v4l2:// :input-slave=alsa:// :v4l-vdev="/dev/video0"
}

###################################
# Phone
###################################

phone()
{
    : '
    Mount Android Phone.
    jmtpfs has to be installed due to incompatibility between MTP and regular USB
    '

    jmtpfs /mnt/phone
}
