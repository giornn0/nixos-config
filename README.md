# nixos-config

Clone the repo onto:

```
  git clone  git@github.com:giornn0/nixos-config ~/.nixos_config
```

In the configuration.nix, the boot-loader configs may need some tweaks related to your installation.

Keep in mind that you will need mostly the last part of this.

After that copy into the default location (pending config with symlink):

```
  sudo cp ./* /etc/nixos/
```

After setting up all the files run:

```
sudo nixos-rebuild switch
```

If everything runs fine, you can run the cmd: update whenever you want to change the configuration
