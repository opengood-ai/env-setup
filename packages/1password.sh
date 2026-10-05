install_1password() {
    write_info "Installing 1Password package..."

    if [[ ! -d "${apps_dir}/1Password.app" ]]; then
        write_info "Installing 1Password..."
        brew list --cask 1password &>/dev/null || brew install --cask 1password
        write_success "Done!"
        write_blank_line
    else
        write_progress "1Password is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_1password() {
    write_info "Uninstalling 1Password package..."

    write_info "Uninstalling 1Password..."
    brew uninstall --cask 1password || { write_warning "WARNING! 1Password is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
