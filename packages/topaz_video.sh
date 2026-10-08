install_topaz_video() {
    write_info "Installing Topaz Video package..."

    if [[ ! -d "${apps_dir}/Topaz Video.app" ]]; then
        write_info "Installing Topaz Video..."
        brew list --cask topaz-video &>/dev/null || brew install --cask topaz-video
        write_success "Done!"
        write_blank_line
    else
        write_progress "Topaz Video is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_topaz_video() {
    write_info "Uninstalling Topaz Video package..."

    write_info "Uninstalling Topaz Video..."
    brew uninstall --cask topaz-video || { write_warning "WARNING! Topaz Video is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
