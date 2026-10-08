# Personal Dock customizations for OpenGood, applied after the core Dock layout.

install_custom_dock_layout() {
    write_info "Adding custom applications to Dock..."

    # Security
    dockutil --add "${apps_dir}/1Password.app" --before 'Passwords' 2>/dev/null || true
    dockutil --add "${apps_dir}/eero.app" --after 'Passwords' 2>/dev/null || true

    # Web Browsers
    dockutil --add "${apps_dir}/Aloha.app" --after 'Google Chrome' 2>/dev/null || true

    # Email, Messaging & Video
    dockutil --add "${apps_dir}/Canary Mail.app" --before 'Messages' 2>/dev/null || true
    dockutil --add "${apps_dir}/Microsoft Outlook.app" --after 'QuickTime Player' 2>/dev/null || true
    dockutil --add "${apps_dir}/Microsoft Teams.app" --after 'Microsoft Outlook' 2>/dev/null || true
    dockutil --add "${apps_dir}/zoom.us.app" --after 'Microsoft Teams' 2>/dev/null || true

    # Productivity
    dockutil --add "${apps_dir}/Relog.app" --after 'Reminders' 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'Relog' 2>/dev/null || true

    # Microsoft Office
    dockutil --add "${apps_dir}/Microsoft Excel.app" --before 'PyCharm' 2>/dev/null || true
    dockutil --add "${apps_dir}/Microsoft Word.app" --after 'Microsoft Excel' 2>/dev/null || true
    dockutil --add "${apps_dir}/Microsoft PowerPoint.app" --after 'Microsoft Word' 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'Microsoft PowerPoint' 2>/dev/null || true

    # Software Engineering
    dockutil --add "${apps_dir}/Visual Studio Code.app" --after 'PyCharm' 2>/dev/null || true
    dockutil --add "${apps_dir}/UltiMaker Cura.app" --after 'iTerm' 2>/dev/null || true

    # AI & Math
    dockutil --add "${apps_dir}/MacWhisper.app" --after 'ChatGPT' 2>/dev/null || true
    dockutil --add "${apps_dir}/PocketCAS.app" --after 'MacWhisper' 2>/dev/null || true
    dockutil --add "${apps_dir}/Logic Calc.app" --after 'PocketCAS' 2>/dev/null || true

    # File Sync and Backup
    dockutil --add "${apps_dir}/Disk Drill.app" --before 'Phone' 2>/dev/null || true
    dockutil --add "${apps_dir}/GoodSync.app" --before 'Phone' 2>/dev/null || true
    dockutil --add "${apps_dir}/pCloud Drive.app" --before 'Phone' 2>/dev/null || true
    dockutil --add "${apps_dir}/OneDrive.app" --before 'Phone' 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'OneDrive' 2>/dev/null || true

    # Entertainment
    dockutil --add "${sys_apps_dir}/Music.app" --before 'Phone' 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/TV.app" --before 'Phone' 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/Photos.app" --before 'Phone' 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'Photos' 2>/dev/null || true

    # Creative
    dockutil --add "${apps_dir}/Final Cut Pro.app" --before 'Phone' 2>/dev/null || true
    dockutil --add "${apps_dir}/Topaz Video.app" --before 'Phone' 2>/dev/null || true
    dockutil --add "${apps_dir}/EaseUS Video Downloader.app" --before 'Phone' 2>/dev/null || true
    dockutil --add "${apps_dir}/Wondershare UniConverter 17.app" --before 'Phone' 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'Wondershare UniConverter 17' 2>/dev/null || true

    # System Management & Utilities
    # The brew cask installs CleanMyMac.app; a direct download installs CleanMyMac_5.app
    for clean_my_mac in "CleanMyMac" "CleanMyMac_5"; do
        if [[ -d "${apps_dir}/${clean_my_mac}.app" ]]; then
            dockutil --add "${apps_dir}/${clean_my_mac}.app" --before 'Phone' 2>/dev/null || true
        fi
    done
    unset clean_my_mac
    dockutil --add "${apps_dir}/Moonlock.app" --before 'Phone' 2>/dev/null || true
    dockutil --add "${apps_dir}/iMazing.app" --before 'Phone' 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/Shortcuts.app" --before 'Phone' 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'Shortcuts' 2>/dev/null || true

    # Home & Location
    dockutil --add "${sys_apps_dir}/Home.app" --before 'Phone' 2>/dev/null || true
    dockutil --add "${sys_apps_dir}/FindMy.app" --before 'Phone' 2>/dev/null || true
    dockutil --add '' --type small-spacer --after 'FindMy' 2>/dev/null || true

    write_success "Done!"
    write_blank_line
}
