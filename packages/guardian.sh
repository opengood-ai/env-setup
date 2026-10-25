install_guardian() {
    write_info "Installing Guardian package..."

    if [[ ! -d "${apps_dir}/Guardian.app" ]]; then
        local base_url="https://guardianapp.com"
        local zip="guardian.zip"
        local unzip_dir
        unzip_dir="$(mktemp -d)"

        write_info "Locating latest Guardian Firewall build..."
        local build_path
        build_path="$(curl -fsSL "${base_url}/macos/latest" | grep -oE "/macos/update/builds/[A-Za-z0-9_.-]+\.zip" | head -n 1)"
        if [[ -z "${build_path}" ]]; then
            write_error "ERROR! Unable to find the latest Guardian Firewall build."
            rmdir "${unzip_dir}" 2>/dev/null || true
            return 1
        fi
        write_success "Done!"
        write_blank_line

        write_info "Downloading Guardian Firewall..."
        cd_push "${downloads_dir}"
        curl -fL -o "${zip}" "${base_url}${build_path}"
        write_success "Done!"
        write_blank_line

        write_info "Installing Guardian Firewall..."
        ditto -x -k "${zip}" "${unzip_dir}"
        cp -a "${unzip_dir}/Guardian.app" "${apps_dir}/Guardian.app"
        write_success "Done!"
        write_blank_line

        write_info "Deleting Guardian Firewall archive..."
        rm -rf "${unzip_dir}" "${zip}"
        cd_pop
        write_success "Done!"
        write_blank_line
    else
        write_progress "Guardian is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_guardian() {
    write_info "Uninstalling Guardian package..."

    write_info "Uninstalling Guardian Firewall..."
    rm -Rf "${apps_dir}/Guardian.app" || { write_warning "WARNING! Guardian is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
