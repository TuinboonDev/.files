echo "Tuinboon's .files"

echo "Applying wallpaper"
curl -o /tmp/wallpaper.png "https://raw.githubusercontent.com/TuinboonDev/.files/refs/heads/main/wallpaper.png"
echo "Wallpaper downloaded"

gsettings reset org.gnome.desktop.background picture-uri
gsettings reset org.gnome.desktop.background picture-options
echo "Reset wallpaper options"

gsettings set org.gnome.desktop.background picture-uri "file:///tmp/wallpaper.png"
gsettings set org.gnome.desktop.background picture-uri-dark "file:///tmp/wallpaper.png"
echo "Wallpaper applied"

sudo pacman -S gtk-engine-murrine
echo "Installed one dependency"

echo "Installing theme"
curl -o /tmp/theme.zip "https://github.com/TuinboonDev/.files/raw/refs/heads/main/Rosepine-Dark-B-MB.zip"
unzip /tmp/theme.zip -d /tmp/theme
echo "Theme downloaded"

mv /tmp/theme/Rosepine-Dark/gtk-4.0/assets ~/.config/gtk-4.0
mv /tmp/theme/Rosepine-Dark/gtk-4.0/gtk.css ~/.config/gtk-4.0
mv /tmp/theme/Rosepine-Dark/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0
echo "Theme was installed"

echo "Downloading extension: openbar"
git clone https://github.com/neuromorph/openbar.git \
	~/.local/share/gnome-shell/extensions/openbar@neuromorph
curl -o /tmp/openbar.config "https://raw.githubusercontent.com/TuinboonDev/.files/refs/heads/main/opbenbar.config"
echo "Extension: openbar, has been downloaded"
echo "Please follow the instruction in the README to load the openbar config"

echo "Downloading extension: Dash2Dock Animated"

git clone https://github.com/icedman/dash2dock-lite.git \
    /tmp/dash2dock
cd /tmp/dash2dock-lite
make
echo "Built exension: Dash2Dock Animated"

curl -o ~/.local/share/gnome-shell/extensions/dash2dock-lite@icedman.github.com/themes/themes.json "https://raw.githubusercontent.com/TuinboonDev/.files/refs/heads/main/themes.json"
echo "Please follow the instructions in the README to load the Dash2Dock config"

rm -rf "/tmp/dash2dock"
echo "Installation finished, any issues? DM tuinboon on discord or tuinboon in the HackClub Slack"
