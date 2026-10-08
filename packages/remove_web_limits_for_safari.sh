get_remove_web_limits_for_safari_dependencies() {
    write_info "Getting Remove Web Limits for Safari package dependencies to install..."

    local dependencies=()
    dependencies+=("mas")

    local array
    array="$(declare -p dependencies)"
    local IFS=$'\v'
    echo "${array#*=}"
}

install_remove_web_limits_for_safari() {
    write_info "Installing Remove Web Limits for Safari package..."

    write_info "Installing Remove Web Limits for Safari..."
    mas list | grep -q "^1626843895" || mas install 1626843895
    write_success "Done!"
    write_blank_line
}

uninstall_remove_web_limits_for_safari() {
    write_info "Uninstalling Remove Web Limits for Safari package..."

    write_info "Uninstalling Remove Web Limits for Safari..."
    sudo mas uninstall 1626843895 || { write_warning "WARNING! Remove Web Limits for Safari is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
