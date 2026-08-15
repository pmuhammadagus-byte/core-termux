#!/bin/bash

import "@/utils/log"

LOG_FILE="$CORE_CACHE/install_ai.log"

AI_TOOLS=(
  "opencode"
)

source "$(dirname "$BASH_SOURCE")/opencode/install.sh"

install_all_ai_tools() {
  local installed_count=0
  local failed_count=0

  for tool in "${AI_TOOLS[@]}"; do
    case "$tool" in
    opencode)
      loading "Installing OpenCode" install_opencode
      case $? in 0) ((installed_count++));; 1) ((failed_count++));; esac
      ;;
    esac
  done

  return 0
}

uninstall_all_ai_tools() {
  local uninstalled_count=0
  local failed_count=0

  for tool in "${AI_TOOLS[@]}"; do
    case "$tool" in
    opencode)
      uninstall_opencode
      case $? in 0) ((uninstalled_count++));; 1) ((failed_count++));; esac
      ;;
    esac
  done

  return 0
}

update_all_ai_tools() {
  for tool in "${AI_TOOLS[@]}"; do
    case "$tool" in
    opencode)
      update_opencode
      ;;
    esac
  done
  echo
}

reinstall_all_ai_tools() {
  local reinstalled_count=0
  local failed_count=0

  for tool in "${AI_TOOLS[@]}"; do
    case "$tool" in
    opencode)
      reinstall_opencode
      case $? in 0) ((reinstalled_count++));; 1) ((failed_count++));; esac
      ;;
    esac
  done

  return 0
}
