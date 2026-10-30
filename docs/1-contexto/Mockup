# 16. Mockups (MK)

Este capítulo representa las vistas de interacción del sistema a partir de las HU, CU, RF, RN y el diccionario de datos del proyecto. Cada figura incorpora llamadas de trazabilidad; su ficha declara cobertura, campos/tipos existentes, acciones y reglas visibles. Las brechas del modelo se señalan para revisión en vez de completar el esquema por suposición.

## 16.1 MK-01 — Acceso y recuperación

 

*Figura 2. MK-01: Acceso y recuperación; vista de referencia con trazabilidad anotada.*

| Campo | Contenido |
|---|---|
| Código | MK-01 |
| Pantalla | Acceso y recuperación |
| Atiende (HU / CU) | HU-01, HU-02, HU-41 / CU-01, CU-02 |
| Campos ↔ Diccionario | Usuario.correo VARCHAR(150); contraseña VARCHAR(255; enmascarada); activo BOOLEAN. RecuperacionContraseña.token VARCHAR(255) y fecha_expiracion DATETIME se validan internamente. |
| Botones ↔ Eventos | Iniciar sesión; Recuperar acceso; Restablecer — eventos relacionados con CU-01, CU-02. RF específicos y transiciones se detallan en la matriz final. |
| RN visibles | RN-20: mecanismo temporal; rechazar vencido o inválido. RNF-03/05: protección de acceso y compatibilidad. |

## 16.2 MK-02 — Bandeja y búsqueda de solicitudes

 

*Figura 3. MK-02: Bandeja y búsqueda de solicitudes; vista de referencia con trazabilidad anotada.*

| Campo | Contenido |
|---|---|
| Código | MK-02 |
| Pantalla | Bandeja y búsqueda de solicitudes |
| Atiende (HU / CU) | HU-13, HU-20 / CU-07 |
| Campos ↔ Diccionario | Solicitud.radicado VARCHAR(20), id_tipo_solicitud/id_estado INT FK, fecha_registro DATETIME y fechas DATE. TipoSolicitud.nombre VARCHAR(50); EstadoSolicitud.nombre VARCHAR(30). |
| Botones ↔ Eventos | Buscar; Abrir solicitud — eventos relacionados con CU-07. RF específicos y transiciones se detallan en la matriz final. |
| RN visibles | RN-23: radicado; RN-24: consulta personal solo propia; RN-27: autorización; RN-30: período coherente. RNF-01/04/05. |

## 16.3 MK-03 — Registro y edición de solicitud

 

*Figura 4. MK-03: Registro y edición de solicitud; vista de referencia con trazabilidad anotada.*

| Campo | Contenido |
|---|---|
| Código | MK-03 |
| Pantalla | Registro y edición de solicitud |
| Atiende (HU / CU) | HU-03, HU-04, HU-05, HU-06, HU-14, HU-16, HU-33 / CU-03, CU-05, CU-08 |
| Campos ↔ Diccionario | Solicitud.id_usuario/id_tipo_solicitud INT FK, fecha_inicio/fecha_fin DATE, motivo TEXT, radicado VARCHAR(20) generado. Permiso.id_tipo_permiso INT FK; Vacacion.dias_solicitados INT; Incapacidad.id_tipo_incapacidad INT FK/observacion TEXT; Documento.nombre_archivo VARCHAR(150), tipo_archivo VARCHAR(50), fecha_carga DATETIME. |
| Botones ↔ Eventos | Guardar solicitud; Adjuntar soporte; Guardar cambios — eventos relacionados con CU-03, CU-05, CU-08. RF específicos y transiciones se detallan en la matriz final. |
| RN visibles | RN-01/02/13/15/17/18/19/23: obligatoriedad, soporte clínico, fechas, edición por estado, asociación/validación de archivo, carga y radicado. RNF-03/04/05/06. |

## 16.4 MK-04 — Detalle, historial y documentos

 

*Figura 5. MK-04: Detalle, historial y documentos; vista de referencia con trazabilidad anotada.*

| Campo | Contenido |
|---|---|
| Código | MK-04 |
| Pantalla | Detalle, historial y documentos |
| Atiende (HU / CU) | HU-15, HU-21, HU-22, HU-26, HU-31, HU-32, HU-34, HU-35, HU-36 / CU-07, CU-08, CU-13 |
| Campos ↔ Diccionario | Solicitud.radicado VARCHAR(20), id_estado INT FK, fechas DATE, motivo TEXT; HistorialSolicitud.fecha_accion DATETIME, comentario TEXT y estados anterior/nuevo; Documento.nombre_archivo VARCHAR(150), tipo_archivo VARCHAR(50), fecha_carga DATETIME. |
| Botones ↔ Eventos | Ver historial; Agregar soporte; Cancelar solicitud — eventos relacionados con CU-07, CU-08, CU-13. RF específicos y transiciones se detallan en la matriz final. |
| RN visibles | RN-04/07/15/17/19/23/24/26/28: cancelación permitida, historial, documentos asociados, consulta personal y responsable vigente. RNF-01/03/04/05/06. |

## 16.5 MK-05 — Bandeja de revisión y decisión

 

*Figura 6. MK-05: Bandeja de revisión y decisión; vista de referencia con trazabilidad anotada.*

| Campo | Contenido |
|---|---|
| Código | MK-05 |
| Pantalla | Bandeja de revisión y decisión |
| Atiende (HU / CU) | HU-07, HU-08, HU-11, HU-19 / CU-05 |
| Campos ↔ Diccionario | Solicitud.id_estado INT FK; decisión y nota en HistorialSolicitud.fecha_accion DATETIME/comentario TEXT; saldo consultado en dias_disponibles DECIMAL(5,2). |
| Botones ↔ Eventos | Aprobar; Rechazar; Pasar a En revisión — eventos relacionados con CU-05. RF específicos y transiciones se detallan en la matriz final. |
| RN visibles | RN-03/05/06/07/12/16: estado válido, autorización, motivo de rechazo, saldo y nota para En revisión. RNF-01/03/04/05. |

## 16.6 MK-06 — Asignaciones y responsables

 

*Figura 7. MK-06: Asignaciones y responsables; vista de referencia con trazabilidad anotada.*

| Campo | Contenido |
|---|---|
| Código | MK-06 |
| Pantalla | Asignaciones y responsables |
| Atiende (HU / CU) | HU-09, HU-23, HU-27, HU-28, HU-29, HU-30 / CU-04, CU-06 |
| Campos ↔ Diccionario | AsignacionSolicitud.id_solicitud/id_usuario_responsable INT FK; fecha_asignacion/fecha_fin DATETIME; motivo TEXT; activa BOOLEAN. |
| Botones ↔ Eventos | Consultar; Reasignar responsable; Finalizar asignación — eventos relacionados con CU-04, CU-06. RF específicos y transiciones se detallan en la matriz final. |
| RN visibles | RN-08/09/10/26: responsable autorizado, motivo de reasignación y asignación vigente diferenciada de finalizada. RNF-03/04/05/06. |

## 16.7 MK-07 — Notificaciones y alertas

 

*Figura 8. MK-07: Notificaciones y alertas; vista de referencia con trazabilidad anotada.*

| Campo | Contenido |
|---|---|
| Código | MK-07 |
| Pantalla | Notificaciones y alertas |
| Atiende (HU / CU) | HU-10, HU-17, HU-39, HU-40 / CU-09 |
| Campos ↔ Diccionario | Notificacion.id_usuario INT FK, id_solicitud INT FK opcional, asunto VARCHAR(150), mensaje TEXT, fecha_envio DATETIME y leida BOOLEAN. |
| Botones ↔ Eventos | Abrir solicitud; Marcar como leída; Ver alertas — eventos relacionados con CU-09. RF específicos y transiciones se detallan en la matriz final. |
| RN visibles | RN-11/21/22: alerta después de tres días sin movimiento, destinatario correcto y lectura individual. RNF-03/04/05. |

## 16.8 MK-08 — Certificado laboral

 

*Figura 9. MK-08: Certificado laboral; vista de referencia con trazabilidad anotada.*

| Campo | Contenido |
|---|---|
| Código | MK-08 |
| Pantalla | Certificado laboral |
| Atiende (HU / CU) | HU-12, HU-37, HU-38 / CU-10 |
| Campos ↔ Diccionario | CertificadoLaboral.id_solicitud/id_estado_certificado INT FK; fecha_generacion DATETIME; ruta_archivo VARCHAR(300). EstadoCertificado.nombre VARCHAR(30). |
| Botones ↔ Eventos | Consultar estado; Generar certificado; Descargar — eventos relacionados con CU-10. RF específicos y transiciones se detallan en la matriz final. |
| RN visibles | RN-14/15: certificado solo desde solicitud aprobada; estado y archivo corresponden a la solicitud. RNF-03/04/05/06. |

## 16.9 MK-09 — Saldo y días de vacaciones

 

*Figura 10. MK-09: Saldo y días de vacaciones; vista de referencia con trazabilidad anotada.*

| Campo | Contenido |
|---|---|
| Código | MK-09 |
| Pantalla | Saldo y días de vacaciones |
| Atiende (HU / CU) | HU-48, HU-49 / CU-11 |
| Campos ↔ Diccionario | SaldoVacaciones.dias_generados/dias_utilizados/dias_disponibles DECIMAL(5,2); fecha_actualizacion DATETIME. El diccionario actual no define Período. |
| Botones ↔ Eventos | Consultar saldo; Ver días disponibles — eventos relacionados con CU-11. RF específicos y transiciones se detallan en la matriz final. |
| RN visibles | RN-12/30: saldo del período y rango temporal coherente. Observación del diccionario pendiente. RNF-01/03/04/05. |

## 16.10 MK-10 — Perfil organizacional y catálogos

 

*Figura 11. MK-10: Perfil organizacional y catálogos; vista de referencia con trazabilidad anotada.*

| Campo | Contenido |
|---|---|
| Código | MK-10 |
| Pantalla | Perfil organizacional y catálogos |
| Atiende (HU / CU) | HU-25, HU-42, HU-43 / CU-12 |
| Campos ↔ Diccionario | Usuario.nombre/apellido VARCHAR(100), id_area/id_cargo/id_rol INT FK; Área/Cargo.nombre VARCHAR(100); Rol.nombre VARCHAR(50); TipoSolicitud.nombre VARCHAR(50); EstadoSolicitud.nombre VARCHAR(30). |
| Botones ↔ Eventos | Consultar perfil; Tipos de solicitud; Estados válidos — eventos relacionados con CU-12. RF específicos y transiciones se detallan en la matriz final. |
| RN visibles | RN-03/25/27: estado válido, perfil del empleado consultado y acceso autorizado. RNF-03/04/05. |

## 16.11 MK-11 — Historial y auditoría

 

*Figura 12. MK-11: Historial y auditoría; vista de referencia con trazabilidad anotada.*

| Campo | Contenido |
|---|---|
| Código | MK-11 |
| Pantalla | Historial y auditoría |
| Atiende (HU / CU) | HU-44, HU-45, HU-46, HU-47, HU-58, HU-59 / CU-13 |
| Campos ↔ Diccionario | HistorialSolicitud.fecha_accion DATETIME, comentario TEXT, id_usuario/id_solicitud INT FK y estados anterior/nuevo. HU-45–47/58–59 requieren datos de acceso/auditoría sin entidad descrita en el diccionario actual. |
| Botones ↔ Eventos | Buscar registros; Ver detalle del cambio — eventos relacionados con CU-13. RF específicos y transiciones se detallan en la matriz final. |
| RN visibles | RN-07/27/28: solo lectura, autorización y valores anterior/nuevo cuando existan. RNF-03/05. Falta modelar accesos/auditoría general en el diccionario. |

## 16.12 MK-12 — Reportes y exportación

 

*Figura 13. MK-12: Reportes y exportación; vista de referencia con trazabilidad anotada.*

| Campo | Contenido |
|---|---|
| Código | MK-12 |
| Pantalla | Reportes y exportación |
| Atiende (HU / CU) | HU-18, HU-24, HU-50, HU-51, HU-52, HU-53, HU-54, HU-55, HU-56, HU-57, HU-60 / CU-14 |
| Campos ↔ Diccionario | Reporte.id_tipo_reporte/id_usuario INT FK, fecha_generacion DATETIME, nombre_archivo VARCHAR(150), ruta_archivo VARCHAR(300). Los filtros de consulta no están definidos como campos persistidos. |
| Botones ↔ Eventos | Generar reporte; Consultar generados; Exportar resultado — eventos relacionados con CU-14. RF específicos y transiciones se detallan en la matriz final. |
| RN visibles | RN-27/29/30: consulta/exportación autorizada, filtros respetados y período coherente. RNF-01/03/04/05. |

## 16.13 Cobertura de operaciones y pantallas

La plantilla comprueba que las operaciones se representen en la interfaz. El material de Nexa no aporta un diagrama de clases ni nombres de métodos de implementación; por eso se verifica la operación funcional y su pantalla sin inventar firmas.

| Operación | Cobertura funcional | RF / RN | Mockups |
|---|---|---|---|
| C — Crear | Solicitudes y soportes; asignación asociada; certificado laboral | RF-03–RF-06, RF-09, RF-12, RF-15, RF-33 | MK-03, MK-04, MK-06, MK-08 |
| R — Consultar | Solicitudes, detalles, historial, asignaciones, notificaciones, perfiles, saldos, auditoría y reportes | RF-13/14, RF-16, RF-21, RF-27–RF-54, RF-60–RF-62 | MK-01–MK-12 según la vista |
| U — Actualizar | Editar mientras procede, cambiar estado/decisión, reasignar, lectura de notificación, recuperación y cierre de asignación | RF-02, RF-07/08, RF-17/20, RF-24, RF-31, RF-42/43 | MK-01, MK-03–MK-07 |
| D — Lógica | No se elimina físicamente la solicitud: cancelar cambia su estado si está permitido y conserva el historial. | RF-23; RN-04/07 | MK-04 |
| Generar / exportar | Generar certificado o reporte; exportar el resultado consultado en formato habilitado. | RF-12, RF-19, RF-25, RF-52–RF-56 | MK-08, MK-12 |

## 16.14 Matriz de trazabilidad de HU a mockups

La matriz relaciona las cuatro CA de cada historia con sus RF, RN/RNF, CU y flujo del capítulo 15, y con el control/pantalla correspondiente. HU-05 aparece en dos mockups porque registrar la solicitud y generar o consultar el certificado son etapas distintas.

| HU | CA | RF | RN / RNF | CU (pasos / flujos) | Control → pantalla |
|---|---|---|---|---|---|
| HU-01 | CA-1, CA-2, CA-3, CA-4 | RF-01 | RN: — <br> RNF: RNF-03 | CU-01: CA-1 y CA-4 → FB-02–FB-03; CA-2 → FA-01; CA-3 → FA-02 | Credenciales → MK-01 |
| HU-02 | CA-1, CA-2, CA-3, CA-4 | RF-02 | RN: RN-20 <br> RNF: RNF-03, RNF-05 | CU-02: CA-1 y CA-3 → FB-01–FB-02; CA-2 → FA-01; CA-4 → FA-02 | Recuperación → MK-01 |
| HU-03 | CA-1, CA-2, CA-3, CA-4 | RF-03 | RN: RN-01, RN-23 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-03: CA-1–CA-2 → FB-02; CA-3 → FA-01; CA-4 → FB-04 | Registro → MK-03 |
| HU-04 | CA-1, CA-2, CA-3, CA-4 | RF-04 | RN: RN-01, RN-13, RN-23 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-03: CA-1–CA-3 → FB-02; CA-4 → FA-02 | Fechas/duración → MK-03 |
| HU-05 | CA-1, CA-2, CA-3, CA-4 | RF-05 | RN: RN-01, RN-23 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-03: CA-1–CA-2 → FB-02 y FB-04; CA-3–CA-4 → CU-10 <br> CU-10: CA-3–CA-4 → FB-01 y FA-01; CA-1–CA-2 → CU-03 | Solicitud / emisión → MK-03 / MK-08 |
| HU-06 | CA-1, CA-2, CA-3, CA-4 | RF-06 | RN: RN-01, RN-02, RN-23 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-03: CA-1–CA-2 → FB-02–FB-04; CA-3–CA-4 → FA-03 | Soporte clínico → MK-03 |
| HU-07 | CA-1, CA-2, CA-3, CA-4 | RF-07 | RN: RN-03, RN-05, RN-07 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-05: CA-1–CA-2, CA-4 → FB-01 y FB-03; CA-3 → FA-01 | Aprobar → MK-05 |
| HU-08 | CA-1, CA-2, CA-3, CA-4 | RF-08 | RN: RN-03, RN-06, RN-07 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-05: CA-1, CA-3–CA-4 → FB-03; CA-2 → FA-02 | Motivo rechazo → MK-05 |
| HU-09 | CA-1, CA-2, CA-3, CA-4 | RF-09 | RN: RN-08 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-04: CA-1–CA-3 → FB-01–FB-03; CA-4 → FA-01 | Asignación inicial → MK-06 |
| HU-10 | CA-1, CA-2, CA-3, CA-4 | RF-10 | RN: RN-11 <br> RNF: RNF-02, RNF-03, RNF-04 | CU-09: CA-1, CA-3–CA-4 → FB-01; CA-2 → FA-01 | Alertas → MK-07 |
| HU-11 | CA-1, CA-2, CA-3, CA-4 | RF-11 | RN: RN-05, RN-12 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-05: CA-1–CA-2, CA-4 → FB-02; CA-3 → FA-03 | Saldo previo → MK-05 |
| HU-12 | CA-1, CA-2, CA-3, CA-4 | RF-12 | RN: RN-15 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-10: CA-1, CA-3–CA-4 → FB-01–FB-02; CA-2 → FA-01 | Generar → MK-08 |
| HU-13 | CA-1, CA-2, CA-3, CA-4 | RF-13, RF-14 | RN: RN-23 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07: CA-1, CA-3–CA-4 → FB-01 y FB-03; CA-2 → FA-01 | Buscar radicado → MK-02 |
| HU-14 | CA-1, CA-2, CA-3, CA-4 | RF-15 | RN: RN-17, RN-18, RN-19 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-08: CA-1, CA-3–CA-4 → FB-01–FB-02; CA-2 → FA-01 | Adjuntar → MK-03 |
| HU-15 | CA-1, CA-2, CA-3, CA-4 | RF-16, RF-26 | RN: RN-07, RN-28 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-13: CA-1–CA-4 → FB-01–FB-03 | Historial → MK-04 |
| HU-16 | CA-1, CA-2, CA-3, CA-4 | RF-17 | RN: RN-07, RN-15 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-05: CA-1, CA-4 → FB-01 y FB-03; CA-2–CA-3 → FA-01 | Editar → MK-03 |
| HU-17 | CA-1, CA-2, CA-3, CA-4 | RF-18 | RN: RN-21 <br> RNF: RNF-02, RNF-03, RNF-04 | CU-09: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-02 | Notificación → MK-07 |
| HU-18 | CA-1, CA-2, CA-3, CA-4 | RF-19 | RN: RN-29, RN-30 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Tiempos → MK-12 |
| HU-19 | CA-1, CA-2, CA-3, CA-4 | RF-20 | RN: RN-03, RN-07, RN-16 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-05: CA-1, CA-3–CA-4 → FB-03; CA-2 → FA-02 | Nota de revisión → MK-05 |
| HU-20 | CA-1, CA-2, CA-3, CA-4 | RF-21 | RN: RN-03, RN-24, RN-27 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07: CA-1–CA-3 → FB-01; CA-4 → FA-01 | Filtros → MK-02 |
| HU-21 | CA-1, CA-2, CA-3, CA-4 | RF-21 | RN: RN-03, RN-24, RN-27 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07: CA-1–CA-3 → FB-01–FB-03; CA-4 → FA-01 | Historial personal → MK-04 |
| HU-22 | CA-1, CA-2, CA-3, CA-4 | RF-23 | RN: RN-03, RN-04, RN-07 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-05: CA-1, CA-4 → FB-03; CA-2–CA-3 → FA-01 | Cancelar → MK-04 |
| HU-23 | CA-1, CA-2, CA-3, CA-4 | RF-24 | RN: RN-07, RN-09, RN-10 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-06: CA-1 y CA-4 → FB-03; CA-2–CA-3 → FA-01 | Reasignar → MK-06 |
| HU-24 | CA-1, CA-2, CA-3, CA-4 | RF-25 | RN: RN-29, RN-30 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Resumen → MK-12 |
| HU-25 | CA-1, CA-2, CA-3, CA-4 | RF-27 | RN: RN-25, RN-27 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05 | CU-12: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Perfil → MK-10 |
| HU-26 | CA-1, CA-2, CA-3, CA-4 | RF-28 | RN: RN-23, RN-27 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Detalle → MK-04 |
| HU-27 | CA-1, CA-2, CA-3, CA-4 | RF-29 | RN: RN-26 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-06: CA-1–CA-3 → FB-01; CA-4 → FA-02 | Responsable vigente → MK-06 |
| HU-28 | CA-1, CA-2, CA-3, CA-4 | RF-30 | RN: RN-26 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-06: CA-1–CA-3 → FB-02; CA-4 → FA-02 | Historial asignación → MK-06 |
| HU-29 | CA-1, CA-2, CA-3, CA-4 | RF-31 | RN: RN-26 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-06: CA-1–CA-3 → FB-03; CA-4 → FA-03 | Finalizar → MK-06 |
| HU-30 | CA-1, CA-2, CA-3, CA-4 | RF-32 | RN: RN-10 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-06: CA-1–CA-2, CA-4 → FB-02; CA-3 → FA-04 | Motivo → MK-06 |
| HU-31 | CA-1, CA-2, CA-3, CA-4 | RF-33 | RN: RN-17, RN-18, RN-19 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-08: CA-1, CA-4 → FB-01–FB-02; CA-2–CA-3 → FA-01 | Soporte adicional → MK-04 |
| HU-32 | CA-1, CA-2, CA-3, CA-4 | RF-34 | RN: RN-17, RN-19 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-08: CA-1–CA-2, CA-4 → FB-03; CA-3 → FA-02 | Documentos → MK-04 |
| HU-33 | CA-1, CA-2, CA-3, CA-4 | RF-35 | RN: RN-18 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-08: CA-1, CA-4 → FB-01; CA-2–CA-3 → FA-01 | Validar archivo → MK-03 |
| HU-34 | CA-1, CA-2, CA-3, CA-4 | RF-36 | RN: — <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07: CA-1–CA-4 → FB-02 | Detalle permiso → MK-04 |
| HU-35 | CA-1, CA-2, CA-3, CA-4 | RF-37 | RN: RN-12, RN-13 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07: CA-1–CA-4 → FB-02 | Detalle vacaciones → MK-04 |
| HU-36 | CA-1, CA-2, CA-3, CA-4 | RF-38 | RN: RN-17 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07: CA-1–CA-4 → FB-02 | Detalle incapacidad → MK-04 |
| HU-37 | CA-1, CA-2, CA-3, CA-4 | RF-39 | RN: RN-15 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-10: CA-1–CA-3 → FB-03; CA-4 → FA-02 | Certificado → MK-08 |
| HU-38 | CA-1, CA-2, CA-3, CA-4 | RF-40 | RN: RN-15 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-10: CA-1–CA-4 → FB-03 y FA-02 | Estado certificado → MK-08 |
| HU-39 | CA-1, CA-2, CA-3, CA-4 | RF-41 | RN: RN-21 <br> RNF: RNF-02, RNF-03, RNF-04 | CU-09: CA-1–CA-3 → FB-03; CA-4 → FA-03 | Bandeja → MK-07 |
| HU-40 | CA-1, CA-2, CA-3, CA-4 | RF-42 | RN: RN-22 <br> RNF: RNF-02, RNF-03, RNF-04 | CU-09: CA-1–CA-3 → FB-03; CA-4 → FA-03 | Marcar leída → MK-07 |
| HU-41 | CA-1, CA-2, CA-3, CA-4 | RF-43 | RN: RN-20 <br> RNF: RNF-03, RNF-05 | CU-02: CA-1–CA-4 → FB-03 y FA-02 | Enlace nuevo → MK-01 |
| HU-42 | CA-1, CA-2, CA-3, CA-4 | RF-44 | RN: — <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05 | CU-12: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-02 | Tipos → MK-10 |
| HU-43 | CA-1, CA-2, CA-3, CA-4 | RF-45 | RN: RN-03 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05 | CU-12: CA-1–CA-2 → FB-01–FB-02; CA-3–CA-4 → FA-02 | Estados → MK-10 |
| HU-44 | CA-1, CA-2, CA-3, CA-4 | RF-46 | RN: RN-07 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-13: CA-1–CA-3 → FB-01; CA-4 → FB-03 | Acciones historial → MK-11 |
| HU-45 | CA-1, CA-2, CA-3, CA-4 | RF-47 | RN: RN-27 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-13: CA-1–CA-3 → FB-01; CA-4 → FA-02 | Registros acceso → MK-11 |
| HU-46 | CA-1, CA-2, CA-3, CA-4 | RF-48 | RN: RN-27, RN-28 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-13: CA-1–CA-3 → FB-01–FB-03; CA-4 → FA-01 | Auditoría → MK-11 |
| HU-47 | CA-1, CA-2, CA-3, CA-4 | RF-49 | RN: RN-27, RN-28 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-13: CA-1–CA-3 → FB-02; CA-4 → FA-03 | Detalle cambio → MK-11 |
| HU-48 | CA-1, CA-2, CA-3, CA-4 | RF-50 | RN: RN-12, RN-30 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-11: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Saldo período → MK-09 |
| HU-49 | CA-1, CA-2, CA-3, CA-4 | RF-51 | RN: RN-12 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-11: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Días disponibles → MK-09 |
| HU-50 | CA-1, CA-2, CA-3, CA-4 | RF-52 | RN: RN-27, RN-30 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-3 → FB-03; CA-4 → FA-02 | Reportes guardados → MK-12 |
| HU-51 | CA-1, CA-2, CA-3, CA-4 | RF-53 | RN: RN-27, RN-29 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Reporte por tipo → MK-12 |
| HU-52 | CA-1, CA-2, CA-3, CA-4 | RF-54 | RN: RN-27, RN-29, RN-30 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Reporte responsable → MK-12 |
| HU-53 | CA-1, CA-2, CA-3, CA-4 | RF-55 | RN: RN-27 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-3 → FB-03; CA-4 → FA-03 | Exportar → MK-12 |
| HU-54 | CA-1, CA-2, CA-3, CA-4 | RF-56 | RN: RN-27, RN-29, RN-30 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-4 → FB-01–FB-02 | Consolidado → MK-12 |
| HU-55 | CA-1, CA-2, CA-3, CA-4 | RF-57 | RN: RN-27, RN-29 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-4 → FB-01 | Área → MK-12 |
| HU-56 | CA-1, CA-2, CA-3, CA-4 | RF-58 | RN: RN-27, RN-29 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-4 → FB-01 | Cargo → MK-12 |
| HU-57 | CA-1, CA-2, CA-3, CA-4 | RF-59 | RN: RN-27, RN-29 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-2, CA-4 → FB-01; CA-3 → FA-01 | Rol → MK-12 |
| HU-58 | CA-1, CA-2, CA-3, CA-4 | RF-60 | RN: RN-27, RN-30 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-13: CA-1–CA-3 → FB-01; CA-4 → FA-02 | Historial accesos → MK-11 |
| HU-59 | CA-1, CA-2, CA-3, CA-4 | RF-61 | RN: RN-27 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-13: CA-1–CA-4 → FB-01; restricciones → FA-02 | Auditoría usuario → MK-11 |
| HU-60 | CA-1, CA-2, CA-3, CA-4 | RF-62 | RN: RN-03, RN-30 <br> RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Período + estado → MK-12 |

