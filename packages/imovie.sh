get_imovie_dependencies() {
    write_info "Getting iMovie package dependencies to install..."

    local dependencies=()
    dependencies+=("mas")

    local array
    array="$(declare -p dependencies)"
    local IFS=$'\v'
    echo "${array#*=}"
}

install_imovie() {
    write_info "Installing iMovie package..."

    write_info "Installing iMovie..."
    mas list | grep -q "^408981434" || mas install 408981434
    write_success "Done!"
    write_blank_line
}

uninstall_imovie() {
    write_info "Uninstalling iMovie package..."

    write_info "Uninstalling iMovie..."
    sudo mas uninstall 408981434 || { write_warning "WARNING! iMovie is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
