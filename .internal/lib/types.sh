is_cmd() {
  if command -v $1 &> /dev/null; then
    return 0
  else
    return 1
  fi
}

is_file() {
  if [[ -f "$1" ]]; then
    return 0
  else
    return 1
  fi
}
