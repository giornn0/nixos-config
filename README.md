## NixOs config

Clone the repo:

```
git clone  git@github.com:giornn0/nixos-config ~/.nixos_config
```

> In the file /etc/nixos/configuration.nix, the boot-loader configurations
> may need some tweaks related to your installation.

Keep in mind that you will need mostly the last part of this file.

After the check for the configuration file, copy the hardware file:

```
sudo cp /etc/nixos/hardware-configuration.nix ~/nixos_config/base
```

Then setup the symlink with this folder:

```
sudo rm /etc/nixos && sudo ln -s ~/.nixos_config /etc/nixos
```

After setting up all the files run:

```
sudo nixos-rebuild switch
```

If everything runs fine, you can run the cmd: `os-update` whenever you want to change the configuration

## Hyprland

Regarding Hyprland setup, some inspiration was taken from [@HeinzDev](https://github.com/HeinzDev/Hyprland-dotfiles) and [@fufexan](https://github.com/fufexan/dotfiles/tree/main/home) dotfiles.

## NPM global packages

For now, I handle npm packages with a local installation for user:

```
npm config set prefix $HOME/.npm
```

After that you will be able to install packages with -g flag.

```
npm -g @angular/language-server
```

The possible command will be available because there is already configured the directory
$HOME/.npm in the shell PATH.

## Update

For package version update, use `nix flake update`
Otherwise for general changes, use `os-update`

## Clean USB

1. First, identify the USB drive device name (e.g., /dev/sdb) using a command like:

```
lsblk
```

2. Unmount any partition on the USB drive:

```
sudo umount /dev/sd{X}
```

> Replace the {x} with letter of the correspondent USB drive. 3. Use the `dd` command to overwrite the drive with zeros:

```
sudo dd if=/dev/zero of=/dev/sd{x} bs=4M status=progress
```

> This will erase the data on the drive. 4. After the process complete you can create a new partition:

```
sudo fdisk /dev/sd{x}
```

- Press 'o' to create a new empty DOS partition table, then 'w' to write the changes and exit.

5. Finally you can format the drive with a new filesystem:

```
sudo mkfs.vfat /dev/sd{x}
```
