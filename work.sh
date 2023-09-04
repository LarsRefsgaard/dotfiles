read -e -p "Is this a work machine? " choice
if [[ "$choice" == [Yy]* ]]; then
    echo "Installing work packages"
    brew bundle --file Brewfile.work

    git clone https://github.com/flutter/flutter.git -b stable
    set -Ua fish_user_paths ~/flutter/bin/
fi
