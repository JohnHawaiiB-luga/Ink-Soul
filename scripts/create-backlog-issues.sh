#!/bin/bash

# Script para crear issues en GitHub basados en el BACKLOG.md
# Uso: ./scripts/create-backlog-issues.sh

# Colores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Creando Issues desde BACKLOG.md ===${NC}\n"

# Verificar que gh CLI está instalado
if ! command -v gh &> /dev/null; then
    echo -e "${YELLOW}Error: gh CLI no está instalado.${NC}"
    echo "Instala desde: https://cli.github.com/"
    exit 1
fi

# Verificar autenticación
if ! gh auth status &> /dev/null; then
    echo -e "${YELLOW}Error: No estás autenticado en gh CLI.${NC}"
    echo "Ejecuta: gh auth login"
    exit 1
fi

# Obtener el nombre del repositorio
REPO=$(gh repo view --json nameWithOwner -q .nameWithOwner)
echo -e "Repositorio: ${GREEN}${REPO}${NC}\n"

# ID del proyecto (debe actualizarse con el ID real)
PROJECT_NUMBER=2
PROJECT_OWNER="Hawaiiiiii"

echo -e "${BLUE}Creando issues de documentación académica...${NC}\n"

# Issue 1: Guía Proyecto Final - Portada y Estructura
gh issue create \
  --title "📋 Guía Proyecto Final - Portada y Estructura" \
  --body "## Objetivo
Completar la portada y estructura inicial del proyecto final siguiendo la guía en \`docs/guia-proyecto-final-ciclo.md\`.

## Tareas
- [ ] Crear portada profesional con nombre del proyecto
- [ ] Incluir nombre completo, curso escolar y ciclo
- [ ] Añadir logo o imagen representativa
- [ ] Generar índice automático
- [ ] Verificar numeración de páginas

## Referencias
- \`docs/guia-proyecto-final-ciclo.md\` - Sección Portada
- Herramientas: Microsoft Word, Google Docs, LaTeX

## Etiquetas
\`documentación\` \`proyecto-final\` \`alta-prioridad\`" \
  --label "documentation,enhancement,high-priority" \
  --assignee "@me"

echo -e "${GREEN}✓${NC} Issue 1 creado: Portada y Estructura\n"

# Issue 2: Guía Proyecto Final - Introducción y Objetivos
gh issue create \
  --title "⚡ Guía Proyecto Final - Introducción y Objetivos" \
  --body "## Objetivo
Redactar introducción completa y definir objetivos SMART del proyecto.

## Tareas
- [ ] Presentar el tema del proyecto
- [ ] Describir relevancia y contexto del problema
- [ ] Justificar elección del tema
- [ ] Definir objetivo general
- [ ] Definir 3-5 objetivos específicos (SMART)

## Criterios SMART
- **S**pecífico
- **M**edible
- **A**lcanzable
- **R**elevante
- **T**emporal

## Referencias
- \`docs/guia-proyecto-final-ciclo.md\` - Sección Introducción

## Etiquetas
\`documentación\` \`proyecto-final\` \`alta-prioridad\`" \
  --label "documentation,enhancement,high-priority" \
  --assignee "@me"

echo -e "${GREEN}✓${NC} Issue 2 creado: Introducción y Objetivos\n"

# Issue 3: Guía Proyecto Final - Planificación
gh issue create \
  --title "🗓️ Guía Proyecto Final - Planificación" \
  --body "## Objetivo
Crear planificación detallada con cronograma y estimación de costes.

## Tareas
- [ ] Crear cronograma con fases del proyecto (Gantt)
- [ ] Estimar tiempo por fase (investigación, diseño, implementación, testing)
- [ ] Calcular costes de recursos humanos
- [ ] Calcular costes de recursos materiales
- [ ] Estimar costes de servicios externos
- [ ] Documentar recursos necesarios (técnicos, humanos, materiales)

## Herramientas Recomendadas
- Diagrama de Gantt: Excel, Google Sheets, ProjectLibre
- Gestión de tareas: Trello, Notion, GitHub Projects

## Referencias
- \`docs/guia-proyecto-final-ciclo.md\` - Sección Planificación

## Etiquetas
\`documentación\` \`proyecto-final\` \`planificación\`" \
  --label "documentation,planning,medium-priority" \
  --assignee "@me"

echo -e "${GREEN}✓${NC} Issue 3 creado: Planificación\n"

# Issue 4: Guía Proyecto Final - Estado del Arte
gh issue create \
  --title "🔎 Guía Proyecto Final - Estado del Arte e Investigación" \
  --body "## Objetivo
Investigar soluciones existentes y documentar estado del arte.

## Tareas
- [ ] Identificar competidores o soluciones similares
- [ ] Analizar fortalezas de soluciones existentes
- [ ] Analizar deficiencias y oportunidades de mejora
- [ ] Investigar tecnologías disponibles (frontend, backend, infraestructura)
- [ ] Recopilar bibliografía inicial
- [ ] Documentar documentación oficial, artículos, tutoriales

## Áreas de Investigación
- Frontend: React, Vue, Angular, Svelte
- Backend: Node.js, Python, Java, PHP
- Infraestructura: Vercel, Netlify, AWS, Supabase, Firebase
- Bases de datos: PostgreSQL, MongoDB, MySQL

## Referencias
- \`docs/guia-proyecto-final-ciclo.md\` - Sección Estado del Arte

## Etiquetas
\`documentación\` \`investigación\` \`proyecto-final\`" \
  --label "documentation,research,medium-priority" \
  --assignee "@me"

echo -e "${GREEN}✓${NC} Issue 4 creado: Estado del Arte\n"

# Issue 5: Guía Proyecto Final - Diseño
gh issue create \
  --title "✍️ Guía Proyecto Final - Diseño Visual y Técnico" \
  --body "## Objetivo
Crear diseños visuales y documentar arquitectura técnica del sistema.

## Tareas de Diseño Visual
- [ ] Crear wireframes (baja fidelidad)
- [ ] Crear mockups (alta fidelidad)
- [ ] Diseñar prototipo interactivo
- [ ] Definir paleta de colores
- [ ] Definir tipografía y jerarquía

## Tareas de Arquitectura
- [ ] Diagrama de arquitectura general
- [ ] Diagrama de base de datos (ER)
- [ ] Diagrama de flujo de usuario
- [ ] Diagrama de componentes
- [ ] Documentar decisiones técnicas
- [ ] Justificar elección de stack tecnológico

## Herramientas Recomendadas
- Diseño: Figma, Adobe XD, Sketch
- Diagramas: draw.io, Lucidchart, Mermaid, PlantUML

## Referencias
- \`docs/guia-proyecto-final-ciclo.md\` - Sección Diseño
- \`docs/design-specification.md\`
- \`docs/design-tokens.json\`

## Etiquetas
\`diseño\` \`arquitectura\` \`proyecto-final\`" \
  --label "design,architecture,high-priority" \
  --assignee "@me"

echo -e "${GREEN}✓${NC} Issue 5 creado: Diseño\n"

# Issue 6: Guía Proyecto Final - Implementación
gh issue create \
  --title "🛠️ Guía Proyecto Final - Implementación y Desarrollo" \
  --body "## Objetivo
Documentar proceso de implementación del proyecto.

## Tareas
- [ ] Documentar estructura del proyecto
- [ ] Describir configuración inicial del entorno
- [ ] Documentar desarrollo por módulos/características
- [ ] Incluir fragmentos de código clave
- [ ] Documentar problemas encontrados y soluciones ⭐
- [ ] Explicar cambios respecto al diseño inicial
- [ ] Crear manual de usuario (si aplica)
- [ ] Añadir capturas de pantalla de funcionalidades

## Nota Importante
La sección de **problemas y soluciones** es MUY VALORADA por el tribunal.
Demuestra capacidad de resolución de problemas y pensamiento crítico.

## Referencias
- \`docs/guia-proyecto-final-ciclo.md\` - Sección Implementación
- Código en: \`ink-soul-app/src/\`

## Etiquetas
\`documentación\` \`implementación\` \`proyecto-final\`" \
  --label "documentation,implementation,high-priority" \
  --assignee "@me"

echo -e "${GREEN}✓${NC} Issue 6 creado: Implementación\n"

# Issue 7: Guía Proyecto Final - Pruebas
gh issue create \
  --title "🌀 Guía Proyecto Final - Pruebas y Validación" \
  --body "## Objetivo
Realizar y documentar pruebas completas del sistema.

## Tipos de Pruebas
- [ ] Pruebas funcionales (casos de uso principales)
- [ ] Pruebas de interfaz (UI/UX)
- [ ] Pruebas de compatibilidad (navegadores, dispositivos)
- [ ] Pruebas de rendimiento (tiempo de carga, optimización)
- [ ] Pruebas de seguridad (validación, XSS, CSRF)

## Documentación de Resultados
- [ ] Crear tabla de pruebas con resultados
- [ ] Documentar observaciones y warnings
- [ ] Verificar cumplimiento de objetivos iniciales
- [ ] Indicar qué objetivos se cumplieron y cuáles no

## Navegadores a Probar
- Chrome
- Firefox
- Safari
- Edge

## Dispositivos a Probar
- Mobile (iOS/Android)
- Tablet
- Desktop

## Referencias
- \`docs/guia-proyecto-final-ciclo.md\` - Sección Pruebas
- \`docs/manual-testing-guide.md\`

## Etiquetas
\`testing\` \`qa\` \`proyecto-final\`" \
  --label "testing,qa,high-priority" \
  --assignee "@me"

echo -e "${GREEN}✓${NC} Issue 7 creado: Pruebas\n"

# Issue 8: Guía Proyecto Final - Conclusiones
gh issue create \
  --title "🤔 Guía Proyecto Final - Conclusiones y Reflexión" \
  --body "## Objetivo
Realizar reflexión final sobre el proyecto y aprendizajes.

## Tareas
- [ ] Reflexión personal: ¿Qué aprendiste?
- [ ] Documentar nuevas tecnologías o frameworks aprendidos
- [ ] Describir buenas prácticas adquiridas
- [ ] Definir mejoras futuras (alta/media/baja prioridad)
- [ ] Evaluar viabilidad del proyecto
- [ ] Analizar valor de la formación recibida
- [ ] Indicar módulos más útiles para el proyecto

## Preguntas Guía
- ¿Qué aprendiste durante el desarrollo?
- ¿Qué añadirías con más tiempo?
- ¿Merece la pena seguir desarrollándolo?
- ¿Cómo te ayudó el ciclo formativo?
- ¿Qué harías diferente si empezaras de nuevo?

## Referencias
- \`docs/guia-proyecto-final-ciclo.md\` - Sección Conclusiones

## Etiquetas
\`documentación\` \`reflexión\` \`proyecto-final\`" \
  --label "documentation,reflection,medium-priority" \
  --assignee "@me"

echo -e "${GREEN}✓${NC} Issue 8 creado: Conclusiones\n"

# Issue 9: Guía Proyecto Final - Bibliografía
gh issue create \
  --title "📚 Guía Proyecto Final - Bibliografía" \
  --body "## Objetivo
Recopilar y formatear todas las fuentes utilizadas en el proyecto.

## Tareas
- [ ] Recopilar documentación oficial utilizada
- [ ] Listar artículos y blogs consultados
- [ ] Añadir vídeos y tutoriales de YouTube
- [ ] Incluir cursos realizados
- [ ] Referenciar repositorios de GitHub
- [ ] Citar libros consultados
- [ ] Formatear en estilo consistente (APA, IEEE)

## Formato Recomendado
Usar gestor de referencias:
- Zotero (gratuito y open source)
- Mendeley (gratuito)
- EndNote (de pago)
- Google Scholar

## Referencias
- \`docs/guia-proyecto-final-ciclo.md\` - Sección Bibliografía

## Etiquetas
\`documentación\` \`bibliografía\` \`proyecto-final\`" \
  --label "documentation,low-priority" \
  --assignee "@me"

echo -e "${GREEN}✓${NC} Issue 9 creado: Bibliografía\n"

# Issue 10: Guía Proyecto Final - Presentación
gh issue create \
  --title "📊 Guía Proyecto Final - Diapositivas y Presentación" \
  --body "## Objetivo
Crear presentación profesional para la defensa del proyecto.

## Tareas de Diseño
- [ ] Crear 15-20 diapositivas siguiendo estructura sugerida
- [ ] Diseñar portada atractiva
- [ ] Incluir capturas de pantalla del proyecto
- [ ] Crear diagramas visuales
- [ ] Aplicar principios de diseño (menos es más, legibilidad)
- [ ] Mantener consistencia visual

## Estructura Sugerida
1. Portada
2. Índice
3. Introducción
4. Objetivos
5. Investigación
6. Diseño y arquitectura
7. Tecnologías
8. Implementación
9. **Demo** ⭐
10. Pruebas
11. Problemas y soluciones
12. Conclusiones
13. Mejoras futuras
14. Bibliografía
15. ¿Preguntas?

## Herramientas
- Google Slides (colaborativo, gratis)
- PowerPoint / Keynote
- Canva (diseños profesionales)
- Reveal.js (HTML)

## Referencias
- \`docs/guia-proyecto-final-ciclo.md\` - Sección Diapositivas

## Etiquetas
\`presentación\` \`defensa\` \`proyecto-final\`" \
  --label "presentation,high-priority" \
  --assignee "@me"

echo -e "${GREEN}✓${NC} Issue 10 creado: Presentación\n"

# Issue 11: Guía Proyecto Final - Preparación de Demo
gh issue create \
  --title "📺 Guía Proyecto Final - Demostración en Directo" \
  --body "## Objetivo
Preparar demostración en vivo del proyecto funcionando.

## Tareas de Preparación
- [ ] Probar todo en el equipo a usar
- [ ] Verificar conexión a Internet
- [ ] Preparar cuentas de prueba con datos de ejemplo
- [ ] Anotar URLs y credenciales
- [ ] Cerrar aplicaciones innecesarias
- [ ] Desactivar notificaciones
- [ ] Limpiar escritorio
- [ ] Usar modo incógnito del navegador

## Workflow de Demo (3-5 minutos)
1. Página de inicio (diseño, hero)
2. Portfolio (filtros, lightbox)
3. Formulario de cita (calendario, validación)
4. Tienda (productos, carrito, checkout Stripe)
5. Responsive (redimensionar ventana)
6. Panel admin (si aplica)

## Plan B: Vídeo Backup ⚠️
- [ ] Grabar vídeo de demostración (OBS Studio)
- [ ] Duración: 3-5 minutos máximo
- [ ] Incluir audio explicativo
- [ ] Probar en varios reproductores
- [ ] Llevar en USB + nube (Google Drive)

## Referencias
- \`docs/guia-proyecto-final-ciclo.md\` - Sección Demostración

## Etiquetas
\`demo\` \`defensa\` \`alta-prioridad\` \`proyecto-final\`" \
  --label "demo,presentation,high-priority" \
  --assignee "@me"

echo -e "${GREEN}✓${NC} Issue 11 creado: Demo\n"

# Issue 12: Guía Proyecto Final - Ensayo de Exposición
gh issue create \
  --title "👩‍🏫 Guía Proyecto Final - Ensayo de Exposición Oral" \
  --body "## Objetivo
Practicar y perfeccionar la exposición oral del proyecto.

## Tareas de Preparación
- [ ] Ensayar presentación 3-5 veces mínimo
- [ ] Presentar frente a familiares/amigos
- [ ] Grabarse en vídeo para auto-evaluación
- [ ] Practicar con cronómetro
- [ ] Preparar notas (no guiones completos)
- [ ] Identificar muletillas y gestos a corregir

## Durante la Presentación
- [ ] Mantener contacto visual con tribunal
- [ ] Usar gestos naturales
- [ ] Hablar a ritmo moderado
- [ ] Hacer pausas estratégicas
- [ ] Proyectar voz con confianza
- [ ] Manejar nervios (respiración profunda)

## Anticipar Preguntas
- ¿Por qué esta tecnología y no otra?
- ¿Cómo manejas la seguridad?
- ¿Qué harías diferente?
- ¿Cómo escalaría el proyecto?
- ¿Cuál fue el mayor desafío?

## Gestión del Tiempo
- Confirmar tiempo límite con tutor/a
- Ajustar contenido al tiempo disponido
- Dejar margen para imprevistos

## Referencias
- \`docs/guia-proyecto-final-ciclo.md\` - Sección Exposición Oral

## Etiquetas
\`ensayo\` \`defensa\` \`proyecto-final\`" \
  --label "presentation,practice,high-priority" \
  --assignee "@me"

echo -e "${GREEN}✓${NC} Issue 12 creado: Ensayo\n"

echo -e "\n${BLUE}=== Resumen ===${NC}"
echo -e "✓ 12 issues creados exitosamente"
echo -e "\nPara añadirlos al proyecto #${PROJECT_NUMBER}:"
echo -e "${YELLOW}gh project item-add ${PROJECT_NUMBER} --owner ${PROJECT_OWNER} --url <issue-url>${NC}"
echo -e "\nO visita: https://github.com/users/${PROJECT_OWNER}/projects/${PROJECT_NUMBER}"
echo -e "y añade los issues manualmente.\n"
