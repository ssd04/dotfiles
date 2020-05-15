
function scpfs() 
{   
    sshfs $1:/home/$2 $HOME/$1_mnt; 
    vifm $HOME/$1_mnt; 
    fusermount -u $HOME/$1_mnt;
}

