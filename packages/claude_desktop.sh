install_claude_desktop() {
    write_info "Installing Claude Desktop package..."

    if [[ ! -d "${apps_dir}/Claude.app" ]]; then
        write_info "Installing Claude Desktop..."
        brew install --cask claude
        write_success "Done!"
        write_blank_line
    else
        write_progress "Claude Desktop already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_claude_desktop() {
    write_info "Uninstalling Claude Desktop package..."

    write_info "Uninstalling Claude Desktop..."
    brew uninstall --cask claude || { write_warning "WARNING! Claude Desktop is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
