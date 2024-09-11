get_nex_root() {
  echo $HOME/dotfiles
}

get_cli_path() {
  echo $nx_cli_v2_root
}

get_root_path() {
  if [ -z "$1" ]; then
    echo $(get_nex_root)
  else
    echo $(get_nex_root)/$1.nex
  fi
}

get_support_path() {
  local base=$(get_cli_path)/src/support
  if [ -z "$1" ]; then
    echo $base
  else
    echo $base/$1/index.sh
  fi
}

get_lib_path() {
  local base=$HOME/groups/lib/bash.lib/src
  if [ -z "$1" ]; then
    echo $base
  else
    echo $base/$1/index.sh
  fi
}

get_plugin_path() {
  if [ -z "$1" ]; then
    echo $(get_nex_root)/plugins
  else
    echo $(get_nex_root)/plugins/$1.plugin
  fi
}

get_mod_path() {
  if [ -z "$1" ]; then
    echo $(get_nex_root)/mods
  else
    echo $(get_nex_root)/mods/$1.mod
  fi 
}
