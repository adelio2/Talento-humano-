# Diccionario de Datos

**Sistema de Gestión de Solicitudes de Talento Humano**  
Proyecto de Ingeniería de Software · Nexa Servicios  
Javier Bernal Garavito · Jhulius Karol Escobar Gomez  
Facultad de Ingeniería, Universidad Remington · Ingeniería de Sistemas  
Profesora: Gloria Amparo Lora Patiño  
Versión armonizada con los requisitos, reglas de negocio y diagramas del proyecto  
27 de octubre de 2026

## 17. Diccionario de Datos

Este diccionario describe las entidades, campos, tipos, tamaños, restricciones y relaciones del Sistema de Gestión de Solicitudes de Talento Humano de Nexa Servicios. Se armonizó con las historias de usuario, requisitos funcionales y no funcionales, reglas de negocio, casos de uso y diagramas de clases de la entrega del proyecto.

### Convenciones

- **PK:** llave primaria. **FK:** llave foránea. **UQ:** valor o combinación única. **NN:** no nulo. **NULL:** valor opcional.
- Las referencias indicadas como `FK -> Tabla.campo` identifican la tabla y el campo referenciados.
- N/A indica que el tamaño no aplica al tipo de dato.

### Criterios de integridad y coherencia

- **Especialización de Solicitud:** PermisoLaboral, Vacacion e Incapacidad son subtipos excluyentes. En cada tabla hija `id_solicitud` es único; además, la aplicación o una restricción de base de datos debe validar que `id_tipo_solicitud` corresponda al único subtipo creado.
- **Fechas de los trámites:** en PermisoLaboral, Vacacion e Incapacidad, `fecha_fin` debe ser igual o posterior a `fecha_inicio`.
- **Duraciones derivadas:** `dias_solicitados` y `dias_incapacidad` no se almacenan; se calculan a partir de `fecha_inicio` y `fecha_fin`. La regla del proyecto debe definir si el cálculo cuenta días calendario o hábiles.
- **Saldo de vacaciones:** la clave compuesta (`id_usuario`, `periodo`) evita saldos duplicados por empleado y período. `dias_disponibles` se calcula como `dias_generados` menos `dias_utilizados` y no se almacena.
- **Auditoría:** AuditoriaSistema registra la operación y DetalleAuditoria conserva los campos y valores modificados, en relación de uno a varios.
- **Motivo de vacaciones:** Vacacion incluye motivo porque HU-04 solicita conservar la razón indicada por el empleado.
- **Reportes:** Reporte conserva los metadatos del archivo generado. Los filtros de consulta son transitorios y no se almacenan en esta entidad.


## 17.1 Entidad Rol


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_rol | INT | Identificador único del rol en el sistema. | PK, NN |
| nombre | VARCHAR (50) | Nombre utilizado para identificar el rol. | UQ, NN |
| descripcion | VARCHAR (200) | Descripción de las funciones asociadas al rol. | N/A |

---


## 17.2 Entidad Área

Nombre fisico normalizado: Área.


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_area | INT | Identificador único del área registrada. | PK, NN |
| nombre | VARCHAR (100) | Nombre del área en Nexa Servicios. | UQ, NN |
| descripcion | VARCHAR (200) | Información sobre las funciones del área. | N/A |

---


## 17.3 Entidad Cargo


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_cargo | INT | Identificador único del cargo. | PK, NN |
| nombre | VARCHAR (100) | Nombre que identifica el cargo. | UQ, NN |
| descripcion | VARCHAR (200) | Funciones o características del cargo. | N/A |

---


## 17.4 Entidad Usuario


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_usuario | INT | Identificador único del usuario. | PK, NN |
| nombre | VARCHAR (100) | Nombre del usuario. | NN |
| apellido | VARCHAR (100) | Apellido del usuario. | NN |
| documento | VARCHAR (20) | Número de identificación del usuario. | UQ, NN |
| correo | VARCHAR (150) | Correo institucional del usuario. | UQ, NN |
| contrasena_hash | VARCHAR (255) | Hash de la contraseña usada para autenticación; no almacenar texto plano. | NN |
| id_cargo | INT | Cargo asociado al usuario. | FK, NN -> Cargo.id_cargo |
| id_area | INT | Área a la que pertenece el usuario. | FK, NN -> Area.id_area |
| id_rol | INT | Rol asignado al usuario. | FK, NN -> Rol.id_rol |
| activo | BOOLEAN | Indica si la cuenta esta habilitada. | NN |
| intentos_fallidos | INT | Cantidad de intentos de acceso incorrectos. | NN |
| bloqueado_hasta | DATETIME | Fecha y hora límite del bloqueo; NULL si la cuenta no esta bloqueada. | NULL |

---


## 17.5 Entidad TipoSolicitud


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_tipo_solicitud | INT | Identificador único del tipo de solicitud. | PK, NN |
| nombre | VARCHAR (50) | Nombre utilizado para identificar el tipo. | UQ, NN |
| descripcion | VARCHAR (200) | Características y finalidad de la solicitud. | N/A |

---


## 17.6 Entidad EstadoSolicitud


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_estado | INT | Identificador único del estado general. | PK, NN |
| nombre | VARCHAR (30) | Nombre que identifica el estado. | UQ, NN |
| descripcion | VARCHAR (150) | Explicacion del significado del estado. | N/A |

---


## 17.7 Entidad Solicitud

Las fechas del tramite y los datos propios del motivo se almacenan en la tabla del subtipo correspondiente. Solicitud es la entidad base.


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_solicitud | INT | Identificador único de cada solicitud registrada. | PK, NN |
| radicado | VARCHAR (20) | Número único de radicado asignado a la solicitud. | UQ, NN |
| id_usuario | INT | Usuario que registra la solicitud. | FK, NN -> Usuario.id_usuario |
| id_tipo_solicitud | INT | Tipo general que identifica el subtipo aplicable. | FK, NN -> TipoSolicitud.id_tipo_solicitud |
| id_estado | INT | Estado general actual de la solicitud. | FK, NN -> EstadoSolicitud.id_estado |
| fecha_registro | DATETIME | Fecha y hora en que se registra la solicitud. | NN |

---


## 17.8 Entidad TipoAccion


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_tipo_accion | INT | Identificador único del tipo de acción. | PK, NN |
| nombre | VARCHAR (50) | Nombre de la acción realizada. | UQ, NN |
| descripcion | VARCHAR (150) | Explicacion de la acción. | N/A |

---


## 17.9 Entidad HistorialSolicitud


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_historial | INT | Identificador del registro historico. | PK, NN |
| id_solicitud | INT | Solicitud relacionada. | FK, NN -> Solicitud.id_solicitud |
| id_usuario | INT | Usuario que realizo la acción. | FK, NN -> Usuario.id_usuario |
| id_tipo_accion | INT | Tipo de acción realizada. | FK, NN -> TipoAccion.id_tipo_accion |
| id_estado_anterior | INT | Estado previo al cambio; puede ser NULL si aun no existia. NULL permitido | FK -> EstadoSolicitud.id_estado; |
| id_estado_nuevo | INT | Estado resultante; puede ser NULL si la acción no cambia el estado. NULL permitido | FK -> EstadoSolicitud.id_estado; |
| fecha_accion | DATETIME | Fecha y hora de la acción. | NN |
| comentario | TEXT | Información adicional, motivo o nota de la acción. | NULL |

---


## 17.10 Entidad AsignacionSolicitud


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_asignacion | INT | Identificador único de la asignación. | PK, NN |
| id_solicitud | INT | Solicitud asignada. | FK, NN -> Solicitud.id_solicitud |
| id_usuario_responsable | INT | Usuario encargado de gestionar la solicitud. | FK, NN -> Usuario.id_usuario |
| fecha_asignacion | DATETIME | Fecha y hora de la asignación. | NN |
| fecha_fin | DATETIME | Fecha y hora en que termina la responsabilidad. | NULL |
| motivo | TEXT | Explicacion de la asignación o reasignación. | NULL |
| activa | BOOLEAN | Indica si la asignación sigue vigente. | NN |

---


## 17.11 Entidad Documento


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_documento | INT | Identificador único del documento. | PK, NN |
| id_solicitud | INT | Solicitud a la que pertenece el documento. | FK, NN -> Solicitud.id_solicitud |
| id_usuario_carga | INT | Usuario que carga el archivo. | FK, NN -> Usuario.id_usuario |
| nombre_archivo | VARCHAR (150) | Nombre del archivo adjuntado. | NN |
| tipo_archivo | VARCHAR (50) | Extension o formato validado durante la carga. | NN |
| tamano_archivo | INT | Tamaño del archivo en KB. | NN |
| ruta_archivo | VARCHAR (300) | Ubicacion del archivo almacenado. | NN |
| fecha_carga | DATETIME | Fecha y hora de carga. | NN |

---


## 17.12 Entidad Notificacion


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_notificacion | INT | Identificador único de la notificacion. | PK, NN |
| id_usuario | INT | Usuario que recibe la notificacion. | FK, NN -> Usuario.id_usuario |
| id_solicitud | INT | Solicitud relacionada; puede ser NULL para avisos generales. permitido | FK -> Solicitud.id_solicitud; NULL |
| asunto | VARCHAR (150) | Titulo principal de la notificacion. | NN |
| mensaje | TEXT | Contenido de la información enviada. | NN |
| fecha_envio | DATETIME | Fecha y hora de envío. | NN |
| leida | BOOLEAN | Indica si el usuario ya consulto la notificacion. | NN |

---


## 17.13 Entidad EstadoCertificado


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_estado_certificado | INT | Identificador único del estado del certificado. | PK, NN |
| nombre | VARCHAR (30) | Nombre del estado del certificado. | UQ, NN |
| descripcion | VARCHAR (150) | Explicacion del significado del estado. | N/A |

---


## 17.14 Entidad CertificadoLaboral


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_certificado | INT | Identificador del certificado laboral generado. | PK, NN |
| id_solicitud | INT | Solicitud de certificado que origino el documento. | FK, NN -> Solicitud.id_solicitud |
| id_estado_certificado | INT | Estado actual del certificado. stado_certificado | FK, NN -> EstadoCertificado.id_e |
| fecha_generacion | DATETIME | Fecha y hora de generación. | NN |
| ruta_archivo | VARCHAR (300) | Ubicacion del archivo del certificado. | NN |

---


## 17.15 Entidad TipoPermiso


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_tipo_permiso | INT | Identificador único del tipo de permiso. | PK, NN |
| nombre | VARCHAR (80) | Categoria del permiso. | UQ, NN |
| descripcion | VARCHAR (200) | Finalidad del tipo de permiso. | N/A |

---


## 17.16 Entidad PermisoLaboral

Regla de fechas: fecha_fin debe ser igual o posterior a fecha_inicio.


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_permiso | INT | Identificador único del permiso. | PK, NN |
| id_solicitud | INT | Solicitud relacionada; una solicitud corresponde a un solo registro de | FK, NN; UQ -> Solicitud.id_solicitud permiso. |
| id_tipo_permiso | INT | Tipo de permiso solicitado. | FK, NN -> TipoPermiso.id_tipo_permiso |
| id_estado_permiso | INT | Estado propio del permiso. do_permiso | FK, NN -> EstadoPermiso.id_esta |
| fecha_inicio | DATE | Fecha de inicio del permiso. | NN |
| fecha_fin | DATE | Fecha de finalización del permiso. | NN |
| motivo | TEXT | Razón del permiso solicitado. | NN |

---


## 17.17 Entidad EstadoPermiso


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_estado_permiso | INT | Identificador único del estado del permiso. | PK, NN |
| nombre | VARCHAR (30) | Nombre del estado del permiso. | UQ, NN |
| descripcion | VARCHAR (150) | Explicacion del significado del estado. | N/A |

---


## 17.18 Entidad TipoVacacion


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_tipo_vacacion | INT | Identificador único del tipo de vacaciones. | PK, NN |
| nombre | VARCHAR (50) | Modalidad de vacaciones. | UQ, NN |
| descripcion | VARCHAR (150) | Características del tipo de vacaciones. | N/A |

---


## 17.19 Entidad Vacacion

Regla de fechas: fecha_fin debe ser igual o posterior a fecha_inicio. La duracion solicitada se calcula a partir de las fechas y no se persiste como

dias_solicitados.


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_vacacion | INT | Identificador único del registro de vacaciones. | PK, NN |
| id_solicitud | INT | Solicitud relacionada; una solicitud corresponde a un solo registro de | FK, NN; UQ -> Solicitud.id_solicitud vacaciones. |
| id_tipo_vacacion | INT | Tipo de vacaciones. | FK, NN -> TipoVacacion.id_tipo_vacacion |
| id_estado_vacacion | INT | Estado de las vacaciones. ado_vacacion | FK, NN -> EstadoVacacion.id_est |
| fecha_inicio | DATE | Fecha de inicio del período solicitado. | NN |
| fecha_fin | DATE | Fecha de finalización del período solicitado. | NN |
| motivo | TEXT | Razón indicada para la solicitud de vacaciones. | NN |

---


## 17.20 Entidad EstadoVacacion


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_estado_vacacion | INT | Identificador único del estado de vacaciones. | PK, NN |
| nombre | VARCHAR (30) | Nombre del estado de vacaciones. | UQ, NN |
| descripcion | VARCHAR (150) | Significado del estado. | N/A |

---


## 17.21 Entidad SaldoVacaciones

Clave compuesta única por usuario y período. dias_disponibles = dias_generados - dias_utilizados; es un valor derivado y no se almacena.


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_saldo | INT | Identificador único del saldo. | PK, NN |
| id_usuario | INT | Usuario al que pertenece el saldo; forma clave única junto con | FK, NN; UQ comp. -> Usuario.id_usuario período. |
| periodo | VARCHAR (10) | Año o ciclo de generación del saldo; forma clave única junto con id_usuario. | NN; UQ comp. |
| dias_generados | DECIMAL (5,2) | Días de vacaciones generados en el período. | NN |
| dias_utilizados | DECIMAL (5,2) | Días de vacaciones utilizados en el período. | NN |
| fecha_actualizacion | DATETIME | Fecha y hora de la última actualizacion del saldo. | NN |

---


## 17.22 Entidad TipoIncapacidad


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_tipo_incapacidad | INT | Identificador único del tipo de incapacidad. | PK, NN |
| nombre | VARCHAR (80) | Nombre del tipo de incapacidad. | UQ, NN |
| descripcion | VARCHAR (200) | Características del tipo de incapacidad. | N/A |

---


## 17.23 Entidad Incapacidad

Regla de fechas: fecha_fin debe ser igual o posterior a fecha_inicio. La duracion se calcula a partir de las fechas y no se persiste como dias_incapacidad.


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_incapacidad | INT | Identificador único del registro de incapacidad. | PK, NN |
| id_solicitud | INT | Solicitud relacionada; una solicitud corresponde a un solo registro de | FK, NN; UQ -> Solicitud.id_solicitud incapacidad. |
| id_tipo_incapacidad | INT | Tipo de incapacidad. o_incapacidad | FK, NN -> TipoIncapacidad.id_tip |
| id_estado_incapacidad | INT | Estado del tramite médico. estado_incapacidad | FK, NN -> EstadoIncapacidad.id_ |
| fecha_inicio | DATE | Fecha de inicio de la incapacidad. | NN |
| fecha_fin | DATE | Fecha de finalización de la incapacidad. | NN |
| observacion | TEXT | Información complementaria de la incapacidad. | NULL |

---


## 17.24 Entidad EstadoIncapacidad


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_estado_incapacidad | INT | Identificador único del estado de incapacidad. | PK, NN |
| nombre | VARCHAR (30) | Nombre del estado de incapacidad. | UQ, NN |
| descripcion | VARCHAR (150) | Explicacion del significado del estado. | N/A |

---


## 17.25 Entidad RecuperacionClave

Nombre fisico normalizado de la entidad de recuperacion de contraseña: RecuperacionClave.


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_recuperacion | INT | Identificador único del proceso de recuperacion. | PK, NN |
| id_usuario | INT | Usuario que solicita recuperar la clave. | FK, NN -> Usuario.id_usuario |
| token | VARCHAR (255) | Token temporal almacenado de forma segura como hash. | UQ, NN |
| fecha_solicitud | DATETIME | Fecha y hora de la solicitud. | NN |
| fecha_expiracion | DATETIME | Fecha y hora límite de validez. | NN |
| utilizada | BOOLEAN | Indica si el token ya fue utilizado. | NN |

---


## 17.26 Entidad TipoReporte


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_tipo_reporte | INT | Identificador único de la categoria de reporte. | PK, NN |
| nombre | VARCHAR (80) | Nombre de la categoria. | UQ, NN |
| descripcion | VARCHAR (200) | Explicacion del tipo de reporte. | N/A |

---


## 17.27 Entidad Reporte

Los criterios usados para generar reportes se procesan como filtros de consulta; no se persisten en esta entidad.


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_reporte | INT | Identificador único del reporte generado. | PK, NN |
| id_tipo_reporte | INT | Tipo de reporte generado. | FK, NN -> TipoReporte.id_tipo_reporte |
| id_usuario | INT | Usuario que genera el reporte. | FK, NN -> Usuario.id_usuario |
| fecha_generacion | DATETIME | Fecha y hora de generación. | NN |
| nombre_archivo | VARCHAR (150) | Nombre del archivo generado; puede ser NULL si el reporte no se descarga como archivo. | N/A |
| ruta_archivo | VARCHAR (300) | Ubicacion del archivo generado; puede ser NULL si el reporte no se almacena como archivo. | N/A |

---


## 17.28 Entidad RegistroAcceso

Entidad de soporte para el historial de intentos de acceso.


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_acceso | INT | Identificador único del registro de acceso. | PK, NN |
| id_usuario | INT | Usuario relacionado con el intento de acceso. | FK, NN -> Usuario.id_usuario |
| fecha_intento | DATETIME | Fecha y hora del intento de inicio de sesion. | NN |
| exitoso | BOOLEAN | Indica si el acceso se realizo correctamente. | NN |
| direccion_ip | VARCHAR (45) | Direccion IP desde la que se realizo el intento. | N/A |

---


## 17.29 Entidad AuditoriaSistema

Cada registro puede tener cero o varios detalles en DetalleAuditoria. El detalle se normaliza en una tabla relacionada, de acuerdo con el diagrama de

clases.


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_auditoria | INT | Identificador único del evento de auditoria. | PK, NN |
| id_usuario | INT | Usuario que desencadena la acción auditada. | FK, NN -> Usuario.id_usuario |
| tabla_afectada | VARCHAR (50) | Nombre de la entidad o tabla modificada. | NN |
| accion_realizada | VARCHAR (10) | Operación registrada: INSERT, UPDATE o DELETE. | NN |
| fecha_accion | DATETIME | Fecha y hora de la operación auditada. | NN |

---


## 17.30 Entidad DetalleAuditoria

Relaciones: una fila de AuditoriaSistema puede tener cero o varias filas de detalle.


| Atributo | Tipo de Dato | Descripción | Restricción |
|---|---|---|---|
| id_detalle | INT | Identificador único del detalle de auditoria. | PK, NN |
| id_auditoria | INT | Evento de auditoria al que pertenece el detalle. | FK, NN -> AuditoriaSistema.id_auditoria |
| campo_modificado | VARCHAR (100) | Nombre del campo afectado por la operación. | NN |
| valor_anterior | TEXT | Valor previo del campo; NULL cuando no existia valor anterior. | NULL |
| valor_nuevo | TEXT | Valor posterior del campo; NULL cuando la operación elimina el valor. | NULL |

---
