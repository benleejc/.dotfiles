# script to activate python venv
activate () {
    dir_name=$(basename "$PWD")
    echo "looking for $dir_name venv in $HOME/.virtualenvs"
    . $HOME/.virtualenvs/${dir_name}/bin/activate
}
activate
