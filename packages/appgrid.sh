install_appgrid() {
    write_info "Installing AppGrid package..."

    if [[ ! -d "${apps_dir}/AppGrid.app" ]]; then
        write_info "Installing AppGrid..."
        brew install --cask appgrid
        write_success "Done!"
        write_blank_line
    else
        write_progress "AppGrid already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_appgrid() {
    write_info "Uninstalling AppGrid package..."

    write_info "Uninstalling AppGrid..."
    brew uninstall --cask appgrid || { write_warning "WARNING! AppGrid is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
