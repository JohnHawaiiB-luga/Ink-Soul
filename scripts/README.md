# 🛠️ Scripts de Automatización

Este directorio contiene scripts de utilidad para el proyecto Ink & Soul.

---

## 📋 create-backlog-issues.sh

**Propósito:** Crear automáticamente issues en GitHub basados en el BACKLOG.md del proyecto.

### Requisitos

1. **GitHub CLI instalado:**
   ```bash
   # En macOS
   brew install gh
   
   # En Ubuntu/Debian
   sudo apt install gh
   
   # En Windows
   winget install --id GitHub.cli
   ```

2. **Autenticación en GitHub:**
   ```bash
   gh auth login
   ```
   
   O usando un token:
   ```bash
   echo "tu_token_aqui" | gh auth login --with-token
   ```

### Uso

```bash
# Desde la raíz del proyecto
./scripts/create-backlog-issues.sh
```

### Lo que hace el script

Crea **12 issues** basados en la guía del proyecto final (`docs/guia-proyecto-final-ciclo.md`):

1. 📋 Portada y Estructura
2. ⚡ Introducción y Objetivos  
3. 🗓️ Planificación
4. 🔎 Estado del Arte e Investigación
5. ✍️ Diseño Visual y Técnico
6. 🛠️ Implementación y Desarrollo
7. 🌀 Pruebas y Validación
8. 🤔 Conclusiones y Reflexión
9. 📚 Bibliografía
10. 📊 Diapositivas y Presentación
11. 📺 Demostración en Directo
12. 👩‍🏫 Ensayo de Exposición Oral

Cada issue incluye:
- ✅ Título descriptivo con emoji
- 📝 Descripción detallada con tareas
- 🏷️ Etiquetas apropiadas
- 👤 Asignación automática a ti (`@me`)
- 📖 Referencias a documentación relevante

### Añadir issues al proyecto

Después de crear los issues, añádelos al proyecto #2:

```bash
# Opción 1: Manualmente desde la web
# Visita: https://github.com/users/Hawaiiiiii/projects/2

# Opción 2: Usando gh CLI
gh project item-add 2 --owner Hawaiiiiii --url <issue-url>
```

O ejecuta este loop para añadir todos:

```bash
# Obtener todos los issues recién creados
gh issue list --limit 12 --json number,url | jq -r '.[] | .url' | while read url; do
  gh project item-add 2 --owner Hawaiiiiii --url "$url"
  echo "✓ Añadido: $url"
done
```

---

## 💳 deploy-payment-system.sh

**Propósito:** Script para deployment del sistema de pagos con Stripe.

### Uso

```bash
./scripts/deploy-payment-system.sh
```

---

## 🔐 Seguridad

⚠️ **Importante:** Nunca comitas tokens o credenciales en el repositorio.

Usa variables de entorno:
```bash
export GITHUB_TOKEN="tu_token_aqui"
gh auth login --with-token <<< "$GITHUB_TOKEN"
```

---

## 📚 Recursos Adicionales

- [GitHub CLI Manual](https://cli.github.com/manual/)
- [GitHub Projects Docs](https://docs.github.com/en/issues/planning-and-tracking-with-projects)
- [Creating Issues via CLI](https://cli.github.com/manual/gh_issue_create)

---

**Última actualización:** 2025-11-24  
**Mantenedor:** Equipo Ink & Soul
