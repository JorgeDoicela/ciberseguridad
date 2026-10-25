# 03 — Guía de Portafolio y Criterios de Reclutamiento

[Volver al Índice General](00-indice-general.md) | [Anterior: Las Tres Vías Profesionales](02-vias-profesionales-ciberseguridad.md) | [Siguiente: Laboratorios Oficiales](04-laboratorios-y-plataformas-oficiales.md)

---

## 1. El Estándar de Oro: El Dosier Técnico en GitHub

Para un reclutador técnico o líder de seguridad, el perfil de GitHub es la prueba de ácido de un candidato. Un portafolio de ciberseguridad debe estructurarse bajo tres pilares innegociables:

### A. Código y Laboratorios 100% Reproducibles
* Si el proyecto documenta un análisis de vulnerabilidad o una defensa, cualquier ingeniero debe poder clonar el repositorio y levantar el entorno con un único comando:
  ```bash
  git clone <url>
  cd <proyecto>
  make lab-up   # o docker compose up -d
  ```
* Los laboratorios que requieren configuraciones manuales oscuras o pasos no documentados denotan falta de madurez técnica.

### B. Documentación Rigurosa bajo Docs-as-Code
* Utilización de la metodología **Docs-as-Code**: archivos Markdown versionados con indexación jerárquica (`00-`, `01-`...), diagramas técnicos de flujo de ataque (Mermaid) y tablas detalladas de mitigación.
* Asociación de cada hallazgo con estándares de la industria:
  * **MITRE ATT&CK:** Para tácticas, técnicas y procedimientos de adversarios (ej. *T1110 - Brute Force*, *T1068 - Exploitation for Privilege Escalation*).
  * **CWE / CVE:** Para la identificación inequívoca de debilidades de software y vulnerabilidades conocidas.
  * **CVSS v3.1:** Para la puntuación cuantitativa del impacto y severidad del riesgo.

### C. Tono Estrictamente Sobrio (Cero Lenguaje Inflado)
* Queda vetado el uso de expresiones vacías (*"soy experto en hacking ético"*, *"domino la seguridad ofensiva"*, emojis decorativos o estética informal de foros).
* **El estándar profesional es fáctico y descriptivo:**
  * Inadecuado: *"Hackeé la máquina en 10 minutos con este exploit brutal"*.
  * Adecuado: *"Análisis de vulnerabilidad en la librería OpenSSH (CVE-2024-6387 regreSSHion), verificación de precondiciones en entorno controlado Debian 12 y aplicación del parche de actualización a OpenSSH 9.8p1"*.

---

## 2. Estructura Canónica de un Reporte de Auditoría o Write-up

Todo análisis de vulnerabilidad o resolución de máquina debe redactarse como un informe de auditoría profesional con las siguientes secciones:

```text
Estructura de Reporte Tecnico:
├── 1. Resumen Ejecutivo (Impacto en el negocio y evaluacion de riesgo)
├── 2. Alcance del Analisis y Topologia del Entorno
├── 3. Cadena de Evaluacion Tecnica:
│   ├── Reconocimiento y Descubrimiento de Superficie
│   ├── Vector de Entrada Inicial (Foothold) y PoC
│   └── Escalada Local de Privilegios
├── 4. Clasificacion del Fallo (CWE, CVE y Puntuacion CVSS)
└── 5. Guia de Remediacion y Parches de Codigo para el Equipo de Desarrollo
```

### Tabla de Clasificación de Hallazgos

| Parámetro | Valor de Ejemplo | Descripción Técnica |
|---|---|---|
| **Vulnerabilidad** | Inyección SQL Ciega basada en Tiempos | Fallo de validación en parámetro `order_by` en API REST |
| **Identificador CWE** | CWE-89: SQL Injection | Inyección de comandos que alteran la lógica de la base de datos |
| **Severidad CVSS v3.1** | **8.5 (Alta)** | `CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:N` |
| **Componente Afectado** | `/api/v1/reports/query` | Controlador backend en servicio de reportería |
| **Remediación** | Implementación de Consultas Parametrizadas | Descartar concatenación de cadenas; utilizar binding de variables |

---

## 3. Lista de Verificación (Checklist) para Publicar un Proyecto

Antes de compartir un repositorio de ciberseguridad con reclutadores:
* [ ] ¿El archivo `README.md` describe con precisión el objetivo técnico sin lenguaje marketero?
* [ ] ¿El laboratorio se inicia sin errores mediante Docker Compose o Makefile?
* [ ] ¿Se verificó que no existan credenciales privadas, tokens de API o archivos sensibles en el historial de Git?
* [ ] ¿Los diagramas de ataque y defensa renderizan correctamente en GitHub?
* [ ] ¿Las recomendaciones de remediación contienen código real y no simples consejos genéricos?
