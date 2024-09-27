#!/usr/bin/env bash

comm -13 <(pacman -Q | awk '{print $1}' | sort) <(comm -12 <(pacman -Q | awk '{print $1 "-docs"}' | sort) <(pacman -Ssq | sort))
