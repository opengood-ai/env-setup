install_clean_my_mac() {
    write_info "Installing CleanMyMac package..."

    if [[ ! -d "${apps_dir}/CleanMyMac.app" && ! -d "${apps_dir}/CleanMyMac_5.app" ]]; then
        write_info "Installing CleanMyMac..."
        brew list --cask cleanmymac &>/dev/null || brew install --cask cleanmymac
        write_success "Done!"
        write_blank_line
    else
        write_progress "CleanMyMac is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_clean_my_mac() {
    write_info "Uninstalling CleanMyMac package..."

    write_info "Uninstalling CleanMyMac..."
    brew uninstall --cask cleanmymac || { write_warning "WARNING! CleanMyMac is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
