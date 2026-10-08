install_easeus_video_downloader() {
    write_info "Installing EaseUS Video Downloader package..."

    if [[ ! -d "${apps_dir}/EaseUS Video Downloader.app" ]]; then
        local dmg="easeus-video-downloader.dmg"
        local mount_dir
        mount_dir="$(mktemp -d)"

        write_info "Downloading EaseUS Video Downloader installer..."
        cd_push "${downloads_dir}"
        curl -fL -o "${dmg}" "https://down.easeus.com/product/mac_video_downloader"
        write_success "Done!"
        write_blank_line

        write_info "Attaching EaseUS Video Downloader image..."
        hdiutil attach "${dmg}" -nobrowse -readonly -mountpoint "${mount_dir}"
        write_success "Done!"
        write_blank_line

        write_info "Running EaseUS Video Downloader installer..."
        open -W "${mount_dir}/EaseUS Video Downloader Installer.app"
        echo -e "Waiting for user to complete interactive installation. When done, press [ENTER]:"
        read -r complete
        write_success "Done!"
        write_blank_line

        write_info "Unmounting EaseUS Video Downloader image..."
        hdiutil detach "${mount_dir}"
        rmdir "${mount_dir}" 2>/dev/null || true
        write_success "Done!"
        write_blank_line

        write_info "Deleting EaseUS Video Downloader image..."
        rm -f "${dmg}"
        cd_pop
        write_success "Done!"
        write_blank_line
    else
        write_progress "EaseUS Video Downloader is already installed"
        write_success "Done!"
        write_blank_line
    fi
}

uninstall_easeus_video_downloader() {
    write_info "Uninstalling EaseUS Video Downloader package..."

    write_info "Uninstalling EaseUS Video Downloader..."
    rm -Rf "${apps_dir}/EaseUS Video Downloader.app" || { write_warning "WARNING! EaseUS Video Downloader is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
