# Sistema de Gestión de Solicitudes de Talento Humano — Nexa Servicios

**Corporación Universitaria Remington — Facultad de Ingeniería**  
**Materia:** Ingeniería de Software  
**Docente:** Prof. Gloria Amparo Lora Patiño  
**Integrantes:** Javier Bernal Garavito | Jhulius Karol Escobar Gómez  
**Año:** 2026  

---

## Tabla de Contenido del Repositorio (Guía para la Docente)

A continuación se presenta el mapa de navegación general del repositorio, estructurado según el orden cronológico del curso y las fases del proyecto:

| Sección / Entregable | Ubicación en el Repositorio | Descripción y Contenido | Estado |
| :--- | :--- | :--- | :---: |
| **0. Cronograma del Proyecto** | [docs/cronograma.md](docs/cronograma.md) | Plan académico de 16 semanas (192 horas), tabla de actividades, compuerta de calidad M2 y asignación de responsabilidades. | **Disponible** |
| **1. Fase 1: Concepción** | [docs/fase-1-concepcion/fase-1-concepcion.md](docs/fase-1-concepcion/fase-1-concepcion.md) | Planteamiento del problema en Nexa Servicios, alcance, objetivos general y específicos, estado del arte (20 referentes), marco teórico (BPM, HRIS), análisis de encuesta (47 respuestas) y problemas P-01 a P-12. | **Disponible (100% verificado)** |
| **2. Fase 2: Análisis** | [docs/fase-2-analisis/fase-2-analisis.md](docs/fase-2-analisis/fase-2-analisis.md) | Historias de usuario ([40 HU](docs/fase-2-analisis/2.1-historias-de-usuario.md)), requisitos funcionales ([62 RF](docs/fase-2-analisis/2.2-requisitos-funcionales.md)), requisitos no funcionales ([6 RNF](docs/fase-2-analisis/2.3-requisitos-no-funcionales.md)), reglas de negocio ([30 RN](docs/fase-2-analisis/2.4-reglas-de-negocio.md)), actores ([5 ACT](docs/fase-2-analisis/2.5-actores.md)), casos de uso ([14 CU](docs/fase-2-analisis/2.6-casos-de-uso.md)) y mockups ([12 MK](docs/fase-2-analisis/2.7-mockups.md)). | **Disponible (100% verificado)** |
| **3. Fase 3: Diseño** | [docs/fase-3-diseno/fase-3-diseno.md](docs/fase-3-diseno/fase-3-diseno.md) | Diccionario de datos ([30 tablas físicas](docs/fase-3-diseno/3.1-diccionario-de-datos.md)), [normalización 3FN](docs/fase-3-diseno/3.2-normalizacion-3fn.md), modelo orientado a objetos ([clases UML y 4 vistas](docs/fase-3-diseno/3.3-modelo-orientado-a-objetos.md)), [diseño conductual MVC](docs/fase-3-diseno/3.4-diseno-conductual-mvc.md), [MER y modelo relacional](docs/fase-3-diseno/3.5-mer-y-modelo-relacional.md), [auditoría cruzada](docs/fase-3-diseno/3.6-auditoria-cruzada.md) y [matriz integral de trazabilidad](docs/fase-3-diseno/3.7-matriz-integral-de-trazabilidad.md). | **Disponible (100% verificado)** |
| **4. Fase 4: Construcción** | [docs/fase-4-construccion/fase-4-construccion.md](docs/fase-4-construccion/fase-4-construccion.md) | Trazabilidad de objetos MySQL ([11 PRGs](docs/fase-4-construccion/4.1-trazabilidad-mysql-prg.md)), script oficial de BD ([talento_humano-1.sql](docs/fase-4-construccion/talento_humano-1.sql) / [versión Markdown](docs/fase-4-construccion/4.4-script-ddl-talento-humano.md)), [control de versiones y .gitignore](docs/fase-4-construccion/4.2-repositorio-y-control-de-versiones.md), [slice MVC](docs/fase-4-construccion/4.3-arquitectura-vertical-slice-mvc.md) y [entrega MySQL en Word](docs/fase-4-construccion/13-Entrega_MySQL_Programacion_Jhulius_Escobar_Javier_Bernal.docx). | **Disponible (100% verificado)** |
| **5. Fase 5: Entrega Final** | [docs/fase-5-entrega/fase-5-entrega.md](docs/fase-5-entrega/fase-5-entrega.md) | Consolidación final del entregable documental, trazabilidad de línea base y referencias bibliográficas completas. | **Disponible (100% verificado)** |
| **6. Diagramas y Arquitectura** | [assets/diagrams/](assets/diagrams/) | Diagramas UML de clases (Figuras 22-26), ciclo de actividad (Figura 27), DDA MVC (Figura 28), secuencia (Figuras 29-30), estados (Figura 31) y MER relacional (Figura 32). | **Disponible** |
| **7. Pantallas y Mockups** | [assets/images/](assets/images/) | Diseños de pantalla anotados (MK-01 a MK-12, Figuras 10-21) y gráficas estadísticas de encuesta (Figuras 1-8). | **Disponible** |
| **8. Archivos Históricos** | [assets/historico/](assets/historico/) | Versiones previas de documentos (Proyecto_Nexa_Servicios_...docx y versiones iniciales de contexto, análisis y diseño) preservadas para auditoría. | **Preservado** |
| **9. Documentos Word y Evidencias** | [assets/](assets/) | Documento Word oficial del proyecto ([Nexa servicios talento humano definitivo actual.docx](assets/Nexa%20servicios%20talento%20humano%20definitivo%20actual.docx)), entrega MySQL ([13-Entrega_MySQL...docx](assets/13-Entrega_MySQL_Programacion_Jhulius_Escobar_Javier_Bernal.docx)), cronograma visual ([cronograma.jpeg](assets/cronograma.jpeg)) y respuestas de encuesta en PDF. | **Disponible** |

---

## 1. Descripción del Proyecto

Este repositorio contiene la especificación de requisitos, arquitectura, modelado y artefactos de desarrollo del **Sistema de Gestión de Solicitudes de Talento Humano** para la empresa **Nexa Servicios**.

El proyecto surge de la necesidad de sustituir los canales informales y dispersos de gestión interna (WhatsApp, correos electrónicos no clasificados, documentos físicos y hojas de cálculo compartidas) por un sistema centralizado, auditable y trazable basado en los enfoques de *Business Process Management* (BPM) y *Human Resource Information Systems* (HRIS).

### Trámites Centralizados en el Alcance
* **Permisos Laborales:** Radicación, validación de fechas, aprobación/rechazo formal con motivo y cálculo derivado de días.
* **Vacaciones:** Solicitud con verificación previa obligatoria del saldo acumulado del empleado por período (`SaldoVacaciones`).
* **Certificaciones Laborales:** Generación y descarga digital condicionada a la aprobación previa de la solicitud.
* **Incapacidades Médicas:** Registro con carga obligatoria y validación de soporte clínico.
* **Servicios Transversales:** Autenticación por roles (`ACT-01` a `ACT-04`), recuperación temporal de contraseñas, asignación de responsables, alertas por inactividad y auditoría inmutable de transiciones.

---

## 2. Estructura de Directorios del Repositorio

```text
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
    ├── fase-1-concepcion/                             <- Fase 1: Concepción (0.1 a 0.5)
    │   └── fase-1-concepcion.md                       <- Documento íntegro verificado
    ├── fase-2-analisis/                               <- Fase 2: Análisis (1 a 4)
    │   ├── fase-2-analisis.md                         <- Documento maestro de análisis
    │   ├── 2.1-historias-de-usuario.md                <- 40 HU consolidadas
    │   ├── 2.2-requisitos-funcionales.md              <- 62 RF con fichas
    │   ├── 2.3-requisitos-no-funcionales.md           <- 6 RNF ISO/IEC 25010:2023
    │   ├── 2.4-reglas-de-negocio.md                   <- 30 RN vinculadas
    │   ├── 2.5-actores.md                             <- 5 actores del sistema
    │   ├── 2.6-casos-de-uso.md                        <- 14 CU con 6 críticos
    │   └── 2.7-mockups.md                             <- 12 pantallas UI/UX
    ├── fase-3-diseno/                                 <- Fase 3: Diseño (5 a 12)
    │   ├── fase-3-diseno.md                           <- Documento maestro de diseño
    │   ├── 3.1-diccionario-de-datos.md                <- 30 tablas físicas
    │   ├── 3.2-normalizacion-3fn.md                   <- Criterios de normalización 1FN a 3FN
    │   ├── 3.3-modelo-orientado-a-objetos.md          <- Clases UML y 4 vistas
    │   ├── 3.4-diseno-conductual-mvc.md               <- Actividades, paquetes, secuencias, estados
    │   ├── 3.5-mer-y-modelo-relacional.md             <- MER y reglas de integridad
    │   ├── 3.6-auditoria-cruzada.md                   <- Diccionario ↔ MER ↔ Clases
    │   └── 3.7-matriz-integral-de-trazabilidad.md     <- Matriz completa (Tabla 18)
    ├── fase-4-construccion/                           <- Fase 4: Construcción (13 a 15)
    │   ├── fase-4-construccion.md                     <- Documento maestro de construcción
    │   ├── 4.1-trazabilidad-mysql-prg.md              <- Tabla 50 y rutinas PRG-01 a PRG-11
    │   ├── 4.2-repositorio-y-control-de-versiones.md  <- Control de versiones y compuerta M2
    │   ├── 4.3-arquitectura-vertical-slice-mvc.md     <- Arquitectura del primer slice MVC
    │   ├── 4.4-script-ddl-talento-humano.md           <- Script DDL de 30 tablas en Markdown
    │   ├── talento_humano-1.sql                       <- Script oficial DDL MySQL (30 tablas)
    │   └── 13-Entrega_MySQL_Programacion_...docx      <- Entrega técnica de programación MySQL
    └── fase-5-entrega/                                <- Fase 5: Entrega y Consolidación (16)
        └── fase-5-entrega.md                          <- Línea base y referencias bibliográficas
```

---

## 3. Avisos de Privacidad y Referencias de Autoría

* **Fuente de Verdad Aprobada:** La referencia técnica definitiva para este repositorio es el documento externo `Nexa servicios talento humano definitivo actual.docx`.
* **Privacidad de Respuestas:** El archivo `assets/Encuesta de procesos internos y experiencia laboral (Respuestas) (1).pdf` contiene marcas temporales y respuestas tabuladas de la consulta de diagnóstico. Se recomienda aplicar un proceso de anonimización formal antes de hacer público el repositorio en entornos de acceso abierto.
