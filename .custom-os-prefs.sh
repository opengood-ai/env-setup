# Template for personal Dock customizations.
#
# Copy this file to 'custom-os-prefs.sh' (no leading dot) in the repo root and
# customize it with your own apps. That file is gitignored, so your personal
# Dock layout never gets committed. It is sourced by
# packages/os_prefs.sh::install_os_prefs() after the core apps are added, so
# `apps_dir`, `dockutil`, and the modules/commons.sh write_* helpers are all
# available here.
#
# Uncomment and edit the example entries below, or replace them entirely.

install_custom_os_prefs() {
    write_info "Adding custom applications to Dock..."

    # dockutil --add "${apps_dir}/Claude.app" 2>/dev/null || true
    # dockutil --add "${apps_dir}/Docker.app" 2>/dev/null || true
    # dockutil --add '' --type small-spacer --after 'Docker' 2>/dev/null || true

    write_success "Done!"
    write_blank_line
}
