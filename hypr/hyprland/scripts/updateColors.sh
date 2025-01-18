#!/bin/bash

image_path=$(swww query | grep -oP 'currently displaying: image: \K.+' | head -n 1)
wallust run $image_path -s # -s to skip terminal color update
