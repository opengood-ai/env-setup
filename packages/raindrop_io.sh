install_raindrop_io() {
    write_info "Installing Raindrop.io package..."

    if [[ ! -d "${apps_dir}/Raindrop.io.app" ]]; then
        write_info "Installing Raindrop.io..."
        brew list raindropio &>/dev/null || brew install --cask raindropio
        write_success "Done!"
        write_blank_line
    else
        write_progress "Raindrop.io is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_raindrop_io() {
    write_info "Uninstalling Raindrop.io package..."

    write_info "Uninstalling Raindrop.io..."
    brew uninstall --cask raindropio || { write_warning "WARNING! Raindrop.io is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
