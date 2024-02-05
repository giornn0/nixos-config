{pkgs}:

pkgs.writeShellApplication {
        name ="podman_shutdown";
        text = ''
        #!/run/current-system/sw/bin/bash
        ${pkgs.podman}/bin/podman stop --all
        '';
}
