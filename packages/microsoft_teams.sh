install_microsoft_teams() {
    write_info "Installing Microsoft Teams package..."

    if [[ ! -d "${apps_dir}/Microsoft Teams.app" ]]; then
        write_info "Installing Microsoft Teams..."
        brew list --cask microsoft-teams &>/dev/null || brew install --cask microsoft-teams
        write_success "Done!"
        write_blank_line
    else
        write_progress "Microsoft Teams is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_microsoft_teams() {
    write_info "Uninstalling Microsoft Teams package..."

    write_info "Uninstalling Microsoft Teams..."
    brew uninstall --cask microsoft-teams || { write_warning "WARNING! Microsoft Teams is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
