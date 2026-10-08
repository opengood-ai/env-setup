get_1password_for_safari_dependencies() {
    write_info "Getting 1Password for Safari package dependencies to install..."

    local dependencies=()
    dependencies+=("mas")

    local array
    array="$(declare -p dependencies)"
    local IFS=$'\v'
    echo "${array#*=}"
}

install_1password_for_safari() {
    write_info "Installing 1Password for Safari package..."

    write_info "Installing 1Password for Safari..."
    mas list | grep -q "^1569813296" || mas install 1569813296
    write_success "Done!"
    write_blank_line
}

uninstall_1password_for_safari() {
    write_info "Uninstalling 1Password for Safari package..."

    write_info "Uninstalling 1Password for Safari..."
    sudo mas uninstall 1569813296 || { write_warning "WARNING! 1Password for Safari is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
