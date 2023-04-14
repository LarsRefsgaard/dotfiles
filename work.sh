read -e -p "Is this a work machine? " choice
if [[ "$choice" == [Yy]* ]]; then
    echo "Installing work packages"
    brew bundle --file Brewfile.work
fi
