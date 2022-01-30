#! /bin/bash
# 
# mk_uml.sh - Build UML classes diagram from .hpp sources files
# 
# Usage:
#     mk_uml.sh output.png file.hpp [ files.hpp ... ]
# 
# Depends on: hpp2plantuml (install via pip), plantuml (install via apt), awk, which, echo
# 
# See also: plantuml, hpp2plantuml
# 

# History:
#  - 2022-01-27: initial version.
# 
# Nicolas Bercher, nbercher@yahoo.fr, 2022-01-27.
# 
# This script is distributed under the terms of the GPL v2 license.
# 

if ! [ -x "$(which plantuml)" ]; then
    echo " - plantuml is NOT INSTALLED, please install it with:" 1>&2
    echo "   sudo apt update" 1>&2
    echo "   sudo apt install plantuml" 1>&2
    exit 1
fi

if ! [ -x "$(which hpp2plantuml)" ]; then
    if ! [ -x "$(which pip3)" ]; then
        echo " - pip3 is NOT INSTALLED, please install it with:" 1>&2
        echo "   sudo apt install python3-pip" 1>&2
        echo 1>&2
    fi
    echo " - hpp2plantuml is NOT INSTALLED, please install it with:" 1>&2
    echo "   sudo pip3 install hpp2plantuml" 1>&2
    exit 1
fi

if (( $# < 2 )); then
    cat "${0}" | \
        awk '
/^#/ && NR>1 { print ; next }
! /^#/ { exit 0 }' | sed "s;^# ;  ;" 1>&2
    exit 2
fi

OUTPUT_PNG="${1}"
shift
OUTPUT_PUML="${OUTPUT_PNG%.*}".puml

for hppfile_ in "${@}"; do
    hpp_options_list="${hpp_options_list} -i ${hppfile_}"
done

if false; then
    echo "OUTPUT_PNG= ${OUTPUT_PNG}"
    echo "OUTPUT_PUML= ${OUTPUT_PUML}"
    echo "hpp_options_list= ${hpp_options_list}"
fi

hpp2plantuml ${hpp_options_list} >"${OUTPUT_PUML}"
plantuml "${OUTPUT_PUML}"
