install_istat_menus() {
    write_info "Installing iStat Menus package..."

    if [[ ! -d "${apps_dir}/iStat Menus.app" ]]; then
        write_info "Installing iStat Menus..."
        brew list --cask istat-menus &>/dev/null || brew install --cask istat-menus
        write_success "Done!"
        write_blank_line
    else
        write_progress "iStat Menus is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_istat_menus() {
    write_info "Uninstalling iStat Menus package..."

    write_info "Uninstalling iStat Menus..."
    brew uninstall --cask istat-menus || { write_warning "WARNING! iStat Menus is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
