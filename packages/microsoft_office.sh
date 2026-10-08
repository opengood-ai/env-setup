get_microsoft_office_dependencies() {
    write_info "Getting Microsoft Office 365 package dependencies to install..."

    local dependencies=()
    dependencies+=("mas")

    local array
    array="$(declare -p dependencies)"
    local IFS=$'\v'
    echo "${array#*=}"
}

install_microsoft_office() {
    write_info "Installing Microsoft Office 365 package..."

    write_info "Installing Microsoft Word..."
    mas list | grep -q "^462054704" || mas install 462054704
    write_success "Done!"
    write_blank_line

    write_info "Installing Microsoft Excel..."
    mas list | grep -q "^462058435" || mas install 462058435
    write_success "Done!"
    write_blank_line

    write_info "Installing Microsoft PowerPoint..."
    mas list | grep -q "^462062816" || mas install 462062816
    write_success "Done!"
    write_blank_line

    write_info "Installing Microsoft Outlook..."
    mas list | grep -q "^985367838" || mas install 985367838
    write_success "Done!"
    write_blank_line
}

uninstall_microsoft_office() {
    write_info "Uninstalling Microsoft Office 365 package..."

    write_info "Uninstalling Microsoft Word..."
    sudo mas uninstall 462054704 || { write_warning "WARNING! Microsoft Word is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line

    write_info "Uninstalling Microsoft Excel..."
    sudo mas uninstall 462058435 || { write_warning "WARNING! Microsoft Excel is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line

    write_info "Uninstalling Microsoft PowerPoint..."
    sudo mas uninstall 462062816 || { write_warning "WARNING! Microsoft PowerPoint is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line

    write_info "Uninstalling Microsoft Outlook..."
    sudo mas uninstall 985367838 || { write_warning "WARNING! Microsoft Outlook is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
