# 4. Fase 4: Construcción

**Proyecto:** Sistema de Gestión de Solicitudes de Talento Humano  
**Organización:** Nexa Servicios  
**Documento Fuente:** *Nexa servicios talento humano definitivo actual.docx*  
**Autores:** Javier Bernal Garavito | Jhulius Karol Escobar Gómez  
**Docente:** Prof. Gloria Amparo Lora Patiño — Universidad Remington  

---

## Índice de la Fase de Construcción

* [4.1 Trazabilidad de Objetos Programables en MySQL (PRG-01 a PRG-11)](4.1-trazabilidad-mysql-prg.md)
* [4.2 Repositorio Git y Control de Versiones](4.2-repositorio-y-control-de-versiones.md)
* [4.3 Arquitectura y Primer Vertical Slice MVC](4.3-arquitectura-vertical-slice-mvc.md)
* [Documento Word de Entrega MySQL (Capítulo 20)](13-Entrega_MySQL_Programacion_Jhulius_Escobar_Javier_Bernal.docx)

---


# 4.1 Trazabilidad de Objetos Programables en MySQL (PRG-01 a PRG-11)

**Proyecto:** Sistema de Gestión de Solicitudes de Talento Humano — Nexa Servicios  
**Fase:** Fase 4 — Construcción (Semanas 13–15)  
**Artefactos del Cronograma:** 13. Script SQL (DDL) y Objetos Programables  
**Fuente:** Documento Definitivo Aprobado (*Nexa servicios talento humano definitivo actual.docx* — Capítulo 19)  

---

## 19. Trazabilidad de objetos MySQL del equipo

Esta matriz consolida los **11 bloques PRG** descritos por el equipo MySQL y los relaciona con métodos UML, las 40 HU, RF, RN/RNF, CU, MK y tablas. El archivo 	alento_humano-1.sql contiene 30 tablas y no declara procedimientos, funciones, triggers, eventos ni vistas; por eso, los bloques PRG se atribuyen al documento de programación del equipo. Las correspondencias se establecen por función y no por coincidencia numérica entre las HU del documento MySQL y las HU consolidadas. Este cruce se revisa junto con el diccionario y la matriz integral.

### Tabla 50. Correspondencia con la entrega MySQL del equipo

| Código | Objetos MySQL | Método UML relacionado | Trazabilidad HU / RF / RN / RNF / CU / MK | Tablas involucradas |
| --- | --- | --- | --- | --- |
| PRG-01 | PROCEDURE sp_autenticar_usuario(IN p_correo, IN p_hash_ingresado, IN p_ip) | Usuario.iniciarSesion(): boolean / Usuario.bloquearCuenta(): void (Vista 1 y Vista 4) | HU-01, HU-33| CU-01, CU-13 | RF-01, RF-47, RF-60 | RN-27 | RNF-03 | MK-01, MK-11 | Usuario (R/U), Rol (R), Area (R), Cargo (R), RegistroAcceso (C) |
| PRG-02 | PROCEDURE sp_solicitar_recuperacion_clave / PROCEDURE sp_restablecer_clave_con_token | Usuario.solicitarRecuperacionClave(): string / RecuperacionClave.validarToken(): boolean (Vista 4) | HU-02 | CU-02 | RF-02, RF-43 | RN-20 | RNF-03 | MK-01 | Usuario (R/U), RecuperacionClave (C/R/U) |
| PRG-03 | FUNCTION fn_calcular_dias(p_fecha_inicio, p_fecha_fin) / FUNCTION fn_dias_disponibles_vacaciones(p_id_usuario, p_periodo) | PermisoLaboral.calcularDias(): int / Vacacion.calcularDias(): int / Incapacidad.calcularDias(): int / SaldoVacaciones.diasDisponibles(): decimal / Vacacion.validarSaldo(): boolean (Vistas 1 y 4) | HU-03, HU-07, HU-29, HU-35 a HU-36| CU-03, CU-05, CU-11 | RF-04, RF-11, RF-37, RF-50, RF-51 | RN-12, RN-13, RN-30 | MK-03, MK-05, MK-09 | SaldoVacaciones (R), Vacacion (R), PermisoLaboral (R), Incapacidad (R) |
| PRG-04 | PROCEDURE sp_radicar_solicitud_th(...) | Solicitud.radicarSolicitud(): boolean (Vista 1) + Caso incluido CU-04 Asignar responsable inicial | HU-03, HU-05, HU-10| CU-03, CU-04, CU-08 | RF-03 a RF-06, RF-09, RF-13, RF-15 | RN-01, RN-02, RN-08, RN-13, RN-17 a RN-19, RN-23 | MK-03, MK-06 | Solicitud (C), PermisoLaboral (C), Vacacion (C), Incapacidad (C), Documento (C), AsignacionSolicitud (C), HistorialSolicitud (C) |
| PRG-05 | PROCEDURE sp_gestionar_estado_solicitud(IN p_id_solicitud, IN p_id_usuario_actor, IN p_nuevo_estado, IN p_comentario) | Solicitud.actualizarEstado(estado): void / HistorialSolicitud.registrarCambio(): void (Vistas 1 y 3) | HU-04, HU-07, HU-12, HU-15, HU-18| CU-05 | RF-07, RF-08, RF-11, RF-17, RF-20, RF-23, RF-26 | RN-03 a RN-07, RN-12, RN-15, RN-16 | MK-04, MK-05 | Solicitud (R/U), EstadoSolicitud (R), Vacacion (R), SaldoVacaciones (R/U), HistorialSolicitud (C) |
| PRG-06 | PROCEDURE sp_reasignar_solicitud(IN p_id_solicitud, IN p_id_nuevo_responsable, IN p_id_usuario_actor, IN p_motivo) | AsignacionSolicitud.finalizarAsignacion(): void (Vista 3) | HU-19, HU-23 a HU-26| CU-06 | RF-24, RF-29 a RF-32 | RN-07, RN-09, RN-10, RN-26 | MK-06 | AsignacionSolicitud (R/U/C), Usuario (R), Rol (R), HistorialSolicitud (C) |
| PRG-07 | PROCEDURE sp_adjuntar_documento(...) | Documento.validarFormato(): boolean / Incapacidad.validarDocumentoMedico(): boolean (Vistas 1 y 3) | HU-03, HU-10, HU-27 a HU-28| CU-08 | RF-06, RF-15, RF-33 a RF-35 | RN-02, RN-17, RN-18, RN-19 | MK-03, MK-04 | Documento (C/R), Solicitud (R) |
| PRG-08 | PROCEDURE sp_generar_certificado_laboral(IN p_id_solicitud, IN p_ruta_archivo) | CertificadoLaboral.generarCertificado(): string (Vista 3) | HU-03, HU-08, HU-30| CU-10 | RF-05, RF-12, RF-39, RF-40 | RN-14, RN-15 | MK-08 | Solicitud (R), CertificadoLaboral (C/U), EstadoCertificado (R) |
| PRG-09 | TRIGGER trg_solicitud_after_update_notificar_auditar / PROCEDURE sp_marcar_notificacion_leida | Notificacion.marcarComoLeida(): void + AuditoriaSistema / DetalleAuditoria (Vistas 3 y 4) | HU-11, HU-13, HU-31, HU-34| CU-09, CU-13 | RF-18, RF-41, RF-42, RF-48, RF-49, RF-61 | RN-21, RN-22, RN-28 | MK-07, MK-11 | Solicitud, Notificacion (C/U), AuditoriaSistema (C), DetalleAuditoria (C) |
| PRG-10 | PROCEDURE sp_generar_alertas_sin_movimiento() + EVENT evt_alerta_solicitudes_sin_movimiento | Caso de Uso CU-09 Gestionar notificaciones y alertas (HU-06 / RN-11) | HU-06 | CU-09 | RF-10 | RN-11 | MK-07 | Solicitud (R), HistorialSolicitud (R), AsignacionSolicitud (R), Notificacion (C) |
| PRG-11 | VIEW vw_bandeja_solicitudes_completa / VIEW vw_perfil_organizacional / PROCEDURE sp_reporte_tiempos_y_resumen | Reporte.generar(): string (Vista 4) + Consultas CU-07, CU-12, CU-14 | HU-09, HU-14, HU-16 a HU-17, HU-20 a HU-22, HU-33 a HU-34, HU-37 a HU-40| CU-07, CU-12, CU-14 | RF-14, RF-19, RF-21, RF-25, RF-27, RF-28, RF-52 a RF-62 | RN-23 a RN-25, RN-27, RN-29, RN-30 | RNF-01 | MK-02, MK-04, MK-10, MK-12 | Solicitud, Usuario, Area, Cargo, Rol, TipoSolicitud, EstadoSolicitud, AsignacionSolicitud, Reporte, TipoReporte |

---

## Estado y Registro del Script SQL Físico

* **Situación Actual:** El archivo físico .sql fue retirado en commits anteriores del repositorio. Queda formalmente registrado como **pendiente de entrega oficial** por parte del compañero responsable de base de datos.
* **Respaldo Documental:** La especificación completa de las 30 tablas físicas se encuentra en el [3.1 Diccionario de Datos](../fase-3-diseno/3.1-diccionario-de-datos.md) y las rutinas programables se respaldan en el documento adjunto [13-Entrega_MySQL_Programacion_...docx](13-Entrega_MySQL_Programacion_Jhulius_Escobar_Javier_Bernal.docx).


---

# 4.2 Repositorio Git y Control de Versiones

**Proyecto:** Sistema de Gestión de Solicitudes de Talento Humano — Nexa Servicios  
**Fase:** Fase 4 — Construcción (Semana 14)  
**Artefactos del Cronograma:** 14. Repositorio Git y archivo .gitignore  

---

## Control de Versiones y Repositorio Oficial

* **Repositorio Remoto:** https://github.com/adelio2/Talento-humano-
* **Rama Principal:** main
* **Línea Base y Checkpoints:** Se establecen etiquetas semánticas (checkpoint-fase-X-completada) para garantizar la trazabilidad inmutable de cada entrega del cronograma.

---

## Política de .gitignore

El archivo .gitignore ubicado en la raíz del proyecto asegura:
1. **Exclusión de temporales de Office:** Previene la subida accidental de archivos de bloqueo ~$*.docx generados al editar los documentos Word.
2. **Exclusión de archivos del SO:** Ignora archivos de sistema como Thumbs.db, .DS_Store y Desktop.ini.
3. **Protección de Secretos y Variables de Entorno:** Excluye .env, certificados y llaves privadas, permitiendo explícitamente el versionamiento de .env.example.

---

## Compuerta de Calidad M2 (Semana 14)

Conforme a lo establecido en el cronograma institucional:
> **Regla de la Compuerta M2:** *No se integrará código fuente ni componentes MVC en el repositorio sin que la Matriz Integral de Trazabilidad esté debidamente cerrada, auditada y revisada por el equipo.*


---

# 4.3 Arquitectura y Primer Vertical Slice MVC

**Proyecto:** Sistema de Gestión de Solicitudes de Talento Humano — Nexa Servicios  
**Fase:** Fase 4 — Construcción (Semana 15)  
**Artefactos del Cronograma:** 15. Primer vertical slice de código MVC  

---

## Definición del Vertical Slice

El primer vertical slice implementará el flujo completo y trazable de un trámite de punta a punta, abarcando desde la capa de presentación hasta la persistencia relacional:

1. **Flujo Prioritario Seleccionado:** Radicación y consulta de Permiso Laboral (HU-03, CU-03, RF-03).
2. **Capa Vista (V):** Interfaz basada en el diseño de pantalla MK-03 (Registro de Solicitud).
3. **Capa Controlador (C):** Control de flujo, validación de sesiones, permisos de rol (ACT-01) y validación de reglas de negocio (RN-01, RN-23).
4. **Capa Modelo / Lógica de Negocio (M):** Entidad Solicitud y subtipo PermisoLaboral con cálculo derivado de días.
5. **Capa Persistencia:** Inserción transaccional atómica en las tablas Solicitud, PermisoLaboral, AsignacionSolicitud e HistorialSolicitud.
