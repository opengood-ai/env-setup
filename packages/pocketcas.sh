get_pocketcas_dependencies() {
    write_info "Getting PocketCAS package dependencies to install..."

    local dependencies=()
    dependencies+=("mas")

    local array
    array="$(declare -p dependencies)"
    local IFS=$'\v'
    echo "${array#*=}"
}

install_pocketcas() {
    write_info "Installing PocketCAS package..."

    write_info "Installing PocketCAS..."
    mas list | grep -q "^703006457" || mas install 703006457
    write_success "Done!"
    write_blank_line
}

uninstall_pocketcas() {
    write_info "Uninstalling PocketCAS package..."

    write_info "Uninstalling PocketCAS..."
    sudo mas uninstall 703006457 || { write_warning "WARNING! PocketCAS is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
