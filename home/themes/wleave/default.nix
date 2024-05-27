{config, ...}: let
  home_directory = "/home/giornn0";
in {
  home.file.".config/wleave/layout".text = ''
    {
        "label" : "lock",
        "action" : "hyprlock",
        "text" : "Lock",
        "keybind" : "l"
    }
    {
        "label" : "hibernate",
        "action" : "systemctl hibernate",
        "text" : "Hibernate",
        "keybind" : "h"
    }
    {
        "label" : "logout",
        "action" : "loginctl terminate-user $USER",
        "text" : "Logout",
        "keybind" : "e"
    }
    {
        "label" : "shutdown",
        "action" : "systemctl poweroff",
        "text" : "Shutdown",
        "keybind" : "s"
    }
    {
        "label" : "suspend",
        "action" : "systemctl suspend",
        "text" : "Suspend",
        "keybind" : "u"
    }
    {
        "label" : "reboot",
        "action" : "systemctl reboot",
        "text" : "Reboot",
        "keybind" : "r"
    }
  '';

  home.file.".config/wleave/style.css".text = ''
    window {
    	background-color: rgba(12, 12, 12, 0.9);
    }

    button {
      color: rgba(255,255,255, 1);
    	background-color: rgba(30, 30, 30, 0.95);
    	border-style: solid;
    	border-width: 2px;
    	background-repeat: no-repeat;
    	background-position: center;
    }

    button:focus, button:active, button:hover {
    	background-color: rgba(55, 0, 179, 1);
    	outline-style: none;
    }

    #lock {
        background-image: image(url("${home_directory}/.nixos_config/icons/lock.svg"), url("${home_directory}/.nixos_config/icons/lock.svg"));
    }

    #logout {
        background-image: image(url("${home_directory}/.nixos_config/icons/logout.svg"), url("${home_directory}/.nixos_config/icons/logout.svg"));
    }

    #suspend {
        background-image: image(url("${home_directory}/.nixos_config/icons/suspend.svg"), url("${home_directory}/.nixos_config/icons/suspend.svg"));
    }

    #hibernate {
        background-image: image(url("${home_directory}/.nixos_config/icons/hibernate.svg"), url("${home_directory}/.nixos_config/icons/hibernate.svg"));
    }

    #shutdown {
        background-image: image(url("${home_directory}/.nixos_config/icons/shutdown.svg"), url("${home_directory}/.nixos_config/icons/shutdown.svg"));
    }

    #reboot {
        background-image: image(url("${home_directory}/.nixos_config/icons/reboot.svg"), url("${home_directory}/.nixos_config/icons/reboot.svg"));
    }
  '';
}
