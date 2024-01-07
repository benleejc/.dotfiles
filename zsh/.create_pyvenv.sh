#!/usr/bin/env bash

read -p "create using current directory name? [Y/n]: " res
res=$(echo "$res" | tr '[:upper:]' '[:lower:]')
if [[ "$res" == "yes" || "$res" == 'y' ]]
    then
        cwd=$(pwd)
        dir_name=$(basename "$cwd") 
    else
        read -p "choose venv name: " dir_name
fi

echo "initialising new venv for project in ~/.virtualenvs/${dir_name}.."
venv_directory="$HOME/.virtualenvs"
if [ ! -d "$venv_directory" ]
    then 
        echo "${venv_directory} doesn't exist.."
        echo "Creating ${venv_directory}"
        mkdir -p $venv_directory
        echo "Creating venv.."
fi

if [ ! -d "$venv_directory/$dir_name" ]
    then
        python -m venv $venv_directory/$dir_name
    else
        echo "venv directory already exists"
        echo "exiting program"
fi
