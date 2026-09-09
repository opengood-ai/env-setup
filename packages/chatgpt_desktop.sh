install_chatgpt_desktop() {
    write_info "Installing ChatGPT Desktop package..."

    if [[ ! -d "${apps_dir}/ChatGPT.app" ]]; then
        write_info "Installing ChatGPT Desktop..."
        brew install --cask chatgpt
        write_success "Done!"
        write_blank_line
    else
        write_progress "ChatGPT Desktop already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_chatgpt_desktop() {
    write_info "Uninstalling ChatGPT Desktop package..."

    write_info "Uninstalling ChatGPT Desktop..."
    brew uninstall --cask chatgpt || { write_warning "WARNING! ChatGPT Desktop is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
