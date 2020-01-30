#!/bin/bash

bgcolor() {
    for((i=16; i<256; i++)); do
        printf "\e[48;5;${i}m%03d" $i;
        printf '\e[0m';
        [ ! $((($i - 15) % 6)) -eq 0 ] && printf ' ' || printf '\n'
    done

    for((i=30; i<112; i++)); do
        printf "\e[0;${i}m\]%03d" $i;
        printf '${i}' $i;
        [ ! $((($i - 15) % 6)) -eq 0 ] && printf ' ' || printf '\n'
    done
}
