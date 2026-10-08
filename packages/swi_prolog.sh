install_swi_prolog() {
    write_info "Installing SWI-Prolog package..."

    write_info "Installing SWI-Prolog..."
    brew list swi-prolog &>/dev/null || brew install swi-prolog
    write_success "Done!"
    write_blank_line
}

uninstall_swi_prolog() {
    write_info "Uninstalling SWI-Prolog package..."

    write_info "Uninstalling SWI-Prolog..."
    brew uninstall swi-prolog || { write_warning "WARNING! SWI-Prolog is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
