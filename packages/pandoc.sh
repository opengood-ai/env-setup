install_pandoc() {
    write_info "Installing Pandoc package..."

    write_info "Installing Pandoc..."
    brew list pandoc &>/dev/null || brew install pandoc
    write_success "Done!"
    write_blank_line

    write_info "Installing LaTeX engine (MacTeX, required for PDF generation)..."
    brew list --cask mactex-no-gui &>/dev/null || brew install --cask mactex-no-gui
    write_success "Done!"
    write_blank_line

    write_info "Adding LaTeX binaries to PATH in Bash profile..."
    if ! grep -qs "${tex_bin_dir}" "${bash_profile}"; then
        cat <<EOF >>"${bash_profile}"

# MacTeX binaries
export PATH="${tex_bin_dir}:\$PATH"

EOF
    else
        write_progress "LaTeX binaries already on PATH in Bash profile"
    fi
    export PATH="${tex_bin_dir}:${PATH}"
    write_success "Done!"
    write_blank_line

    write_info "Installing PDF fonts..."
    brew list --cask font-noto-sans &>/dev/null || brew install --cask font-noto-sans
    brew list --cask font-noto-sans-mono &>/dev/null || brew install --cask font-noto-sans-mono
    brew list --cask font-dejavu &>/dev/null || brew install --cask font-dejavu
    write_success "Done!"
    write_blank_line

    write_info "Creating PDF LaTeX header file '${resources_dir}/${pdf_header_file}'..."
    cat <<'EOF' >"${resources_dir}/${pdf_header_file}"
\usepackage{xcolor}
\definecolor{shadecolor}{RGB}{240,240,240}
\definecolor{inlinecodebg}{RGB}{240,240,240}

\usepackage{newunicodechar}
\newfontfamily\symbolfont{DejaVu Sans}
\newunicodechar{→}{{\symbolfont →}}
\newunicodechar{μ}{{\symbolfont μ}}

% Give inline code spans (pandoc renders these as \texttt) a shaded background
\usepackage{letltxmacro}
\LetLtxMacro{\OldTexttt}{\texttt}
\renewcommand{\texttt}[1]{\colorbox{inlinecodebg}{\OldTexttt{#1}}}
EOF
    mkdir -p "${pandoc_dir}"
    cp "${resources_dir}/${pdf_header_file}" "${pandoc_dir}/${pdf_header_file}"
    write_success "Done!"
    write_blank_line

    write_info "Configuring 'md_to_pdf' function with bash-it..."
    if [[ -d "${bash_it_dir}/custom" ]]; then
        cp "${resources_dir}/pandoc.bash" "${bash_it_dir}"/custom/pandoc.bash
    else
        write_warning "WARNING! bash-it custom directory not found, skipping 'md_to_pdf' function."
    fi
    write_success "Done!"
    write_blank_line
}

uninstall_pandoc() {
    write_info "Uninstalling Pandoc package..."

    write_info "Removing 'md_to_pdf' function and PDF header file..."
    rm -f "${bash_it_dir}"/custom/pandoc.bash
    rm -f "${pandoc_dir}/${pdf_header_file}"
    rmdir "${pandoc_dir}" 2>/dev/null || true
    write_success "Done!"
    write_blank_line

    write_info "Removing LaTeX binaries from PATH in Bash profile..."
    if [[ -f "${bash_profile}" ]]; then
        sed -i '' -e '/# MacTeX binaries/d' -e "\#${tex_bin_dir}#d" "${bash_profile}"
    fi
    write_success "Done!"
    write_blank_line

    write_info "Uninstalling PDF fonts..."
    brew uninstall --cask font-dejavu || { write_warning "WARNING! font-dejavu is not installed and cannot be uninstalled. Continuing on."; }
    brew uninstall --cask font-noto-sans-mono || { write_warning "WARNING! font-noto-sans-mono is not installed and cannot be uninstalled. Continuing on."; }
    brew uninstall --cask font-noto-sans || { write_warning "WARNING! font-noto-sans is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line

    write_info "Uninstalling LaTeX engine (MacTeX)..."
    brew uninstall --cask mactex-no-gui || { write_warning "WARNING! mactex-no-gui is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line

    write_info "Uninstalling Pandoc..."
    brew uninstall pandoc || { write_warning "WARNING! Pandoc is not installed and cannot be uninstalled. Continuing on."; }
    write_success "Done!"
    write_blank_line
}
