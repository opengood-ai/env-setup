install_vscode() {
    write_info "Installing Visual Studio Code package..."

    if [[ ! -d "${apps_dir}/Visual Studio Code.app" ]]; then
        write_info "Installing Visual Studio Code..."
        brew list --cask visual-studio-code &>/dev/null || brew install --cask visual-studio-code
        write_success "Done!"
        write_blank_line
    else
        write_progress "Visual Studio Code is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_vscode() {
    write_info "Uninstalling Visual Studio Code package..."

    write_info "Uninstalling Visual Studio Code..."
    brew uninstall --cask visual-studio-code || { write_warning "WARNING! Visual Studio Code is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
