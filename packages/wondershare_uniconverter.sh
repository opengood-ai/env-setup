install_wondershare_uniconverter() {
    write_info "Installing Wondershare UniConverter package..."

    if ! compgen -G "${apps_dir}/Wondershare UniConverter*.app" >/dev/null; then
        write_info "Installing Wondershare UniConverter..."
        brew list --cask wondershare-uniconverter &>/dev/null || brew install --cask wondershare-uniconverter
        write_success "Done!"
        write_blank_line
    else
        write_progress "Wondershare UniConverter is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_wondershare_uniconverter() {
    write_info "Uninstalling Wondershare UniConverter package..."

    write_info "Uninstalling Wondershare UniConverter..."
    brew uninstall --cask wondershare-uniconverter || { write_warning "WARNING! Wondershare UniConverter is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
