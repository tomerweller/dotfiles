#!/bin/bash

pkgs=(`pacman -Sql core`)
toplevel=(`pacman -Sql core`)
for b in ${pkgs[@]}; do
    deps=`pacman -Si $b | sed -n "/^Depends On/{s/Depends On *: \(.*\)/\1/;p}"`
    for d in $deps; do
        toplevel=(${toplevel[@]/$d/})
    done
done
echo ${toplevel[@]}
