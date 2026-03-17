install_neo4j_desktop() {
    write_info "Installing Neo4j Desktop package..."

    write_info "Installing Neo4j Desktop..."
    brew list neo4j-desktop &>/dev/null || brew install neo4j-desktop
    write_success "Done!"
    write_blank_line
}

uninstall_neo4j_desktop() {
    write_info "Uninstalling Neo4j Desktop package..."

    write_info "Uninstalling Neo4j Desktop..."
    brew uninstall neo4j-desktop || { write_warning "WARNING! Neo4j Desktop is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
