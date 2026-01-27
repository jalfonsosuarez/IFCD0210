## Comparativa: Plone vs WordPress  
**Enfoque en Usabilidad, Accesibilidad y Arquitectura**

Esta comparativa está orientada a una **visión técnica y estratégica**, no solo a popularidad o facilidad inicial.

---

## 1. Filosofía de diseño

| Aspecto | Plone | WordPress |
|------|------|-----------|
| Enfoque principal | CMS empresarial, gobierno, educación | Publicación rápida y blogging |
| Accesibilidad | **Core-first** (por diseño) | **Opcional** (dependiente del tema) |
| Seguridad | Integrada en el núcleo | Dependiente de plugins |
| Flexibilidad | Alta, pero controlada | Muy alta, poco control |

---

## 2. Accesibilidad (A11y)

### Plone
- Cumple **WCAG 2.1 AA** por defecto
- HTML semántico consistente
- Formularios accesibles (z3c.form)
- Navegación completa por teclado
- Muy difícil “romper” la accesibilidad sin hacerlo explícitamente

### WordPress
- El **core es razonablemente accesible**
- La accesibilidad depende de:
  - Tema
  - Page builder (Elementor, Divi, etc.)
  - Plugins
- Fácil introducir:
  - HTML inválido
  - Problemas de contraste
  - Navegación inaccesible

**Conclusión:**  
> En Plone debes **esforzarte para romper la accesibilidad**.  
> En WordPress debes **esforzarte para mantenerla**.

---

## 3. Usabilidad editorial (UX)

### Experiencia del editor

| Aspecto | Plone 6 (Volto) | WordPress (Gutenberg) |
|------|------|-----------|
| Curva inicial | Media | Baja |
| Consistencia UI | Alta | Variable |
| Edición por bloques | Sí | Sí |
| Control de contenido | Muy alto | Medio |
| Errores editoriales | Difícil cometerlos | Muy comunes |

Plone prioriza **previsibilidad y control**, WordPress **rapidez y libertad**.

---

## 4. Arquitectura técnica

### Backend

| Aspecto | Plone | WordPress |
|------|------|-----------|
| Lenguaje | Python (Zope) | PHP |
| Modelo de contenido | Tipado y estructurado | Flexible pero débil |
| APIs | REST nativo | REST añadida |
| Escalabilidad | Alta | Media |
| Multisitio | Robusto | Complejo |

### Frontend

- **Plone 6**:  
  - Backend desacoplado  
  - Frontend React (Volto)  
  - Arquitectura moderna SPA

- **WordPress**:  
  - Mayormente monolítico  
  - React solo en el editor  
  - Frontend clásico PHP/JS

---

## 5. Seguridad y mantenimiento

| Aspecto | Plone | WordPress |
|------|------|-----------|
| Superficie de ataque | Baja | Alta |
| Dependencia de plugins | Baja | Muy alta |
| Actualizaciones críticas | Poco frecuentes | Frecuentes |
| Historial de exploits | Muy bajo | Alto |

> WordPress no es inseguro por diseño,  
> pero su **ecosistema lo hace vulnerable**.

---

## 6. Flujos de trabajo y roles

### Plone
- Workflows avanzados
- Estados de contenido
- Permisos granulares
- Auditoría y versionado

### WordPress
- Roles básicos
- Workflows limitados (requieren plugins)
- Menor trazabilidad

---

## 7. Coste real del proyecto

| Tipo de coste | Plone | WordPress |
|------|------|-----------|
| Arranque | Alto | Bajo |
| Desarrollo | Medio–Alto | Bajo–Medio |
| Mantenimiento | Bajo | Medio–Alto |
| Correcciones legales (a11y) | Bajo | Alto |
| Escalado | Bajo | Alto |

---

## 8. Casos de uso recomendados

### Usa **Plone** si:
- Necesitas cumplimiento WCAG / legal
- Trabajas con sector público o educación
- Requieres workflows complejos
- La seguridad es crítica
- El proyecto es a largo plazo

### Usa **WordPress** si:
- Necesitas publicar rápido
- El equipo no es técnico
- El presupuesto inicial es bajo
- La accesibilidad no es obligatoria
- El sitio es simple o temporal

---

## 9. Conclusión de desarrollador

```text
WordPress optimiza el corto plazo.
Plone optimiza el largo plazo.
