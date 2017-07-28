#!/bin/sh
for dir in */
do stow --no-folding $dir
done
