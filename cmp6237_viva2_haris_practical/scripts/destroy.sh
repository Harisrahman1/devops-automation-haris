#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TF_DIR="${ROOT_DIR}/terraform"

command -v terraform >/dev/null 2>&1 || { echo "Missing dependency: terraform"; exit 1; }

cd "$TF_DIR"
terraform destroy -auto-approve
