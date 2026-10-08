get_eero_dependencies() {
    write_info "Getting eero package dependencies to install..."

    local dependencies=()
    dependencies+=("mas")

    local array
    array="$(declare -p dependencies)"
    local IFS=$'\v'
    echo "${array#*=}"
}

install_eero() {
    write_info "Installing eero package..."

    write_info "Installing eero..."
    mas list | grep -q "^1023499075" || mas install 1023499075
    write_success "Done!"
    write_blank_line
}

uninstall_eero() {
    write_info "Uninstalling eero package..."

    write_info "Uninstalling eero..."
    sudo mas uninstall 1023499075 || { write_warning "WARNING! eero is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
