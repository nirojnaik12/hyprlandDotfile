# HYPRLAND CONFIG FILE

I am an Arch user, and I want to maintain a backup of my configuration files for convenience. This way, if I ever crash my OS, I can easily restore my old configs. Currently, I'm working on configuring my window manager (Hyprland), and I update my config files weekly whenever I make changes. Some of my config files might look similar to other dotfiles available online. I deeply respect the effort and hard work of the original creators, and I always give proper credit to them as authors in my files. Please don't misuse or create unnecessary confusion.

### How to install hyprland on your distro

You can install Hyprland using a package manager or manually. The installation method may vary depending on your Linux distribution, as different distros have different package managers. For Debian-based systems, a stable package might not always be available. However, there are options for Ubuntu users as well. You can find more details and installation instructions in the official repository.[click here](https://github.com/JaKooLit/Debian-Hyprland) to visit the repository .
I recomand you to read instructions from [Hyperland Wiki](https://wiki.hypr.land/Getting-Started/Installation/).

#### hyprland
```
sudo pacman -S hyprland
```
if you use yay, installation from AUR
```
yay -S hyprland-git
```
make sure you installed the dependencies
```
yay -S ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite libxrender libxcursor pixman wayland-protocols cairo pango libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio tomlplusplus hyprlang-git hyprcursor-git hyprwayland-scanner-git xcb-util-errors hyprutils-git glaze hyprgraphics-git aquamarine-git re2 hyprland-qtutils
```
Once you have installed make sure you have already sddm and switched to sddm
for more knowledge about sddm [click here](https://wiki.archlinux.org/title/SDDM)

After installation you can just copy my entire directory and pest there but you must remember to make a backup of your previous hypr directory. If something wrong happend you can atleast restore your previous setting

### status bar

At first you dont have anything like status bar on your desktop. You have to install waybar or polybar whatever you like. As for me, I love to use waybar and I copied from another person. You can also search for your self or you may copy from me. 
But at first you need to install waybar or polybar

#### waybar
```
sudo pacman -S waybar
```

#### polybar
```
sudo pacman -S polybar
```
there is two main file you need, first the config.jsonc file and other one is style.css
