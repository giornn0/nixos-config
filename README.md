# nixos-config

Clone the repo onto:

```
git clone  git@github.com:giornn0/nixos-config ~/.nixos_config
```

In the file /etc/nixos/configuration.nix, the boot-loader configs may need some tweaks related to your installation.

Keep in mind that you will need mostly the last part of this.

After the check for the configuration file, copy the hardware file:

```
sudo cp /etc/nixos/hardware-configuration.nix ~/nixos_config
```

Then setup the symlink with this folder:

```
sudo rm /etc/nixos && sudo ln -s ~/.nixos_config /etc/nixos
```

After setting up all the files run:

```
sudo nixos-rebuild switch
```

If everything runs fine, you can run the cmd: update whenever you want to change the configuration

Regarding Hyprland setup, some inspiration was taken from [@HeinzDev](https://github.com/HeinzDev/Hyprland-dotfiles) and [@fufexan](https://github.com/fufexan/dotfiles/tree/main/home) dotfiles.

For easy installation(pending config this inside the configuration) of global npm packages run:

```
npm config set prefix $HOME/.npm
```

After that you will be able to install packages with -g flag. And the cmd will be available thanks to that we already added the install path to the shell PATH.

```
npm -g @angular/language-server
```
