install_pcloud_drive() {
    write_info "Installing pCloud Drive package..."

    if [[ ! -d "${apps_dir}/pCloud Drive.app" ]]; then
        write_info "Tapping third-party Homebrew tap 'lyraphase/pcloud'..."
        brew tap lyraphase/pcloud
        write_info "Installing pCloud Drive..."
        brew list --cask pcloud-drive &>/dev/null || brew install --cask lyraphase/pcloud/pcloud-drive
        write_success "Done!"
        write_blank_line
    else
        write_progress "pCloud Drive is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_pcloud_drive() {
    write_info "Uninstalling pCloud Drive package..."

    write_info "Uninstalling pCloud Drive..."
    brew uninstall --cask pcloud-drive || { write_warning "WARNING! pCloud Drive is not installed and cannot be uninstalled. Continuing on."; }
    brew untap lyraphase/pcloud || { write_warning "WARNING! Tap 'lyraphase/pcloud' is not tapped and cannot be untapped. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
