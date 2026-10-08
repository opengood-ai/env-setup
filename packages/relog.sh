get_relog_dependencies() {
    write_info "Getting Relog package dependencies to install..."

    local dependencies=()
    dependencies+=("mas")

    local array
    array="$(declare -p dependencies)"
    local IFS=$'\v'
    echo "${array#*=}"
}

install_relog() {
    write_info "Installing Relog package..."

    write_info "Installing Relog..."
    mas list | grep -q "^6462759656" || mas install 6462759656
    write_success "Done!"
    write_blank_line
}

uninstall_relog() {
    write_info "Uninstalling Relog package..."

    write_info "Uninstalling Relog..."
    sudo mas uninstall 6462759656 || { write_warning "WARNING! Relog is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
