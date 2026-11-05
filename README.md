# Sistema de Gestión de Solicitudes de Talento Humano – Nexa Servicios

<div align="center">

### Proyecto de Ingeniería de Software
**Corporación Universitaria Remington — Facultad de Ingeniería**  
Ingeniería de Sistemas — Año 2026

**Integrantes del Proyecto:**  
**Javier Bernal Garavito** | **Jhulius Karol Escobar Gómez**  

**Docente:**  
Prof. Gloria Amparo Lora Patiño

</div>

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

## 2. Estructura del Repositorio

El repositorio está organizado conforme a las fases y entregables del **cronograma académico de 16 semanas**:

```text
Talento-humano-/
├── README.md                                          <- Guía principal y mapa de navegación del proyecto
├── .gitignore                                         <- Filtro de archivos temporales de Office, SO y secretos
└── docs/
    ├── 00-concepcion/                                 <- Fase de Concepción (Semanas 1 y 2: Artefactos 0.1–0.5)
    │   ├── 00.1-descripcion-del-problema-y-alcance.md
    │   ├── 00.2-objetivos.md
    │   ├── 00.3-estado-del-arte-y-marco-teorico.md
    │   ├── 00.4-analisis-de-la-encuesta-y-problemas.md
    │   └── 00.5-cronograma.md
    ├── 01-analisis/                                   <- Fase de Análisis (Semanas 3 a 6: Artefactos 1–4)
    │   ├── 01-historias-de-usuario.md
    │   ├── 01.1-la-cadena-completa.md
    │   ├── 02.1-requisitos-funcionales.md
    │   ├── 02.2-reglas-de-negocio.md
    │   ├── 02.3-requisitos-no-funcionales.md
    │   ├── 02.4-actores.md
    │   ├── 03-casos-de-uso.md
    │   ├── 03.1-escenarios.md
    │   └── 04-mockups.md
    ├── 02-diseno/                                     <- Fase de Diseño (Semanas 7 a 12: Artefactos 5–12)
    │   ├── 05-diccionario-de-datos.md
    │   └── 12-matriz-de-trazabilidad.md
    ├── 03-construccion/                               <- Fase de Construcción (Semanas 13 a 15: Artefactos 13–15)
    │   └── 13-Entrega_MySQL_Programacion_...docx      <- Entrega técnica de programación MySQL (PRG-01 a PRG-11)
    ├── 04-entrega/                                    <- Fase de Entrega Final (Semana 16: Artefacto 16)
    ├── assets/                                        <- Recursos de apoyo, imágenes y diagramas
    │   ├── cronograma.jpeg
    │   └── Encuesta de procesos internos... (1).pdf
    └── 99-historico/                                  <- Versiones previas preservadas para trazabilidad
        ├── README.md
        ├── Proyecto_Nexa_Servicios_...docx
        └── version-previa-1-contexto/
```

---

## 3. Secuencia de Lectura y Navegación

Para recorrer los entregables en el orden metodológico del cronograma:

1. **Fase de Concepción (Semanas 1–2):**
   * [00.1 Descripción del problema y alcance](docs/00-concepcion/00.1-descripcion-del-problema-y-alcance.md)
   * [00.2 Objetivo general y específicos](docs/00-concepcion/00.2-objetivos.md)
   * [00.3 Estado del arte y marco teórico](docs/00-concepcion/00.3-estado-del-arte-y-marco-teorico.md)
   * [00.4 Análisis de la encuesta y problemas identificados](docs/00-concepcion/00.4-analisis-de-la-encuesta-y-problemas.md)
   * [00.5 Cronograma de trabajo de 16 semanas](docs/00-concepcion/00.5-cronograma.md)
2. **Fase de Análisis (Semanas 3–6):**
   * [01 Historias de Usuario](docs/01-analisis/01-historias-de-usuario.md) y [01.1 Cadena completa](docs/01-analisis/01.1-la-cadena-completa.md)
   * [02.1 Requisitos Funcionales](docs/01-analisis/02.1-requisitos-funcionales.md), [02.2 Reglas de Negocio](docs/01-analisis/02.2-reglas-de-negocio.md) y [02.3 Requisitos No Funcionales](docs/01-analisis/02.3-requisitos-no-funcionales.md)
   * [02.4 Actores del sistema](docs/01-analisis/02.4-actores.md)
   * [03 Casos de Uso](docs/01-analisis/03-casos-de-uso.md) y [03.1 Escenarios](docs/01-analisis/03.1-escenarios.md)
   * [04 Mockups de Interfaz](docs/01-analisis/04-mockups.md)
3. **Fase de Diseño (Semanas 7–12):**
   * [05 Diccionario de Datos (30 tablas)](docs/02-diseno/05-diccionario-de-datos.md)
   * [12 Matriz Integral de Trazabilidad](docs/02-diseno/12-matriz-de-trazabilidad.md)
4. **Fase de Construcción (Semanas 13–15):**
   * `13-DDL Script SQL`: *Pendiente de entrega física por el compañero de equipo responsable del SQL.*
   * [13 Especificación de Programación MySQL](docs/03-construccion/13-Entrega_MySQL_Programacion_Jhulius_Escobar_Javier_Bernal.docx): Documentación de los bloques `PRG-01` a `PRG-11`.
   * `14-Repositorio Git y .gitignore`: *Disponible en este repositorio.*
   * `15-Vertical Slice MVC`: *Planificado según cronograma tras compuerta M2.*
5. **Fase de Entrega (Semana 16):**
   * `16-Consolidación Final`: *Programada para el cierre del ciclo académico.*

---

## 4. Estado de los Entregables

| Número | Fase | Artefacto / Documento | Ubicación | Estado |
| :---: | :--- | :--- | :--- | :---: |
| **0.1** | Concepción | Planteamiento del problema y alcance | `docs/00-concepcion/00.1-...md` | **Disponible (Verificado)** |
| **0.2** | Concepción | Objetivo general y específicos | `docs/00-concepcion/00.2-...md` | **Disponible (Verificado)** |
| **0.3** | Concepción | Estado del arte y marco teórico | `docs/00-concepcion/00.3-...md` | **Disponible (Verificado)** |
| **0.4** | Concepción | Análisis de encuesta y problemas P-01 a P-12 | `docs/00-concepcion/00.4-...md` | **Disponible (Verificado)** |
| **0.5** | Concepción | Cronograma de 16 semanas y compuertas | `docs/00-concepcion/00.5-...md` | **Disponible (Verificado)** |
| **1** | Análisis | Historias de usuario (HU) y criterios | `docs/01-analisis/01-...md` | **En revisión** *(Reconciliación 40 HU vs 60 HU)* |
| **2** | Análisis | Requisitos funcionales (62), RN (30) y RNF (6) | `docs/01-analisis/02.x-...md` | **En revisión** *(Alineación con versión aprobada)* |
| **3** | Análisis | Casos de uso (14 CU y 6 críticos) | `docs/01-analisis/03-...md` | **En revisión** |
| **4** | Análisis | Mockups de interfaz (12 MK) | `docs/01-analisis/04-...md` | **En revisión** |
| **5–7** | Diseño | Diccionario de datos (30 tablas), MER y clases | `docs/02-diseno/05-...md` | **En revisión** |
| **8–12** | Diseño | Diagramas conductuales y matriz trazabilidad | `docs/02-diseno/12-...md` | **En revisión** |
| **13** | Construcción | Script SQL DDL (`talento_humano.sql`) | `docs/03-construccion/` | **Pendiente** *(A cargo del compañero responsable)* |
| **14** | Construcción | Control de versiones y `.gitignore` | Raíz (`.gitignore`) | **Disponible** |
| **15** | Construcción | Primer slice vertical MVC | `src/` | **Pendiente** *(Sujeto a compuerta M2)* |
| **16** | Entrega | Consolidación y entrega final | `docs/04-entrega/` | **Pendiente** *(Semana 16)* |

---

## 5. Avisos de Privacidad y Referencias de Autoría

* **Fuente de Verdad Aprobada:** La referencia técnica definitiva para este repositorio es el documento externo `Nexa servicios talento humano definitivo actual.docx`.
* **Privacidad de Respuestas:** El archivo [Encuesta de procesos internos y experiencia laboral (Respuestas) (1).pdf](docs/assets/Encuesta%20de%20procesos%20internos%20y%20experiencia%20laboral%20(Respuestas)%20(1).pdf) contiene marcas temporales y respuestas tabuladas. Se recomienda aplicar un proceso de anonimización formal antes de hacer público el repositorio en entornos de acceso abierto.
