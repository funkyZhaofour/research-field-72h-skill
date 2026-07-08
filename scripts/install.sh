#!/usr/bin/env bash
set -euo pipefail

target="both"
codex_dir="${HOME}/.codex/skills"
claude_dir="${HOME}/.claude/skills"

usage() {
  cat <<'USAGE'
Usage:
  ./scripts/install.sh [--target codex|claude|both] [--codex-dir DIR] [--claude-dir DIR]

Defaults:
  --target both
  --codex-dir ~/.codex/skills
  --claude-dir ~/.claude/skills
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      target="${2:-}"
      shift 2
      ;;
    --codex-dir)
      codex_dir="${2:-}"
      shift 2
      ;;
    --claude-dir)
      claude_dir="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

case "$target" in
  codex|claude|both) ;;
  *)
    echo "--target must be codex, claude, or both" >&2
    exit 2
    ;;
esac

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "${script_dir}/.." && pwd)"
skill_src="${repo_root}/skills/research-field-72h"

if [[ ! -f "${skill_src}/SKILL.md" ]]; then
  echo "Missing ${skill_src}/SKILL.md" >&2
  exit 1
fi

install_one() {
  local base_dir="$1"
  local dest="${base_dir}/research-field-72h"

  mkdir -p "${base_dir}"
  rm -rf "${dest}"
  cp -R "${skill_src}" "${dest}"
  echo "Installed research-field-72h -> ${dest}"
}

if [[ "$target" == "codex" || "$target" == "both" ]]; then
  install_one "$codex_dir"
fi

if [[ "$target" == "claude" || "$target" == "both" ]]; then
  install_one "$claude_dir"
fi
