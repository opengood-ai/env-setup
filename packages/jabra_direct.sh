install_jabra_direct() {
    write_info "Installing Jabra Direct package..."

    if [[ ! -d "${apps_dir}/Jabra Direct.app" ]]; then
        write_info "Installing Jabra Direct..."
        brew list --cask jabra-direct &>/dev/null || brew install --cask jabra-direct
        write_success "Done!"
        write_blank_line
    else
        write_progress "Jabra Direct is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_jabra_direct() {
    write_info "Uninstalling Jabra Direct package..."

    write_info "Uninstalling Jabra Direct..."
    brew uninstall --cask jabra-direct || { write_warning "WARNING! Jabra Direct is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
