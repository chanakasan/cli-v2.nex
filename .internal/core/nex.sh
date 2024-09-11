nex_main() {
  local main_cmd="nex $1 $2 $3"
  exit_if_blank $@
  try_functions $@
  # try_commands $@
  try_subcommands $@
  echo " not_found: $main_cmd"
}

exit_if_blank() {
  if [ -z "$1" ]; then
    print_usage
    exit 1
  fi
}

try_functions() {
  local fn_name=fn_$1
  if [ "$(type -t $fn_name)" == function ]; then
    $fn_name ${@:2}
    exit 0
  fi
}

try_commands() {
  local cmd_1=_nx_$1'_'$2
  local cmd_2=_nx_$1
  try_cmd $cmd_1 "${@:3}"
  try_cmd $cmd_2 "${@:2}"
}

try_cmd() {
  if is_cmd $1; then
    "$1" ${@:2}
    exit
  fi
}

try_subcommands() {
  local sub_1=$1'_'$2'_'$3.sh
  local sub_2=$1'_'$2.sh
  local sub_3=$1.sh
  try_sub $sub_1 "${@:4}"
  try_sub $sub_2 "${@:3}"
  try_sub $sub_3 "${@:2}"
}

try_sub() {
  local file=$(get_cli_root)/.internal/cmd/$1
  if is_file $file; then 
    bash $file ${@:2}
    exit
  fi
}

get_cli_root() {
  echo $nx2_cli_root
}

print_usage() {
  echo " Usage: nex <1> <2> <3>"
  echo
}
