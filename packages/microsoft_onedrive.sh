get_microsoft_onedrive_dependencies() {
    write_info "Getting Microsoft OneDrive package dependencies to install..."

    local dependencies=()
    dependencies+=("mas")

    local array
    array="$(declare -p dependencies)"
    local IFS=$'\v'
    echo "${array#*=}"
}

install_microsoft_onedrive() {
    write_info "Installing Microsoft OneDrive package..."

    write_info "Installing Microsoft OneDrive..."
    mas list | grep -q "^823766827" || mas install 823766827
    write_success "Done!"
    write_blank_line
}

uninstall_microsoft_onedrive() {
    write_info "Uninstalling Microsoft OneDrive package..."

    write_info "Uninstalling Microsoft OneDrive..."
    sudo mas uninstall 823766827 || { write_warning "WARNING! Microsoft OneDrive is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
