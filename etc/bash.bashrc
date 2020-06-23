#!/bin/bash
function get_script_dir_qs5ope3dkl03bf7()
{
    local SOURCE="${BASH_SOURCE[0]}"
    while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
        DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
        SOURCE="$(readlink "$SOURCE")"
        [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    done
    local DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
    echo $DIR;
}
script_dir=$(get_script_dir_qs5ope3dkl03bf7)
unset -f  get_script_dir_qs5ope3dkl03bf7

export PATH=$PATH:$(readlink -f "${script_dir}/../bin")
# echo $PATH;
source ${script_dir}"/bash.functions.d/"*

unset  script_dir

