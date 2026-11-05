# 3. Fase 3: Diseño

**Proyecto:** Sistema de Gestión de Solicitudes de Talento Humano  
**Organización:** Nexa Servicios  
**Documento Fuente:** *Nexa servicios talento humano definitivo actual.docx*  
**Autores:** Javier Bernal Garavito | Jhulius Karol Escobar Gómez  
**Docente:** Prof. Gloria Amparo Lora Patiño — Universidad Remington  

---

## Índice de la Fase de Diseño

* [3.1 Diccionario de Datos (30 Tablas Físicas)](3.1-diccionario-de-datos.md)
* [3.2 Revisión Lógica de Normalización (1FN, 2FN, 3FN)](3.2-normalizacion-3fn.md)
* [3.3 Modelo Orientado a Objetos y Diagrama de Clases UML](3.3-modelo-orientado-a-objetos.md)
* [3.4 Diseño Conductual y Arquitectura en Paquetes MVC](3.4-diseno-conductual-mvc.md)
* [3.5 MER y Modelo Relacional](3.5-mer-y-modelo-relacional.md)
* [3.6 Auditoría Cruzada (Diccionario ↔ MER ↔ Clases)](3.6-auditoria-cruzada.md)
* [3.7 Matriz Integral de Trazabilidad](3.7-matriz-integral-de-trazabilidad.md)

---


## 3.1 Diccionario de Datos (30 Tablas Físicas)

15. Diccionario de Datos

Este diccionario describe las entidades, campos, tipos, tamaños, restricciones y relaciones del Sistema de Gestión de Solicitudes de Talento Humano de Nexa Servicios. Sus 30 entidades y campos se contrastaron con las 30 tablas del SQL recibido; la correspondencia se documenta también en la matriz de HU de la sección 14.13.

Convenciones

PK: llave primaria. FK: llave foránea. UQ: valor o combinación única. NN: no nulo. NULL: valor opcional. AI: autoincremental.

Las referencias indicadas como FK -> Tabla.campo identifican la tabla y el campo referenciados.

N/A indica que el tamaño no aplica al tipo de dato.

Criterios de integridad y coherencia

Especialización de Solicitud. PermisoLaboral, Vacacion e Incapacidad son subtipos excluyentes. En cada tabla hija id_solicitud es único; además, la aplicación o una restricción de base de datos debe validar que id_tipo_solicitud corresponda al único subtipo creado.

Fechas de los trámites. En PermisoLaboral, Vacacion e Incapacidad, fecha_fin debe ser igual o posterior a fecha_inicio.

Duraciones derivadas. dias_solicitados y dias_incapacidad no se almacenan; se calculan a partir de fecha_inicio y fecha_fin. La regla del proyecto debe definir si el cálculo cuenta días calendario o hábiles.

Saldo de vacaciones. La clave compuesta (id_usuario, periodo) evita saldos duplicados por empleado y período. dias_disponibles se calcula como dias_generados menos dias_utilizados y no se almacena.

Auditoría. AuditoriaSistema registra la operación y DetalleAuditoria conserva los campos y valores modificados, en relación de uno a varios.

Motivo de vacaciones. Vacacion incluye motivo porque HU-03 solicita conservar la razón indicada por el empleado.

Reportes. Reporte conserva los metadatos del archivo generado. Los filtros de consulta son transitorios y no se almacenan en esta entidad.

Tablas y campos

### 15.1 Tabla Rol

#### Tabla 19. Tabla Rol

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_rol | INT | N/A | PK, NN, AI | Identificador único del rol en el sistema. |
| nombre | VARCHAR | 50 | UQ, NN | Nombre utilizado para identificar el rol. |
| descripcion | VARCHAR | 200 | N/A | Descripción de las funciones asociadas al rol. |

### 15.2 Tabla Área

Nombre fisico normalizado: Área.

#### Tabla 20. Tabla Área

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_area | INT | N/A | PK, NN, AI | Identificador único del área registrada. |
| nombre | VARCHAR | 100 | UQ, NN | Nombre del área en Nexa Servicios. |
| descripcion | VARCHAR | 200 | N/A | Información sobre las funciones del área. |

### 15.3 Tabla Cargo

#### Tabla 21. Tabla Cargo

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_cargo | INT | N/A | PK, NN, AI | Identificador único del cargo. |
| nombre | VARCHAR | 100 | UQ, NN | Nombre que identifica el cargo. |
| descripcion | VARCHAR | 200 | N/A | Funciones o características del cargo. |

### 15.4 Tabla Usuario

#### Tabla 22. Tabla Usuario

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_usuario | INT | N/A | PK, NN, AI | Identificador único del usuario. |
| nombre | VARCHAR | 100 | NN | Nombre del usuario. |
| apellido | VARCHAR | 100 | NN | Apellido del usuario. |
| documento | VARCHAR | 20 | UQ, NN | Número de identificación del usuario. |
| correo | VARCHAR | 150 | UQ, NN | Correo institucional del usuario. |
| contrasena_hash | VARCHAR | 255 | NN | Hash de la contraseña usada para autenticación; no almacenar texto plano. |
| id_cargo | INT | N/A | FK, NN -> Cargo.id_cargo | Cargo asociado al usuario. |
| id_area | INT | N/A | FK, NN -> Area.id_area | Área a la que pertenece el usuario. |
| id_rol | INT | N/A | FK, NN -> Rol.id_rol | Rol asignado al usuario. |
| activo | BOOLEAN | N/A | NN | Indica si la cuenta esta habilitada. |
| intentos_fallidos | INT | N/A | NN | Cantidad de intentos de acceso incorrectos. |
| bloqueado_hasta | DATETIME | N/A | NULL | Fecha y hora límite del bloqueo; NULL si la cuenta no esta bloqueada. |

### 15.5 Tabla TipoSolicitud

#### Tabla 23. Tabla TipoSolicitud

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_tipo_solicitud | INT | N/A | PK, NN, AI | Identificador único del tipo de solicitud. |
| nombre | VARCHAR | 50 | UQ, NN | Nombre utilizado para identificar el tipo. |
| descripcion | VARCHAR | 200 | N/A | Características y finalidad de la solicitud. |

### 15.6 Tabla EstadoSolicitud

#### Tabla 24. Tabla EstadoSolicitud

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_estado | INT | N/A | PK, NN, AI | Identificador único del estado general. |
| nombre | VARCHAR | 30 | UQ, NN | Nombre que identifica el estado. |
| descripcion | VARCHAR | 150 | N/A | Explicacion del significado del estado. |

### 15.7 Tabla Solicitud

Las fechas del tramite y los datos propios del motivo se almacenan en la tabla del subtipo correspondiente. Solicitud es la entidad base.

#### Tabla 25. Tabla Solicitud

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_solicitud | INT | N/A | PK, NN, AI | Identificador único de cada solicitud registrada. |
| radicado | VARCHAR | 20 | UQ, NN | Número único de radicado asignado a la solicitud. |
| id_usuario | INT | N/A | FK, NN -> Usuario.id_usuario | Usuario que registra la solicitud. |
| id_tipo_solicitud | INT | N/A | FK, NN -> TipoSolicitud.id_tipo_solicitud | Tipo general que identifica el subtipo aplicable. |
| id_estado | INT | N/A | FK, NN -> EstadoSolicitud.id_estado | Estado general actual de la solicitud. |
| fecha_registro | DATETIME | N/A | NN | Fecha y hora en que se registra la solicitud. |

### 15.8 Tabla TipoAccion

#### Tabla 26. Tabla TipoAccion

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_tipo_accion | INT | N/A | PK, NN, AI | Identificador único del tipo de acción. |
| nombre | VARCHAR | 50 | UQ, NN | Nombre de la acción realizada. |
| descripcion | VARCHAR | 150 | N/A | Explicacion de la acción. |

### 15.9 Tabla HistorialSolicitud

#### Tabla 27. Tabla HistorialSolicitud

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_historial | INT | N/A | PK, NN, AI | Identificador del registro historico. |
| id_solicitud | INT | N/A | FK, NN -> Solicitud.id_solicitud | Solicitud relacionada. |
| id_usuario | INT | N/A | FK, NN -> Usuario.id_usuario | Usuario que realizo la acción. |
| id_tipo_accion | INT | N/A | FK, NN -> TipoAccion.id_tipo_accion | Tipo de acción realizada. |
| id_estado_anterior | INT | N/A | FK -> EstadoSolicitud.id_estado; | Estado previo al cambio; puede ser NULL si aun no existia. NULL permitido |
| id_estado_nuevo | INT | N/A | FK -> EstadoSolicitud.id_estado; | Estado resultante; puede ser NULL si la acción no cambia el estado. NULL permitido |
| fecha_accion | DATETIME | N/A | NN | Fecha y hora de la acción. |
| comentario | TEXT | N/A | NULL | Información adicional, motivo o nota de la acción. |

### 15.10 Tabla AsignacionSolicitud

#### Tabla 28. Tabla AsignacionSolicitud

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_asignacion | INT | N/A | PK, NN, AI | Identificador único de la asignación. |
| id_solicitud | INT | N/A | FK, NN -> Solicitud.id_solicitud | Solicitud asignada. |
| id_usuario_responsable | INT | N/A | FK, NN -> Usuario.id_usuario | Usuario encargado de gestionar la solicitud. |
| fecha_asignacion | DATETIME | N/A | NN | Fecha y hora de la asignación. |
| fecha_fin | DATETIME | N/A | NULL | Fecha y hora en que termina la responsabilidad. |
| motivo | TEXT | N/A | NULL | Explicacion de la asignación o reasignación. |
| activa | BOOLEAN | N/A | NN | Indica si la asignación sigue vigente. |

### 15.11 Tabla Documento

#### Tabla 29. Tabla Documento

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_documento | INT | N/A | PK, NN, AI | Identificador único del documento. |
| id_solicitud | INT | N/A | FK, NN -> Solicitud.id_solicitud | Solicitud a la que pertenece el documento. |
| id_usuario_carga | INT | N/A | FK, NN -> Usuario.id_usuario | Usuario que carga el archivo. |
| nombre_archivo | VARCHAR | 150 | NN | Nombre del archivo adjuntado. |
| tipo_archivo | VARCHAR | 50 | NN | Extension o formato validado durante la carga. |
| tamano_archivo | INT | N/A | NN | Tamaño del archivo en KB. |
| ruta_archivo | VARCHAR | 300 | NN | Ubicacion del archivo almacenado. |
| fecha_carga | DATETIME | N/A | NN | Fecha y hora de carga. |

### 15.12 Tabla Notificacion

#### Tabla 30. Tabla Notificacion

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_notificacion | INT | N/A | PK, NN, AI | Identificador único de la notificacion. |
| id_usuario | INT | N/A | FK, NN -> Usuario.id_usuario | Usuario que recibe la notificacion. |
| id_solicitud | INT | N/A | FK -> Solicitud.id_solicitud; NULL | Solicitud relacionada; puede ser NULL para avisos generales. permitido |
| asunto | VARCHAR | 150 | NN | Titulo principal de la notificacion. |
| mensaje | TEXT | N/A | NN | Contenido de la información enviada. |
| fecha_envio | DATETIME | N/A | NN | Fecha y hora de envío. |
| leida | BOOLEAN | N/A | NN | Indica si el usuario ya consulto la notificacion. |

### 15.13 Tabla EstadoCertificado

#### Tabla 31. Tabla EstadoCertificado

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_estado_certificado | INT | N/A | PK, NN, AI | Identificador único del estado del certificado. |
| nombre | VARCHAR | 30 | UQ, NN | Nombre del estado del certificado. |
| descripcion | VARCHAR | 150 | N/A | Explicacion del significado del estado. |

### 15.14 Tabla CertificadoLaboral

#### Tabla 32. Tabla CertificadoLaboral

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_certificado | INT | N/A | PK, NN, AI | Identificador del certificado laboral generado. |
| id_solicitud | INT | N/A | FK, NN -> Solicitud.id_solicitud | Solicitud de certificado que origino el documento. |
| id_estado_certificado | INT | N/A | FK, NN -> EstadoCertificado.id_e | Estado actual del certificado. stado_certificado |
| fecha_generacion | DATETIME | N/A | NN | Fecha y hora de generación. |
| ruta_archivo | VARCHAR | 300 | NN | Ubicacion del archivo del certificado. |

### 15.15 Tabla TipoPermiso

#### Tabla 33. Tabla TipoPermiso

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_tipo_permiso | INT | N/A | PK, NN, AI | Identificador único del tipo de permiso. |
| nombre | VARCHAR | 80 | UQ, NN | Categoria del permiso. |
| descripcion | VARCHAR | 200 | N/A | Finalidad del tipo de permiso. |

### 15.16 Tabla PermisoLaboral

Regla de fechas: fecha_fin debe ser igual o posterior a fecha_inicio.

#### Tabla 34. Tabla PermisoLaboral

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_permiso | INT | N/A | PK, NN, AI | Identificador único del permiso. |
| id_solicitud | INT | N/A | FK, NN; UQ -> Solicitud.id_solicitud permiso. | Solicitud relacionada; una solicitud corresponde a un solo registro de |
| id_tipo_permiso | INT | N/A | FK, NN -> TipoPermiso.id_tipo_permiso | Tipo de permiso solicitado. |
| id_estado_permiso | INT | N/A | FK, NN -> EstadoPermiso.id_esta | Estado propio del permiso. do_permiso |
| fecha_inicio | DATE | N/A | NN | Fecha de inicio del permiso. |
| fecha_fin | DATE | N/A | NN | Fecha de finalización del permiso. |
| motivo | TEXT | N/A | NN | Razón del permiso solicitado. |

### 15.17 Tabla EstadoPermiso

#### Tabla 35. Tabla EstadoPermiso

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_estado_permiso | INT | N/A | PK, NN, AI | Identificador único del estado del permiso. |
| nombre | VARCHAR | 30 | UQ, NN | Nombre del estado del permiso. |
| descripcion | VARCHAR | 150 | N/A | Explicacion del significado del estado. |

### 15.18 Tabla TipoVacacion

#### Tabla 36. Tabla TipoVacacion

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_tipo_vacacion | INT | N/A | PK, NN, AI | Identificador único del tipo de vacaciones. |
| nombre | VARCHAR | 50 | UQ, NN | Modalidad de vacaciones. |
| descripcion | VARCHAR | 150 | N/A | Características del tipo de vacaciones. |

### 15.19 Tabla Vacacion

Regla de fechas: fecha_fin debe ser igual o posterior a fecha_inicio. La duracion solicitada se calcula a partir de las fechas y no se persiste como

dias_solicitados.

#### Tabla 37. Tabla Vacacion

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_vacacion | INT | N/A | PK, NN, AI | Identificador único del registro de vacaciones. |
| id_solicitud | INT | N/A | FK, NN; UQ -> Solicitud.id_solicitud vacaciones. | Solicitud relacionada; una solicitud corresponde a un solo registro de |
| id_tipo_vacacion | INT | N/A | FK, NN -> TipoVacacion.id_tipo_vacacion | Tipo de vacaciones. |
| id_estado_vacacion | INT | N/A | FK, NN -> EstadoVacacion.id_est | Estado de las vacaciones. ado_vacacion |
| fecha_inicio | DATE | N/A | NN | Fecha de inicio del período solicitado. |
| fecha_fin | DATE | N/A | NN | Fecha de finalización del período solicitado. |
| motivo | TEXT | N/A | NN | Razón indicada para la solicitud de vacaciones. |

### 15.20 Tabla EstadoVacacion

#### Tabla 38. Tabla EstadoVacacion

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_estado_vacacion | INT | N/A | PK, NN, AI | Identificador único del estado de vacaciones. |
| nombre | VARCHAR | 30 | UQ, NN | Nombre del estado de vacaciones. |
| descripcion | VARCHAR | 150 | N/A | Significado del estado. |

### 15.21 Tabla SaldoVacaciones

Clave compuesta única por usuario y período. dias_disponibles = dias_generados - dias_utilizados; es un valor derivado y no se almacena.

#### Tabla 39. Tabla SaldoVacaciones

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_saldo | INT | N/A | PK, NN, AI | Identificador único del saldo. |
| id_usuario | INT | N/A | FK, NN; UQ comp. -> Usuario.id_usuario período. | Usuario al que pertenece el saldo; forma clave única junto con |
| periodo | VARCHAR | 10 | NN; UQ comp. | Año o ciclo de generación del saldo; forma clave única junto con id_usuario. |
| dias_generados | DECIMAL | 5,2 | NN | Días de vacaciones generados en el período. |
| dias_utilizados | DECIMAL | 5,2 | NN | Días de vacaciones utilizados en el período. |
| fecha_actualizacion | DATETIME | N/A | NN | Fecha y hora de la última actualizacion del saldo. |

### 15.22 Tabla TipoIncapacidad

#### Tabla 40. Tabla TipoIncapacidad

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_tipo_incapacidad | INT | N/A | PK, NN, AI | Identificador único del tipo de incapacidad. |
| nombre | VARCHAR | 80 | UQ, NN | Nombre del tipo de incapacidad. |
| descripcion | VARCHAR | 200 | N/A | Características del tipo de incapacidad. |

### 15.23 Tabla Incapacidad

Regla de fechas: fecha_fin debe ser igual o posterior a fecha_inicio. La duracion se calcula a partir de las fechas y no se persiste como dias_incapacidad.

#### Tabla 41. Tabla Incapacidad

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_incapacidad | INT | N/A | PK, NN, AI | Identificador único del registro de incapacidad. |
| id_solicitud | INT | N/A | FK, NN; UQ -> Solicitud.id_solicitud incapacidad. | Solicitud relacionada; una solicitud corresponde a un solo registro de |
| id_tipo_incapacidad | INT | N/A | FK, NN -> TipoIncapacidad.id_tip | Tipo de incapacidad. o_incapacidad |
| id_estado_incapacidad | INT | N/A | FK, NN -> EstadoIncapacidad.id_ | Estado del tramite médico. estado_incapacidad |
| fecha_inicio | DATE | N/A | NN | Fecha de inicio de la incapacidad. |
| fecha_fin | DATE | N/A | NN | Fecha de finalización de la incapacidad. |
| observacion | TEXT | N/A | NULL | Información complementaria de la incapacidad. |

### 15.24 Tabla EstadoIncapacidad

#### Tabla 42. Tabla EstadoIncapacidad

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_estado_incapacidad | INT | N/A | PK, NN, AI | Identificador único del estado de incapacidad. |
| nombre | VARCHAR | 30 | UQ, NN | Nombre del estado de incapacidad. |
| descripcion | VARCHAR | 150 | N/A | Explicacion del significado del estado. |

### 15.25 Tabla RecuperacionClave

Nombre fisico normalizado de la entidad de recuperacion de contraseña: RecuperacionClave.

#### Tabla 43. Tabla RecuperacionClave

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_recuperacion | INT | N/A | PK, NN, AI | Identificador único del proceso de recuperacion. |
| id_usuario | INT | N/A | FK, NN -> Usuario.id_usuario | Usuario que solicita recuperar la clave. |
| token | VARCHAR | 255 | UQ, NN | Token temporal almacenado de forma segura como hash. |
| fecha_solicitud | DATETIME | N/A | NN | Fecha y hora de la solicitud. |
| fecha_expiracion | DATETIME | N/A | NN | Fecha y hora límite de validez. |
| utilizada | BOOLEAN | N/A | NN | Indica si el token ya fue utilizado. |

### 15.26 Tabla TipoReporte

#### Tabla 44. Tabla TipoReporte

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_tipo_reporte | INT | N/A | PK, NN, AI | Identificador único de la categoria de reporte. |
| nombre | VARCHAR | 80 | UQ, NN | Nombre de la categoria. |
| descripcion | VARCHAR | 200 | N/A | Explicacion del tipo de reporte. |

### 15.27 Tabla Reporte

Los criterios usados para generar reportes se procesan como filtros de consulta; no se persisten en esta entidad.

#### Tabla 45. Tabla Reporte

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_reporte | INT | N/A | PK, NN, AI | Identificador único del reporte generado. |
| id_tipo_reporte | INT | N/A | FK, NN -> TipoReporte.id_tipo_reporte | Tipo de reporte generado. |
| id_usuario | INT | N/A | FK, NN -> Usuario.id_usuario | Usuario que genera el reporte. |
| fecha_generacion | DATETIME | N/A | NN | Fecha y hora de generación. |
| nombre_archivo | VARCHAR | 150 | N/A | Nombre del archivo generado; puede ser NULL si el reporte no se descarga como archivo. |
| ruta_archivo | VARCHAR | 300 | N/A | Ubicacion del archivo generado; puede ser NULL si el reporte no se almacena como archivo. |

### 15.28 Tabla RegistroAcceso

Entidad de soporte para el historial de intentos de acceso.

#### Tabla 46. Tabla RegistroAcceso

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_acceso | INT | N/A | PK, NN, AI | Identificador único del registro de acceso. |
| id_usuario | INT | N/A | FK, NN -> Usuario.id_usuario | Usuario relacionado con el intento de acceso. |
| fecha_intento | DATETIME | N/A | NN | Fecha y hora del intento de inicio de sesion. |
| exitoso | BOOLEAN | N/A | NN | Indica si el acceso se realizo correctamente. |
| direccion_ip | VARCHAR | 45 | N/A | Direccion IP desde la que se realizo el intento. |

### 15.29 Tabla AuditoriaSistema

Cada registro puede tener cero o varios detalles en DetalleAuditoria. El detalle se normaliza en una tabla relacionada, de acuerdo con el diagrama de

clases.

#### Tabla 47. Tabla AuditoriaSistema

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_auditoria | INT | N/A | PK, NN, AI | Identificador único del evento de auditoria. |
| id_usuario | INT | N/A | FK, NN -> Usuario.id_usuario | Usuario que desencadena la acción auditada. |
| tabla_afectada | VARCHAR | 50 | NN | Nombre de la entidad o tabla modificada. |
| accion_realizada | VARCHAR | 10 | NN | Operación registrada: INSERT, UPDATE o DELETE. |
| fecha_accion | DATETIME | N/A | NN | Fecha y hora de la operación auditada. |

### 15.30 Tabla DetalleAuditoria

Relaciones: una fila de AuditoriaSistema puede tener cero o varias filas de detalle.

#### Tabla 48. Tabla DetalleAuditoria

| Campo | Tipo de dato | Tamaño | Restricción | Descripción |
| --- | --- | --- | --- | --- |
| id_detalle | INT | N/A | PK, NN, AI | Identificador único del detalle de auditoria. |
| id_auditoria | INT | N/A | FK, NN -> AuditoriaSistema.id_auditoria | Evento de auditoria al que pertenece el detalle. |
| campo_modificado | VARCHAR | 100 | NN | Nombre del campo afectado por la operación. |
| valor_anterior | TEXT | N/A | NULL | Valor previo del campo; NULL cuando no existia valor anterior. |
| valor_nuevo | TEXT | N/A | NULL | Valor posterior del campo; NULL cuando la operación elimina el valor. |

Esta es una comprobación lógica del diccionario y del modelo relacional documentados, no una certificación del DDL ni de sus restricciones. El compañero responsable del SQL debe cotejar claves, dependencias funcionales, nulabilidad e integridad referencial al entregar el script.

La revisión del Diccionario de Datos aplica estos criterios: 1FN, campos atómicos y grupos repetibles representados en entidades relacionadas; 2FN, claves primarias simples id_* en las fichas revisadas, sin dependencia parcial de claves compuestas; 3FN, atributos descriptivos de roles, áreas, cargos, tipos y estados se mantienen en catálogos y se relacionan mediante claves foráneas, evitando repetir esos nombres en las entidades transaccionales.


## 3.2 Revisión Lógica de Normalización (1FN, 2FN, 3FN)

### 15.31 Revisión lógica de normalización hasta tercera forma normal


## 3.3 Modelo Orientado a Objetos y Diagrama de Clases UML

16. Modelo Orientado a Objetos (Diagrama de Clases)

Esta sección integra el paso del modelo de datos relacional al modelo orientado a objetos contenido en el PDF actual, conservando las clases, visibilidad, atributos, métodos y herencia allí definidos.

#### <<Clase>> Usuario

- idUsuario: int

- nombre: string

- apellido: string

- documento: string

- correo: string

- contrasenaHash: string

- activo: boolean

- intentosFallidos: int

- bloqueadoHasta: datetime

- cargo: Cargo

- area: Area

- rol: Rol

+ iniciarSesion(correo: string, contrasena: string): boolean
+ registrarIntentoFallido(): void
+ bloquearCuenta(): void
+ solicitarRecuperacionClave(): string

#### <<Clase>> Solicitud

- idSolicitud: int

- radicado: string

- fechaRegistro: datetime

- estado: EstadoSolicitud

- usuario: Usuario

- documentosSoporte: List<Documento>

+ radicarSolicitud(): boolean
+ actualizarEstado(nuevoEstado: EstadoSolicitud): void
+ asignarResponsable(usuario: Usuario): void

#### <<Clase>> PermisoLaboral

- fechaInicio: date

- fechaFin: date

- motivo: string

- tipoPermiso: TipoPermiso

- estadoPermiso: EstadoPermiso

+ calcularDias(): int <<derived>>
+ aprobarPermiso(): void
+ rechazarPermiso(): void

#### <<Clase>> Vacacion

- fechaInicio: date

- fechaFin: date
- motivo: string

- tipoVacacion: TipoVacacion

- estadoVacacion: EstadoVacacion

+ calcularDias(): int <<derived>>
+ validarSaldo(saldoActual: SaldoVacaciones): boolean

#### <<Clase>> Incapacidad

- fechaInicio: date

- fechaFin: date

- observacion: string

- tipoIncapacidad: TipoIncapacidad

- estadoIncapacidad: EstadoIncapacidad

+ calcularDias(): int <<derived>>
+ validarDocumentoMedico(): boolean

#### <<Clase>> Documento

- idDocumento: int

- nombreArchivo: string

- tipoArchivo: string

- tamanoArchivo: int

- rutaArchivo: string

- fechaCarga: datetime

- usuarioCarga: Usuario

+ validarFormato(): boolean
+ validarTamanoMaximo(): boolean
+ almacenarEnServidor(): string

Diagrama de Clases UML del sistema (núcleo y especialización de solicitudes)

#### Figura 22. Diagrama de Clases UML - Gestión de Solicitudes.

Este diagrama presenta el núcleo de solicitudes y sus especializaciones. Sus atributos y relaciones se contrastan con el Diccionario de Datos y talento_humano-1.sql; la exclusividad entre subtipos permanece como validación de aplicación, porque el script no la impone.

Vistas ampliadas por subdominio del diagrama de clases (30 entidades)

El modelo se presenta en cuatro vistas UML complementarias para facilitar la lectura. Las clases repetidas son referencias a una misma clase lógica; aquí se muestran atributos principales y el Diccionario de Datos conserva el detalle completo.

### 16.1 Núcleo y especialización

Solicitud es una clase concreta que sirve como base conceptual. PermisoLaboral, Vacacion e Incapacidad son especializaciones conceptuales. El SQL no garantiza exclusividad ni completitud entre subtipos.

#### Figura 23. Vista UML del núcleo y la especialización de solicitudes.

### 16.2 Catálogos de tipo y estado

Cada permiso, vacación o incapacidad se vincula con un tipo y un estado propios. Un registro de catálogo puede clasificar varias instancias del subtipo correspondiente.

#### Figura 24. Vista UML de los catálogos de los subtipos.

### 16.3 Gestión y seguimiento

Una solicitud puede tener cero o varios registros de historial, asignaciones, documentos o certificados. Cada notificación se dirige a un usuario y puede vincularse con cero o una solicitud; una solicitud puede asociarse con varias notificaciones. Las referencias al usuario identifican el actor, responsable, destinatario o cargador según el caso.

#### Figura 25. Vista UML del flujo y seguimiento de solicitudes.

### 16.4 Usuarios, acceso y auditoría

Se muestran las relaciones organizacionales del usuario y las entidades de recuperación, acceso, reportes y auditoría.

#### Figura 26. Vista UML de usuarios y servicios de soporte.

### 16.5 Criterios de corrección UML

La operación calcularDias() se define solo en las clases con fechas de inicio y fin: PermisoLaboral, Vacacion e Incapacidad. Solicitud no la declara porque también se relaciona con certificados, que no representan un periodo de ausencia.

• El modelo conceptual representa PermisoLaboral, Vacacion e Incapacidad como especializaciones mutuamente excluyentes. El SQL define UNIQUE(id_solicitud) en cada tabla de subtipo, lo que limita a una fila por subtipo y solicitud, pero no impide que una misma Solicitud aparezca en varias tablas ni exige que aparezca en alguna. La exclusividad y completitud deben validarse en la aplicación o respaldarse con restricciones de esquema adicionales. CertificadoLaboral se vincula con Solicitud para emitir el documento aprobado.

• Las multiplicidades distinguen catálogos compartidos (un tipo o estado para muchas instancias) de registros dependientes (por ejemplo, una auditoría con cero o más detalles).

• Las vistas parciales no duplican entidades del modelo; repiten Usuario, Solicitud y otros elementos solo como anclas de lectura.


## 3.4 Diseño Conductual y Arquitectura en Paquetes MVC

### 16.6 Diseño conductual y paquetes MVC

Los siguientes diagramas presentan el flujo, la arquitectura lógica en paquetes MVC, las interacciones de registro y decisión y los estados de una solicitud. Se vinculan con requisitos y reglas ya documentados; son diseños conceptuales y no afirman que exista código implementado.

#### Figura 27. Diagrama de actividad del ciclo de una solicitud.

Trazabilidad: HU-03 a HU-04, HU-15, HU-18; RF-03 a RF-09, RF-13, RF-20, RF-23 y RF-26; RN-01 a RN-08, RN-13, RN-16, RN-21 y RN-23.

#### Figura 28. DDA de arquitectura lógica con paquetes MVC.

Trazabilidad funcional: CU-01 a CU-14. Vista conceptual del diseño MVC; los paquetes no implican que sus componentes estén implementados.

#### Figura 29. Diagrama de secuencia para registrar una solicitud.

Trazabilidad: HU-03; RF-03 a RF-06 y RF-13; RN-01, RN-02, RN-13 y RN-23; persistencia de Solicitud y del subtipo aplicable.

#### Figura 30. Diagrama de secuencia para decidir una solicitud.

Trazabilidad: HU-04, HU-15, HU-18; RF-07, RF-08, RF-20, RF-23 y RF-26; RN-03 a RN-07, RN-16 y RN-21; evento en HistorialSolicitud.

#### Figura 31. Diagrama de estados de Solicitud.

Trazabilidad: HU-04, HU-15, HU-18; RF-07, RF-08, RF-20 y RF-23; RN-03 a RN-07 y RN-16. La transición válida requiere control de permisos y estado.


## 3.5 MER y Modelo Relacional

17. MER y Modelo Relacional

Este artefacto se construye a partir del Diccionario de Datos actualizado y mantiene la secuencia de Diseño. No se inicia Construcción.

### 17.1 Entidades y claves

#### Figura 32. Modelo relacional de talento_humano.

Cada tarjeta enumera campos, tipos y restricciones. FK → tabla señala la referencia; una FK no única implica 1:N y una FK con UQ limita la relación a 1:1. NULL y NOT NULL indican la opcionalidad del lado que contiene la FK.

### 17.2 Reglas de integridad

• Cada tabla de subtipo tiene UNIQUE(id_solicitud), que impide más de una fila de ese subtipo para la misma Solicitud. El script no impone exclusividad entre las tres tablas ni garantiza la creación de un subtipo para cada Solicitud; id_tipo_solicitud tampoco tiene una restricción que sincronice el catálogo con las tablas de subtipo.

• La aplicación debe validar que id_tipo_solicitud corresponda al subtipo registrado; el SQL suministrado no impone esa correspondencia entre tablas.

• Los datos derivados eliminados del Diccionario no deben volver a persistirse.

• Las claves foráneas deben referenciar registros existentes.


## 3.6 Auditoría Cruzada (Diccionario ↔ MER ↔ Clases)

18. Auditoría cruzada: Diccionario de Datos ↔ MER ↔ Modelo Orientado a Objetos

Se revisó la correspondencia entre las tres representaciones y se registran coincidencias y diferencias.

#### Tabla 49. Auditoría cruzada del diccionario, el MER y las clases

| Elemento | Resultado | Observación |
| --- | --- | --- |
| Usuario | Coincide | Entidad y clase contienen autenticación, cargo, área y rol. |
| Solicitud | Coincide | Tanto el Diccionario/MER como el diagrama general y la Vista 1 del diagrama de clases vinculan Solicitud con Usuario, TipoSolicitud y EstadoSolicitud. |
| PermisoLaboral | Coincide | Subtipo de Solicitud con fechas, tipo y estado. |
| Vacacion | Coincide | Subtipo de Solicitud con fechaInicio, fechaFin, motivo, TipoVacacion y EstadoVacacion; días solicitados calculados por método derivado calcularDias(). |
| Incapacidad | Coincide | Subtipo de Solicitud; días derivados. |
| Documento | Coincide | Relacionado con Solicitud y Usuario y representado como clase. |
| RegistroAcceso | Coincide | Modelado en el Diccionario (15.28), MER/SQL y Vista 4 del diagrama de clases (asociado a Usuario con métodos registrarIntento y consultarAccesosPorUsuario). |
| AuditoriaSistema | Coincide | Modelado en el Diccionario (15.29), MER/SQL y Vista 4 del diagrama de clases (asociado a Usuario y DetalleAuditoria). |
| HistorialSolicitud / AsignacionSolicitud | Coincide | Modelados en el Diccionario (15.9 y 15.10), MER/SQL y Vista 3 del diagrama de clases (asociados a Solicitud, Usuario y TipoAccion). |
| DetalleAuditoria | Coincide | Incorporado en el Diccionario (15.30), MER/SQL y Vista 4 del diagrama de clases (composición 1:N desde AuditoriaSistema). |

### 18.1 Resultado de la auditoría

Control documental: el proyecto consolida 62 RF, 30 RN, 6 RNF, 40 HU funcionales, 14 CU, 12 mockups, 30 tablas del diccionario y la matriz integral de trazabilidad (sección 14.13). El cronograma prevé 16 semanas y 192 horas; los hitos de repositorio y del primer flujo MVC se presentan como entregables previstos, no como implementación ya comprobada.

Repositorio Git del proyecto: https://github.com/adelio2/Talento-humano-

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

#### Tabla 50. Correspondencia con la entrega MySQL del equipo

Esta matriz consolida los 11 bloques PRG descritos por el equipo MySQL y los relaciona con métodos UML, las 40 HU, RF, RN/RNF, CU, MK y tablas. El archivo talento_humano-1.sql contiene 30 tablas y no declara procedimientos, funciones, triggers, eventos ni vistas; por eso, los bloques PRG se atribuyen al documento de programación del equipo. Las correspondencias se establecen por función y no por coincidencia numérica entre las HU del documento MySQL y las HU consolidadas. Este cruce se revisa junto con el diccionario y la matriz integral.


## 3.7 Matriz Integral de Trazabilidad

| HU | Criterios de aceptación | RF asociados | RN / RNF | CU (pasos / flujos) | SQL DDL: tablas y campos | ACT / MK / referencia MySQL |
| --- | --- | --- | --- | --- | --- | --- |
| HU-01 | CA-1: Con credenciales válidas, el sistema permite el acceso y muestra únicamente las funciones del rol asignado. <br> CA-2: Con credenciales inválidas, deniega el acceso y presenta un mensaje claro. <br> CA-3: Registra los intentos asociados a una cuenta identificable con fecha, resultado y dirección IP cuando esté disponible. | RF-01 | RN: — / RNF: RNF-03 | CU-01 P1–3; FA-01/02; CU-01 P3 | Usuario (id_usuario, nombre, apellido, correo, contrasena_hash, id_cargo, id_area, id_rol, activo); Rol (id_rol, nombre); RegistroAcceso (id_acceso, id_usuario, fecha_intento, exitoso, direccion_ip) | ACT-01 / MK-01 / PRG-01 / ACT-01, ACT-02, ACT-03, ACT-04 / Sin PRG directo identificado en la matriz MySQL |
| HU-02 | CA-1: El sistema envía un mecanismo temporal al correo registrado y permite solicitar otro cuando el anterior haya expirado. <br> CA-2: Solo un mecanismo vigente y no utilizado permite establecer la nueva contraseña. <br> CA-3: Después del restablecimiento, el mecanismo queda marcado como utilizado y no puede reutilizarse. | RF-02, RF-43 | RN: RN-20 / RNF: RNF-03, RNF-05 | CU-02 P1; FA-01/02; CU-02 P3; FA-02; CU-02 P2 | RecuperacionClave (id_recuperacion, id_usuario, token, fecha_solicitud, fecha_expiracion, utilizada); Usuario (id_usuario, nombre, apellido, correo, contrasena_hash, id_cargo, id_area, id_rol, activo) | ACT-01, ACT-05 / MK-01 / PRG-02 / ACT-01, ACT-02, ACT-03, ACT-05 / Sin PRG directo identificado en la matriz MySQL |
| HU-03 | CA-1: El empleado selecciona uno de los tipos de solicitud disponibles y diligencia los datos obligatorios de ese trámite. <br> CA-2: Se aplican las validaciones correspondientes, incluidas las fechas y el saldo para vacaciones y el soporte requerido para incapacidad. <br> CA-3: Una solicitud válida recibe un radicado único, queda en el estado inicial definido y muestra confirmación. <br> CA-4: Si faltan datos o no se cumplen las reglas del tipo seleccionado, el sistema no radica la solicitud e indica qué debe corregirse. | RF-03, RF-13, RF-04, RF-05, RF-06 | RN: RN-01, RN-23, RN-13, RN-14, RN-02 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-03 P1–4; FA-01–04; CU-10 P1–3; FA-01/02. | PermisoLaboral (id_permiso, id_solicitud, id_tipo_permiso, id_estado_permiso, fecha_inicio, fecha_fin, motivo); EstadoPermiso (id_estado_permiso, nombre); TipoPermiso (id_tipo_permiso, nombre); Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro); EstadoVacacion (id_estado_vacacion, nombre); TipoVacacion (id_tipo_vacacion, nombre); Vacacion (id_vacacion, id_solicitud, id_tipo_vacacion, id_estado_vacacion, fecha_inicio, fecha_fin, motivo); CertificadoLaboral (id_certificado, id_solicitud, id_estado_certificado, fecha_generacion, ruta_archivo); EstadoCertificado (id_estado_certificado, nombre); EstadoIncapacidad (id_estado_incapacidad, nombre); TipoIncapacidad (id_tipo_incapacidad, nombre); Incapacidad (id_incapacidad, id_solicitud, id_tipo_incapacidad, id_estado_incapacidad, fecha_inicio, fecha_fin, observacion); Documento (id_documento, id_solicitud, id_usuario_carga, nombre_archivo, tipo_archivo, tamano_archivo, ruta_archivo, fecha_carga) | ACT-01 / MK-03, MK-08 / PRG-04 / PRG-03, PRG-04 / PRG-04, PRG-08 / PRG-04, PRG-07 |
| HU-04 | CA-1: Solo un actor autorizado puede aprobar o rechazar una solicitud en un estado que admita la decisión. <br> CA-2: Al rechazar, se exige el motivo; al aprobar, se registra la decisión y su nuevo estado. <br> CA-3: Cada cambio guarda solicitud, actor, fecha, estado anterior, estado nuevo y acción asociada al historial. | RF-07, RF-26, RF-08 | RN: RN-03, RN-05, RN-07, RN-06 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-05 P1–3; FA-01/02/04. | HistorialSolicitud (id_historial, id_solicitud, id_usuario, id_tipo_accion, id_estado_anterior, id_estado_nuevo, fecha_accion, comentario); EstadoSolicitud (id_estado, nombre); PermisoLaboral (id_permiso, id_solicitud, id_tipo_permiso, id_estado_permiso, fecha_inicio, fecha_fin, motivo); Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro) | ACT-02 / MK-05 / PRG-05 / ACT-01, ACT-02, ACT-03, ACT-04 / Sin PRG directo identificado en la matriz MySQL |
| HU-05 | Antecedentes: <br> Dado que existe una solicitud registrada <br> Y que el tipo de solicitud tiene un responsable definido para iniciar su flujo <br>  <br> Escenario: CA-1 Determinación del responsable <br> Dado que RAD-2026-005 corresponde a un tipo de solicitud con responsable configurado <br> Cuando se inicia el flujo de atención <br> Entonces el sistema determina el responsable correspondiente al tipo de solicitud <br>  <br> Escenario: CA-2 Asociación de la asignación <br> Dado que se determinó el responsable "Carlos Pérez" <br> Cuando se confirma la asignación inicial <br> Entonces la asignación queda asociada a RAD-2026-005 <br> Y Carlos Pérez queda identificado como responsable <br>  <br> Escenario: CA-3 Registro de fecha <br> Dado que la solicitud fue asignada <br> Cuando se consulta la asignación <br> Entonces se muestra el responsable asignado <br> Y se conserva la fecha de asignación <br>  <br> Escenario: CA-4 Solicitud sin responsable disponible <br> Dado que no existe un responsable configurado para el tipo correspondiente <br> Cuando se intenta realizar la asignación inicial <br> Entonces el sistema no asigna un responsable inexistente <br> Y deja la situación identificada para gestión | RF-09 | RN: RN-08 / RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-04 P1–3; FA-01; CU-06 P1–4 (consulta, reasignación y cierre de asignaciones). | AsignacionSolicitud (id_asignacion, id_solicitud, id_usuario_responsable, fecha_asignacion, fecha_fin, motivo, activa); Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro) | ACT-03 / MK-06 / PRG-04 |
| HU-06 | Antecedentes: <br> Dado que existe una solicitud pendiente de atención <br> Y que el límite definido para generar la alerta es superior a tres días sin movimiento <br>  <br> Escenario: CA-1 Alerta después del límite <br> Dado que RAD-2026-006 permanece sin movimiento durante más de tres días <br> Cuando se supera el límite definido <br> Entonces el sistema genera la alerta correspondiente <br> Y la alerta identifica la solicitud y el destinatario <br>  <br> Escenario: CA-2 Sin alerta antes del límite <br> Dado que RAD-2026-007 lleva menos de tres días sin movimiento <br> Cuando se verifica el proceso de alertas <br> Entonces el sistema no genera la alerta por vencimiento del límite <br>  <br> Escenario: CA-3 Identificación de la solicitud <br> Dado que RAD-2026-006 genera una alerta <br> Cuando el destinatario consulta la alerta <br> Entonces puede identificar el número de radicado <br> Y puede identificar que corresponde a una solicitud sin movimiento <br>  <br> Escenario: CA-4 Destinatario correcto <br> Dado que una solicitud tiene un responsable vigente <br> Cuando se genera la alerta <br> Entonces la alerta se dirige al destinatario definido para la atención de la solicitud | RF-10 | RN: RN-11 / RNF: RNF-02, RNF-03, RNF-04 | CU-09 P1–2; FA-01 | Notificacion (id_notificacion, id_usuario, id_solicitud, asunto, mensaje, fecha_envio, leida); Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro) | ACT-03, ACT-05 / MK-07 / PRG-10 |
| HU-07 | Antecedentes: <br> Dado que existe una solicitud de vacaciones pendiente de aprobación <br> Y que el sistema dispone del saldo correspondiente al empleado y período <br>  <br> Escenario: CA-1 Consulta previa a la aprobación <br> Dado que Ana Torres solicita 5 días de vacaciones <br> Cuando el usuario autorizado inicia la validación para aprobar <br> Entonces el sistema consulta el saldo disponible antes de aprobar <br>  <br> Escenario: CA-2 Saldo suficiente <br> Dado que Ana tiene 10 días disponibles y solicita 5 <br> Cuando se valida el saldo <br> Entonces el sistema determina que el saldo es suficiente <br> Y permite continuar con el proceso de aprobación <br>  <br> Escenario: CA-3 Saldo insuficiente <br> Dado que Ana tiene 3 días disponibles y solicita 5 <br> Cuando se valida el saldo <br> Entonces el sistema determina que el saldo es insuficiente <br> Y no permite aprobar la solicitud por falta de saldo <br>  <br> Escenario: CA-4 Período correspondiente <br> Dado que Ana tiene saldos registrados para diferentes períodos <br> Cuando se valida una solicitud de vacaciones <br> Entonces el sistema utiliza el saldo correspondiente al período de la solicitud | RF-11 | RN: RN-05, RN-12 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-05 P2; FA-03 | SaldoVacaciones (id_saldo, id_usuario, periodo, dias_generados, dias_utilizados, fecha_actualizacion); Vacacion (id_vacacion, id_solicitud, id_tipo_vacacion, id_estado_vacacion, fecha_inicio, fecha_fin, motivo) | ACT-03 / MK-05 / PRG-03, PRG-05 |
| HU-08 | Antecedentes: <br> Dado que existe una solicitud de certificado laboral asociada a un empleado <br>  <br> Escenario: CA-1 Generación desde solicitud aprobada <br> Dado que la solicitud RAD-2026-008 está aprobada <br> Cuando el usuario de Talento Humano solicita generar el certificado <br> Entonces el sistema genera el certificado asociado a RAD-2026-008 <br>  <br> Escenario: CA-2 Rechazo de generación sin aprobación <br> Dado que RAD-2026-009 se encuentra pendiente <br> Cuando el usuario intenta generar el certificado <br> Entonces el sistema no genera el documento como certificado aprobado <br> Y conserva el estado de la solicitud <br>  <br> Escenario: CA-3 Asociación del archivo <br> Dado que el certificado fue generado correctamente <br> Cuando se consulta la solicitud RAD-2026-008 <br> Entonces el archivo generado aparece asociado a esa solicitud <br>  <br> Escenario: CA-4 Disponibilidad <br> Dado que existe un certificado generado <br> Cuando el empleado o usuario autorizado consulta la solicitud <br> Entonces el sistema permite acceder al archivo según los permisos definidos | RF-12 | RN: RN-14 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-10 P1–2; FA-01 | CertificadoLaboral (id_certificado, id_solicitud, id_estado_certificado, fecha_generacion, ruta_archivo); EstadoCertificado (id_estado_certificado, nombre); Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro) | ACT-03 / MK-08 / PRG-08 |
| HU-09 | Antecedentes: <br> Dado que el usuario de Talento Humano ha iniciado sesión <br> Y que existen solicitudes registradas <br>  <br> Escenario: CA-1 Búsqueda por radicado existente <br> Dado que existe la solicitud RAD-2026-010 <br> Cuando el usuario busca exactamente RAD-2026-010 <br> Entonces el sistema localiza la solicitud <br> Y muestra información que permite identificarla inequívocamente <br>  <br> Escenario: CA-2 Radicado inexistente <br> Dado que no existe una solicitud con radicado RAD-9999 <br> Cuando el usuario realiza la búsqueda <br> Entonces el sistema no devuelve solicitudes <br> Y muestra que no se encontró coincidencia <br>  <br> Escenario: CA-3 Radicado exacto <br> Dado que existen varios radicados diferentes <br> Cuando el usuario consulta RAD-2026-010 <br> Entonces el resultado corresponde al radicado consultado <br> Y no mezcla información de otros radicados <br>  <br> Escenario: CA-4 Consulta sin modificación <br> Dado que el usuario localiza una solicitud <br> Cuando visualiza el resultado de la búsqueda <br> Entonces la consulta no modifica los datos de la solicitud | RF-14 | RN: RN-23 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07 P1; FA-01 | Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro) | ACT-03 / MK-02 / PRG-11 |
| HU-10 | CA-1: El archivo queda asociado a la solicitud correspondiente y se identifica quién lo cargó y cuándo. <br> CA-2: Se permiten soportes adicionales mientras la solicitud no haya sido procesada. <br> CA-3: El sistema valida el formato y tamaño permitidos antes de aceptar el archivo. | RF-15, RF-33 | RN: RN-17, RN-18, RN-19 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-08 P1–2; FA-01/02. | Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro); Documento (id_documento, id_solicitud, id_usuario_carga, nombre_archivo, tipo_archivo, tamano_archivo, ruta_archivo, fecha_carga) | ACT-01 / MK-03 / PRG-04, PRG-07 / MK-04 / PRG-07 |
| HU-11 | CA-1: El historial se presenta en orden cronológico y corresponde a la solicitud consultada. <br> CA-2: Cuando existan, se muestran la radicación, cambios de estado, asignaciones y cargas documentales, con actor, fecha y detalle registrado. <br> CA-3: El acceso a la información respeta los permisos del usuario. | RF-16, RF-46 | RN: RN-07, RN-28 / RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-13 P1–2; FA-01; CU-13 P1 | HistorialSolicitud (id_historial, id_solicitud, id_usuario, id_tipo_accion, id_estado_anterior, id_estado_nuevo, fecha_accion, comentario); TipoAccion (id_tipo_accion, nombre) | ACT-03 / MK-04 / PRG-09 / MK-11 / Consulta SQL; matriz MySQL |
| HU-12 | Antecedentes: <br> Dado que el empleado tiene una solicitud registrada <br> Y que la solicitud se encuentra en un estado que permite modificación <br>  <br> Escenario: CA-1 Edición de solicitud pendiente <br> Dado que RAD-2026-013 está pendiente <br> Cuando Ana modifica el motivo de la solicitud y guarda los cambios <br> Entonces el sistema actualiza la información <br> Y conserva la solicitud con sus datos modificados <br>  <br> Escenario: CA-2 Solicitud procesada no editable <br> Dado que RAD-2026-014 ya fue aprobada <br> Cuando Ana intenta modificarla <br> Entonces el sistema no permite la edición <br> Y conserva los datos procesados <br>  <br> Escenario: CA-3 Estado no modificable <br> Dado que una solicitud se encuentra en un estado que no permite cambios <br> Cuando el empleado intenta editarla <br> Entonces el sistema bloquea la operación <br>  <br> Escenario: CA-4 Trazabilidad de modificación <br> Dado que una solicitud pendiente fue modificada <br> Cuando se consulta su historial <br> Entonces la modificación queda identificable para conservar la trazabilidad | RF-17 | RN: RN-07, RN-15 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-05 P1,3; FA-01/04 | Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro) | ACT-01 / MK-03 / PRG-05 |
| HU-13 | Antecedentes: <br> Dado que el empleado tiene solicitudes registradas <br> Y que está habilitada la notificación correspondiente <br>  <br> Escenario: CA-1 Notificación por cambio de estado <br> Dado que RAD-2026-015 cambia de Pendiente a Aprobada <br> Cuando se confirma el cambio de estado <br> Entonces el sistema genera la notificación configurada <br> Y la dirige al empleado correspondiente <br>  <br> Escenario: CA-2 Destinatario correcto <br> Dado que RAD-2026-016 pertenece a Ana Torres <br> Cuando se genera una notificación por su cambio de estado <br> Entonces la notificación identifica a Ana como destinataria <br> Y no se presenta como notificación dirigida a otro empleado <br>  <br> Escenario: CA-3 Notificación interna <br> Dado que se genera una notificación interna <br> Cuando Ana consulta sus notificaciones <br> Entonces puede identificar el aviso relacionado con la solicitud <br> Y el sistema conserva su estado de lectura <br>  <br> Escenario: CA-4 Correo configurado <br> Dado que el proceso tiene habilitada la notificación por correo <br> Cuando ocurre el evento que la genera <br> Entonces el sistema utiliza el correo asociado al destinatario | RF-18 | RN: RN-21 / RNF: RNF-02, RNF-03, RNF-04 | CU-09 P2–3; FA-02/03 | Notificacion (id_notificacion, id_usuario, id_solicitud, asunto, mensaje, fecha_envio, leida); Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro) | ACT-01, ACT-05 / MK-07 / PRG-09 |
| HU-14 | Antecedentes: <br> Dado que existen solicitudes con fechas y responsables registrados <br> Y que el usuario de Talento Humano puede consultar reportes <br>  <br> Escenario: CA-1 Consulta por tipo y responsable <br> Dado que existen solicitudes de permiso atendidas por Carlos Pérez <br> Cuando el usuario consulta tiempos por tipo "Permiso laboral" y responsable "Carlos Pérez" <br> Entonces el reporte utiliza esos criterios <br> Y muestra los tiempos registrados para las solicitudes coincidentes <br>  <br> Escenario: CA-2 Uso de tiempos registrados <br> Dado que una solicitud tiene registrado su tiempo de atención <br> Cuando se genera la consulta <br> Entonces el reporte utiliza el tiempo registrado del proceso <br> Y no inventa un valor para la solicitud <br>  <br> Escenario: CA-3 Identificación del período <br> Dado que el usuario consulta el período del 01/10/2026 al 31/10/2026 <br> Cuando genera el reporte <br> Entonces el resultado identifica el período consultado <br>  <br> Escenario: CA-4 Sin coincidencias <br> Dado que no existen solicitudes que cumplan los filtros <br> Cuando se consulta el reporte <br> Entonces el sistema informa que no hay información coincidente | RF-19 | RN: RN-29, RN-30 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14 P1–2; FA-01 | TipoReporte (id_tipo_reporte, nombre); Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro); Reporte (id_reporte, id_tipo_reporte, id_usuario, fecha_generacion, nombre_archivo, ruta_archivo) | ACT-03 / MK-12 / PRG-11 |
| HU-15 | Antecedentes: <br> Dado que existe una solicitud que puede pasar al estado En revisión <br> Y que el usuario de Talento Humano está autorizado <br>  <br> Escenario: CA-1 Cambio a En revisión <br> Dado que RAD-2026-017 está en un estado que permite revisión adicional <br> Cuando el usuario selecciona cambiar a En revisión <br> Entonces la solicitud queda en estado En revisión <br>  <br> Escenario: CA-2 Nota obligatoria <br> Dado que RAD-2026-018 requiere una validación adicional <br> Cuando el usuario intenta cambiarla a En revisión sin registrar una nota <br> Entonces el sistema no ejecuta el cambio <br> Y solicita la nota explicativa <br>  <br> Escenario: CA-3 Nota registrada <br> Dado que el usuario ingresa la nota "Validar soporte adjunto" <br> Cuando confirma el cambio <br> Entonces la nota queda asociada al cambio de estado <br> Y la solicitud queda En revisión <br>  <br> Escenario: CA-4 Historial <br> Dado que la solicitud fue cambiada a En revisión <br> Cuando se consulta su historial <br> Entonces se identifica el cambio de estado <br> Y se conserva la nota explicativa registrada | RF-20, RF-26 | RN: RN-03, RN-07, RN-16 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-05 P1,3; FA-01/02/04 | HistorialSolicitud (id_historial, id_solicitud, id_usuario, id_tipo_accion, id_estado_anterior, id_estado_nuevo, fecha_accion, comentario); EstadoSolicitud (id_estado, nombre); Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro) | ACT-03 / MK-05 / PRG-05 |
| HU-16 | CA-1: La consulta acepta estado, tipo, empleado y rango de fechas, incluidos los filtros de período y estado. <br> CA-2: Los resultados corresponden a los criterios seleccionados y muestran el radicado, tipo, empleado, fecha y estado. <br> CA-3: Si no hay coincidencias, el sistema informa que no se encontraron solicitudes. | RF-21, RF-62 | RN: RN-03, RN-27, RN-30 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07 P1; FA-01/02; CU-14 P1–2 | EstadoSolicitud (id_estado, nombre); TipoSolicitud (id_tipo_solicitud, nombre); Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro); TipoReporte (id_tipo_reporte, nombre); Reporte (id_reporte, id_tipo_reporte, id_usuario, fecha_generacion, nombre_archivo, ruta_archivo); Cargo (id_cargo, nombre); Area (id_area, nombre); Rol (id_rol, nombre) | ACT-03 / MK-02 / PRG-11 / MK-02, MK-12 |
| HU-17 | Antecedentes: <br> Dado que el empleado "Ana Torres" ha iniciado sesión <br>  <br> Escenario: CA-1 Consulta exclusiva del empleado <br> Dado que Ana tiene solicitudes propias y existen solicitudes de otros empleados <br> Cuando consulta su historial personal <br> Entonces el sistema muestra únicamente las solicitudes de Ana Torres <br>  <br> Escenario: CA-2 Fechas y estados <br> Dado que Ana tiene solicitudes con diferentes fechas y estados <br> Cuando consulta su historial <br> Entonces cada solicitud muestra su fecha y estado correspondiente <br>  <br> Escenario: CA-3 Respuestas y comentarios <br> Dado que una solicitud de Ana tiene una respuesta o comentario registrado <br> Cuando consulta su historial <br> Entonces el sistema muestra esa respuesta o comentario junto a la solicitud <br>  <br> Escenario: CA-4 Sin solicitudes <br> Dado que un empleado no tiene solicitudes anteriores <br> Cuando consulta su historial personal <br> Entonces el sistema informa que no existen solicitudes para mostrar | RF-22 | RN: RN-03, RN-24 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07 P2; FA-01/02 | EstadoSolicitud (id_estado, nombre); TipoSolicitud (id_tipo_solicitud, nombre); Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro) | ACT-01 / MK-04 / PRG-11 |
| HU-18 | Antecedentes: <br> Dado que el empleado tiene una solicitud registrada <br> Y que todavía no ha sido aprobada ni rechazada <br>  <br> Escenario: CA-1 Cancelación permitida <br> Dado que RAD-2026-019 se encuentra pendiente <br> Cuando Ana selecciona cancelar la solicitud <br> Entonces el sistema ejecuta la cancelación <br> Y registra la acción realizada <br>  <br> Escenario: CA-2 Solicitud aprobada no cancelable <br> Dado que RAD-2026-020 está aprobada <br> Cuando Ana intenta cancelarla <br> Entonces el sistema no permite la cancelación <br>  <br> Escenario: CA-3 Solicitud rechazada no cancelable <br> Dado que RAD-2026-021 está rechazada <br> Cuando Ana intenta cancelarla <br> Entonces el sistema no permite la cancelación <br>  <br> Escenario: CA-4 Trazabilidad <br> Dado que RAD-2026-019 fue cancelada correctamente <br> Cuando se consulta su historial <br> Entonces la cancelación aparece registrada <br> Y se conserva la información de la acción | RF-23, RF-26 | RN: RN-03, RN-04, RN-07 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-05 P1,3; FA-01/04 | HistorialSolicitud (id_historial, id_solicitud, id_usuario, id_tipo_accion, id_estado_anterior, id_estado_nuevo, fecha_accion, comentario); EstadoSolicitud (id_estado, nombre); Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro) | ACT-01 / MK-04 / PRG-05 |
| HU-19 | Antecedentes: <br> Dado que existe una solicitud con un responsable asignado <br> Y que el usuario de Talento Humano está autorizado para reasignar <br>  <br> Escenario: CA-1 Reasignación a responsable autorizado <br> Dado que RAD-2026-022 está asignada a Carlos Pérez <br> Cuando el usuario la reasigna a Laura Gómez, quien es responsable autorizado <br> Entonces la nueva asignación queda asociada a la solicitud <br>  <br> Escenario: CA-2 Responsable no autorizado <br> Dado que "Usuario no autorizado" no puede recibir solicitudes <br> Cuando se intenta reasignar RAD-2026-022 a ese usuario <br> Entonces el sistema no realiza la reasignación <br>  <br> Escenario: CA-3 Motivo obligatorio <br> Dado que se seleccionó un responsable autorizado <br> Cuando el usuario intenta reasignar sin ingresar motivo <br> Entonces el sistema no completa la reasignación <br> Y solicita el motivo obligatorio <br>  <br> Escenario: CA-4 Registro histórico <br> Dado que la reasignación se realizó con motivo "Distribución de carga" <br> Cuando se consulta el historial de la solicitud <br> Entonces se identifica la reasignación <br> Y se conserva el motivo registrado | RF-24 | RN: RN-07, RN-09, RN-10 / RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-06 P1,3; FA-01 | AsignacionSolicitud (id_asignacion, id_solicitud, id_usuario_responsable, fecha_asignacion, fecha_fin, motivo, activa); HistorialSolicitud (id_historial, id_solicitud, id_usuario, id_tipo_accion, id_estado_anterior, id_estado_nuevo, fecha_accion, comentario) | ACT-03 / MK-06 / PRG-06 |
| HU-20 | Antecedentes: <br> Dado que el gerente tiene permiso para consultar información de gestión <br>  <br> Escenario: CA-1 Selección de período <br> Dado que el gerente desea consultar octubre de 2026 <br> Cuando selecciona el período del 01/10/2026 al 31/10/2026 <br> Entonces el sistema genera el resumen correspondiente a ese período <br>  <br> Escenario: CA-2 Diferenciación por tipo <br> Dado que existen solicitudes de permisos, vacaciones, incapacidades y certificados <br> Cuando el gerente consulta el resumen <br> Entonces la información diferencia los tipos de solicitud <br>  <br> Escenario: CA-3 Correspondencia con el período <br> Dado que existen solicitudes fuera del período seleccionado <br> Cuando se genera el resumen <br> Entonces esas solicitudes no hacen parte del resultado del período consultado <br>  <br> Escenario: CA-4 Período sin información <br> Dado que no existen solicitudes en el período seleccionado <br> Cuando el gerente consulta el resumen <br> Entonces el sistema informa que no existen datos para ese período | RF-25 | RN: RN-29, RN-30 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14 P1–2; FA-01 | TipoReporte (id_tipo_reporte, nombre); Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro); Reporte (id_reporte, id_tipo_reporte, id_usuario, fecha_generacion, nombre_archivo, ruta_archivo) | ACT-04 / MK-12 / PRG-11 |
| HU-21 | Antecedentes: <br> Dado que existe un empleado registrado <br> Y que el usuario de Talento Humano tiene permiso para consultar su información organizacional <br>  <br> Escenario: CA-1 Identificación del empleado <br> Dado que el usuario selecciona a Ana Torres <br> Cuando consulta su perfil organizacional <br> Entonces el sistema identifica que la información corresponde a Ana Torres <br>  <br> Escenario: CA-2 Datos organizacionales disponibles <br> Dado que Ana Torres tiene área "Talento Humano", cargo "Analista" y rol registrado <br> Cuando se consulta su perfil <br> Entonces el sistema muestra el área, cargo y rol registrados <br>  <br> Escenario: CA-3 Información correspondiente <br> Dado que existen otros empleados registrados <br> Cuando el usuario consulta el perfil de Ana Torres <br> Entonces el sistema no mezcla datos organizacionales de otros empleados <br>  <br> Escenario: CA-4 Datos no registrados <br> Dado que un empleado no tiene uno de los datos organizacionales registrados <br> Cuando se consulta el perfil <br> Entonces el sistema muestra los datos disponibles <br> Y no inventa información para el dato faltante | RF-27 | RN: RN-03 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05 | CU-12 P1–2; FA-01/03 | Usuario (id_usuario, nombre, apellido, correo, contrasena_hash, id_cargo, id_area, id_rol, activo); Cargo (id_cargo, nombre); Area (id_area, nombre); Rol (id_rol, nombre) | ACT-03 / MK-10 / PRG-11 |
| HU-22 | Antecedentes: <br> Dado que existe una solicitud registrada <br> Y que el usuario tiene permiso para consultarla <br>  <br> Escenario: CA-1 Radicado <br> Dado que existe RAD-2026-023 <br> Cuando el usuario consulta su detalle <br> Entonces el sistema muestra el radicado RAD-2026-023 <br>  <br> Escenario: CA-2 Información básica <br> Dado que RAD-2026-023 es una solicitud de permiso registrada el 10/10/2026 <br> Cuando se consulta el detalle <br> Entonces se muestran el tipo, la fecha y el estado actual <br>  <br> Escenario: CA-3 Responsable <br> Dado que RAD-2026-023 tiene un responsable vigente <br> Cuando se consulta el detalle <br> Entonces el sistema muestra el responsable actual <br>  <br> Escenario: CA-4 Solicitud inexistente <br> Dado que no existe RAD-9999 <br> Cuando el usuario intenta consultar su detalle <br> Entonces el sistema informa que la solicitud no fue encontrada | RF-28 | RN: RN-23, RN-27 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07 P2; FA-03 | EstadoSolicitud (id_estado, nombre); TipoSolicitud (id_tipo_solicitud, nombre); Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro) | ACT-01 / MK-04 / PRG-11 |
| HU-23 | Antecedentes: <br> Dado que existe una solicitud con asignaciones registradas <br>  <br> Escenario: CA-1 Responsable vigente <br> Dado que RAD-2026-024 tiene como responsable vigente a Carlos Pérez <br> Cuando el usuario consulta el responsable actual <br> Entonces el sistema identifica a Carlos Pérez como responsable vigente <br>  <br> Escenario: CA-2 Correspondencia con la solicitud <br> Dado que existen asignaciones de varias solicitudes <br> Cuando se consulta RAD-2026-024 <br> Entonces se muestra únicamente la asignación correspondiente a esa solicitud <br>  <br> Escenario: CA-3 Asignación finalizada <br> Dado que una asignación anterior de RAD-2026-024 fue finalizada <br> Cuando se consulta el responsable actual <br> Entonces la asignación finalizada no aparece como vigente <br>  <br> Escenario: CA-4 Sin responsable vigente <br> Dado que una solicitud no tiene una asignación vigente <br> Cuando se consulta su responsable actual <br> Entonces el sistema informa que no existe responsable vigente | RF-29 | RN: RN-26 / RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-06 P1; FA-02 | AsignacionSolicitud (id_asignacion, id_solicitud, id_usuario_responsable, fecha_asignacion, fecha_fin, motivo, activa); HistorialSolicitud (id_historial, id_solicitud, id_usuario, id_tipo_accion, id_estado_anterior, id_estado_nuevo, fecha_accion, comentario); Usuario (id_usuario, nombre, apellido, correo, contrasena_hash, id_cargo, id_area, id_rol, activo) | ACT-01 / MK-06 / PRG-06 |
| HU-24 | Antecedentes: <br> Dado que una solicitud tiene una o más asignaciones o reasignaciones registradas <br>  <br> Escenario: CA-1 Consulta de asignaciones <br> Dado que RAD-2026-025 fue asignada inicialmente a Carlos Pérez y posteriormente a Laura Gómez <br> Cuando se consulta el historial de asignaciones <br> Entonces se muestran las asignaciones asociadas a RAD-2026-025 <br>  <br> Escenario: CA-2 Diferenciación de estados <br> Dado que la asignación de Carlos Pérez fue finalizada y la de Laura Gómez está vigente <br> Cuando se consulta el historial <br> Entonces se distinguen la asignación finalizada y la vigente <br>  <br> Escenario: CA-3 Fechas de asignación <br> Dado que cada asignación tiene una fecha registrada <br> Cuando se consulta el historial <br> Entonces el sistema muestra la fecha correspondiente a cada asignación <br>  <br> Escenario: CA-4 Solicitud sin asignaciones <br> Dado que una solicitud no tiene asignaciones registradas <br> Cuando se consulta su historial de asignaciones <br> Entonces el sistema informa que no existen asignaciones históricas | RF-30 | RN: RN-26 / RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-06 P1–2; FA-02/04 | AsignacionSolicitud (id_asignacion, id_solicitud, id_usuario_responsable, fecha_asignacion, fecha_fin, motivo, activa); HistorialSolicitud (id_historial, id_solicitud, id_usuario, id_tipo_accion, id_estado_anterior, id_estado_nuevo, fecha_accion, comentario); Usuario (id_usuario, nombre, apellido, correo, contrasena_hash, id_cargo, id_area, id_rol, activo) | ACT-03 / MK-06 / PRG-06 |
| HU-25 | Antecedentes: <br> Dado que existe una asignación vigente asociada a una solicitud <br> Y que el usuario de Talento Humano está autorizado <br>  <br> Escenario: CA-1 Finalización de asignación <br> Dado que Carlos Pérez tiene la asignación vigente de RAD-2026-026 <br> Cuando el usuario finaliza la asignación <br> Entonces la asignación queda marcada como finalizada <br>  <br> Escenario: CA-2 Registro de fecha de finalización <br> Dado que la asignación está vigente <br> Cuando se confirma su finalización <br> Entonces el sistema registra la fecha de finalización <br>  <br> Escenario: CA-3 Deja de estar activa <br> Dado que la asignación de Carlos Pérez fue finalizada <br> Cuando se consulta el responsable vigente de RAD-2026-026 <br> Entonces Carlos Pérez ya no aparece como responsable activo <br>  <br> Escenario: CA-4 Asignación ya finalizada <br> Dado que una asignación ya está finalizada <br> Cuando se intenta finalizar nuevamente <br> Entonces el sistema no la trata como una asignación vigente | RF-31 | RN: RN-26 / RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-06 P3; FA-03 | AsignacionSolicitud (id_asignacion, id_solicitud, id_usuario_responsable, fecha_asignacion, fecha_fin, motivo, activa) | ACT-03 / MK-06 / PRG-06 |
| HU-26 | Antecedentes: <br> Dado que existe una asignación o reasignación con motivo registrado <br>  <br> Escenario: CA-1 Consulta del motivo <br> Dado que la asignación de RAD-2026-027 tiene el motivo "Distribución de carga" <br> Cuando el usuario consulta el motivo <br> Entonces el sistema muestra "Distribución de carga" <br>  <br> Escenario: CA-2 Motivo asociado a la asignación <br> Dado que RAD-2026-027 tiene varias asignaciones con motivos diferentes <br> Cuando se consulta una asignación específica <br> Entonces el motivo mostrado corresponde a esa asignación <br>  <br> Escenario: CA-3 Asignación sin motivo <br> Dado que una asignación no tiene un motivo registrado <br> Cuando se consulta su motivo <br> Entonces el sistema informa que no existe motivo registrado <br>  <br> Escenario: CA-4 Consulta sin modificación <br> Dado que existe una asignación con motivo registrado <br> Cuando el usuario consulta el motivo <br> Entonces la asignación permanece sin cambios | RF-32 | RN: RN-10 / RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-06 P2; FA-04 | AsignacionSolicitud (id_asignacion, id_solicitud, id_usuario_responsable, fecha_asignacion, fecha_fin, motivo, activa); HistorialSolicitud (id_historial, id_solicitud, id_usuario, id_tipo_accion, id_estado_anterior, id_estado_nuevo, fecha_accion, comentario); Usuario (id_usuario, nombre, apellido, correo, contrasena_hash, id_cargo, id_area, id_rol, activo) | ACT-03 / MK-06 / PRG-06 |
| HU-27 | Antecedentes: <br> Dado que existe una solicitud con documentos adjuntos <br> Y que el usuario tiene permiso para consultarlos <br>  <br> Escenario: CA-1 Consulta de documentos <br> Dado que RAD-2026-029 tiene dos documentos asociados <br> Cuando el usuario consulta sus documentos adjuntos <br> Entonces el sistema muestra los documentos asociados a RAD-2026-029 <br>  <br> Escenario: CA-2 Información del documento <br> Dado que existe un documento llamado "Soporte.pdf" <br> Cuando se consulta la lista de documentos <br> Entonces se identifica su nombre, tipo y fecha de carga <br>  <br> Escenario: CA-3 Documento de otra solicitud <br> Dado que existen documentos asociados a diferentes solicitudes <br> Cuando se consulta RAD-2026-029 <br> Entonces el sistema no muestra documentos pertenecientes a otra solicitud <br>  <br> Escenario: CA-4 Consulta sin modificación <br> Dado que existen documentos asociados <br> Cuando el usuario los consulta <br> Entonces el contenido y los registros de los archivos no se modifican | RF-34 | RN: RN-17, RN-19 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-08 P3; FA-02/03 | Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro); Documento (id_documento, id_solicitud, id_usuario_carga, nombre_archivo, tipo_archivo, tamano_archivo, ruta_archivo, fecha_carga) | ACT-03 / MK-04 / PRG-07 |
| HU-28 | Antecedentes: <br> Dado que el empleado está adjuntando un documento a una solicitud <br>  <br> Escenario: CA-1 Formato válido <br> Dado que el archivo "Soporte.pdf" tiene un formato permitido <br> Cuando el empleado intenta adjuntarlo <br> Entonces el sistema acepta la validación de formato <br>  <br> Escenario: CA-2 Formato inválido <br> Dado que el archivo "Soporte.exe" no corresponde a un formato permitido <br> Cuando el empleado intenta adjuntarlo <br> Entonces el sistema informa que el formato no es válido <br> Y no almacena el archivo como soporte válido <br>  <br> Escenario: CA-3 Tamaño máximo <br> Dado que el archivo supera el tamaño máximo permitido <br> Cuando el empleado intenta cargarlo <br> Entonces el sistema informa que el tamaño no es válido <br> Y no almacena el archivo como soporte válido <br>  <br> Escenario: CA-4 Validación exitosa <br> Dado que el archivo cumple formato y tamaño <br> Cuando se ejecutan las validaciones <br> Entonces el archivo puede continuar al proceso de almacenamiento como soporte válido | RF-35 | RN: RN-18 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-08 P1; FA-01 | Documento (id_documento, id_solicitud, id_usuario_carga, nombre_archivo, tipo_archivo, tamano_archivo, ruta_archivo, fecha_carga) | ACT-01 / MK-03 / PRG-07 |
| HU-29 | CA-1: El permiso muestra fechas, tipo, estado y motivo. <br> CA-2: Las vacaciones muestran fechas, días calculados, modalidad, estado y motivo. <br> CA-3: La incapacidad muestra fechas, tipo u origen, estado, observación y soporte médico cuando esté asociado. <br> CA-4: El sistema solo muestra los datos que corresponden al tipo de trámite y a los permisos del usuario. | RF-36, RF-37, RF-38 | RN: RN-12, RN-13, RN-17 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07 P2; FA-03 | PermisoLaboral (id_permiso, id_solicitud, id_tipo_permiso, id_estado_permiso, fecha_inicio, fecha_fin, motivo); EstadoPermiso (id_estado_permiso, nombre); TipoPermiso (id_tipo_permiso, nombre); EstadoVacacion (id_estado_vacacion, nombre); TipoVacacion (id_tipo_vacacion, nombre); Vacacion (id_vacacion, id_solicitud, id_tipo_vacacion, id_estado_vacacion, fecha_inicio, fecha_fin, motivo); EstadoIncapacidad (id_estado_incapacidad, nombre); TipoIncapacidad (id_tipo_incapacidad, nombre); Incapacidad (id_incapacidad, id_solicitud, id_tipo_incapacidad, id_estado_incapacidad, fecha_inicio, fecha_fin, observacion) | ACT-01 / MK-04 / Consulta SQL; matriz MySQL / PRG-03 / ACT-03 |
| HU-30 | CA-1: El sistema informa el estado vigente del certificado. <br> CA-2: Cuando el certificado esté generado, permite consultar y descargar el archivo asociado. <br> CA-3: Si aún no está disponible, indica el estado sin presentar un archivo inexistente. | RF-39, RF-40 | RN: RN-14 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-10 P3; FA-02 | CertificadoLaboral (id_certificado, id_solicitud, id_estado_certificado, fecha_generacion, ruta_archivo); EstadoCertificado (id_estado_certificado, nombre) | ACT-01 / MK-08 / PRG-08 |
| HU-31 | CA-1: El empleado consulta únicamente sus notificaciones, con asunto, fecha y contenido. <br> CA-2: Puede marcar individualmente una notificación como leída. <br> CA-3: El estado de lectura se conserva y se refleja al volver a consultar. | RF-41, RF-42 | RN: RN-21, RN-22 / RNF: RNF-02, RNF-03, RNF-04 | CU-09 P3; FA-03 | Notificacion (id_notificacion, id_usuario, id_solicitud, asunto, mensaje, fecha_envio, leida) | ACT-01 / MK-07 / PRG-09 |
| HU-32 | CA-1: Antes de radicar, el empleado puede consultar los tipos de solicitud disponibles. <br> CA-2: El personal autorizado puede consultar los estados válidos y su significado operativo. <br> CA-3: La consulta presenta los valores definidos por los catálogos vigentes. | RF-44, RF-45 | RN: RN-03 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05 | CU-12 P1–2; FA-02 | TipoSolicitud (id_tipo_solicitud, nombre); EstadoSolicitud (id_estado, nombre) | ACT-01 / MK-10 / Consulta SQL; matriz MySQL / ACT-03 |
| HU-33 | CA-1: La consulta permite filtrar por usuario y rango de fechas; cuando se requiera, también por dirección IP y resultado. <br> CA-2: Cada resultado muestra fecha del intento, resultado y dirección IP registrada. <br> CA-3: La consulta no permite alterar los registros de acceso. | RF-47, RF-60 | RN: RN-27 / RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-13 P1; FA-01/02; CU-13 P1–2 | RegistroAcceso (id_acceso, id_usuario, fecha_intento, exitoso, direccion_ip); Usuario (id_usuario, nombre, apellido, correo, contrasena_hash, id_cargo, id_area, id_rol, activo) | ACT-03 / MK-11 / PRG-01 / PRG-01, PRG-11 |
| HU-34 | CA-1: La consulta permite filtrar eventos por usuario operador, tabla afectada y período. <br> CA-2: Cada evento muestra acción, usuario y fecha registrados. <br> CA-3: Cuando existe un detalle asociado, se muestran el campo modificado y sus valores anterior y nuevo. | RF-48, RF-49, RF-61 | RN: RN-27, RN-28 / RNF: RNF-01, RNF-02, RNF-03, RNF-06 | CU-13 P1; FA-01/02; CU-13 P2–3; FA-01/02/03; CU-13 P1–2 | AuditoriaSistema (id_auditoria, id_usuario, tabla_afectada, accion_realizada, fecha_accion); Usuario (id_usuario, nombre, apellido, correo, contrasena_hash, id_cargo, id_area, id_rol, activo); DetalleAuditoria (id_detalle, id_auditoria, campo_modificado, valor_anterior, valor_nuevo) | ACT-04 / MK-11 / PRG-09 / ACT-03 / PRG-09, PRG-11 |
| HU-35 | Antecedentes: <br> Dado que existe información de saldo de vacaciones para empleados y períodos <br>  <br> Escenario: CA-1 Selección de empleado y período <br> Dado que el usuario selecciona a Ana Torres y el período 2026 <br> Cuando consulta el saldo <br> Entonces el sistema identifica a Ana Torres y el período 2026 <br>  <br> Escenario: CA-2 Días generados y utilizados <br> Dado que Ana tiene 15 días generados y 5 utilizados <br> Cuando consulta el saldo del período <br> Entonces el sistema muestra 15 días generados <br> Y muestra 5 días utilizados <br>  <br> Escenario: CA-3 Único saldo por empleado y período <br> Dado que existe un saldo para Ana Torres y el período 2026 <br> Cuando se consulta ese período <br> Entonces el sistema presenta el saldo correspondiente a esa combinación <br>  <br> Escenario: CA-4 Período sin saldo <br> Dado que no existe saldo registrado para el período consultado <br> Cuando se realiza la consulta <br> Entonces el sistema informa que no existe información de saldo para ese período | RF-50 | RN: RN-12, RN-30 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-11 P1–2; FA-01/02 | SaldoVacaciones (id_saldo, id_usuario, periodo, dias_generados, dias_utilizados, fecha_actualizacion) | ACT-03 / MK-09 / PRG-03 |
| HU-36 | Antecedentes: <br> Dado que el empleado "Ana Torres" tiene información de saldo de vacaciones <br>  <br> Escenario: CA-1 Cálculo de disponibilidad <br> Dado que Ana tiene 15 días generados y 5 utilizados <br> Cuando consulta sus días disponibles <br> Entonces el sistema calcula la disponibilidad a partir de esos valores <br>  <br> Escenario: CA-2 Período correspondiente <br> Dado que Ana tiene saldos correspondientes a diferentes períodos <br> Cuando consulta un período específico <br> Entonces la disponibilidad corresponde al período consultado <br>  <br> Escenario: CA-3 Consulta sin modificación <br> Dado que existe un saldo de vacaciones registrado <br> Cuando Ana consulta sus días disponibles <br> Entonces la consulta no modifica el saldo <br>  <br> Escenario: CA-4 Sin información de saldo <br> Dado que no existe saldo para el período consultado <br> Cuando Ana consulta sus días disponibles <br> Entonces el sistema informa que no hay información disponible para calcular la disponibilidad | RF-51 | RN: RN-12 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-11 P1–2; FA-01/02 | SaldoVacaciones (id_saldo, id_usuario, periodo, dias_generados, dias_utilizados, fecha_actualizacion) | ACT-01 / MK-09 / PRG-03 |
| HU-37 | Antecedentes: <br> Dado que existen reportes de gestión previamente generados <br> Y que el usuario está autorizado para consultarlos <br>  <br> Escenario: CA-1 Identificación del tipo <br> Dado que existe un reporte de tiempos de respuesta <br> Cuando el usuario consulta los reportes generados <br> Entonces el sistema identifica el tipo del reporte <br>  <br> Escenario: CA-2 Fecha de generación <br> Dado que el reporte fue generado el 20/10/2026 <br> Cuando el usuario consulta sus datos <br> Entonces se muestra la fecha de generación <br>  <br> Escenario: CA-3 Usuario autorizado <br> Dado que el reporte está disponible para un usuario autorizado <br> Cuando ese usuario lo consulta <br> Entonces el sistema permite acceder al reporte <br>  <br> Escenario: CA-4 Reporte no disponible para el usuario <br> Dado que un reporte no corresponde al usuario autorizado <br> Cuando intenta consultarlo <br> Entonces el sistema no lo presenta como disponible para ese usuario | RF-52 | RN: RN-27, RN-30 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14 P1,3; FA-01 | TipoReporte (id_tipo_reporte, nombre); Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro); Reporte (id_reporte, id_tipo_reporte, id_usuario, fecha_generacion, nombre_archivo, ruta_archivo); Cargo (id_cargo, nombre); Area (id_area, nombre); Rol (id_rol, nombre) | ACT-04 / MK-12 / PRG-11 |
| HU-38 | CA-1: El usuario selecciona el criterio disponible: tipo de solicitud, responsable o período. <br> CA-2: El reporte presenta los datos que corresponden al criterio seleccionado y al intervalo indicado. <br> CA-3: Si no hay datos para los filtros, el sistema informa que el resultado está vacío. | RF-53, RF-54, RF-56 | RN: RN-27, RN-29, RN-30 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14 P1–2; FA-01/02 | TipoReporte (id_tipo_reporte, nombre); Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro); Reporte (id_reporte, id_tipo_reporte, id_usuario, fecha_generacion, nombre_archivo, ruta_archivo) | ACT-03 / MK-12 / PRG-11 / ACT-04 |
| HU-39 | Antecedentes: <br> Dado que existe un reporte de gestión consultado <br> Y que el formato de exportación está habilitado <br>  <br> Escenario: CA-1 Exportación habilitada <br> Dado que el reporte RAD-REP-001 está disponible <br> Cuando el usuario selecciona un formato habilitado <br> Entonces el sistema genera el archivo de exportación <br>  <br> Escenario: CA-2 Reporte correspondiente <br> Dado que el usuario está consultando el reporte de solicitudes de octubre <br> Cuando selecciona exportar <br> Entonces el archivo corresponde al reporte consultado <br>  <br> Escenario: CA-3 Conservación de información <br> Dado que el reporte contiene resultados y filtros <br> Cuando se exporta <br> Entonces el archivo conserva la información del resultado <br>  <br> Escenario: CA-4 Formato no habilitado <br> Dado que un formato no está habilitado <br> Cuando el usuario intenta exportar en ese formato <br> Entonces el sistema no realiza una exportación en ese formato | RF-55 | RN: RN-27 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14 P3; FA-02/03 | Reporte (id_reporte, id_tipo_reporte, id_usuario, fecha_generacion, nombre_archivo, ruta_archivo) | ACT-03 / MK-12 / PRG-11 |
| HU-40 | CA-1: La consulta admite cada criterio organizacional definido: área, cargo o rol. <br> CA-2: Los resultados muestran únicamente las solicitudes vinculadas al criterio seleccionado. <br> CA-3: El sistema respeta los permisos de consulta del usuario. | RF-57, RF-58, RF-59 | RN: RN-27, RN-29 / RNF: RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14 P1–2; FA-01/02 | TipoReporte (id_tipo_reporte, nombre); Solicitud (id_solicitud, radicado, id_usuario, id_tipo_solicitud, id_estado, fecha_registro); Reporte (id_reporte, id_tipo_reporte, id_usuario, fecha_generacion, nombre_archivo, ruta_archivo); Cargo (id_cargo, nombre); Area (id_area, nombre); Rol (id_rol, nombre) | ACT-04 / MK-12 / PRG-11 / ACT-03 |
