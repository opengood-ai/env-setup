get_final_cut_pro_dependencies() {
    write_info "Getting Final Cut Pro package dependencies to install..."

    local dependencies=()
    dependencies+=("mas")

    local array
    array="$(declare -p dependencies)"
    local IFS=$'\v'
    echo "${array#*=}"
}

install_final_cut_pro() {
    write_info "Installing Final Cut Pro package..."

    write_info "Installing Final Cut Pro..."
    mas list | grep -q "^424389933" || mas install 424389933
    write_success "Done!"
    write_blank_line
}

uninstall_final_cut_pro() {
    write_info "Uninstalling Final Cut Pro package..."

    write_info "Uninstalling Final Cut Pro..."
    sudo mas uninstall 424389933 || { write_warning "WARNING! Final Cut Pro is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
