# Config

## Arch Setup

### User

    useradd -m -G wheel jmiguel
    passwd jmiguel

If wsl, in ps:

    wsl --manage ArchLinux --set-default-user jmiguel

### Initial packages

    pacman -S git vim tmux reflector openssh

### MirrorList

    reflector --country BR,US, --latest 200 --fastest 100 --sort rate --save /etc/pacman.d/mirrorlist

### Installs

- [Install yay](https://github.com/Jguer/yay)

- [Install powerlevel10k](https://github.com/romkatv/powerlevel10k)
    
    `yay -S --noconfirm zsh-theme-powerlevel10k-git`






