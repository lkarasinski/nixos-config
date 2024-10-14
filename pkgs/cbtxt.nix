{ lib, python3Packages, writeShellScriptBin, wl-clipboard, xclip }:

let
  codebase-to-text = python3Packages.buildPythonApplication rec {
    pname = "codebase_to_text";
    version = "1.0.7";

    src = python3Packages.fetchPypi {
      inherit pname version;
      sha256 = "sha256-ewyVkVKKhBit9tP5FLX845DwrorfN2eCqYP5i48y080=";
    };

    propagatedBuildInputs = with python3Packages; [
      python-docx
      gitpython
    ];

    doCheck = false;

    meta = with lib; {
      description = "A CLI tool to convert codebase to text";
      homepage = "https://github.com/QaisarRajput/codebase_to_text";
      license = licenses.mit;
      maintainers = with maintainers; [ ];
    };
  };
in
  writeShellScriptBin "cbtxt" ''
    #!/usr/bin/env bash

    # Default output path
    DEFAULT_OUTPUT_PATH="$HOME/bulk.txt"

    # Function to print usage
    print_usage() {
        echo "Usage: cbtxt [OPTIONS]"
        echo "Options:"
        echo "  --input DIR    Input directory (default: current directory)"
        echo "  --output FILE  Output file (default: $DEFAULT_OUTPUT_PATH)"
        echo "  --help         Print this help message"
    }

    # Parse command line arguments
    INPUT_DIR="."
    OUTPUT_FILE="$DEFAULT_OUTPUT_PATH"

    while [[ $# -gt 0 ]]; do
        case $1 in
            --input)
                INPUT_DIR="$2"
                shift 2
                ;;
            --output)
                OUTPUT_FILE="$2"
                shift 2
                ;;
            --help)
                print_usage
                exit 0
                ;;
            *)
                echo "Unknown option: $1"
                print_usage
                exit 1
                ;;
        esac
    done

    # Run the command and save output to file
    ${codebase-to-text}/bin/codebase-to-text --input "$INPUT_DIR" --output "$OUTPUT_FILE" --output_type txt

    # Copy the content to clipboard
    if command -v wl-copy &> /dev/null; then
        # If wl-copy is available (Wayland)
        cat "$OUTPUT_FILE" | ${wl-clipboard}/bin/wl-copy
        echo "Content copied to clipboard using wl-copy"
    elif command -v xclip &> /dev/null; then
        # If xclip is available (X11)
        cat "$OUTPUT_FILE" | ${xclip}/bin/xclip -selection clipboard
        echo "Content copied to clipboard using xclip"
    else
        echo "Neither wl-copy nor xclip found. Content not copied to clipboard."
    fi

    echo "Output saved to $OUTPUT_FILE"
  ''
