# Personal Dock customizations for OpenGood, applied after the core Dock layout.

install_custom_os_prefs() {
    write_info "Adding custom applications to Dock..."

    # Security
    dockutil --add "${apps_dir}/1Password.app" --before 'Passwords' 2>/dev/null || true
    dockutil --add "${apps_dir}/eero.app" --after 'Passwords' 2>/dev/null || true

    # Web Browsers
    dockutil --add "${apps_dir}/Aloha.app" --after 'Google Chrome' 2>/dev/null || true

    # Email, Messaging & Video
    dockutil --add "${apps_dir}/Canary Mail.app" --before 'Messages' 2>/dev/null || true
    dockutil --add "${apps_dir}/Microsoft Outlook.app" --after 'FaceTime' 2>/dev/null || true
    dockutil --add "${apps_dir}/Microsoft Teams.app" --after 'Microsoft Outlook' 2>/dev/null || true
    dockutil --add "${apps_dir}/zoom.us.app" --after 'Microsoft Teams' 2>/dev/null || true

    # Productivity
    dockutil --add "${apps_dir}/Relog.app" --after 'Reminders' 2>/dev/null || true

    # Software Engineering
    dockutil --add "${apps_dir}/UltiMaker Cura.app" --after 'iTerm' 2>/dev/null || true

    # AI & Math
    dockutil --add "${apps_dir}/MacWhisper.app" --after 'ChatGPT' 2>/dev/null || true
    dockutil --add "${apps_dir}/PocketCAS.app" --after 'MacWhisper' 2>/dev/null || true

    # File Sync and Backup
    dockutil --add '' --type small-spacer --after 'System Settings' 2>/dev/null || true
    dockutil --add "${apps_dir}/Disk Drill.app" 2>/dev/null || true
    dockutil --add "${apps_dir}/GoodSync.app" 2>/dev/null || true
    dockutil --add "${apps_dir}/pCloud Drive.app" 2>/dev/null || true
    dockutil --add "${apps_dir}/OneDrive.app" 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'OneDrive' 2>/dev/null || true

    # Entertainment
    dockutil --add "${sys_apps_dir}/TV.app" 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/Music.app" 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/Photos.app" 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'Photos' 2>/dev/null || true

    # Creative
    dockutil --add "${apps_dir}/Final Cut Pro.app" 2>/dev/null || true
    dockutil --add "${apps_dir}/Topaz Video.app" 2>/dev/null || true
    dockutil --add "${apps_dir}/EaseUS Video Downloader.app" 2>/dev/null || true
    dockutil --add "${apps_dir}/Wondershare UniConverter 17.app" 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'Wondershare UniConverter 17' 2>/dev/null || true

    # System Management & Utilities
    dockutil --add "${apps_dir}/CleanMyMac_5.app" 2>/dev/null || true
    dockutil --add "${apps_dir}/Moonlock.app" 2>/dev/null || true
    dockutil --add "${apps_dir}/iMazing.app" 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/Shortcuts.app" 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'Shortcuts' 2>/dev/null || true

    # Home & Location
    dockutil --add "${sys_apps_dir}/Home.app" 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/FindMy.app" 2>/dev/null || true

    write_success "Done!"
    write_blank_line
}
