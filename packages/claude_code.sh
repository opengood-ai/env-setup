install_claude_code() {
    write_info "Installing Claude Code package..."

    write_info "Installing Claude Code..."
    brew list claude-code &>/dev/null || brew install --cask claude-code
    write_success "Done!"
    write_blank_line
}

uninstall_claude_code() {
    write_info "Uninstalling Claude Code package..."

    write_info "Uninstalling Claude Code..."
    brew uninstall claude-code || { write_warning "WARNING! Claude Code is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
