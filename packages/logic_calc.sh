get_logic_calc_dependencies() {
    write_info "Getting Logic Calc package dependencies to install..."

    local dependencies=()
    dependencies+=("mas")

    local array
    array="$(declare -p dependencies)"
    local IFS=$'\v'
    echo "${array#*=}"
}

install_logic_calc() {
    write_info "Installing Logic Calc package..."

    write_info "Installing Logic Calc..."
    mas list | grep -q "^1484264087" || mas install 1484264087
    write_success "Done!"
    write_blank_line
}

uninstall_logic_calc() {
    write_info "Uninstalling Logic Calc package..."

    write_info "Uninstalling Logic Calc..."
    sudo mas uninstall 1484264087 || { write_warning "WARNING! Logic Calc is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
