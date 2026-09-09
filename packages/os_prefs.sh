get_os_prefs_dependencies() {
    write_info "Getting macOS preferences package dependencies to install..."

    local dependencies=()
    dependencies+=("dockutil")

    local array
    array="$(declare -p dependencies)"
    local IFS=$'\v'
    echo "${array#*=}"
}

install_os_prefs() {
    write_info "Installing macOS preferences..."

    write_info "Setting macOS menu clock format..."
    write_info "http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns"
    defaults write com.apple.menuextra.clock "DateFormat" 'EEE MMM d  h:mm:ss a'
    killall SystemUIServer
    write_success "Done!"
    write_blank_line

    write_info "Setting fast key repeat rates..."
    write_warning "NOTE: Requires reboot to take effect"
    defaults write -g KeyRepeat -int 1
    defaults write -g InitialKeyRepeat -int 15
    write_success "Done!"
    write_blank_line

    write_info "Setting Finder to display full path in title bar..."
    defaults write com.apple.finder '_FXShowPosixPathInTitle' -bool true
    write_success "Done!"
    write_blank_line

    write_info "Setting Photos to stop opening automatically..."
    defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
    write_success "Done!"
    write_blank_line

    write_info "Setting auto-hide macOS Dock..."
    defaults write com.apple.dock autohide -bool true
    killall Dock
    write_success "Done!"
    write_blank_line

    write_info "Configuring Dock applications layout..."
    write_blank_line

    write_info "Removing all Dock applications..."
    dockutil --remove all 2>/dev/null || true
    write_success "Done!"
    write_blank_line

    write_info "Adding core applications to Dock..."

    # Organization
    dockutil --add "${apps_dir}/AppGridMac.app" 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'AppGridMac' 2>/dev/null || true

    # Security
    dockutil --add "${sys_apps_dir}/Passwords.app" 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'Passwords' 2>/dev/null || true

    # Web Browsers
    dockutil --add "${apps_dir}/Safari.app" 2>/dev/null || true
    dockutil --add "${apps_dir}/Google Chrome.app" 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'Google Chrome'

    # Email, Messaging & Video
    dockutil --add "${sys_apps_dir}/Messages.app"
    dockutil --add "${sys_apps_dir}/FaceTime.app" 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'FaceTime' 2>/dev/null || true

    # Productivity
    dockutil --add "${apps_dir}/Obsidian.app" 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/Calendar.app" 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/Reminders.app" 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'Reminders' 2>/dev/null || true

    # Software Engineering
    dockutil --add "${apps_dir}/PyCharm.app" 2>/dev/null || true
    dockutil --add "${apps_dir}/iTerm.app" 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'iTerm' 2>/dev/null || true

    # AI & Math
    dockutil --add "${apps_dir}/Claude.app" 2>/dev/null || true
    dockutil --add "${apps_dir}/ChatGPT.app" 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'ChatGPT' 2>/dev/null || true

    # System
    dockutil --add "${sys_apps_dir}/Phone.app" 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/iPhone Mirroring.app" 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/App Store.app" 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/System Settings.app" 2>/dev/null || true

    write_success "Done!"
    write_blank_line

    if [[ -f "${setup_dir}/custom-os-prefs.sh" ]]; then
        write_info "Applying custom Dock preferences from 'custom-os-prefs.sh'..."
        source "${setup_dir}/custom-os-prefs.sh"
        if function_exists "install_custom_os_prefs"; then
            install_custom_os_prefs
        fi
        write_success "Done!"
        write_blank_line
    else
        write_warning "WARNING! No 'custom-os-prefs.sh' found in repo root, skipping custom Dock apps."
        write_warning "Copy '.custom-os-prefs.sh' to 'custom-os-prefs.sh' and customize it to add your own apps."
        write_blank_line
    fi

    write_info "Refreshing Dock..."
    killall Dock
    write_blank_line

    write_success "Done!"
    write_blank_line
}

uninstall_os_prefs() {
    write_info "Uninstalling macOS preferences..."

    write_info "Resetting macOS menu clock format..."
    defaults write com.apple.menuextra.clock "DateFormat" 'EEE h:mm a'
    killall SystemUIServer
    write_success "Done!"
    write_blank_line

    write_info "Resetting Finder to not display full path in title bar..."
    defaults write com.apple.finder '_FXShowPosixPathInTitle' -bool false
    write_success "Done!"
    write_blank_line

    write_info "Resetting Photos to open automatically..."
    defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool false
    write_success "Done!"
    write_blank_line

    write_info "Resetting auto-hide macOS Dock..."
    defaults write com.apple.dock autohide -bool false
    killall Dock
    write_success "Done!"
    write_blank_line

    write_info "Resetting Dock to default applications layout..."
    dockutil --remove all 2>/dev/null || true
    if dockutil --find App\ Store | grep "was not found"; then dockutil --add "${apps_dir}"/App\ Store.app; fi
    if dockutil --find System\ Preferences | grep "was not found"; then dockutil --add "${apps_dir}"/System\ Preferences.app; fi
    killall Dock
    write_success "Done!"
    write_blank_line
}
