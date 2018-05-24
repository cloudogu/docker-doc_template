#!/bin/bash

# Don't "set -o errexit", because in case of error the second replacement should still work
# Treat references to unset variables as errors.
set -o nounset
# Use the first non-zero exit code (if any) of a set of piped command as the exit code of the full set of commands.
set -o pipefail

# search and replace ß because it fails with latex T1 encoding leads to SS
find . -type f -name "*.md" -print0 | xargs -0 sed -i 's/ß/\\"s/g'
/usr/local/bin/pandoc.sh "$@"
find . -type f -name "*.md" -print0 | xargs -0 sed -i 's/\\"s/ß/g'

exit 0;

