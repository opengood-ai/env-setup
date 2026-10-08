get_canary_mail_dependencies() {
    write_info "Getting Canary Mail package dependencies to install..."

    local dependencies=()
    dependencies+=("mas")

    local array
    array="$(declare -p dependencies)"
    local IFS=$'\v'
    echo "${array#*=}"
}

install_canary_mail() {
    write_info "Installing Canary Mail package..."

    write_info "Installing Canary Mail..."
    mas list | grep -q "^1236045954" || mas install 1236045954
    write_success "Done!"
    write_blank_line
}

uninstall_canary_mail() {
    write_info "Uninstalling Canary Mail package..."

    write_info "Uninstalling Canary Mail..."
    sudo mas uninstall 1236045954 || { write_warning "WARNING! Canary Mail is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
