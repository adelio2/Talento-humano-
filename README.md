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
| **2. Fase 2: Análisis** | [docs/01-analisis/](docs/01-analisis/) | Historias de usuario (HU), requisitos funcionales (62 RF), reglas de negocio (30 RN), requisitos no funcionales (6 RNF), catálogo de casos de uso (14 CU) y mockups (12 MK). | **Siguiente fase** |
| **3. Fase 3: Diseño** | [docs/02-diseno/](docs/02-diseno/) | Diccionario de datos (30 tablas normalizadas a 3FN), modelo relacional (MER), diagramas de clases UML y matriz integral de trazabilidad. | **Pendiente de fase** |
| **4. Fase 4: Construcción** | [docs/03-construccion/](docs/03-construccion/) | Entrega de programación en MySQL (fichas `PRG-01` a `PRG-11`), repositorio Git, `.gitignore` y desarrollo del primer vertical slice MVC. | **En desarrollo** |
| **5. Fase 5: Entrega Final** | `docs/04-entrega/` | Consolidación final del entregable documental y cierre de líneas base. | **Planificada (Sem. 16)** |
| **6. Archivos Históricos** | [assets/historico/](assets/historico/) | Versiones previas de documentos (`Proyecto_Nexa_Servicios_Documentacion_completa.docx` y entregas intermedias) preservadas para trazabilidad y auditoría. | **Preservado** |
| **7. Recursos y Evidencias** | [assets/](assets/) | Gráfica del cronograma (`cronograma.jpeg`) y respuestas tabuladas de la encuesta institucional en PDF. | **Disponible** |

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

## 2. Estructura de Directorios

```text
Talento-humano-/
├── README.md                                          <- Tabla de contenido para la docente y guía del proyecto
├── .gitignore                                         <- Filtro de archivos temporales de Office, SO y secretos
├── assets/                                            <- Recursos de apoyo, diagramas y evidencias
│   ├── cronograma.jpeg
│   ├── Encuesta de procesos internos... (1).pdf
│   └── historico/                                     <- Archivos históricos preservados (versiones previas)
│       ├── Proyecto_Nexa_Servicios_...docx
│       └── version-previa-1-contexto/
└── docs/
    ├── cronograma.md                                  <- Cronograma de trabajo de 16 semanas y compuertas
    ├── fase-1-concepcion/                             <- Fase 1: Concepción (0.1 a 0.5)
    │   └── fase-1-concepcion.md                       <- Documento íntegro con planteamiento, objetivos, marco, encuesta y problemas
    ├── 01-analisis/                                   <- Fase 2: Análisis (HU, RF, RN, RNF, CU, Mockups)
    ├── 02-diseno/                                     <- Fase 3: Diseño (Diccionario, MER, Clases, Matriz)
    ├── 03-construccion/                               <- Fase 4: Construcción (Programación MySQL y vertical slice)
    └── 04-entrega/                                    <- Fase 5: Entrega final
```

---

## 3. Avisos de Privacidad y Referencias de Autoría

* **Fuente de Verdad Aprobada:** La referencia técnica definitiva para este repositorio es el documento externo `Nexa servicios talento humano definitivo actual.docx`.
* **Privacidad de Respuestas:** El archivo `assets/Encuesta de procesos internos y experiencia laboral (Respuestas) (1).pdf` contiene marcas temporales y respuestas tabuladas de la consulta de diagnóstico. Se recomienda aplicar un proceso de anonimización formal antes de hacer público el repositorio en entornos de acceso abierto.
