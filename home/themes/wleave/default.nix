{ config, ... }:
let home_directory = "/home/giornn0";
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
    * {
      background-image: none;
    }

    window {
      background-color: rgba(12, 12, 12, 0.9);
    }

    button {
      color: #ffffff;
      background-color: #1e1e1e;
      border-style: solid;
      border-width: 2px;
      background-repeat: no-repeat;
      background-position: center;
    }

    button:focus,
    button:active,
    button:hover {
      background-color: #3700b3;
      outline-style: none;
    }

    #lock {
      background-image: url("${home_directory}/.nixos_config/icons/lock.svg");
    }

    #logout {
      background-image: url("${home_directory}/.nixos_config"/icons/logout.svg");
    }

    #suspend {
      background-image: url("${home_directory}/.nixos_config/icons/suspend.svg");
    }

    #hibernate {
      background-image: url("${home_directory}/.nixos_config/icons/hibernate.svg");
    }

    #shutdown {
      background-image: url("${home_directory}/.nixos_config/icons/shutdown.svg");
    }

    #reboot {
      background-image: url("${home_directory}/.nixos_config/icons/reboot.svg");
    }
  '';
}
