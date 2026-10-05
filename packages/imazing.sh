install_imazing() {
    write_info "Installing iMazing package..."

    if [[ ! -d "${apps_dir}/iMazing.app" ]]; then
        write_info "Installing iMazing..."
        brew list --cask imazing &>/dev/null || brew install --cask imazing
        write_success "Done!"
        write_blank_line
    else
        write_progress "iMazing is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_imazing() {
    write_info "Uninstalling iMazing package..."

    write_info "Uninstalling iMazing..."
    brew uninstall --cask imazing || { write_warning "WARNING! iMazing is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
