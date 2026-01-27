## Casos prácticos para comprender la accesibilidad web  
**Basados en sitios reales + herramientas concretas**

Estos casos están pensados para **aprender haciendo**, partiendo de webs existentes (públicas) y usando **herramientas estándar de auditoría a11y**. Son aplicables tanto a **Plone** como a **WordPress** (y otros CMS).

---

## Caso 1: Contraste de color insuficiente en textos

### Sitio real
- Web corporativa o institucional con diseño “branding-first”

### Problema típico
- Texto gris claro sobre fondo blanco
- Botones con bajo contraste
- Enlaces indistinguibles del texto normal

### Herramientas
- **Lighthouse (Chrome DevTools)**
- **axe DevTools**
- **Contrast Checker (WCAG)**

### Qué aprender
- Requisitos WCAG 2.1 (1.4.3 / 1.4.6)
- Diferencia entre AA y AAA
- Cómo pequeños cambios de color mejoran mucho la accesibilidad

---

## Caso 2: Navegación imposible solo con teclado

### Sitio real
- E-commerce o portal con menú desplegable complejo

### Problema típico
- Menús inaccesibles con `Tab`
- Foco invisible
- Elementos interactivos que no reciben foco

### Herramientas
- Teclado (Tab, Shift+Tab, Enter, Esc)
- **axe DevTools**
- **Chrome DevTools → Accessibility**

### Qué aprender
- Orden lógico de foco
- Importancia de `:focus`
- Roles ARIA mal usados vs innecesarios

---

## Caso 3: Encabezados mal estructurados

### Sitio real
- Blog o portal de noticias

### Problema típico
- Saltos de h1 a h4
- Encabezados usados solo para estilo
- Múltiples h1 incorrectos

### Herramientas
- **Web Developer Toolbar**
- **HeadingsMap**
- Lectores de pantalla (modo headings)

### Qué aprender
- Estructura semántica del contenido
- Cómo navegan los usuarios de lector de pantalla
- Relación entre SEO y accesibilidad

---

## Caso 4: Formularios inaccesibles

### Sitio real
- Formulario de contacto o inscripción

### Problema típico
- Campos sin `<label>`
- Mensajes de error solo visuales
- Campos obligatorios no anunciados

### Herramientas
- **NVDA / VoiceOver**
- **axe DevTools**
- Inspector HTML

### Qué aprender
- Asociación label–input
- Anuncio de errores accesibles
- Buenas prácticas WCAG 3.3.x

---

## Caso 5: Imágenes sin texto alternativo útil

### Sitio real
- Web institucional con muchas imágenes decorativas

### Problema típico
- `alt=""` incorrecto
- `alt="imagen"` o textos redundantes
- Imágenes informativas sin descripción

### Herramientas
- **WAVE**
- Inspector DOM
- Lector de pantalla

### Qué aprender
- Diferencia entre imagen decorativa e informativa
- Cómo escribir buenos textos alternativos
- Impacto real en usuarios ciegos

---

## Caso 6: Contenido dinámico no anunciado

### Sitio real
- SPA (React, Vue, Angular)
- Buscadores con resultados en vivo

### Problema típico
- Cambios en pantalla no anunciados
- Alertas invisibles para lectores de pantalla

### Herramientas
- **NVDA / VoiceOver**
- **ARIA Live Regions**
- React DevTools (si aplica)

### Qué aprender
- Uso correcto de `aria-live`
- Errores comunes en SPAs
- Diferencias entre accesibilidad “estática” y “dinámica”

---

## Caso 7: Enlaces poco descriptivos

### Sitio real
- Portales de noticias o blogs antiguos

### Problema típico
- “Haz clic aquí”
- “Leer más”
- Enlaces repetidos sin contexto

### Herramientas
- Lector de pantalla (lista de enlaces)
- **axe DevTools**
- Auditoría manual

### Qué aprender
- Cómo navegan los usuarios por enlaces
- Relación entre accesibilidad y UX
- Mejores prácticas WCAG 2.4.4

---

## Caso 8: Uso incorrecto de ARIA

### Sitio real
- Web con widgets personalizados

### Problema típico
- ARIA innecesaria
- Roles incorrectos
- `aria-label` sobrescribiendo contenido útil

### Herramientas
- **Chrome Accessibility Tree**
- **axe DevTools**
- Documentación WAI-ARIA

### Qué aprender
- Regla de oro: *“No ARIA is better than bad ARIA”*
- Cuándo usar ARIA y cuándo no
- Cómo ARIA puede romper accesibilidad

---

## Caso 9: Comparativa directa Plone vs WordPress

### Sitio real
- Un sitio Plone por defecto
- Un WordPress con page builder

### Actividad
- Ejecutar las mismas auditorías en ambos
- Comparar:
  - Errores automáticos
  - Problemas manuales
  - Riesgo de regresión

### Herramientas
- Lighthouse
- axe
- WAVE

### Qué aprender
- Accesibilidad “by design” vs “by configuration”
- Impacto del CMS en el resultado final
- Coste real de mantener accesibilidad

---

## Caso 10: Auditoría completa simulando cumplimiento legal

### Sitio real
- Web pública de ayuntamiento / universidad

### Actividad
- Auditoría WCAG 2.1 AA
- Informe de hallazgos
- Propuesta de correcciones

### Herramientas
- **WCAG-EM**
- Lighthouse
- axe
- Pruebas manuales

### Qué aprender
- Qué NO detectan las herramientas automáticas
- Cómo documentar problemas de accesibilidad
- Enfoque profesional y legal


---
# Taller práctico paso a paso: Accesibilidad web basada en sitios reales

**Perfil:** desarrolladores, diseñadores, editores de contenido  
**Duración total:** 4–6 horas (adaptable)  
**Nivel:** inicial → intermedio  
**Objetivo:** comprender la accesibilidad web **detectando, entendiendo y corrigiendo problemas reales**

---

## 0. Preparación del taller (15 min)

### Requisitos
- Navegador Chrome o Firefox
- Extensiones:
  - axe DevTools
  - WAVE
  - HeadingsMap
- Lector de pantalla:
  - **NVDA** (Windows) o **VoiceOver** (macOS)
- Acceso a:
  - Un sitio Plone (idealmente demo)
  - Un sitio WordPress (con theme o page builder)

### Concepto clave
> Las herramientas ayudan a detectar errores,  
> **los usuarios los sufren**.

---

## Fase 1: Auditoría automática inicial (30 min)

### Paso 1.1 — Ejecutar Lighthouse
1. Abrir el sitio
2. Chrome DevTools → Lighthouse
3. Ejecutar auditoría de **Accessibility**

### Paso 1.2 — Ejecutar axe
1. Abrir axe DevTools
2. Analizar la página
3. Exportar resultados

### Resultado esperado
- Lista de errores automáticos
- Diferenciar:
  - Errores críticos
  - Advertencias
  - Buenas prácticas

### Aprendizaje
- Qué detectan las herramientas
- Qué **no** detectan

---

## Fase 2: Contraste y legibilidad (30 min)

### Paso 2.1 — Detectar problemas
- Usar WAVE
- Identificar:
  - Textos con bajo contraste
  - Botones problemáticos

### Paso 2.2 — Validar contraste
- Medir ratio AA / AAA
- Proponer corrección mínima

### Ejercicio
> Ajustar un color sin romper la identidad visual.

### Aprendizaje
- WCAG 1.4.3 / 1.4.6
- Accesibilidad ≠ diseño feo

---

## Fase 3: Navegación por teclado (30 min)

### Paso 3.1 — Prueba manual
- Usar solo:
  - `Tab`
  - `Shift + Tab`
  - `Enter`
  - `Esc`

### Paso 3.2 — Evaluar
- ¿El foco es visible?
- ¿El orden es lógico?
- ¿Se puede cerrar un menú?

### Comparativa
- Repetir en Plone y WordPress

### Aprendizaje
- El teclado es la base de la accesibilidad
- Muchísimos errores no son automáticos

---

## Fase 4: Estructura semántica (30 min)

### Paso 4.1 — Analizar encabezados
- Usar HeadingsMap
- Revisar jerarquía h1–h6

### Paso 4.2 — Detectar errores
- Saltos de nivel
- Encabezados usados como estilo

### Ejercicio
> Redefinir la estructura solo cambiando HTML, no CSS.

### Aprendizaje
- Cómo “leen” las páginas los lectores de pantalla
- Relación directa con SEO

---

## Fase 5: Formularios accesibles (40 min)

### Paso 5.1 — Auditoría visual
- Revisar:
  - Labels
  - Campos obligatorios
  - Mensajes de error

### Paso 5.2 — Auditoría con lector de pantalla
- Navegar campo a campo
- Provocar errores

### Paso 5.3 — Corrección conceptual
- Asociar labels
- Anunciar errores
- Usar descripciones claras

### Aprendizaje
- WCAG 3.3.x
- Formularios = punto crítico de exclusión

---

## Fase 6: Imágenes y textos alternativos (25 min)

### Paso 6.1 — Identificar imágenes
- Decorativas
- Informativas
- Funcionales

### Paso 6.2 — Evaluar alt text
- ¿Aporta información?
- ¿Es redundante?

### Ejercicio
> Reescribir 5 textos alternativos reales.

### Aprendizaje
- Accesibilidad es **comunicación**, no etiquetas

---

## Fase 7: Contenido dinámico y ARIA (40 min)

### Paso 7.1 — Identificar cambios dinámicos
- Alerts
- Modales
- Búsquedas en vivo

### Paso 7.2 — Probar con lector de pantalla
- ¿Se anuncia el cambio?
- ¿Se pierde el foco?

### Paso 7.3 — Revisar ARIA
- Detectar ARIA innecesaria
- Corregir roles incorrectos

### Aprendizaje
```text
ARIA no arregla HTML roto.
