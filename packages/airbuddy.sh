install_airbuddy() {
    write_info "Installing AirBuddy package..."

    if [[ ! -d "${apps_dir}/AirBuddy.app" ]]; then
        write_info "Installing AirBuddy..."
        brew list --cask airbuddy &>/dev/null || brew install --cask airbuddy
        write_success "Done!"
        write_blank_line
    else
        write_progress "AirBuddy is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_airbuddy() {
    write_info "Uninstalling AirBuddy package..."

    write_info "Uninstalling AirBuddy..."
    brew uninstall --cask airbuddy || { write_warning "WARNING! AirBuddy is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
