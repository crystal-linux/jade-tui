#!/usr/bin/bash
gum confirm "$(gum style --border normal --margin '1' --padding '1 2' --border-foreground 212 'Welcome to jade-tui, ready to start your installation?')" && CONTINUE=true
if [[ $CONTINUE != "true" ]]; then
	echo "Exiting. Have a good day!"
	exit
fi
keymap=$(localectl list-keymaps | gum filter --placeholder "select a keymap")
echo $keymap
timezone=$(timedatectl list-timezones | gum filter --placeholder "select a timezone")
echo $timezone
gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "Please enter your username"
username=$(gum input --placeholder "Please enter your username")
echo $username
matches="false"
passwrong="false"
while [[ "$matches" == "false" ]]; do
	clear
	if [[ "$passwrong" == "true" ]]; then
		gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "Passwords did not match, please type the password again"
	else
		gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "Now enter your password"
	fi
	password=$(gum input --password --placeholder "Please enter a password")
	echo $password
	gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "Verify your password"
	password_verif=$(gum input --password --placeholder "Type your password again")
	if [[ "$password" == "$password_verif" ]]; then
		matches="true"
	else
		passwrong="true"
	fi
done
gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "Select a desktop to use"
desktop=$(gum choose --limit 1 gnome kde budgie mate cinnamon lxqt sway i3gaps herbstluftwm awesome bspwm)
gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "Some miscellaneous settings"
misc_settings=$(gum choose --limit 2 "Enable ipv6" "Enable timeshift")
enable_ipv6="false"
enable_timeshift="true"
if [[ $misc_settings == *"ipv6"* ]]; then
	enable_ipv6="true"
fi
if [[ $misc_settings == *"timeshift"* ]]; then
	enable_timeshift="true"
fi
gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "Please select the disk to install to  $(gum style --foreground 212 'WARNING: This will erease the whole disk')"
disk=$(lsblk -pdo name | grep -v zram | grep -v NAME | grep -v loop | grep -v sr | gum choose --limit 1)
bios_type=$([ -d /sys/firmware/efi ] && echo UEFI || echo Legacy BIOS)

