install_gpg_keychain() {
    write_info "Installing GPG Keychain package..."

    if [[ ! -d "${apps_dir}/GPG Keychain.app" ]]; then
        write_info "Installing GPG Keychain..."
        brew list --cask gpg-suite-no-mail &>/dev/null || brew install --cask gpg-suite-no-mail
        write_success "Done!"
        write_blank_line
    else
        write_progress "GPG Keychain is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_gpg_keychain() {
    write_info "Uninstalling GPG Keychain package..."

    write_info "Uninstalling GPG Keychain..."
    brew uninstall --cask gpg-suite-no-mail || { write_warning "WARNING! GPG Keychain is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
