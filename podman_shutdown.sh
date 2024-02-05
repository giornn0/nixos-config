#!/usr/bin/env bash

containers=$("${pkgs.podman}"/bin/podman ps | "${pkgs.ripgrep}"/bin/ripgrep -v 'CONTAINER ID' | /etc/profiles/per-user/giornn0/bin/awk '{print $1}')
length=${#containers}
echo "$length"

while [ "$length" -gt "0" ]
do
        for i in $containers
        do
                "${pkgs.podman}"/bin/podman stop "$i"
        done
        containers=$("${pkgs.podman}"/bin/podman ps | "${pkgs.ripgrep}"/bin/ripgrep -v 'CONTAINER ID' | /etc/profiles/per-user/giornn0/bin/awk '{print $1}')
        length=${#containers}
done
