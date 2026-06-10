install_sqlite() {
    write_info "Installing SQLite package..."

    write_info "Installing SQLite..."
    brew list sqlite &>/dev/null || brew install sqlite
    write_success "Done!"
    write_blank_line
}

uninstall_sqlite() {
    write_info "Uninstalling SQLite package..."

    write_info "Uninstalling SQLite..."
    brew uninstall sqlite || { write_warning "WARNING! SQLite is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}