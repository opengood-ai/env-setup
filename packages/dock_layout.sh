# Start a batch of Dock changes
# Pauses the Dock process while dockutil edits its preferences. Editing a running
# Dock one change at a time (restarting it after each) races with the Dock
# rewriting its own preferences, which loses apps and produces a random layout
# order. The EXIT trap resumes the Dock if the script aborts mid-batch.
begin_dock_batch() {
    trap 'killall -CONT Dock 2>/dev/null || true' EXIT
    killall -STOP Dock
}

# Apply the batch of Dock changes in one step
# Force-quits the paused Dock so it relaunches from the updated preferences
# without first writing back its stale in-memory layout
commit_dock_batch() {
    killall -9 Dock
    trap - EXIT
}

# Run dockutil without restarting the Dock after every change
# Used with begin_dock_batch/commit_dock_batch, which restart the Dock once
dockutil() {
    command dockutil "$@" --no-restart
}

apply_custom_dock_layout() {
    local custom_file="${setup_dir}/custom-dock-layout.sh"

    if [[ ! -f "${custom_file}" ]]; then
        write_warning "WARNING! No 'custom-dock-layout.sh' found in repo root, skipping custom Dock apps."
        write_warning "Copy '.custom-dock-layout.sh' to 'custom-dock-layout.sh' and customize it to add your own apps."
        write_blank_line
        return 0
    fi

    write_info "Applying custom Dock layout from 'custom-dock-layout.sh'..."
    source "${custom_file}"
    if function_exists "install_custom_dock_layout"; then
        install_custom_dock_layout
    else
        write_warning "WARNING! 'custom-dock-layout.sh' does not define 'install_custom_dock_layout()'."
    fi
    write_success "Done!"
    write_blank_line
}

get_dock_layout_dependencies() {
    write_info "Getting Dock layout package dependencies to install..."

    local dependencies=()
    dependencies+=("dockutil")

    local array
    array="$(declare -p dependencies)"
    local IFS=$'\v'
    echo "${array#*=}"
}

install_dock_layout() {
    write_info "Installing Dock layout..."

    write_info "Configuring Dock applications layout..."
    write_blank_line

    begin_dock_batch

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
    dockutil --add '' --type small-spacer --after 'Google Chrome' 2>/dev/null || true

    # Email, Messaging & Video
    dockutil --add "${sys_apps_dir}/Messages.app" 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/FaceTime.app" 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/QuickTime Player.app" 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'QuickTime Player' 2>/dev/null || true

    # Productivity
    dockutil --add "${sys_apps_dir}/Calendar.app" 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/Reminders.app" 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/VoiceMemos.app" 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/Preview.app" 2>/dev/null || true
    dockutil --add "${apps_dir}/Obsidian.app" 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'Obsidian' 2>/dev/null || true

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

    apply_custom_dock_layout

    write_info "Refreshing Dock..."
    commit_dock_batch
    write_blank_line

    write_success "Done!"
    write_blank_line
}

uninstall_dock_layout() {
    write_info "Uninstalling Dock layout..."

    write_info "Resetting Dock to default applications layout..."
    begin_dock_batch
    dockutil --remove all 2>/dev/null || true
    if dockutil --find App\ Store | grep "was not found"; then dockutil --add "${sys_apps_dir}"/App\ Store.app; fi
    if dockutil --find System\ Settings | grep "was not found"; then dockutil --add "${sys_apps_dir}"/System\ Settings.app; fi
    commit_dock_batch
    write_success "Done!"
    write_blank_line
}
