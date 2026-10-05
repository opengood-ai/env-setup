install_disk_drill() {
    write_info "Installing Disk Drill package..."

    if [[ ! -d "${apps_dir}/Disk Drill.app" ]]; then
        write_info "Installing Disk Drill..."
        brew list --cask disk-drill &>/dev/null || brew install --cask disk-drill
        write_success "Done!"
        write_blank_line
    else
        write_progress "Disk Drill is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_disk_drill() {
    write_info "Uninstalling Disk Drill package..."

    write_info "Uninstalling Disk Drill..."
    brew uninstall --cask disk-drill || { write_warning "WARNING! Disk Drill is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
