# Sistema de Gestión de Solicitudes de Talento Humano — Nexa Servicios

**Corporación Universitaria Remington — Facultad de Ingeniería**  
**Materia:** Ingeniería de Software  
**Docente:** Prof. Gloria Amparo Lora Patiño  
**Integrantes:** Javier Bernal Garavito | Jhulius Karol Escobar Gómez  
**Año:** 2026  

---

## Tabla de Contenido del Repositorio (Guía para la Docente)

A continuación se presenta el mapa de navegación general del repositorio, estructurado según las fases oficiales del curso y el cronograma académico:

| Sección / Entregable | Ubicación en el Repositorio | Descripción y Contenido | Estado |
| :--- | :--- | :--- | :---: |
| **0. Cronograma del Proyecto** | [docs/cronograma.md](docs/cronograma.md) | Plan académico oficial de 16 semanas (192 horas), compuerta de calidad M2 y asignación de responsabilidades. | **Disponible** |
| **Fase 0: Concepción** | [docs/fase-0-concepcion/fase-0-concepcion.md](docs/fase-0-concepcion/fase-0-concepcion.md) | Planteamiento del problema en Nexa Servicios, alcance, objetivos general y específicos, estado del arte (20 referentes), marco teórico (BPM, HRIS), análisis de encuesta (47 respuestas) y problemas P-01 a P-12. | **Disponible (100% verificado)** |
| **Fase 1: Análisis** | [docs/fase-1-analisis/fase-1-analisis.md](docs/fase-1-analisis/fase-1-analisis.md) | Historias de usuario ([40 HU](docs/fase-1-analisis/1.1-historias-de-usuario.md)), requisitos funcionales ([62 RF](docs/fase-1-analisis/1.2-requisitos-funcionales.md)), requisitos no funcionales ([6 RNF](docs/fase-1-analisis/1.3-requisitos-no-funcionales.md)), reglas de negocio ([30 RN](docs/fase-1-analisis/1.4-reglas-de-negocio.md)), actores ([5 ACT](docs/fase-1-analisis/1.5-actores.md)), casos de uso ([14 CU](docs/fase-1-analisis/1.6-casos-de-uso.md)) y mockups ([12 MK](docs/fase-1-analisis/1.7-mockups.md)). | **Disponible (100% verificado)** |
| **Fase 2: Diseño** | [docs/fase-2-diseno/fase-2-diseno.md](docs/fase-2-diseno/fase-2-diseno.md) | Diccionario de datos ([30 tablas físicas](docs/fase-2-diseno/2.1-diccionario-de-datos.md)), [normalización 3FN](docs/fase-2-diseno/2.2-normalizacion-3fn.md), modelo orientado a objetos ([clases UML y 4 vistas](docs/fase-2-diseno/2.3-modelo-orientado-a-objetos.md)), [diseño conductual MVC](docs/fase-2-diseno/2.4-diseno-conductual-mvc.md), [MER y modelo relacional](docs/fase-2-diseno/2.5-mer-y-modelo-relacional.md), [auditoría cruzada](docs/fase-2-diseno/2.6-auditoria-cruzada.md) y [matriz integral de trazabilidad](docs/fase-2-diseno/2.7-matriz-integral-de-trazabilidad.md). | **Disponible (100% verificado)** |
| **Fase 3: Construcción** | [docs/fase-3-construccion/fase-3-construccion.md](docs/fase-3-construccion/fase-3-construccion.md) | Trazabilidad de objetos MySQL ([11 PRGs](docs/fase-3-construccion/3.1-trazabilidad-mysql-prg.md)), script oficial de BD ([talento_humano-1.sql](docs/fase-3-construccion/talento_humano-1.sql) / [versión Markdown](docs/fase-3-construccion/3.4-script-ddl-talento-humano.md)), [control de versiones y .gitignore](docs/fase-3-construccion/3.2-repositorio-y-control-de-versiones.md), [slice MVC](docs/fase-3-construccion/3.3-arquitectura-vertical-slice-mvc.md), [entrega MySQL en Word](docs/fase-3-construccion/13-Entrega_MySQL_Programacion_Jhulius_Escobar_Javier_Bernal.docx) y [entrega final consolidada](docs/fase-3-construccion/3.5-entrega-final-y-consolidacion.md). | **Disponible (100% verificado)** |
| **Diagramas y Arquitectura** | [assets/diagrams/](assets/diagrams/) | Diagramas UML de clases (Figuras 22-26), ciclo de actividad (Figura 27), DDA MVC (Figura 28), secuencia (Figuras 29-30), estados (Figura 31) y MER relacional (Figura 32). | **Disponible** |
| **Pantallas y Mockups** | [assets/images/](assets/images/) | Diseños de pantalla anotados (MK-01 a MK-12, Figuras 10-21) y gráficas estadísticas de encuesta (Figuras 1-8). | **Disponible** |
| **Archivos Históricos** | [assets/historico/](assets/historico/) | Versiones previas de documentos (Proyecto_Nexa_Servicios_...docx y versiones iniciales de contexto, análisis y diseño) preservadas para auditoría. | **Preservado** |
| **Documentos Word y Evidencias** | [assets/](assets/) | Documento Word oficial del proyecto ([Nexa servicios talento humano definitivo actual.docx](assets/Nexa%20servicios%20talento%20humano%20definitivo%20actual.docx)), entrega MySQL ([13-Entrega_MySQL...docx](assets/13-Entrega_MySQL_Programacion_Jhulius_Escobar_Javier_Bernal.docx)), cronograma visual ([cronograma.jpeg](assets/cronograma.jpeg)) y respuestas de encuesta en PDF. | **Disponible** |

---

## 1. Descripción del Proyecto

Este repositorio contiene la especificación de requisitos, arquitectura, modelado y artefactos de desarrollo del **Sistema de Gestión de Solicitudes de Talento Humano** para la empresa **Nexa Servicios**.

El proyecto surge de la necesidad de sustituir los canales informales y dispersos de gestión interna (WhatsApp, correos electrónicos no clasificados, documentos físicos y hojas de cálculo compartidas) por un sistema centralizado, auditable y trazable basado en los enfoques de *Business Process Management* (BPM) y *Human Resource Information Systems* (HRIS).

### Trámites Centralizados en el Alcance
* **Permisos Laborales:** Radicación, validación de fechas, aprobación/rechazo formal con motivo y cálculo derivado de días.
* **Vacaciones:** Solicitud con verificación previa obligatoria del saldo acumulado del empleado por período (SaldoVacaciones).
* **Certificaciones Laborales:** Generación y descarga digital condicionada a la aprobación previa de la solicitud.
* **Incapacidades Médicas:** Registro con carga obligatoria y validación de soporte clínico.
* **Servicios Transversales:** Autenticación por roles (ACT-01 a ACT-04), recuperación temporal de contraseñas, asignación de responsables, alertas por inactividad y auditoría inmutable de transiciones.

---

## 2. Estructura de Directorios del Repositorio

`	ext
Talento-humano-/
├── README.md                                          <- Tabla de contenido para la docente y guía del proyecto
├── .gitignore                                         <- Filtro de archivos temporales de Office, SO y secretos
├── assets/                                            <- Recursos de apoyo, diagramas y evidencias
│   ├── Nexa servicios talento humano definitivo actual.docx <- Documento Word oficial consolidado del proyecto
│   ├── 13-Entrega_MySQL_Programacion_...docx          <- Documento Word oficial de programación MySQL
│   ├── cronograma.jpeg                                <- Gráfica visual del cronograma institucional (16 semanas)
│   ├── Encuesta de procesos internos... (1).pdf       <- Tabulación original de encuesta (47 respuestas)
│   ├── diagrams/                                      <- Diagramas UML de clases, actividad, MVC, secuencia, estados y MER
│   ├── images/                                        <- Pantallas de mockups (MK-01 a MK-12) y gráficos de encuesta
│   └── historico/                                     <- Archivos históricos preservados (versiones previas)
│       ├── Proyecto_Nexa_Servicios_...docx
│       ├── version-previa-1-contexto/
│       ├── version-previa-analisis/
│       └── version-previa-diseno/
└── docs/
    ├── cronograma.md                                  <- Cronograma de trabajo de 16 semanas y compuertas
    ├── fase-0-concepcion/                             <- Fase 0: Concepción (Semanas 1–2, artefactos 0.1 a 0.5)
    │   └── fase-0-concepcion.md                       <- Documento íntegro verificado
    ├── fase-1-analisis/                               <- Fase 1: Análisis (Semanas 3–6, artefactos 1 a 4)
    │   ├── fase-1-analisis.md                         <- Documento maestro de análisis
    │   ├── 1.1-historias-de-usuario.md                <- 40 HU consolidadas
    │   ├── 1.2-requisitos-funcionales.md              <- 62 RF con fichas
    │   ├── 1.3-requisitos-no-funcionales.md           <- 6 RNF ISO/IEC 25010:2023
    │   ├── 1.4-reglas-de-negocio.md                   <- 30 RN vinculadas
    │   ├── 1.5-actores.md                             <- 5 actores del sistema
    │   ├── 1.6-casos-de-uso.md                        <- 14 CU con 6 críticos
    │   └── 1.7-mockups.md                             <- 12 pantallas UI/UX
    ├── fase-2-diseno/                                 <- Fase 2: Diseño (Semanas 7–12, artefactos 5 a 12)
    │   ├── fase-2-diseno.md                           <- Documento maestro de diseño
    │   ├── 2.1-diccionario-de-datos.md                <- 30 tablas físicas
    │   ├── 2.2-normalizacion-3fn.md                   <- Criterios de normalización 1FN a 3FN
    │   ├── 2.3-modelo-orientado-a-objetos.md          <- Clases UML y 4 vistas
    │   ├── 2.4-diseno-conductual-mvc.md               <- Actividades, paquetes, secuencias, estados
    │   ├── 2.5-mer-y-modelo-relacional.md             <- MER y reglas de integridad
    │   ├── 2.6-auditoria-cruzada.md                   <- Diccionario ↔ MER ↔ Clases
    │   └── 2.7-matriz-integral-de-trazabilidad.md     <- Matriz completa (Tabla 18)
    └── fase-3-construccion/                           <- Fase 3: Construcción (Semanas 13–16, artefactos 13 a 16)
        ├── fase-3-construccion.md                     <- Documento maestro de construcción y entrega
        ├── 3.1-trazabilidad-mysql-prg.md              <- Tabla 50 y rutinas PRG-01 a PRG-11
        ├── 3.2-repositorio-y-control-de-versiones.md  <- Control de versiones y compuerta M2
        ├── 3.3-arquitectura-vertical-slice-mvc.md     <- Arquitectura del primer slice MVC
        ├── 3.4-script-ddl-talento-humano.md           <- Script DDL de 30 tablas en Markdown
        ├── 3.5-entrega-final-y-consolidacion.md       <- Consolidación final y línea base (Semana 16)
        ├── talento_humano-1.sql                       <- Script oficial DDL MySQL (30 tablas)
        └── 13-Entrega_MySQL_Programacion_...docx      <- Entrega técnica de programación MySQL
`

---

## 3. Avisos de Privacidad y Referencias de Autoría

* **Fuente de Verdad Aprobada:** La referencia técnica definitiva para este repositorio es el documento externo Nexa servicios talento humano definitivo actual.docx.
* **Privacidad de Respuestas:** El archivo ssets/Encuesta de procesos internos y experiencia laboral (Respuestas) (1).pdf contiene marcas temporales y respuestas tabuladas de la consulta de diagnóstico. Se recomienda aplicar un proceso de anonimización formal antes de hacer público el repositorio en entornos de acceso abierto.
