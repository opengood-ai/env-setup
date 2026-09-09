install_obsidian() {
    write_info "Installing Obsidian package..."

    if [[ ! -d "${apps_dir}/Obsidian.app" ]]; then
        write_info "Installing Obsidian..."
        brew install --cask obsidian
        write_success "Done!"
        write_blank_line
    else
        write_progress "Obsidian already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_obsidian() {
    write_info "Uninstalling Obsidian package..."

    write_info "Uninstalling Obsidian..."
    brew uninstall --cask obsidian || { write_warning "WARNING! Obsidian is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
