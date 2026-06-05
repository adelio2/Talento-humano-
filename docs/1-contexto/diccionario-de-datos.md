#  Diccionario de Datos.

## 17.1 Entidad Solicitud

| Atributo | Tipo de Dato | Descripción | Restricción |
|-----------|-------------|-------------|-------------|
| id_solicitud | Entero | Identificador único de la solicitud | PK, Obligatorio |
| radicado | Cadena (20) | Número único generado automáticamente | Único, Obligatorio |
| fecha_registro | FechaHora | Fecha de creación de la solicitud | Obligatorio |
| descripcion | Texto | Detalle de la solicitud realizada | Obligatorio |
| id_tipo | Entero | Tipo de solicitud asociada | FK |
| id_estado | Entero | Estado actual de la solicitud | FK |
| id_empleado | Entero | Empleado que registra la solicitud | FK |
| observaciones | Texto | Comentarios adicionales | Opcional |

---

## 17.2 Entidad Tipo

| Atributo | Tipo de Dato | Descripción | Restricción |
|-----------|-------------|-------------|-------------|
| id_tipo | Entero | Identificador del tipo de solicitud | PK |
| nombre_tipo | Cadena (50) | Nombre del tipo de solicitud | Obligatorio |
| descripcion | Texto | Descripción del tipo | Opcional |

### Valores permitidos

- Permiso Laboral
- Vacaciones
- Incapacidad Médica
- Certificado Laboral

---

## 17.3 Entidad Estado

| Atributo | Tipo de Dato | Descripción | Restricción |
|-----------|-------------|-------------|-------------|
| id_estado | Entero | Identificador del estado | PK |
| nombre_estado | Cadena (30) | Nombre del estado | Obligatorio |
| descripcion | Texto | Descripción del estado | Opcional |

### Valores permitidos

- Pendiente
- En Revisión
- Aprobada
- Rechazada
- Cancelada

---

## 17.4 Entidad Historial

| Atributo | Tipo de Dato | Descripción | Restricción |
|-----------|-------------|-------------|-------------|
| id_historial | Entero | Identificador del registro histórico | PK |
| id_solicitud | Entero | Solicitud asociada | FK |
| fecha_evento | FechaHora | Fecha del cambio realizado | Obligatorio |
| usuario_responsable | Cadena (100) | Usuario que realizó la acción | Obligatorio |
| accion_realizada | Cadena (100) | Acción ejecutada | Obligatorio |
| observacion | Texto | Comentario asociado al cambio | Opcional |

---

## 17.5 Entidad Adjunto

| Atributo | Tipo de Dato | Descripción | Restricción |
|-----------|-------------|-------------|-------------|
| id_adjunto | Entero | Identificador del archivo | PK |
| id_solicitud | Entero | Solicitud relacionada | FK |
| nombre_archivo | Cadena (150) | Nombre del documento cargado | Obligatorio |
| ruta_archivo | Cadena (255) | Ubicación del archivo | Obligatorio |
| fecha_carga | FechaHora | Fecha de carga del archivo | Obligatorio |

---

## 17.6 Entidad Notificación

| Atributo | Tipo de Dato | Descripción | Restricción |
|-----------|-------------|-------------|-------------|
| id_notificacion | Entero | Identificador de la notificación | PK |
| id_solicitud | Entero | Solicitud relacionada | FK |
| destinatario | Cadena (100) | Correo del destinatario | Obligatorio |
| asunto | Cadena (150) | Asunto del mensaje | Obligatorio |
| fecha_envio | FechaHora | Fecha de envío | Obligatorio |
| estado_envio | Cadena (20) | Resultado del envío | Obligatorio |

---

## 17.7 Entidad Certificado

| Atributo | Tipo de Dato | Descripción | Restricción |
|-----------|-------------|-------------|-------------|
| id_certificado | Entero | Identificador del certificado | PK |
| id_solicitud | Entero | Solicitud asociada | FK |
| fecha_generacion | FechaHora | Fecha de generación | Obligatorio |
| tipo_certificado | Cadena (50) | Tipo de certificado emitido | Obligatorio |
| ruta_documento | Cadena (255) | Ubicación del archivo generado | Obligatorio |
