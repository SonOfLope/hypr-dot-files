#!/bin/bash

link_config() {
    src="$1"
    dest="$2"
    
    # Check if the destination is a symlink, broken or not
    if [ -L "$dest" ]; then
        # Check if the symlink is broken
        if ! [ -e "$dest" ]; then
            echo "Warning: Broken symlink detected at $dest. Removing it."
            rm "$dest"
        else
            echo "Symlink $dest already exists and is not broken. Skipping."
            return
        fi
    fi

    # If the destination is a file or directory but not a symlink
    if [ -e "$dest" ]; then
        echo "----------------------------------------------------------------"
        echo "Warning: $dest already exists as a directory or file."
        echo "Contents:"
        ls -l "$dest"
        read -p "Do you want to replace it with a symlink? (y/N): " confirmation
        case $confirmation in
            [Yy]* )
                rm -rf "$dest"
                ;;
            * )
                echo "Skipped creating symlink for $dest."
                return
                ;;
        esac
    fi

    # Create the symlink
    echo "Creating symlink $dest -> $src"
    ln -s "$src" "$dest"
}



link_config $(pwd)/config/alacritty ~/.config/alacritty
link_config $(pwd)/config/autorandr ~/.config/autorandr
link_config $(pwd)/config/hypr ~/.config/hypr
link_config $(pwd)/config/waybar ~/.config/waybar
link_config $(pwd)/config/system_scripts ~/.config/system_scripts
link_config $(pwd)/backgrounds ~/.config/backgrounds
link_config $(pwd)/config/dunst ~/.config/dunst
link_config $(pwd)/config/rofi ~/.config/rofi
link_config $(pwd)/config/wlogout ~/.config/wlogout
link_config $(pwd)/config/swaylock ~/.config/swaylock
link_config $(pwd)/config/neofetch ~/.config/neofetch
link_config $(pwd)/config/Thunar ~/.config/Thunar
link_config $(pwd)/config/gtk-3.0 ~/.config/gtk-3.0
