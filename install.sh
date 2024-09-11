packages=(
    firefox
    polkit-kde-agent
    nwg-look
    rofi-wayland
    unzip
    waybar
    thunar
    pipewire-pulse
    pavucontrol
    fastfetch
    blueman
    ttf-jetbrains-mono-nerd
)

# Prompt the user for a yes or no answer
read -p "Would you like to install the Required Packages? (y/n): "  answerPackages

# Convert the answer to lowercase
answerPackages=$(echo "$answerPackages" | tr '[:upper:]' '[:lower:]')

# Check the user's response for configuration installation
if [[ "$answerPackages" == "y" || "$answerPackages" == "yes" ]]; then
    # Update the package database and install the packages
    sudo pacman -Syu --noconfirm "${packages[@]}"
    # Confirm Completion
    echo "All packages have been installed successfully."
elif [[ "$answerPackages" == "n" || "$answerPackages" == "no" ]]; then
    echo "No packages were installed."
else
    # Check if user, selected not select a valid option and prompt again
    echo "Invalid response. Please answer with 'y' or 'n'. Now exiting"
    exit 0
fi

# Prompt the user for a yes or no answer
read -p "Would you like to install the Configs? (y/n): "  answerConfigs

# Convert the answer to lowercase
answer=$(echo "$answerConfigs" | tr '[:upper:]' '[:lower:]')

# Check the user's response for configuration installation
if [[ "$answerConfigs" == "y" || "$answerConfigs" == "yes" ]]; then
    cp -rT .config/ ~/.config/
elif [[ "$answerConfigs" == "n" || "$answerConfigs" == "no" ]]; then
    echo "No Configs were installed."
else
    echo "Invalid response. Please answer with 'y' or 'n'. Now exiting"
    exit 0
fi

# Prompt the user for a yes or no answer
read -p "Would you like to install the Cattpuccino GTK Theme? (y/n): "  answerThemes

# Convert the answer to lowercase
answer=$(echo "$answerThemes" | tr '[:upper:]' '[:lower:]')

# Check the user's response for configuration installation
if [[ "$answerThemes" == "y" || "$answerThemes" == "yes" ]]; then
    cp -rT Themes/ /usr/share/themes/
elif [[ "$answerThemes" == "n" || "$answerThemes" == "no" ]]; then
    echo "No Themes were installed."
    exit 0
else
    echo "Invalid response. Please answer with 'y' or 'n'. Now exiting"
    exit 0
fi

exit 0
