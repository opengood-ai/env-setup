install_ultimaker_cura() {
    write_info "Installing UltiMaker Cura package..."

    if [[ ! -d "${apps_dir}/UltiMaker Cura.app" ]]; then
        write_info "Installing UltiMaker Cura..."
        brew list --cask ultimaker-cura &>/dev/null || brew install --cask ultimaker-cura
        write_success "Done!"
        write_blank_line
    else
        write_progress "UltiMaker Cura is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_ultimaker_cura() {
    write_info "Uninstalling UltiMaker Cura package..."

    write_info "Uninstalling UltiMaker Cura..."
    brew uninstall --cask ultimaker-cura || { write_warning "WARNING! UltiMaker Cura is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
