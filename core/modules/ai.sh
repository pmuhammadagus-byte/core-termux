#!/data/data/com.termux/files/usr/bin/bash

import "@/utils/log"
import "@/utils/colors"

LOG_FILE="$CORE_CACHE/install_ai.log"

install_ai() {
  separator
  box "Installing AI Tool"
  separator
  echo

  log_info "Installing OpenCode..."
  echo

  mkdir -p "$(dirname "$LOG_FILE")"

  _install_ai_tools_wrapper
  log_success "OpenCode installed successfully"
  separator
  echo
  list_item "OpenCode ${GRAY}(${D_GREEN}opencode${GRAY})"
  echo
}

_install_ai_tools_wrapper() {
  import "@/tools/ai/opencode/install"
  install_opencode
}

uninstall_ai() {
  if ! command -v opencode &>/dev/null; then
    log_info "OpenCode is not installed"
    return 0
  fi
  separator
  box "Uninstalling AI Tool"
  separator
  echo

  log_info "Uninstalling OpenCode..."

  _uninstall_ai_tools_wrapper
  log_success "OpenCode uninstalled"
}

_uninstall_ai_tools_wrapper() {
  import "@/tools/ai/opencode/install"
  uninstall_opencode
}

update_ai() {
  separator
  box "Updating AI Tool"
  separator
  echo

  log_info "Updating OpenCode..."

  _update_ai_tools_wrapper
  log_success "OpenCode updated"
}

_update_ai_tools_wrapper() {
  import "@/tools/ai/opencode/install"
  update_opencode
}

reinstall_ai() {
  separator
  box "Reinstalling AI Tool"
  separator
  echo

  log_info "Reinstalling OpenCode..."
  echo

  _reinstall_ai_tools_wrapper
  log_success "OpenCode reinstalled successfully"
  separator
  echo
  list_item "OpenCode"
  echo
}

_reinstall_ai_tools_wrapper() {
  import "@/tools/ai/opencode/install"
  reinstall_opencode
}
