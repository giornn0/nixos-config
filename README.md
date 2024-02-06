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

