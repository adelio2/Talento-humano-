# Requisitos Funcionales (RF)

Los Requisitos Funcionales se derivan directamente de las Historias de Usuario y de las reglas de negocio que deben vigilar. Se mantiene la trazabilidad HU → RF → RN y se evita crear requisitos separados cuando dos historias expresan la misma capacidad funcional.

La numeración conserva la trazabilidad existente del proyecto. El código RF-22 no se asigna porque no corresponde a una capacidad funcional independiente sustentada por las HU; se evita así introducir un requisito redundante únicamente para completar la secuencia.

| Código | Descripción | HU origen | RN que vigila |
| --- | --- | --- | --- |
| RF-01 | El sistema debe permitir al usuario iniciar sesión mediante sus credenciales y habilitar únicamente las funciones correspondientes al rol asignado. | HU-01 | Ninguna |
| RF-02 | El sistema debe permitir solicitar la recuperación de contraseña usando el correo registrado y un mecanismo temporal que permita restablecer el acceso cuando sea válido. | HU-02 | RN-20 |
| RF-03 | El sistema debe permitir registrar una solicitud de permiso laboral con la información requerida, asociarla al empleado y generar su radicado y estado inicial. | HU-03 | RN-01, RN-23 |
| RF-04 | El sistema debe permitir registrar una solicitud de vacaciones con fechas, motivo, empleado asociado y duración correspondiente al período solicitado. | HU-04 | RN-01, RN-13, RN-23 |
| RF-05 | El sistema debe permitir registrar una solicitud de certificado laboral, asociarla al empleado y generar el radicado y estado inicial correspondientes. | HU-05 | RN-01, RN-23 |
| RF-06 | El sistema debe permitir registrar una incapacidad médica con sus fechas, tipo y soporte clínico requerido, asociándola al empleado y a la solicitud. | HU-06 | RN-01, RN-02, RN-23 |
| RF-07 | El sistema debe permitir a un usuario autorizado aprobar una solicitud cuando su estado permita la aprobación y registrar la decisión en el historial. | HU-07 | RN-03, RN-05, RN-07 |
| RF-08 | El sistema debe permitir a un usuario autorizado rechazar una solicitud registrando el motivo obligatorio y dejando la decisión en el historial. | HU-08 | RN-03, RN-06, RN-07 |
| RF-09 | El sistema debe asignar un responsable inicial autorizado de acuerdo con el tipo de solicitud y conservar la asignación asociada al trámite. | HU-09 | RN-08 |
| RF-10 | El sistema debe identificar solicitudes que permanezcan más de tres días sin movimiento y generar la alerta correspondiente para su atención. | HU-10 | RN-11 |
| RF-11 | El sistema debe consultar y validar el saldo disponible de vacaciones antes de permitir la aprobación de una solicitud de vacaciones. | HU-11 | RN-05, RN-12 |
| RF-12 | El sistema debe generar el certificado laboral asociado a una solicitud aprobada y dejar disponible el documento generado para su consulta. | HU-12 | RN-15 |
| RF-13 | El sistema debe generar un número de radicado para cada solicitud registrada, de manera que pueda identificarse de forma específica. | HU-13 | RN-23 |
| RF-14 | El sistema debe permitir localizar una solicitud mediante su número de radicado y mostrar el resultado correspondiente cuando exista. | HU-13 | RN-23 |
| RF-15 | El sistema debe permitir asociar un documento de soporte a una solicitud, registrar quién y cuándo lo cargó y conservarlo como soporte de la solicitud. | HU-14 | RN-17, RN-18, RN-19 |
| RF-16 | El sistema debe permitir consultar las acciones y cambios registrados sobre una solicitud, identificando usuario, acción y fecha y mostrando cambios de estado cuando correspondan. | HU-15 | RN-07, RN-28 |
| RF-17 | El sistema debe permitir al empleado modificar una solicitud mientras se encuentre en un estado modificable y conservar la trazabilidad de la modificación. | HU-16 | RN-07, RN-15 |
| RF-18 | El sistema debe generar y entregar al empleado las notificaciones configuradas cuando ocurran eventos relacionados con sus solicitudes. | HU-17 | RN-21 |
| RF-19 | El sistema debe permitir consultar tiempos de respuesta de las solicitudes utilizando los criterios de tipo, responsable y período seleccionados. | HU-18 | RN-29, RN-30 |
| RF-20 | El sistema debe permitir a un usuario autorizado cambiar una solicitud al estado En revisión registrando la nota explicativa requerida y el cambio en el historial. | HU-19 | RN-03, RN-07, RN-16 |
| RF-21 | El sistema debe permitir consultar solicitudes según los filtros definidos y, para la consulta personal, mostrar únicamente las solicitudes asociadas al empleado consultante. | HU-20, HU-21 | RN-03, RN-24, RN-27 |
| RF-23 | El sistema debe permitir al empleado cancelar una solicitud que todavía no haya sido aprobada ni rechazada y registrar la cancelación en el historial. | HU-22 | RN-03, RN-04, RN-07 |
| RF-24 | El sistema debe permitir reasignar una solicitud a un responsable autorizado, exigir el motivo de reasignación y conservar la evidencia de la operación. | HU-23 | RN-07, RN-09, RN-10 |
| RF-25 | El sistema debe permitir consultar un resumen de solicitudes por tipo y período, mostrando únicamente la información correspondiente a los criterios seleccionados. | HU-24 | RN-29, RN-30 |
| RF-26 | El sistema debe registrar cada cambio de estado de una solicitud con la información necesaria para mantener su trazabilidad. | HU-15 | RN-07 |
| RF-27 | El sistema debe permitir consultar el área, cargo y rol correspondientes al empleado seleccionado, sin mezclar información de otros empleados. | HU-25 | RN-25, RN-27 |
| RF-28 | El sistema debe permitir consultar el detalle de una solicitud mostrando su radicado, tipo, fecha, estado y responsable cuando exista. | HU-26 | RN-23, RN-27 |
| RF-29 | El sistema debe mostrar el responsable vigente de una solicitud y distinguirlo de asignaciones que ya hayan finalizado. | HU-27 | RN-26 |
| RF-30 | El sistema debe permitir consultar las asignaciones realizadas sobre una solicitud, incluyendo la información necesaria para identificar su secuencia. | HU-28 | RN-26 |
| RF-31 | El sistema debe permitir finalizar una asignación de una solicitud y conservar la información necesaria para distinguirla de la asignación vigente. | HU-29 | RN-26 |
| RF-32 | El sistema debe permitir consultar el motivo registrado para una asignación o reasignación cuando este exista. | HU-30 | RN-10 |
| RF-33 | El sistema debe permitir agregar documentos adicionales a una solicitud y asociarlos correctamente al trámite. | HU-31 | RN-17, RN-18, RN-19 |
| RF-34 | El sistema debe permitir consultar los documentos asociados a una solicitud, identificando la información disponible de cada soporte. | HU-32 | RN-17, RN-19 |
| RF-35 | El sistema debe validar el formato y tamaño permitido de un archivo antes de almacenarlo como soporte válido. | HU-33 | RN-18 |
| RF-36 | El sistema debe permitir consultar el detalle de un permiso laboral mostrando fechas, motivo, tipo y estado del trámite. | HU-34 | Ninguna |
| RF-37 | El sistema debe permitir consultar el detalle de una solicitud de vacaciones mostrando fechas, duración, tipo, estado y saldo disponible cuando corresponda. | HU-35 | RN-13, RN-12 |
| RF-38 | El sistema debe permitir consultar el detalle de una incapacidad mostrando fechas, tipo, estado, observación y soporte asociado cuando exista. | HU-36 | RN-17 |
| RF-39 | El sistema debe permitir consultar el certificado laboral generado y su asociación con la solicitud correspondiente. | HU-37 | RN-15 |
| RF-40 | El sistema debe permitir consultar el estado del certificado laboral de acuerdo con el estado real de la solicitud y del documento generado. | HU-38 | RN-15 |
| RF-41 | El sistema debe permitir al usuario consultar sus notificaciones internas y visualizar únicamente las que le correspondan. | HU-39 | RN-21 |
| RF-42 | El sistema debe permitir marcar una notificación como leída modificando únicamente su estado de lectura. | HU-40 | RN-22 |
| RF-43 | El sistema debe permitir solicitar un nuevo mecanismo de recuperación cuando el anterior no sea utilizable y generar uno vigente para el proceso. | HU-41 | RN-20 |
| RF-44 | El sistema debe permitir consultar los tipos de solicitud disponibles para identificar las opciones de trámite que pueden registrarse. | HU-42 | Ninguna |
| RF-45 | El sistema debe permitir consultar los estados de solicitud utilizados por el sistema. | HU-43 | RN-03 |
| RF-46 | El sistema debe permitir consultar las acciones registradas en el historial de una solicitud, identificando la acción, usuario y fecha. | HU-44 | RN-07 |
| RF-47 | El sistema debe permitir a un usuario autorizado consultar los registros de acceso disponibles, incluyendo fecha, resultado y dirección IP cuando estén registrados. | HU-45 | RN-27 |
| RF-48 | El sistema debe permitir a un usuario autorizado consultar las operaciones auditadas, identificando usuario, entidad, operación y fecha. | HU-46 | RN-27, RN-28 |
| RF-49 | El sistema debe permitir consultar el detalle de un cambio auditado, incluyendo campo modificado y valores anterior y nuevo cuando estén registrados. | HU-47 | RN-27, RN-28 |
| RF-50 | El sistema debe permitir consultar el saldo de vacaciones correspondiente a un período seleccionado. | HU-48 | RN-12, RN-30 |
| RF-51 | El sistema debe permitir consultar los días de vacaciones disponibles del empleado a partir del saldo correspondiente. | HU-49 | RN-12 |
| RF-52 | El sistema debe permitir consultar los reportes generados y mostrar el reporte correspondiente al usuario autorizado. | HU-50 | RN-27, RN-30 |
| RF-53 | El sistema debe permitir generar un reporte utilizando el tipo de solicitud seleccionado y diferenciar los resultados por dicho criterio. | HU-51 | RN-27, RN-29 |
| RF-54 | El sistema debe permitir generar un reporte utilizando un responsable como criterio y relacionar los resultados con las asignaciones registradas. | HU-52 | RN-27, RN-29, RN-30 |
| RF-55 | El sistema debe permitir exportar un reporte de gestión y conservar en el archivo la información correspondiente al resultado consultado. | HU-53 | RN-27 |
| RF-56 | El sistema debe permitir generar un reporte consolidado para un período seleccionado, incluyendo los tipos de solicitud definidos para el reporte. | HU-54 | RN-27, RN-29, RN-30 |
| RF-57 | El sistema debe permitir consultar solicitudes filtrando por el área organizacional seleccionada y mostrar únicamente los resultados que correspondan al filtro. | HU-55 | RN-27, RN-29 |
| RF-58 | El sistema debe permitir consultar solicitudes filtrando por el cargo seleccionado y mostrar únicamente los resultados que correspondan al filtro. | HU-56 | RN-27, RN-29 |
| RF-59 | El sistema debe permitir consultar solicitudes filtrando por el rol seleccionado y respetar los permisos del usuario que realiza la consulta. | HU-57 | RN-27, RN-29 |
| RF-60 | El sistema debe permitir consultar los accesos de un usuario en un período seleccionado, mostrando fecha, resultado y dirección IP cuando estén registrados. | HU-58 | RN-27, RN-30 |
| RF-61 | El sistema debe permitir filtrar la auditoría por usuario y mostrar las operaciones autorizadas correspondientes. | HU-59 | RN-27 |
| RF-62 | El sistema debe permitir combinar un período y un estado válido como criterios de consulta y mostrar únicamente las solicitudes que cumplan ambos. | HU-60 | RN-03, RN-30 |

## 9.1  Fichas de los Requisitos Funcionales

Cada ficha formaliza un requisito verificable. La HU de origen identifica la necesidad funcional que lo genera y las RN indicadas son las reglas que el requisito hace cumplir cuando aplica.

| Código | RF-01 |
| --- | --- |
| Nombre corto | Autenticar usuario |
| Descripción | El sistema debe permitir al usuario iniciar sesión mediante sus credenciales y habilitar únicamente las funciones correspondientes al rol asignado. |
| HU de origen | HU-01 |
| RN que hace cumplir | Ninguna |
| Prioridad | Alta |

| Código | RF-02 |
| --- | --- |
| Nombre corto | Recuperar contraseña |
| Descripción | El sistema debe permitir solicitar la recuperación de contraseña usando el correo registrado y un mecanismo temporal que permita restablecer el acceso cuando sea válido. |
| HU de origen | HU-02 |
| RN que hace cumplir | RN-20 |
| Prioridad | Alta |

| Código | RF-03 |
| --- | --- |
| Nombre corto | Registrar permiso laboral |
| Descripción | El sistema debe permitir registrar una solicitud de permiso laboral con la información requerida, asociarla al empleado y generar su radicado y estado inicial. |
| HU de origen | HU-03 |
| RN que hace cumplir | RN-01, RN-23 |
| Prioridad | Alta |

| Código | RF-04 |
| --- | --- |
| Nombre corto | Registrar solicitud de vacaciones |
| Descripción | El sistema debe permitir registrar una solicitud de vacaciones con fechas, motivo, empleado asociado y duración correspondiente al período solicitado. |
| HU de origen | HU-04 |
| RN que hace cumplir | RN-01, RN-13, RN-23 |
| Prioridad | Alta |

| Código | RF-05 |
| --- | --- |
| Nombre corto | Registrar solicitud de certificado laboral |
| Descripción | El sistema debe permitir registrar una solicitud de certificado laboral, asociarla al empleado y generar el radicado y estado inicial correspondientes. |
| HU de origen | HU-05 |
| RN que hace cumplir | RN-01, RN-14, RN-23 |
| Prioridad | Media |

| Código | RF-06 |
| --- | --- |
| Nombre corto | Registrar incapacidad médica |
| Descripción | El sistema debe permitir registrar una incapacidad médica con sus fechas, tipo y soporte clínico requerido, asociándola al empleado y a la solicitud. |
| HU de origen | HU-06 |
| RN que hace cumplir | RN-01, RN-02, RN-23 |
| Prioridad | Alta |

| Código | RF-07 |
| --- | --- |
| Nombre corto | Aprobar solicitud |
| Descripción | El sistema debe permitir a un usuario autorizado aprobar una solicitud cuando su estado permita la aprobación y registrar la decisión en el historial. |
| HU de origen | HU-07 |
| RN que hace cumplir | RN-03, RN-05, RN-07 |
| Prioridad | Alta |

| Código | RF-08 |
| --- | --- |
| Nombre corto | Rechazar solicitud |
| Descripción | El sistema debe permitir a un usuario autorizado rechazar una solicitud registrando el motivo obligatorio y dejando la decisión en el historial. |
| HU de origen | HU-08 |
| RN que hace cumplir | RN-03, RN-06, RN-07 |
| Prioridad | Alta |

| Código | RF-09 |
| --- | --- |
| Nombre corto | Asignar responsable inicial |
| Descripción | El sistema debe asignar un responsable inicial autorizado de acuerdo con el tipo de solicitud y conservar la asignación asociada al trámite. |
| HU de origen | HU-09 |
| RN que hace cumplir | RN-08 |
| Prioridad | Alta |

| Código | RF-10 |
| --- | --- |
| Nombre corto | Alertar solicitudes sin movimiento |
| Descripción | El sistema debe identificar solicitudes que permanezcan más de tres días sin movimiento y generar la alerta correspondiente para su atención. |
| HU de origen | HU-10 |
| RN que hace cumplir | RN-11 |
| Prioridad | Alta |

| Código | RF-11 |
| --- | --- |
| Nombre corto | Validar saldo de vacaciones |
| Descripción | El sistema debe consultar y validar el saldo disponible de vacaciones antes de permitir la aprobación de una solicitud de vacaciones. |
| HU de origen | HU-11 |
| RN que hace cumplir | RN-05, RN-12 |
| Prioridad | Alta |

| Código | RF-12 |
| --- | --- |
| Nombre corto | Generar certificado laboral |
| Descripción | El sistema debe generar el certificado laboral asociado a una solicitud aprobada y dejar disponible el documento generado para su consulta. |
| HU de origen | HU-12 |
| RN que hace cumplir | RN-14 |
| Prioridad | Media |

| Código | RF-13 |
| --- | --- |
| Nombre corto | Generar radicado de solicitud |
| Descripción | El sistema debe generar un número de radicado para cada solicitud registrada, de manera que pueda identificarse de forma específica. |
| HU de origen | HU-13 |
| RN que hace cumplir | RN-23 |
| Prioridad | Media |

| Código | RF-14 |
| --- | --- |
| Nombre corto | Buscar solicitud por radicado |
| Descripción | El sistema debe permitir localizar una solicitud mediante su número de radicado y mostrar el resultado correspondiente cuando exista. |
| HU de origen | HU-13 |
| RN que hace cumplir | RN-23 |
| Prioridad | Media |

| Código | RF-15 |
| --- | --- |
| Nombre corto | Adjuntar soporte a la solicitud |
| Descripción | El sistema debe permitir asociar un documento de soporte a una solicitud, registrar quién y cuándo lo cargó y conservarlo como soporte de la solicitud. |
| HU de origen | HU-14 |
| RN que hace cumplir | RN-17, RN-18, RN-19 |
| Prioridad | Alta |

| Código | RF-16 |
| --- | --- |
| Nombre corto | Consultar historial de cambios |
| Descripción | El sistema debe permitir consultar las acciones y cambios registrados sobre una solicitud, identificando usuario, acción y fecha y mostrando cambios de estado cuando correspondan. |
| HU de origen | HU-15 |
| RN que hace cumplir | RN-07, RN-28 |
| Prioridad | Alta |

| Código | RF-17 |
| --- | --- |
| Nombre corto | Editar solicitud pendiente |
| Descripción | El sistema debe permitir al empleado modificar una solicitud mientras se encuentre en un estado modificable y conservar la trazabilidad de la modificación. |
| HU de origen | HU-16 |
| RN que hace cumplir | RN-07, RN-15 |
| Prioridad | Alta |

| Código | RF-18 |
| --- | --- |
| Nombre corto | Recibir notificaciones |
| Descripción | El sistema debe generar y entregar al empleado las notificaciones configuradas cuando ocurran eventos relacionados con sus solicitudes. |
| HU de origen | HU-17 |
| RN que hace cumplir | RN-21 |
| Prioridad | Media |

| Código | RF-19 |
| --- | --- |
| Nombre corto | Consultar tiempos de respuesta |
| Descripción | El sistema debe permitir consultar tiempos de respuesta de las solicitudes utilizando los criterios de tipo, responsable y período seleccionados. |
| HU de origen | HU-18 |
| RN que hace cumplir | RN-29, RN-30 |
| Prioridad | Media |

| Código | RF-20 |
| --- | --- |
| Nombre corto | Cambiar solicitud a En revisión |
| Descripción | El sistema debe permitir a un usuario autorizado cambiar una solicitud al estado En revisión registrando la nota explicativa requerida y el cambio en el historial. |
| HU de origen | HU-19 |
| RN que hace cumplir | RN-03, RN-07, RN-16 |
| Prioridad | Alta |

| Código | RF-21 |
| --- | --- |
| Nombre corto | Consultar solicitudes e historial personal |
| Descripción | El sistema debe permitir consultar solicitudes según los filtros definidos y, para la consulta personal, mostrar únicamente las solicitudes asociadas al empleado consultante. |
| HU de origen | HU-20, HU-21 |
| RN que hace cumplir | RN-03, RN-24, RN-27 |
| Prioridad | Media |

| Código | RF-23 |
| --- | --- |
| Nombre corto | Cancelar solicitud |
| Descripción | El sistema debe permitir al empleado cancelar una solicitud que todavía no haya sido aprobada ni rechazada y registrar la cancelación en el historial. |
| HU de origen | HU-22 |
| RN que hace cumplir | RN-03, RN-04, RN-07 |
| Prioridad | Alta |

| Código | RF-24 |
| --- | --- |
| Nombre corto | Reasignar solicitud |
| Descripción | El sistema debe permitir reasignar una solicitud a un responsable autorizado, exigir el motivo de reasignación y conservar la evidencia de la operación. |
| HU de origen | HU-23 |
| RN que hace cumplir | RN-07, RN-09, RN-10 |
| Prioridad | Alta |

| Código | RF-25 |
| --- | --- |
| Nombre corto | Consultar resumen de solicitudes |
| Descripción | El sistema debe permitir consultar un resumen de solicitudes por tipo y período, mostrando únicamente la información correspondiente a los criterios seleccionados. |
| HU de origen | HU-24 |
| RN que hace cumplir | RN-29, RN-30 |
| Prioridad | Media |

| Código | RF-26 |
| --- | --- |
| Nombre corto | Registrar cambios de estado |
| Descripción | El sistema debe registrar cada cambio de estado de una solicitud con la información necesaria para mantener su trazabilidad. |
| HU de origen | HU-15 |
| RN que hace cumplir | RN-07 |
| Prioridad | Alta |

| Código | RF-27 |
| --- | --- |
| Nombre corto | Consultar perfil organizacional |
| Descripción | El sistema debe permitir consultar el área, cargo y rol correspondientes al empleado seleccionado, sin mezclar información de otros empleados. |
| HU de origen | HU-25 |
| RN que hace cumplir | RN-25, RN-27, RN-20 |
| Prioridad | Media |

| Código | RF-28 |
| --- | --- |
| Nombre corto | Consultar detalle de solicitud |
| Descripción | El sistema debe permitir consultar el detalle de una solicitud mostrando su radicado, tipo, fecha, estado y responsable cuando exista. |
| HU de origen | HU-26 |
| RN que hace cumplir | RN-23, RN-27 |
| Prioridad | Media |

| Código | RF-29 |
| --- | --- |
| Nombre corto | Consultar responsable actual |
| Descripción | El sistema debe mostrar el responsable vigente de una solicitud y distinguirlo de asignaciones que ya hayan finalizado. |
| HU de origen | HU-27 |
| RN que hace cumplir | RN-26 |
| Prioridad | Media |

| Código | RF-30 |
| --- | --- |
| Nombre corto | Consultar historial de asignaciones |
| Descripción | El sistema debe permitir consultar las asignaciones realizadas sobre una solicitud, incluyendo la información necesaria para identificar su secuencia. |
| HU de origen | HU-28 |
| RN que hace cumplir | RN-26 |
| Prioridad | Media |

| Código | RF-31 |
| --- | --- |
| Nombre corto | Finalizar asignación |
| Descripción | El sistema debe permitir finalizar una asignación de una solicitud y conservar la información necesaria para distinguirla de la asignación vigente. |
| HU de origen | HU-29 |
| RN que hace cumplir | RN-26 |
| Prioridad | Media |

| Código | RF-32 |
| --- | --- |
| Nombre corto | Consultar motivo de asignación o reasignación |
| Descripción | El sistema debe permitir consultar el motivo registrado para una asignación o reasignación cuando este exista. |
| HU de origen | HU-30 |
| RN que hace cumplir | RN-10 |
| Prioridad | Media |

| Código | RF-33 |
| --- | --- |
| Nombre corto | Adjuntar soporte adicional |
| Descripción | El sistema debe permitir agregar documentos adicionales a una solicitud y asociarlos correctamente al trámite. |
| HU de origen | HU-31 |
| RN que hace cumplir | RN-17, RN-18, RN-19 |
| Prioridad | Alta |

| Código | RF-34 |
| --- | --- |
| Nombre corto | Consultar documentos adjuntos |
| Descripción | El sistema debe permitir consultar los documentos asociados a una solicitud, identificando la información disponible de cada soporte. |
| HU de origen | HU-32 |
| RN que hace cumplir | RN-17 |
| Prioridad | Media |

| Código | RF-35 |
| --- | --- |
| Nombre corto | Validar documento adjunto |
| Descripción | El sistema debe validar el formato y tamaño permitido de un archivo antes de almacenarlo como soporte válido. |
| HU de origen | HU-33 |
| RN que hace cumplir | RN-18 |
| Prioridad | Alta |

| Código | RF-36 |
| --- | --- |
| Nombre corto | Consultar detalle de permiso laboral |
| Descripción | El sistema debe permitir consultar el detalle de un permiso laboral mostrando fechas, motivo, tipo y estado del trámite. |
| HU de origen | HU-34 |
| RN que hace cumplir | Ninguna |
| Prioridad | Media |

| Código | RF-37 |
| --- | --- |
| Nombre corto | Consultar detalle de vacaciones |
| Descripción | El sistema debe permitir consultar el detalle de una solicitud de vacaciones mostrando fechas, duración, tipo, estado y saldo disponible cuando corresponda. |
| HU de origen | HU-35 |
| RN que hace cumplir | RN-13, RN-12 |
| Prioridad | Media |

| Código | RF-38 |
| --- | --- |
| Nombre corto | Consultar detalle de incapacidad |
| Descripción | El sistema debe permitir consultar el detalle de una incapacidad mostrando fechas, tipo, estado, observación y soporte asociado cuando exista. |
| HU de origen | HU-36 |
| RN que hace cumplir | RN-17 |
| Prioridad | Media |

| Código | RF-39 |
| --- | --- |
| Nombre corto | Consultar certificado generado |
| Descripción | El sistema debe permitir consultar el certificado laboral generado y su asociación con la solicitud correspondiente. |
| HU de origen | HU-37 |
| RN que hace cumplir | RN-14 |
| Prioridad | Media |

| Código | RF-40 |
| --- | --- |
| Nombre corto | Consultar estado de certificado |
| Descripción | El sistema debe permitir consultar el estado del certificado laboral de acuerdo con el estado real de la solicitud y del documento generado. |
| HU de origen | HU-38 |
| RN que hace cumplir | RN-14 |
| Prioridad | Media |

| Código | RF-41 |
| --- | --- |
| Nombre corto | Consultar notificaciones internas |
| Descripción | El sistema debe permitir al usuario consultar sus notificaciones internas y visualizar únicamente las que le correspondan. |
| HU de origen | HU-39 |
| RN que hace cumplir | RN-21 |
| Prioridad | Media |

| Código | RF-42 |
| --- | --- |
| Nombre corto | Marcar notificación como leída |
| Descripción | El sistema debe permitir marcar una notificación como leída modificando únicamente su estado de lectura. |
| HU de origen | HU-40 |
| RN que hace cumplir | RN-22 |
| Prioridad | Media |

| Código | RF-43 |
| --- | --- |
| Nombre corto | Solicitar nuevo enlace de recuperación |
| Descripción | El sistema debe permitir solicitar un nuevo mecanismo de recuperación cuando el anterior no sea utilizable y generar uno vigente para el proceso. |
| HU de origen | HU-41 |
| RN que hace cumplir | RN-20 |
| Prioridad | Alta |

| Código | RF-44 |
| --- | --- |
| Nombre corto | Consultar tipos de solicitud |
| Descripción | El sistema debe permitir consultar los tipos de solicitud disponibles para identificar las opciones de trámite que pueden registrarse. |
| HU de origen | HU-42 |
| RN que hace cumplir | Ninguna |
| Prioridad | Media |

| Código | RF-45 |
| --- | --- |
| Nombre corto | Consultar estados de solicitud |
| Descripción | El sistema debe permitir consultar los estados de solicitud utilizados por el sistema. |
| HU de origen | HU-43 |
| RN que hace cumplir | RN-03, RN-27, RN-20 |
| Prioridad | Media |

| Código | RF-46 |
| --- | --- |
| Nombre corto | Consultar acciones del historial |
| Descripción | El sistema debe permitir consultar las acciones registradas en el historial de una solicitud, identificando la acción, usuario y fecha. |
| HU de origen | HU-44 |
| RN que hace cumplir | RN-07 |
| Prioridad | Media |

| Código | RF-47 |
| --- | --- |
| Nombre corto | Consultar registros de acceso |
| Descripción | El sistema debe permitir a un usuario autorizado consultar los registros de acceso disponibles, incluyendo fecha, resultado y dirección IP cuando estén registrados. |
| HU de origen | HU-45 |
| RN que hace cumplir | RN-27, RN-20 |
| Prioridad | Media |

| Código | RF-48 |
| --- | --- |
| Nombre corto | Consultar auditoría de operaciones |
| Descripción | El sistema debe permitir a un usuario autorizado consultar las operaciones auditadas, identificando usuario, entidad, operación y fecha. |
| HU de origen | HU-46 |
| RN que hace cumplir | RN-27, RN-28, RN-20 |
| Prioridad | Media |

| Código | RF-49 |
| --- | --- |
| Nombre corto | Consultar detalle de cambio auditado |
| Descripción | El sistema debe permitir consultar el detalle de un cambio auditado, incluyendo campo modificado y valores anterior y nuevo cuando estén registrados. |
| HU de origen | HU-47 |
| RN que hace cumplir | RN-27, RN-28, RN-20 |
| Prioridad | Media |

| Código | RF-50 |
| --- | --- |
| Nombre corto | Consultar saldo de vacaciones por período |
| Descripción | El sistema debe permitir consultar el saldo de vacaciones correspondiente a un período seleccionado. |
| HU de origen | HU-48 |
| RN que hace cumplir | RN-12, RN-30 |
| Prioridad | Media |

| Código | RF-51 |
| --- | --- |
| Nombre corto | Consultar días disponibles de vacaciones |
| Descripción | El sistema debe permitir consultar los días de vacaciones disponibles del empleado a partir del saldo correspondiente. |
| HU de origen | HU-49 |
| RN que hace cumplir | RN-12 |
| Prioridad | Media |

| Código | RF-52 |
| --- | --- |
| Nombre corto | Consultar reportes generados |
| Descripción | El sistema debe permitir consultar los reportes generados y mostrar el reporte correspondiente al usuario autorizado. |
| HU de origen | HU-50 |
| RN que hace cumplir | RN-27, RN-30 |
| Prioridad | Media |

| Código | RF-53 |
| --- | --- |
| Nombre corto | Generar reporte por tipo de solicitud |
| Descripción | El sistema debe permitir generar un reporte utilizando el tipo de solicitud seleccionado y diferenciar los resultados por dicho criterio. |
| HU de origen | HU-51 |
| RN que hace cumplir | RN-27, RN-29 |
| Prioridad | Media |

| Código | RF-54 |
| --- | --- |
| Nombre corto | Generar reporte por responsable |
| Descripción | El sistema debe permitir generar un reporte utilizando un responsable como criterio y relacionar los resultados con las asignaciones registradas. |
| HU de origen | HU-52 |
| RN que hace cumplir | RN-27, RN-29, RN-30 |
| Prioridad | Media |

| Código | RF-55 |
| --- | --- |
| Nombre corto | Exportar reporte de gestión |
| Descripción | El sistema debe permitir exportar un reporte de gestión y conservar en el archivo la información correspondiente al resultado consultado. |
| HU de origen | HU-53 |
| RN que hace cumplir | RN-27 |
| Prioridad | Media |

| Código | RF-56 |
| --- | --- |
| Nombre corto | Generar reporte consolidado por período |
| Descripción | El sistema debe permitir generar un reporte consolidado para un período seleccionado, incluyendo los tipos de solicitud definidos para el reporte. |
| HU de origen | HU-54 |
| RN que hace cumplir | RN-27, RN-29, RN-30 |
| Prioridad | Media |

| Código | RF-57 |
| --- | --- |
| Nombre corto | Consultar solicitudes por área |
| Descripción | El sistema debe permitir consultar solicitudes filtrando por el área organizacional seleccionada y mostrar únicamente los resultados que correspondan al filtro. |
| HU de origen | HU-55 |
| RN que hace cumplir | RN-27, RN-29 |
| Prioridad | Media |

| Código | RF-58 |
| --- | --- |
| Nombre corto | Consultar solicitudes por cargo |
| Descripción | El sistema debe permitir consultar solicitudes filtrando por el cargo seleccionado y mostrar únicamente los resultados que correspondan al filtro. |
| HU de origen | HU-56 |
| RN que hace cumplir | RN-27, RN-29 |
| Prioridad | Media |

| Código | RF-59 |
| --- | --- |
| Nombre corto | Consultar solicitudes por rol |
| Descripción | El sistema debe permitir consultar solicitudes filtrando por el rol seleccionado y respetar los permisos del usuario que realiza la consulta. |
| HU de origen | HU-57 |
| RN que hace cumplir | RN-27, RN-29 |
| Prioridad | Media |

| Código | RF-60 |
| --- | --- |
| Nombre corto | Consultar historial de accesos por usuario |
| Descripción | El sistema debe permitir consultar los accesos de un usuario en un período seleccionado, mostrando fecha, resultado y dirección IP cuando estén registrados. |
| HU de origen | HU-58 |
| RN que hace cumplir | RN-27, RN-30, RN-20 |
| Prioridad | Media |

| Código | RF-61 |
| --- | --- |
| Nombre corto | Consultar auditoría por usuario |
| Descripción | El sistema debe permitir filtrar la auditoría por usuario y mostrar las operaciones autorizadas correspondientes. |
| HU de origen | HU-59 |
| RN que hace cumplir | RN-27, RN-20 |
| Prioridad | Media |

| Código | RF-62 |
| --- | --- |
| Nombre corto | Consultar solicitudes por período y estado |
| Descripción | El sistema debe permitir combinar un período y un estado válido como criterios de consulta y mostrar únicamente las solicitudes que cumplan ambos. |
| HU de origen | HU-60 |
| RN que hace cumplir | RN-03, RN-30 |
| Prioridad | Alta |
