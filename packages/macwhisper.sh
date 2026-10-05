install_macwhisper() {
    write_info "Installing MacWhisper package..."

    if [[ ! -d "${apps_dir}/MacWhisper.app" ]]; then
        write_info "Installing MacWhisper..."
        brew list --cask macwhisper &>/dev/null || brew install --cask macwhisper
        write_success "Done!"
        write_blank_line
    else
        write_progress "MacWhisper is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_macwhisper() {
    write_info "Uninstalling MacWhisper package..."

    write_info "Uninstalling MacWhisper..."
    brew uninstall --cask macwhisper || { write_warning "WARNING! MacWhisper is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
