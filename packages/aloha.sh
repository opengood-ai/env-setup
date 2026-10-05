install_aloha() {
    write_info "Installing Aloha package..."

    if [[ ! -d "${apps_dir}/Aloha.app" ]]; then
        write_info "Installing Aloha..."
        brew list --cask aloha-browser &>/dev/null || brew install --cask aloha-browser
        write_success "Done!"
        write_blank_line
    else
        write_progress "Aloha is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_aloha() {
    write_info "Uninstalling Aloha package..."

    write_info "Uninstalling Aloha..."
    brew uninstall --cask aloha-browser || { write_warning "WARNING! Aloha is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
