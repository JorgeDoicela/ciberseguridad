#!/usr/bin/env bash
# ==============================================================================
# Script de Auditoria Rapida de Seguridad en Linux
# Uso: bash scripts/audit-linux-quick.sh
# ==============================================================================

set -euo pipefail

echo "=================================================================="
echo " INICIANDO AUDITORIA RAPIDA DE SEGURIDAD EN LINUX"
echo " Fecha: $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
echo " Host:  $(hostname)"
echo " Kernel: $(uname -r)"
echo "=================================================================="
echo ""

# 1. Verificacion de Firewall (UFW / iptables)
echo "[+] 1. ESTADO DEL FIREWALL"
if command -v ufw >/dev/null 2>&1; then
    sudo ufw status verbose || ufw status || echo "Requiere privilegios sudo para ver ufw status"
else
    echo "[-] UFW no esta instalado en el sistema."
fi
echo ""

# 2. Verificacion de Configuracion SSH
echo "[+] 2. HARDENING DE OPENSSH (/etc/ssh/sshd_config)"
if [ -f /etc/ssh/sshd_config ]; then
    echo "  PermitRootLogin: $(grep -Ei '^\s*PermitRootLogin' /etc/ssh/sshd_config || echo 'No configurado explicitamente')"
    echo "  PasswordAuthentication: $(grep -Ei '^\s*PasswordAuthentication' /etc/ssh/sshd_config || echo 'No configurado explicitamente')"
    echo "  X11Forwarding: $(grep -Ei '^\s*X11Forwarding' /etc/ssh/sshd_config || echo 'No configurado explicitamente')"
else
    echo "[-] Archivo /etc/ssh/sshd_config no encontrado."
fi
echo ""

# 3. Permisos de Archivos Criticos del Sistema
echo "[+] 3. PERMISOS DE ARCHIVOS CRITICOS"
for f in /etc/passwd /etc/shadow /etc/gshadow /etc/group; do
    if [ -f "$f" ]; then
        ls -l "$f"
    fi
done
echo ""

# 4. Puertos en Escucha (Superficie de Ataque)
echo "[+] 4. PUERTOS TCP/UDP EN ESCUCHA"
if command -v ss >/dev/null 2>&1; then
    ss -tuln
elif command -v netstat >/dev/null 2>&1; then
    netstat -tuln
else
    echo "[-] Ni 'ss' ni 'netstat' estan disponibles."
fi
echo ""

# 5. Binarios con Bit SUID Activo (Vectores de Elevacion de Privilegios)
echo "[+] 5. BINARIOS SUID EN EL SISTEMA"
find /usr/bin /usr/sbin -perm -4000 -type f 2>/dev/null | head -n 15 || true
echo "  ... (listado truncado a los primeros 15 elementos)"
echo ""

echo "=================================================================="
echo " AUDITORIA RAPIDA FINALIZADA CON EXITO"
echo "=================================================================="
