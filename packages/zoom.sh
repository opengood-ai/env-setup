install_zoom() {
    write_info "Installing Zoom package..."

    if [[ ! -d "${apps_dir}/zoom.us.app" ]]; then
        write_info "Installing Zoom..."
        brew list --cask zoom &>/dev/null || brew install --cask zoom
        write_success "Done!"
        write_blank_line
    else
        write_progress "Zoom is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_zoom() {
    write_info "Uninstalling Zoom package..."

    write_info "Uninstalling Zoom..."
    brew uninstall --cask zoom || { write_warning "WARNING! Zoom is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
