install_goodsync() {
    write_info "Installing GoodSync package..."

    if [[ ! -d "${apps_dir}/GoodSync.app" ]]; then
        write_info "Installing GoodSync..."
        brew list --cask goodsync &>/dev/null || brew install --cask goodsync
        write_success "Done!"
        write_blank_line
    else
        write_progress "GoodSync is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_goodsync() {
    write_info "Uninstalling GoodSync package..."

    write_info "Uninstalling GoodSync..."
    brew uninstall --cask goodsync || { write_warning "WARNING! GoodSync is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
