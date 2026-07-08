#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
skill_dir="${repo_root}/skills/research-field-72h"

required_files=(
  "README.md"
  "ACKNOWLEDGEMENTS.md"
  "LICENSE"
  "skill-manifest.json"
  "skills/research-field-72h/SKILL.md"
  "skills/research-field-72h/README.md"
  "skills/research-field-72h/examples/example-ai-for-medical-image-segmentation.md"
  "skills/research-field-72h/templates/field_map.md"
  "skills/research-field-72h/templates/paper_matrix.csv"
  "skills/research-field-72h/templates/terminology_table.csv"
  "skills/research-field-72h/templates/author_profile.csv"
  "skills/research-field-72h/templates/code_data_audit.md"
  "skills/research-field-72h/templates/final_72h_report.md"
)

for path in "${required_files[@]}"; do
  if [[ ! -f "${repo_root}/${path}" ]]; then
    echo "Missing required file: ${path}" >&2
    exit 1
  fi
done

if ! grep -q '^---$' "${skill_dir}/SKILL.md"; then
  echo "SKILL.md is missing YAML frontmatter markers" >&2
  exit 1
fi

if ! grep -q '^name: research-field-72h$' "${skill_dir}/SKILL.md"; then
  echo "SKILL.md frontmatter is missing name: research-field-72h" >&2
  exit 1
fi

if ! grep -q '^description:' "${skill_dir}/SKILL.md"; then
  echo "SKILL.md frontmatter is missing description" >&2
  exit 1
fi

awk -F, '
  FNR == 1 { expected = NF }
  NF != expected {
    printf "CSV column mismatch in %s line %d: expected %d, got %d\n", FILENAME, FNR, expected, NF > "/dev/stderr"
    exit 1
  }
' "${skill_dir}"/templates/*.csv

echo "Validation passed."
