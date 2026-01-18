#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TF_DIR="${ROOT_DIR}/terraform"
ANSIBLE_DIR="${ROOT_DIR}/ansible"

require() {
  command -v "$1" >/dev/null 2>&1 || { echo "Missing dependency: $1"; exit 1; }
}

require terraform
require ansible-playbook
require python3

echo "[1/4] Terraform init/apply..."
cd "$TF_DIR"
terraform init -upgrade
terraform apply -auto-approve

PUBLIC_IP="$(terraform output -raw instance_public_ip)"
echo "Instance Public IP: ${PUBLIC_IP}"

echo "[2/4] Generate Ansible inventory..."
cd "$ANSIBLE_DIR"
python3 - <<PY
from jinja2 import Template
from pathlib import Path
tpl = Template(Path("templates/inventory.ini.j2").read_text())
Path("inventory.ini").write_text(tpl.render(public_ip="${PUBLIC_IP}") + "\n")
print("inventory.ini generated")
PY

echo "[3/4] Run Ansible configuration..."
ansible-playbook -i inventory.ini site.yml

echo "[4/4] Done."
echo "Open: http://${PUBLIC_IP}"
