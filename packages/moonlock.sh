install_moonlock() {
    write_info "Installing Moonlock package..."

    if [[ ! -d "${apps_dir}/Moonlock.app" ]]; then
        local dmg="moonlock.dmg"
        local mount_dir
        mount_dir="$(mktemp -d)"

        write_info "Downloading Moonlock..."
        cd_push "${downloads_dir}"
        curl -fL -o "${dmg}" "https://dl.devmate.com/com.macpaw.moonlock/Moonlock.dmg"
        write_success "Done!"
        write_blank_line

        write_info "Attaching Moonlock image..."
        hdiutil attach "${dmg}" -nobrowse -readonly -mountpoint "${mount_dir}"
        write_success "Done!"
        write_blank_line

        write_info "Installing Moonlock..."
        cp -a "${mount_dir}/Moonlock.app" "${apps_dir}/Moonlock.app"
        write_success "Done!"
        write_blank_line

        write_info "Unmounting Moonlock image..."
        hdiutil detach "${mount_dir}"
        rmdir "${mount_dir}" 2>/dev/null || true
        write_success "Done!"
        write_blank_line

        write_info "Deleting Moonlock image..."
        rm -f "${dmg}"
        cd_pop
        write_success "Done!"
        write_blank_line
    else
        write_progress "Moonlock is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_moonlock() {
    write_info "Uninstalling Moonlock package..."

    write_info "Uninstalling Moonlock..."
    rm -Rf "${apps_dir}/Moonlock.app" || { write_warning "WARNING! Moonlock is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
