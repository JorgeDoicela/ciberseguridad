# Ciberseguridad — Laboratorio, Auditoría y Portafolio Técnico

Repositorio centralizado de **Ciberseguridad Aplicada**, **Auditoría de Sistemas**, **DevSecOps** y **Defensa en Profundidad**. 

Este proyecto está diseñado para proporcionar evidencia técnica verificable, scripts de auditoría automatizada y laboratorios reproducibles para demostrar competencias prácticas en el aseguramiento de infraestructura Linux, contenedores y detección de amenazas.

---

## 1. Requisitos Previos y Compatibilidad de Entorno

* **Sistema Operativo:** Linux (Debian/Ubuntu, Arch, Fedora) o sistemas tipo UNIX con shell Bash.
* **Herramientas de Ejecución Local:**
  * Bash >= 5.0
  * Git >= 2.40
  * Docker Engine >= 26.0 y Docker Compose Plugin >= 2.27 (para despliegue de laboratorios)
  * Utilidades de red estándar: `ss`, `netstat`, `grep`, `awk`
* **Privilegios:** Acceso a `sudo` para consultar configuraciones privilegiadas del sistema (como `ufw status` o `/etc/shadow`).

---

## 2. Inicio Rápido (Quickstart en 3 Pasos)

### Paso A: Clonar el repositorio
```bash
git clone git@github.com:JorgeDoicela/ciberseguridad.git
cd ciberseguridad
```

### Paso B: Ejecutar la auditoría rápida de seguridad de Linux
```bash
# Otorgar permisos de ejecucion si es necesario
chmod +x scripts/audit-linux-quick.sh

# Ejecutar el script de auditoria de host
./scripts/audit-linux-quick.sh
```

El script inspeccionará en segundos: el estado del cortafuegos UFW, las directivas de hardening de OpenSSH (`PermitRootLogin`, `PasswordAuthentication`), permisos de archivos de autenticación (`/etc/shadow`), puertos TCP/UDP abiertos y binarios con bit SUID activo.

### Paso C: Explorar la hoja de ruta y la documentación técnica
Consultar la biblioteca documental en `docs/` para seleccionar la ruta de especialización deseada (DevSecOps, Blue Team o Seguridad Ofensiva).

---

## 3. Comandos Principales y Herramientas

| Componente | Comando / Ruta | Propósito Técnico |
|---|---|---|
| **Auditoría Linux** | `./scripts/audit-linux-quick.sh` | Inspección rápida de superficie de ataque en el host local. |
| **Documentación** | `docs/00-indice-general.md` | Catálogo maestro de metodologías, vías profesionales y hojas de ruta. |
| **Estrategia** | `docs/01-estrategia-y-perfil-profesional.md` | Guía de posicionamiento en el mercado técnico de ciberseguridad. |
| **Vías Técnicas** | `docs/02-vias-profesionales-ciberseguridad.md` | Especificación de proyectos en DevSecOps, Blue Team y Pentesting. |
| **Portafolio** | `docs/03-guia-portafolio-y-reclutamiento.md` | Pautas de redacción de reportes técnicos y write-ups profesionales. |
| **Plataformas** | `docs/04-laboratorios-y-plataformas-oficiales.md` | Guía de PortSwigger Web Security Academy, HTB y TryHackMe. |
| **Roadmap** | `docs/05-hoja-de-ruta-y-siguientes-pasos.md` | Fases de desarrollo para expandir laboratorios y pipelines de CI/CD. |

---

## 4. Estructura Macro del Directorio

```text
ciberseguridad/
├── README.md                           # Entrada tecnica, onboarding y guia rapida (este archivo)
├── .gitignore                          # Exclusiones de seguridad (pcap, claves privadas, logs)
├── docs/                               # Biblioteca documental Docs-as-Code
│   ├── 00-indice-general.md           # Catalogo maestro de documentacion
│   ├── 01-estrategia-y-perfil-profesional.md # Evidencia verificable vs certificaciones
│   ├── 02-vias-profesionales-ciberseguridad.md # DevSecOps, Blue Team y Seguridad Web
│   ├── 03-guia-portafolio-y-reclutamiento.md # Criterios de portafolio y redaccion de reportes
│   ├── 04-laboratorios-y-plataformas-oficiales.md # PortSwigger, HackTheBox y TryHackMe
│   └── 05-hoja-de-ruta-y-siguientes-pasos.md # Fases de ejecucion para laboratorios
└── scripts/
    └── audit-linux-quick.sh           # Script de auditoria rapida de seguridad en Linux
```

---

## 5. Puntero a la Documentación Técnica Detallada (Docs-as-Code)

Para profundizar en las metodologías de análisis, taxonomías de vulnerabilidad y hojas de ruta de especialización, consultar el catálogo técnico centralizado:

👉 **[Documentación Técnica Completa](docs/00-indice-general.md)**

---

## 6. Seguridad y Ética

* **Uso Exclusivo en Entornos Autorizados:** Todas las herramientas, scripts y laboratorios contenidos en este proyecto están destinados estrictamente a fines de auditoría defensiva, hardening de sistemas autorizados e investigación en entornos aislados.
* **Cero Secretos:** Queda prohibido comitear credenciales reales, tokens de API o volcados de memoria sensibles.
* **Licencia:** Distribuido bajo términos de código abierto para fines educativos y de estandarización técnica.
