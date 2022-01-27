#!/bin/bash
set -euo pipefail

main() {
    # Use file descriptor 3 for script debug output.
    exec 3>&1

    # Ensure directories exist.
    [[ -d charts/flagsmith ]] || exit_with_error "'charts/flagsmith' directory not found. Maybe re-clone the repo?"
    [[ -d charts/repo ]] || exit_with_error "'charts/repo' directory not found. Maybe re-clone the repo?"
    # Create the tarball.
    cd charts/flagsmith
    helm package . --destination ../repo
    # Update the index.
    cd ../repo
    helm repo index . --merge=index.yaml
    cd ../..
}

#######################################
# Exits the program with the provided error message.
# Arguments:
#   $1: The error message to be displayed to the user.
# Outputs:
#   Writes error log to stderr.
# Returns:
#   1
#######################################
exit_with_error() {
    local err_msg="$1"
    echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: ${err_msg}" >&2
    exit 1
}

main
