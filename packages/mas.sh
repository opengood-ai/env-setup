install_mas() {
    write_info "Installing mas package..."

    write_info "Installing mas..."
    brew list mas &>/dev/null || brew install mas
    write_success "Done!"
    write_blank_line
}

uninstall_mas() {
    write_info "Uninstalling mas package..."

    write_info "Uninstalling mas..."
    brew uninstall mas || { write_warning "WARNING! mas is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
