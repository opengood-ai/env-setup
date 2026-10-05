# Convert a Markdown file to PDF using pandoc and the xelatex engine.
#
# Usage: md_to_pdf [options] <input.md> [output.pdf]
#
# Arguments:
#   input.md    - Markdown file to convert (relative image paths are resolved
#                 from the directory containing this file)
#   output.pdf  - Optional output file (default: input file name with .pdf)
#
# Options:
#   -m <margin>    Page margin (default: 1in)
#   -f <font>      Main body font (default: Noto Sans)
#   -c <font>      Monospace/code font (default: Noto Sans Mono)
#   -s <style>     Syntax highlighting style (default: tango)
#   -H <file>      LaTeX header file (default: ~/.pandoc/pdf-header.tex)
#   -h             Show this help
md_to_pdf() {
    local margin="1in"
    local main_font="Noto Sans"
    local mono_font="Noto Sans Mono"
    local style="tango"
    local header="${HOME}/.pandoc/pdf-header.tex"

    local OPTIND=1
    local opt
    while getopts ":m:f:c:s:H:h" opt; do
        case "${opt}" in
        m) margin="${OPTARG}" ;;
        f) main_font="${OPTARG}" ;;
        c) mono_font="${OPTARG}" ;;
        s) style="${OPTARG}" ;;
        H) header="${OPTARG}" ;;
        h)
            echo "Usage: md_to_pdf [-m margin] [-f main_font] [-c mono_font] [-s style] [-H header_file] <input.md> [output.pdf]"
            return 0
            ;;
        :)
            echo "md_to_pdf: option -${OPTARG} requires an argument" >&2
            return 1
            ;;
        *)
            echo "md_to_pdf: unknown option -${OPTARG}" >&2
            return 1
            ;;
        esac
    done
    shift $((OPTIND - 1))

    local input="$1"
    local output="${2:-}"

    if [[ -z "${input}" ]]; then
        echo "Usage: md_to_pdf [options] <input.md> [output.pdf]" >&2
        return 1
    fi
    if [[ ! -f "${input}" ]]; then
        echo "md_to_pdf: input file '${input}' does not exist" >&2
        return 1
    fi
    if ! command -v pandoc &>/dev/null; then
        echo "md_to_pdf: pandoc is not installed" >&2
        return 1
    fi
    if ! command -v xelatex &>/dev/null; then
        echo "md_to_pdf: xelatex not found; ensure /Library/TeX/texbin is on your PATH" >&2
        return 1
    fi

    [[ -z "${output}" ]] && output="${input%.*}.pdf"

    local args=(
        "${input}"
        -o "${output}"
        --pdf-engine=xelatex
        --resource-path="$(dirname -- "${input}")"
        -V "geometry:margin=${margin}"
        -V "mainfont=${main_font}"
        -V "monofont=${mono_font}"
        "--syntax-highlighting=${style}"
    )
    if [[ -f "${header}" ]]; then
        args+=("--include-in-header=${header}")
    else
        echo "md_to_pdf: header file '${header}' not found, continuing without it" >&2
    fi

    pandoc "${args[@]}"
}
