## 8.1 HU-01 — Iniciar sesión

| Campo | Contenido |
|---|---|
| Código | HU-01 |
| Título corto | Iniciar sesión |
| Historia | Como usuario del sistema, quiero iniciar sesión con correo y contraseña, para acceder únicamente a las funciones permitidas según mi rol. |
| Criterios de aceptación | Antecedentes: Dado que el usuario tiene una cuenta registrada y se encuentra en la pantalla de inicio de sesión. **CA-1 Acceso exitoso con credenciales válidas:** Dado que el usuario "Ana Torres" tiene registrada la cuenta ana.torres@empresa.com con contraseña válida, cuando ingresa el correo y la contraseña correctos y selecciona iniciar sesión, entonces el sistema permite el acceso y muestra únicamente las funciones correspondientes al rol asignado. **CA-2 Rechazo por credenciales inválidas:** Dado que la cuenta ana.torres@empresa.com está registrada, cuando el usuario ingresa una contraseña incorrecta, entonces el sistema no permite el acceso y muestra un mensaje indicando que las credenciales no son válidas. **CA-3 Correo no registrado:** Dado que no existe una cuenta con el correo desconocido@empresa.com, cuando el usuario intenta iniciar sesión con ese correo, entonces el sistema rechaza el acceso y no muestra las funciones internas del sistema. **CA-4 Menú según rol:** Dado que el usuario "Ana Torres" tiene asignado el rol permitido, cuando inicia sesión correctamente, entonces el sistema muestra el menú correspondiente a ese rol y no presenta funciones que no estén permitidas para dicho rol. |
| Origen de la necesidad | HU original; CU-01 Autenticarse en el Sistema; ACT-01 a ACT-04. |
| RF derivados | RF-01 (existente) |
| Prioridad | Alta |

## 8.2 HU-02 — Recuperar contraseña

| Campo | Contenido |
|---|---|
| Código | HU-02 |
| Título corto | Recuperar contraseña |
| Historia | Como usuario, quiero recuperar mi contraseña mediante el correo registrado, para volver a ingresar al sistema en caso de olvido. |
| Criterios de aceptación | Antecedentes: Dado que existe un usuario registrado con un correo electrónico válido. **CA-1 Solicitud con correo registrado:** Dado que ana.torres@empresa.com pertenece a un usuario registrado, cuando el usuario solicita recuperar su contraseña con ese correo, entonces el sistema acepta la solicitud y genera un mecanismo temporal de recuperación. **CA-2 Rechazo de correo no registrado:** Dado que no existe un usuario registrado con desconocido@empresa.com, cuando se solicita recuperación con ese correo, entonces el sistema no genera un mecanismo asociado a una cuenta inexistente y muestra el mensaje correspondiente al proceso. **CA-3 Uso de mecanismo vigente:** Dado que existe un mecanismo temporal de recuperación vigente para ana.torres@empresa.com, cuando el usuario accede mediante dicho mecanismo y establece una nueva contraseña válida, entonces el sistema permite restablecer la contraseña y la nueva contraseña queda asociada a la cuenta. **CA-4 Mecanismo vencido o inválido:** Dado que el mecanismo de recuperación está vencido o no corresponde a una solicitud válida, cuando el usuario intenta restablecer la contraseña, entonces el sistema no permite completar el cambio y solicita iniciar nuevamente el proceso de recuperación. |
| Origen de la necesidad | HU original; CU-02 Recuperar Contraseña. |
| RF derivados | RF-02 (existente) |
| Prioridad | Alta |

## 8.3 HU-03 — Crear solicitud de permiso laboral

| Campo | Contenido |
|---|---|
| Código | HU-03 |
| Título corto | Crear solicitud de permiso laboral |
| Historia | Como empleado, quiero crear solicitudes de permisos laborales, para gestionar ausencias autorizadas. |
| Criterios de aceptación | Antecedentes: Dado que el empleado "Ana Torres" ha iniciado sesión y que se encuentra habilitado para registrar solicitudes. **CA-1 Registro exitoso de permiso laboral:** Dado que Ana selecciona el tipo "Permiso laboral", cuando registra fecha inicial "10/10/2026", fecha final "10/10/2026", motivo "Cita personal" y los datos obligatorios, entonces el sistema registra la solicitud asociada a Ana Torres, genera un número de radicado y establece el estado inicial definido para una solicitud nueva. **CA-2 Registro de datos obligatorios:** Dado que Ana está diligenciando una solicitud de permiso, cuando registra fechas, motivo y tipo de permiso válidos, entonces el sistema conserva esos datos en la solicitud y los asocia al empleado solicitante. **CA-3 Rechazo por información obligatoria incompleta:** Dado que Ana intenta registrar un permiso sin uno de los datos obligatorios, cuando solicita guardar la solicitud, entonces el sistema no la registra y señala el dato que debe completar. **CA-4 Identificación de la solicitud:** Dado que Ana registró correctamente el permiso, cuando consulta el resultado del registro, entonces el sistema muestra el radicado generado y el estado inicial de la solicitud. |
| Origen de la necesidad | HU original; CU-03 Registrar Solicitud de Talento Humano; RN-01 y RN-05. |
| RF derivados | RF-03 (existente) |
| Prioridad | Alta |

## 8.4 HU-04 — Solicitar vacaciones

| Campo | Contenido |
|---|---|
| Código | HU-04 |
| Título corto | Solicitar vacaciones |
| Historia | Como empleado, quiero solicitar vacaciones indicando fechas y motivo, para gestionar mi descanso laboral. |
| Criterios de aceptación | Antecedentes: Dado que el empleado "Ana Torres" ha iniciado sesión y que puede registrar solicitudes de vacaciones. **CA-1 Registro de período de vacaciones:** Dado que Ana desea solicitar vacaciones del "15/10/2026" al "20/10/2026", cuando registra las fechas y el motivo "Descanso", entonces el sistema registra la fecha inicial y la fecha final y conserva el motivo asociado a la solicitud. **CA-2 Cálculo de duración:** Dado que Ana ha indicado una fecha inicial y una fecha final válidas, cuando solicita registrar las vacaciones, entonces el sistema determina la duración solicitada y la conserva asociada a la solicitud. **CA-3 Asociación al empleado y estado:** Dado que Ana registra correctamente la solicitud, cuando el sistema finaliza el registro, entonces la solicitud queda asociada a Ana Torres, identificada como solicitud de vacaciones y con el estado correspondiente al inicio del trámite. **CA-4 Fechas inválidas:** Dado que Ana intenta registrar una fecha final anterior a la fecha inicial, cuando solicita guardar la solicitud, entonces el sistema no registra un período inválido y solicita corregir las fechas. |
| Origen de la necesidad | HU original; CU-03 Registrar Solicitud de Talento Humano. |
| RF derivados | RF-04 (existente) |
| Prioridad | Alta |

## 8.5 HU-05 — Solicitar certificado laboral

| Campo | Contenido |
|---|---|
| Código | HU-05 |
| Título corto | Solicitar certificado laboral |
| Historia | Como empleado, quiero solicitar un certificado laboral, para obtener un documento oficial emitido por Talento Humano. |
| Criterios de aceptación | Antecedentes: Dado que el empleado "Ana Torres" ha iniciado sesión y que puede solicitar certificados laborales. **CA-1 Registro de solicitud:** Dado que Ana selecciona la opción para solicitar un certificado laboral, cuando confirma la solicitud con la información requerida, entonces el sistema registra la solicitud y la asocia a Ana Torres. **CA-2 Identificación del solicitante:** Dado que Ana ha registrado una solicitud de certificado, cuando consulta el registro, entonces el sistema la identifica como solicitante y conserva la solicitud asociada a su usuario. **CA-3 Solicitud aprobada habilita generación:** Dado que existe una solicitud de certificado laboral registrada, cuando cambia al estado aprobado, entonces el sistema permite continuar con el proceso de generación del certificado. **CA-4 Solicitud no aprobada:** Dado que la solicitud todavía no está aprobada, cuando se intenta continuar directamente con la generación, entonces el sistema no la trata como una solicitud aprobada y conserva el estado actual del trámite. |
| Origen de la necesidad | HU original; CU-03 y CU-06; ACT-01. |
| RF derivados | RF-05 (existente) |
| Prioridad | Media |

## 8.6 HU-06 — Registrar incapacidad médica

| Campo | Contenido |
|---|---|
| Código | HU-06 |
| Título corto | Registrar incapacidad médica |
| Historia | Como empleado, quiero registrar una incapacidad médica adjuntando soporte clínico, para justificar mi ausencia laboral. |
| Criterios de aceptación | Antecedentes: Dado que el empleado "Ana Torres" ha iniciado sesión y debe justificar una ausencia mediante una incapacidad médica. **CA-1 Registro de incapacidad:** Dado que Ana dispone de un soporte clínico, cuando registra las fechas "12/10/2026" a "14/10/2026" y el tipo de incapacidad correspondiente, entonces el sistema registra el período y el tipo de incapacidad y los asocia a Ana Torres. **CA-2 Asociación del soporte:** Dado que Ana ha seleccionado un archivo de soporte clínico válido, cuando confirma el registro, entonces el soporte queda asociado a la solicitud correspondiente y puede identificarse como documento de la incapacidad. **CA-3 Rechazo sin soporte obligatorio:** Dado que Ana intenta registrar una incapacidad sin adjuntar el soporte requerido, cuando solicita guardar el registro, entonces el sistema lo rechaza y solicita adjuntar el soporte obligatorio. **CA-4 Soporte inválido:** Dado que Ana adjunta un archivo que no cumple las condiciones permitidas, cuando intenta guardar la incapacidad, entonces el sistema no lo acepta como soporte válido y no completa el registro hasta corregir la información. |
| Origen de la necesidad | HU original; CU-03; RN-02. |
| RF derivados | RF-06 (existente) |
| Prioridad | Alta |

## 8.7 HU-07 — Aprobar solicitud

| Campo | Contenido |
|---|---|
| Código | HU-07 |
| Título corto | Aprobar solicitud |
| Historia | Como jefe inmediato o usuario autorizado de Talento Humano, quiero aprobar solicitudes, para autorizar su ejecución. |
| Criterios de aceptación | Antecedentes: Dado que existe una solicitud en un estado que permite aprobación y que el usuario tiene autorización para aprobarla. **CA-1 Aprobación permitida:** Dado que RAD-2026-001 está pendiente, cuando el usuario autorizado selecciona aprobar, entonces la solicitud cambia al estado aprobado y la acción queda registrada con el usuario que la ejecutó. **CA-2 Registro de fecha y usuario:** Dado que una solicitud puede ser aprobada, cuando el usuario autorizado confirma la aprobación, entonces el sistema registra el usuario responsable y la fecha de la acción. **CA-3 Estado no permitido:** Dado que RAD-2026-002 ya se encuentra rechazada, cuando el usuario intenta aprobarla, entonces el sistema no ejecuta la aprobación y conserva el estado rechazado. **CA-4 Trazabilidad:** Dado que la solicitud fue aprobada correctamente, cuando se consulta su historial, entonces aparece la acción de aprobación y se identifica quién y cuándo la realizó. |
| Origen de la necesidad | HU original; CU-04; RN-03, RN-05 y RN-06. |
| RF derivados | RF-07 (existente) |
| Prioridad | Alta |

## 8.8 HU-08 — Rechazar solicitud

| Campo | Contenido |
|---|---|
| Código | HU-08 |
| Título corto | Rechazar solicitud |
| Historia | Como jefe inmediato o usuario autorizado de Talento Humano, quiero rechazar solicitudes indicando el motivo, para informar al empleado sobre la decisión. |
| Criterios de aceptación | Antecedentes: Dado que existe una solicitud que puede ser procesada por un usuario autorizado. **CA-1 Rechazo con motivo:** Dado que RAD-2026-003 está pendiente, cuando el usuario autorizado selecciona rechazar e ingresa el motivo "Información incompleta", entonces la solicitud cambia al estado Rechazada y el motivo queda registrado. **CA-2 Motivo obligatorio:** Dado que RAD-2026-004 está pendiente, cuando el usuario intenta rechazarla sin ingresar un motivo, entonces el sistema no completa el rechazo y solicita registrar el motivo. **CA-3 Estado posterior:** Dado que el rechazo fue confirmado con un motivo válido, cuando se consulta la solicitud, entonces su estado es Rechazada y el motivo registrado puede identificarse. **CA-4 Trazabilidad:** Dado que una solicitud fue rechazada, cuando se consulta su historial, entonces se identifica la acción de rechazo y se registra el usuario, la fecha y el motivo. |
| Origen de la necesidad | HU original; CU-04; RN-03 y RN-06. |
| RF derivados | RF-08 (existente) |
| Prioridad | Alta |

## 8.9 HU-09 — Asignar responsable inicial

| Campo | Contenido |
|---|---|
| Código | HU-09 |
| Título corto | Asignar responsable inicial |
| Historia | Como usuario de Talento Humano, quiero que una solicitud reciba un responsable inicial según su tipo, para iniciar el flujo de revisión. |
| Criterios de aceptación | Antecedentes: Dado que existe una solicitud registrada y que el tipo de solicitud tiene un responsable definido para iniciar su flujo. **CA-1 Determinación del responsable:** Dado que RAD-2026-005 corresponde a un tipo con responsable configurado, cuando se inicia el flujo de atención, entonces el sistema determina el responsable correspondiente. **CA-2 Asociación:** Dado que se determinó el responsable "Carlos Pérez", cuando se confirma la asignación inicial, entonces esta queda asociada a RAD-2026-005 y Carlos Pérez queda identificado como responsable. **CA-3 Registro de fecha:** Dado que la solicitud fue asignada, cuando se consulta la asignación, entonces se muestra el responsable y se conserva la fecha de asignación. **CA-4 Sin responsable disponible:** Dado que no existe un responsable configurado para el tipo correspondiente, cuando se intenta realizar la asignación inicial, entonces el sistema no asigna un responsable inexistente y deja la situación identificada para gestión. |
| Origen de la necesidad | HU original reformulada; CU-03; RN-05. |
| RF derivados | RF-09 (existente) |
| Prioridad | Alta |

## 8.10 HU-10 — Alertar solicitudes sin movimiento

| Campo | Contenido |
|---|---|
| Código | HU-10 |
| Título corto | Alertar solicitudes sin movimiento |
| Historia | Como usuario de Talento Humano, quiero recibir alertas cuando una solicitud permanezca más de tres días sin movimiento, para evitar retrasos. |
| Criterios de aceptación | Antecedentes: Dado que existe una solicitud pendiente de atención y que el límite definido para generar la alerta es superior a tres días sin movimiento. **CA-1 Alerta después del límite:** Dado que RAD-2026-006 permanece sin movimiento durante más de tres días, cuando se supera el límite, entonces el sistema genera una alerta que identifica la solicitud y el destinatario. **CA-2 Sin alerta antes del límite:** Dado que RAD-2026-007 lleva menos de tres días sin movimiento, cuando se verifica el proceso de alertas, entonces el sistema no genera la alerta por vencimiento del límite. **CA-3 Identificación:** Dado que RAD-2026-006 genera una alerta, cuando el destinatario la consulta, entonces puede identificar el radicado y que corresponde a una solicitud sin movimiento. **CA-4 Destinatario correcto:** Dado que una solicitud tiene un responsable vigente, cuando se genera la alerta, entonces se dirige al destinatario definido para su atención. |
| Origen de la necesidad | HU original; P-01, P-05 y P-10; CU-04. |
| RF derivados | RF-10 (existente) |
| Prioridad | Media |
## 8.11 HU-11 — Validar saldo de vacaciones

| Campo | Contenido |
|---|---|
| Código | HU-11 |
| Título corto | Validar saldo de vacaciones |
| Historia | Como usuario de Talento Humano, quiero validar el saldo disponible de vacaciones antes de aprobar una solicitud, para evitar inconsistencias. |
| Criterios de aceptación | Antecedentes: existe una solicitud de vacaciones pendiente de aprobación y el sistema dispone del saldo del empleado y período. **CA-1 Consulta previa:** Ana Torres solicita 5 días; antes de aprobar, el usuario autorizado consulta el saldo. **CA-2 Saldo suficiente:** Ana tiene 10 días y solicita 5; el sistema determina que el saldo es suficiente y permite continuar con la aprobación. **CA-3 Saldo insuficiente:** Ana tiene 3 días y solicita 5; el sistema determina que el saldo es insuficiente y no permite aprobar. **CA-4 Período correspondiente:** si Ana tiene saldos de varios períodos, el sistema usa el saldo que corresponde al período de la solicitud. |
| Origen de la necesidad | HU original; RN-05; CU-04. |
| RF derivados | RF-11 (existente) |
| Prioridad | Alta |

## 8.12 HU-12 — Generar certificado laboral

| Campo | Contenido |
|---|---|
| Código | HU-12 |
| Título corto | Generar certificado laboral |
| Historia | Como usuario de Talento Humano, quiero generar certificados laborales aprobados, para reducir procesos manuales. |
| Criterios de aceptación | **CA-1 Generación desde solicitud aprobada:** si RAD-2026-008 está aprobada, al solicitar la generación el sistema crea el certificado asociado a esa solicitud. **CA-2 Sin aprobación:** si RAD-2026-009 está pendiente, el sistema no genera el documento como certificado aprobado y conserva el estado de la solicitud. **CA-3 Asociación del archivo:** el archivo generado aparece asociado a RAD-2026-008. **CA-4 Disponibilidad:** el empleado o usuario autorizado puede acceder al certificado según los permisos definidos. |
| Origen de la necesidad | HU original; CU-06 Generar Certificado Laboral; ACT-03. |
| RF derivados | RF-12 (existente) |
| Prioridad | Media |

## 8.13 HU-13 — Buscar solicitud por radicado

| Campo | Contenido |
|---|---|
| Código | HU-13 |
| Título corto | Buscar solicitud por radicado |
| Historia | Como usuario de Talento Humano, quiero buscar una solicitud mediante su número de radicado, para encontrarla rápidamente. |
| Criterios de aceptación | Antecedentes: el usuario de Talento Humano inició sesión y existen solicitudes registradas. **CA-1 Radicado existente:** al buscar exactamente RAD-2026-010, el sistema localiza la solicitud y muestra información que permite identificarla inequívocamente. **CA-2 Radicado inexistente:** al buscar RAD-9999, el sistema no devuelve solicitudes e informa que no encontró coincidencias. **CA-3 Radicado exacto:** el resultado corresponde al radicado consultado y no mezcla información de otros radicados. **CA-4 Consulta sin modificación:** consultar el resultado no modifica los datos de la solicitud. |
| Origen de la necesidad | HU original; P-01 y P-03; CU-05. |
| RF derivados | RF-13 y RF-14 (existentes) |
| Prioridad | Media |

## 8.14 HU-14 — Adjuntar soporte a la solicitud

| Campo | Contenido |
|---|---|
| Código | HU-14 |
| Título corto | Adjuntar soporte a la solicitud |
| Historia | Como empleado, quiero adjuntar documentos de soporte a mis solicitudes, para justificar correctamente la información registrada. |
| Criterios de aceptación | Antecedentes: Ana Torres tiene una solicitud registrada que permite adjuntar soportes. **CA-1 Carga válida:** al adjuntar a RAD-2026-011 un documento permitido, el sistema lo asocia a la solicitud y registra la carga. **CA-2 Archivo no permitido:** el sistema rechaza un archivo que no cumple las condiciones y no lo registra como soporte válido. **CA-3 Usuario de carga:** la información del documento identifica a Ana Torres como quien lo cargó. **CA-4 Fecha de carga:** se conserva la fecha correspondiente a la carga del soporte. |
| Origen de la necesidad | HU original; CU-03; RN-02; ACT-01. |
| RF derivados | RF-15 (existente) |
| Prioridad | Alta |

## 8.15 HU-15 — Consultar historial de cambios

| Campo | Contenido |
|---|---|
| Código | HU-15 |
| Título corto | Consultar historial de cambios |
| Historia | Como usuario de Talento Humano o Gerencia, quiero consultar el historial de cambios de las solicitudes, para auditar las acciones realizadas. |
| Criterios de aceptación | Antecedentes: existe una solicitud con acciones en su historial y el usuario tiene permiso para consultar la trazabilidad. **CA-1 Consulta:** para RAD-2026-012, el sistema muestra la solicitud, usuario, acción y fecha de cada registro. **CA-2 Cambio de estado:** el historial muestra el cambio de Pendiente a Aprobada. **CA-3 Valores anterior y nuevo:** cuando existe auditoría detallada, el usuario puede ver los valores anterior y nuevo registrados. **CA-4 Consulta sin alteración:** consultar los registros no los modifica. |
| Origen de la necesidad | HU original; CU-05; RN-06 y RN-12; RNF-09. |
| RF derivados | RF-16 y RF-26 (existentes) |
| Prioridad | Alta |

## 8.16 HU-16 — Editar solicitud pendiente

| Campo | Contenido |
|---|---|
| Código | HU-16 |
| Título corto | Editar solicitud pendiente |
| Historia | Como empleado, quiero editar mi solicitud mientras permanezca pendiente, para corregir información antes de ser procesada. |
| Criterios de aceptación | Antecedentes: el empleado tiene una solicitud registrada en un estado que permite modificaciones. **CA-1 Edición pendiente:** al modificar y guardar el motivo de RAD-2026-013, el sistema actualiza la información. **CA-2 Solicitud procesada:** si RAD-2026-014 ya fue aprobada, el sistema no permite editarla y conserva sus datos. **CA-3 Estado no modificable:** si el estado no permite cambios, el sistema bloquea la operación. **CA-4 Trazabilidad:** una modificación de una solicitud pendiente queda identificable en el historial. |
| Origen de la necesidad | HU original; CU-04; RN-03 y RN-06. |
| RF derivados | RF-17 (existente) |
| Prioridad | Alta |

## 8.17 HU-17 — Recibir notificaciones

| Campo | Contenido |
|---|---|
| Código | HU-17 |
| Título corto | Recibir notificaciones |
| Historia | Como empleado, quiero recibir notificaciones por correo electrónico y dentro del sistema, para mantenerme informado sobre el estado de mis solicitudes. |
| Criterios de aceptación | Antecedentes: el empleado tiene solicitudes registradas y está habilitada la notificación correspondiente. **CA-1 Cambio de estado:** al cambiar RAD-2026-015 de Pendiente a Aprobada, el sistema genera la notificación configurada y la dirige al empleado. **CA-2 Destinatario correcto:** la notificación de RAD-2026-016, que pertenece a Ana Torres, la identifica como destinataria y no la dirige a otro empleado. **CA-3 Notificación interna:** Ana puede identificar el aviso relacionado con la solicitud y el sistema conserva el estado de lectura. **CA-4 Correo configurado:** cuando ocurre el evento, el sistema usa el correo asociado al destinatario. |
| Origen de la necesidad | HU original; P-10 y P-11; RN-08; ACT-05. |
| RF derivados | RF-18 (existente) |
| Prioridad | Media |

## 8.18 HU-18 — Consultar tiempos de respuesta

| Campo | Contenido |
|---|---|
| Código | HU-18 |
| Título corto | Consultar tiempos de respuesta |
| Historia | Como usuario de Talento Humano, quiero consultar reportes de tiempos de respuesta por tipo de solicitud y responsable, para evaluar el desempeño del proceso. |
| Criterios de aceptación | Antecedentes: existen solicitudes con fechas y responsables registrados y el usuario puede consultar reportes. **CA-1 Filtros:** al consultar permisos atendidos por Carlos Pérez, el reporte usa los criterios tipo "Permiso laboral" y responsable "Carlos Pérez" y muestra los tiempos de las solicitudes coincidentes. **CA-2 Tiempos registrados:** el reporte utiliza el tiempo de atención registrado y no inventa valores. **CA-3 Período:** el resultado identifica el período consultado, por ejemplo, del 01/10/2026 al 31/10/2026. **CA-4 Sin coincidencias:** el sistema informa cuando no hay solicitudes que cumplan los filtros. |
| Origen de la necesidad | HU original; CU-07; RN-10. |
| RF derivados | RF-19 (existente) |
| Prioridad | Media |

## 8.19 HU-19 — Cambiar solicitud a En revisión

| Campo | Contenido |
|---|---|
| Código | HU-19 |
| Título corto | Cambiar solicitud a En revisión |
| Historia | Como usuario de Talento Humano, quiero cambiar una solicitud al estado En revisión cuando necesite validaciones adicionales, registrando una nota explicativa, para dejar constancia del motivo. |
| Criterios de aceptación | Antecedentes: existe una solicitud que puede pasar a En revisión y el usuario está autorizado. **CA-1 Cambio de estado:** RAD-2026-017 queda En revisión cuando el usuario selecciona ese cambio. **CA-2 Nota obligatoria:** el sistema no cambia RAD-2026-018 si falta la nota y solicita ingresarla. **CA-3 Nota registrada:** al registrar "Validar soporte adjunto", el sistema asocia la nota al cambio y deja la solicitud En revisión. **CA-4 Historial:** el historial identifica el cambio de estado y conserva la nota explicativa. |
| Origen de la necesidad | HU original; CU-04; RN-03 y RN-06. |
| RF derivados | RF-20 (existente) |
| Prioridad | Alta |

## 8.20 HU-20 — Consultar solicitudes con filtros

| Campo | Contenido |
|---|---|
| Código | HU-20 |
| Título corto | Consultar solicitudes con filtros |
| Historia | Como responsable de Talento Humano, quiero consultar solicitudes mediante filtros por estado, tipo, fecha y empleado, para revisar la información de forma organizada. |
| Criterios de aceptación | Antecedentes: existen solicitudes registradas y el responsable tiene permiso para consultarlas. **CA-1 Filtros combinados:** al seleccionar estado "Pendiente", tipo "Permiso laboral", período y empleado, el sistema aplica conjuntamente los filtros. **CA-2 Resultados:** si tres solicitudes cumplen los criterios, el sistema muestra únicamente esas solicitudes. **CA-3 Cambio de filtro:** al modificar un criterio, el resultado se actualiza conforme al nuevo criterio. **CA-4 Sin coincidencias:** el sistema informa cuando ninguna solicitud coincide con los filtros. |
| Origen de la necesidad | HU original; CU-05; P-01, P-08 y P-09. |
| RF derivados | RF-21 (existente) |
| Prioridad | Media |

## 8.21 HU-21 — Consultar historial personal

| Campo | Contenido |
|---|---|
| Código | HU-21 |
| Título corto | Consultar historial personal |
| Historia | Como empleado, quiero consultar el historial de mis solicitudes anteriores con fechas, estados y respuestas recibidas, para tener un registro completo de lo gestionado. |
| Criterios de aceptación | **CA-1 Consulta exclusiva:** el sistema muestra únicamente las solicitudes de Ana Torres. **CA-2 Fechas y estados:** cada solicitud muestra su fecha y estado. **CA-3 Respuestas y comentarios:** muestra la respuesta o comentario registrado junto a la solicitud. **CA-4 Sin solicitudes:** informa cuando no existen solicitudes anteriores para mostrar. |
| Origen de la necesidad | HU original; ACT-01; CU-05; P-06 y P-09. |
| RF derivados | RF-21 (existente) |
| Prioridad | Media |

## 8.22 HU-22 — Cancelar solicitud

| Campo | Contenido |
|---|---|
| Código | HU-22 |
| Título corto | Cancelar solicitud |
| Historia | Como empleado, quiero cancelar una solicitud que envié pero que aún no ha sido procesada, para corregir un error o retirarla si ya no la necesito. |
| Criterios de aceptación | **CA-1 Cancelación permitida:** si RAD-2026-019 está pendiente, el sistema la cancela y registra la acción. **CA-2 Solicitud aprobada:** no permite cancelar RAD-2026-020 si está aprobada. **CA-3 Solicitud rechazada:** no permite cancelar RAD-2026-021 si está rechazada. **CA-4 Trazabilidad:** la cancelación de RAD-2026-019 aparece en el historial con la información de la acción. |
| Origen de la necesidad | HU original; RN-04 y RN-06; CU-04. |
| RF derivados | RF-23 (existente) |
| Prioridad | Alta |

## 8.23 HU-23 — Reasignar solicitud

| Campo | Contenido |
|---|---|
| Código | HU-23 |
| Título corto | Reasignar solicitud |
| Historia | Como usuario de Talento Humano, quiero reasignar una solicitud a otro responsable registrando un motivo obligatorio, para garantizar la trazabilidad del proceso. |
| Criterios de aceptación | **CA-1 Responsable autorizado:** reasignar RAD-2026-022 de Carlos Pérez a Laura Gómez deja la nueva asignación asociada a la solicitud. **CA-2 Responsable no autorizado:** el sistema no reasigna a un usuario que no puede recibir solicitudes. **CA-3 Motivo obligatorio:** no completa la reasignación sin motivo y solicita ingresarlo. **CA-4 Registro histórico:** la reasignación con motivo "Distribución de carga" queda identificada en el historial. |
| Origen de la necesidad | HU original; RN-07; CU-04. |
| RF derivados | RF-24 (existente) |
| Prioridad | Alta |

## 8.24 HU-24 — Consultar resumen de solicitudes

| Campo | Contenido |
|---|---|
| Código | HU-24 |
| Título corto | Consultar resumen de solicitudes |
| Historia | Como gerente, quiero consultar un resumen de las solicitudes por tipo y período, para tener visibilidad sobre el estado del equipo y apoyar la toma de decisiones. |
| Criterios de aceptación | **CA-1 Selección de período:** al seleccionar del 01/10/2026 al 31/10/2026, el sistema genera el resumen de ese período. **CA-2 Diferenciación por tipo:** diferencia permisos, vacaciones, incapacidades y certificados. **CA-3 Correspondencia con el período:** excluye solicitudes fuera del período seleccionado. **CA-4 Período sin información:** informa cuando no existen datos para el período. |
| Origen de la necesidad | HU original; ACT-04; CU-07; RN-10. |
| RF derivados | RF-25 (existente) |
| Prioridad | Media |

## 8.25 HU-25 — Consultar perfil organizacional del empleado

| Campo | Contenido |
|---|---|
| Código | HU-25 |
| Título corto | Consultar perfil organizacional del empleado |
| Historia | Como usuario de Talento Humano, quiero consultar el área, cargo y rol asociados a un empleado, para identificar su contexto organizacional al gestionar una solicitud. |
| Criterios de aceptación | **CA-1 Identificación:** al seleccionar a Ana Torres, el sistema identifica que el perfil corresponde a ella. **CA-2 Datos organizacionales:** muestra el área "Talento Humano", el cargo "Analista" y el rol registrados. **CA-3 Información correspondiente:** no mezcla datos de otros empleados. **CA-4 Datos no registrados:** muestra los datos disponibles y no inventa los faltantes. |
| Origen de la necesidad | ACT-03; Diccionario de Datos como soporte de datos organizacionales; validación de negocio pendiente. |
| RF derivados | RF-27 (nuevo; validar) |
| Prioridad | Media |

## 8.26 HU-26 — Consultar detalle de una solicitud

| Campo | Contenido |
|---|---|
| Código | HU-26 |
| Título corto | Consultar detalle de una solicitud |
| Historia | Como empleado o usuario de Talento Humano, quiero consultar el detalle de una solicitud, para conocer su radicado, tipo, fecha, estado y responsable. |
| Criterios de aceptación | **CA-1 Radicado:** el detalle muestra RAD-2026-023. **CA-2 Información básica:** muestra tipo, fecha y estado actual. **CA-3 Responsable:** muestra el responsable vigente cuando existe. **CA-4 Solicitud inexistente:** informa cuando RAD-9999 no fue encontrada. |
| Origen de la necesidad | CU-05: Consultar Solicitudes e Historial; P-01 y P-09. |
| RF derivados | RF-28 (nuevo; validar) |
| Prioridad | Alta |

## 8.27 HU-27 — Consultar responsable actual

| Campo | Contenido |
|---|---|
| Código | HU-27 |
| Título corto | Consultar responsable actual |
| Historia | Como usuario de Talento Humano, quiero consultar el responsable actual de una solicitud, para saber quién debe atenderla. |
| Criterios de aceptación | **CA-1 Responsable vigente:** identifica a Carlos Pérez como responsable de RAD-2026-024. **CA-2 Correspondencia:** muestra únicamente la asignación de esa solicitud. **CA-3 Asignación finalizada:** no presenta como vigente una asignación finalizada. **CA-4 Sin responsable vigente:** informa cuando la solicitud no tiene una asignación vigente. |
| Origen de la necesidad | CU-04 y CU-05; P-04. |
| RF derivados | RF-29 (nuevo; validar) |
| Prioridad | Alta |

## 8.28 HU-28 — Consultar historial de asignaciones

| Campo | Contenido |
|---|---|
| Código | HU-28 |
| Título corto | Consultar historial de asignaciones |
| Historia | Como usuario de Talento Humano, quiero consultar las asignaciones y reasignaciones de una solicitud, para reconstruir quién tuvo la responsabilidad en cada momento. |
| Criterios de aceptación | **CA-1 Consulta:** muestra las asignaciones de RAD-2026-025 a Carlos Pérez y posteriormente a Laura Gómez. **CA-2 Estados:** distingue la asignación finalizada de Carlos de la asignación vigente de Laura. **CA-3 Fechas:** muestra la fecha correspondiente a cada asignación. **CA-4 Sin asignaciones:** informa cuando no existen asignaciones históricas. |
| Origen de la necesidad | CU-04: reasignación; RN-07; P-04; validación de negocio pendiente para la consulta histórica. |
| RF derivados | RF-30 (nuevo; validar) |
| Prioridad | Media |

## 8.29 HU-29 — Finalizar una asignación

| Campo | Contenido |
|---|---|
| Código | HU-29 |
| Título corto | Finalizar una asignación |
| Historia | Como usuario de Talento Humano, quiero finalizar la responsabilidad de una asignación, para dejar disponible la solicitud para una nueva asignación cuando corresponda. |
| Criterios de aceptación | **CA-1 Finalización:** al finalizar la asignación vigente de Carlos Pérez para RAD-2026-026, queda marcada como finalizada. **CA-2 Fecha:** el sistema registra la fecha de finalización. **CA-3 Deja de estar activa:** Carlos ya no aparece como responsable activo. **CA-4 Ya finalizada:** el sistema no trata una asignación finalizada como vigente si se intenta finalizar de nuevo. |
| Origen de la necesidad | CU-04 Gestionar Solicitudes y modelo de AsignacionSolicitud; validación de la regla de cierre pendiente. |
| RF derivados | RF-31 (nuevo; validar) |
| Prioridad | Media |

## 8.30 HU-30 — Consultar motivo de asignación o reasignación

| Campo | Contenido |
|---|---|
| Código | HU-30 |
| Título corto | Consultar motivo de asignación o reasignación |
| Historia | Como usuario de Talento Humano, quiero consultar el motivo registrado en una asignación, para conocer por qué una solicitud fue entregada a un responsable. |
| Criterios de aceptación | **CA-1 Consulta:** muestra "Distribución de carga" como motivo de la asignación de RAD-2026-027. **CA-2 Motivo asociado:** si hay varios motivos, muestra el correspondiente a la asignación consultada. **CA-3 Sin motivo:** informa cuando no existe un motivo registrado. **CA-4 Consulta sin modificación:** consultar el motivo no altera la asignación. |
| Origen de la necesidad | HU-23 y RN-07; validación de consulta de motivos pendiente. |
| RF derivados | RF-32 (nuevo; validar) |
| Prioridad | Media |

## 8.31 HU-31 — Adjuntar soporte adicional

| Campo | Contenido |
|---|---|
| Código | HU-31 |
| Título corto | Adjuntar soporte adicional |
| Historia | Como empleado, quiero agregar un documento adicional a una solicitud antes de que sea procesada, para complementar la información entregada. |
| Criterios de aceptación | **CA-1 Soporte adicional válido:** al adjuntar a RAD-2026-028 un documento que cumple el formato y tamaño permitidos, queda asociado a la solicitud. **CA-2 Formato no permitido:** el sistema rechaza el documento y no lo registra como soporte válido. **CA-3 Tamaño no permitido:** el sistema rechaza el archivo que supera el límite y solicita uno que lo cumpla. **CA-4 Registro de carga:** se identifica quién cargó el soporte y se conserva la fecha de carga. |
| Origen de la necesidad | CU-03 y ACT-01; P-03 y RN-11; validación de permitir múltiples soportes pendiente. |
| RF derivados | RF-33 (nuevo; validar) |
| Prioridad | Media |

## 8.32 HU-32 — Consultar documentos adjuntos

| Campo | Contenido |
|---|---|
| Código | HU-32 |
| Título corto | Consultar documentos adjuntos |
| Historia | Como empleado o usuario de Talento Humano, quiero consultar los documentos asociados a una solicitud, para verificar los soportes entregados. |
| Criterios de aceptación | **CA-1 Consulta:** muestra los dos documentos asociados a RAD-2026-029. **CA-2 Información del documento:** identifica el nombre, tipo y fecha de carga de "Soporte.pdf". **CA-3 Documento de otra solicitud:** no muestra documentos que pertenecen a otras solicitudes. **CA-4 Consulta sin modificación:** consultar los documentos no modifica los archivos ni sus registros. |
| Origen de la necesidad | CU-04: revisión de documentos; CU-05; ACT-01 y ACT-03. |
| RF derivados | RF-34 (nuevo; validar) |
| Prioridad | Media |

## 8.33 HU-33 — Recibir validación del documento adjunto

| Campo | Contenido |
|---|---|
| Código | HU-33 |
| Título corto | Recibir validación del documento adjunto |
| Historia | Como empleado, quiero recibir una respuesta clara cuando un archivo no cumple el formato o tamaño permitido, para corregirlo antes de enviar la solicitud. |
| Criterios de aceptación | **CA-1 Formato válido:** el sistema acepta la validación de "Soporte.pdf" si su formato está permitido. **CA-2 Formato inválido:** informa que "Soporte.exe" no es válido y no lo almacena como soporte. **CA-3 Tamaño máximo:** informa cuando el archivo supera el tamaño permitido y no lo almacena como soporte válido. **CA-4 Validación exitosa:** si el archivo cumple el formato y tamaño, puede continuar al proceso de almacenamiento. |
| Origen de la necesidad | CU-03 FE-02; ACT-01; RN-02; validación de mensajes de rechazo pendiente. |
| RF derivados | RF-35 (nuevo; validar) |
| Prioridad | Alta |

## 8.34 HU-34 — Consultar detalle de permiso laboral

| Campo | Contenido |
|---|---|
| Código | HU-34 |
| Título corto | Consultar detalle de permiso laboral |
| Historia | Como empleado o usuario de Talento Humano, quiero consultar el detalle de un permiso, para revisar fechas, motivo, tipo y estado del trámite. |
| Criterios de aceptación | **CA-1 Fechas:** muestra las fechas inicial y final de RAD-2026-030. **CA-2 Motivo:** muestra "Cita personal". **CA-3 Tipo y estado:** muestra el tipo de permiso y el estado actual, Pendiente. **CA-4 Solicitud consultada:** muestra únicamente la información correspondiente a RAD-2026-030. |
| Origen de la necesidad | CU-05 y CU-04; ACT-01 y ACT-03; validación de consulta específica pendiente. |
| RF derivados | RF-36 (nuevo; validar) |
| Prioridad | Media |

## 8.35 HU-35 — Consultar detalle de vacaciones

| Campo | Contenido |
|---|---|
| Código | HU-35 |
| Título corto | Consultar detalle de vacaciones |
| Historia | Como empleado o usuario de Talento Humano, quiero consultar el detalle de una solicitud de vacaciones, para revisar período, duración, tipo, estado y saldo asociado. |
| Criterios de aceptación | **CA-1 Fechas solicitadas:** muestra las fechas inicial y final del 15/10/2026 al 20/10/2026. **CA-2 Duración:** muestra la duración calculada asociada a las fechas. **CA-3 Tipo y estado:** muestra el tipo de solicitud y el estado Aprobada de RAD-2026-031. **CA-4 Saldo:** cuando la solicitud utiliza un saldo registrado, muestra la disponibilidad correspondiente si está disponible. |
| Origen de la necesidad | CU-05; RN-05; ACT-01 y ACT-03; validación de consulta ampliada pendiente. |
| RF derivados | RF-37 (nuevo; validar) |
| Prioridad | Media |

## 8.36 HU-36 — Consultar detalle de incapacidad

| Campo | Contenido |
|---|---|
| Código | HU-36 |
| Título corto | Consultar detalle de incapacidad |
| Historia | Como empleado o usuario de Talento Humano, quiero consultar el detalle de una incapacidad, para revisar período, tipo, estado, observación y soporte. |
| Criterios de aceptación | **CA-1 Período:** muestra las fechas del 12/10/2026 al 14/10/2026 para RAD-2026-032. **CA-2 Tipo y estado:** muestra el tipo "Incapacidad médica" y el estado registrado. **CA-3 Observación:** muestra la observación registrada. **CA-4 Soporte:** identifica el soporte asociado, si existe. |
| Origen de la necesidad | CU-04 y CU-05; RN-02; validación de consulta específica pendiente. |
| RF derivados | RF-38 (nuevo; validar) |
| Prioridad | Media |

## 8.37 HU-37 — Consultar certificado generado

| Campo | Contenido |
|---|---|
| Código | HU-37 |
| Título corto | Consultar certificado generado |
| Historia | Como empleado, quiero consultar y descargar el certificado laboral generado, para disponer del documento oficial solicitado. |
| Criterios de aceptación | **CA-1 Certificado correspondiente:** muestra el certificado asociado a RAD-2026-033. **CA-2 Archivo disponible:** permite consultar o descargar el archivo según la acción permitida. **CA-3 Descarga solicitada:** si Ana tiene varias solicitudes, descarga el certificado de RAD-2026-033 y no el de otra solicitud. **CA-4 Sin certificado generado:** informa que el certificado de RAD-2026-034 aún no está disponible. |
| Origen de la necesidad | ACT-01: permiso explícito para descargar certificados; CU-06; validación de reglas de descarga pendiente. |
| RF derivados | RF-39 (nuevo; validar) |
| Prioridad | Media |

## 8.38 HU-38 — Consultar estado de certificado

| Campo | Contenido |
|---|---|
| Código | HU-38 |
| Título corto | Consultar estado de certificado |
| Historia | Como empleado o usuario de Talento Humano, quiero consultar el estado de mi certificado laboral, para saber si está pendiente, generado o en el estado definido por el proceso. |
| Criterios de aceptación | **CA-1 Estado válido:** muestra Pendiente para el certificado de RAD-2026-035. **CA-2 Estado generado:** muestra el estado correspondiente cuando el certificado de RAD-2026-036 fue generado. **CA-3 Estado asociado:** el estado corresponde al certificado y solicitud consultados. **CA-4 Estado no mezclado:** al consultar RAD-2026-035 pendiente, no muestra el estado del certificado generado de RAD-2026-036. |
| Origen de la necesidad | EstadoCertificado + CU-06 + P-09; validación de estados exactos pendiente. |
| RF derivados | RF-40 (nuevo; validar) |
| Prioridad | Media |

## 8.39 HU-39 — Consultar notificaciones internas

| Campo | Contenido |
|---|---|
| Código | HU-39 |
| Título corto | Consultar notificaciones internas |
| Historia | Como empleado, quiero consultar mis notificaciones internas, para conocer los eventos relacionados con mis solicitudes. |
| Criterios de aceptación | **CA-1 Solo notificaciones propias:** Ana ve únicamente las notificaciones dirigidas a ella. **CA-2 Asunto y fecha:** muestra el asunto "Solicitud aprobada" y la fecha de la notificación. **CA-3 Solicitud relacionada:** identifica la solicitud relacionada cuando corresponda, como RAD-2026-037. **CA-4 Sin notificaciones:** informa cuando no existen notificaciones para mostrar. |
| Origen de la necesidad | HU-17; ACT-01; P-10 y P-11; validación de filtros de notificación pendiente. |
| RF derivados | RF-41 (nuevo; validar) |
| Prioridad | Media |

## 8.40 HU-40 — Marcar notificación como leída

| Campo | Contenido |
|---|---|
| Código | HU-40 |
| Título corto | Marcar notificación como leída |
| Historia | Como empleado, quiero marcar una notificación como leída, para distinguir los avisos que ya revisé. |
| Criterios de aceptación | **CA-1 Marcar como leída:** cuando Ana marca como leída la notificación "Solicitud aprobada", su estado cambia a leída. **CA-2 Estado posterior:** aparece como leída al volver a consultar las notificaciones. **CA-3 Contenido conservado:** mantiene el asunto y la fecha. **CA-4 Notificación de otro usuario:** el sistema no permite que Ana modifique la notificación de otra persona. |
| Origen de la necesidad | Modelo de Notificacion + HU-17; necesidad de lectura derivada del atributo leida y validación pendiente. |
| RF derivados | RF-42 (nuevo; validar) |
| Prioridad | Baja |

## 8.41 HU-41 — Solicitar nuevo enlace de recuperación

| Campo | Contenido |
|---|---|
| Código | HU-41 |
| Título corto | Solicitar nuevo enlace de recuperación |
| Historia | Como usuario, quiero solicitar un nuevo enlace temporal de recuperación cuando el anterior haya expirado, para restablecer mi acceso. |
| Criterios de aceptación | **CA-1 Nuevo enlace:** si el enlace de ana.torres@empresa.com está vencido, el sistema genera un nuevo mecanismo temporal. **CA-2 Enlace anterior:** el anterior deja de ser utilizable cuando corresponda. **CA-3 Vigencia:** el nuevo mecanismo tiene una vigencia temporal definida. **CA-4 Uso del mecanismo:** si el enlace está vigente, Ana puede continuar el proceso de restablecimiento. |
| Origen de la necesidad | CU-02 FA-01: solicitar un nuevo enlace de recuperación; modelo RecuperacionClave. |
| RF derivados | RF-43 (nuevo; validar) |
| Prioridad | Alta |

## 8.42 HU-42 — Consultar tipos de solicitud disponibles

| Campo | Contenido |
|---|---|
| Código | HU-42 |
| Título corto | Consultar tipos de solicitud disponibles |
| Historia | Como empleado, quiero consultar los tipos de solicitud disponibles antes de registrar una solicitud, para seleccionar el trámite correcto. |
| Criterios de aceptación | **CA-1 Tipos habilitados:** muestra los tipos habilitados: Permiso laboral, Vacaciones, Incapacidad y Certificado laboral. **CA-2 Nombre identificable:** cada tipo tiene un nombre que permite identificarlo. **CA-3 Selección:** al seleccionar "Vacaciones", el sistema dirige al formulario correspondiente. **CA-4 Tipo no habilitado:** los tipos no habilitados no aparecen como opciones. |
| Origen de la necesidad | CU-03: selección del tipo de solicitud; HU-03 a HU-06; validación de catálogo visible pendiente. |
| RF derivados | RF-44 (nuevo; validar) |
| Prioridad | Media |

## 8.43 HU-43 — Consultar estados válidos de solicitud

| Campo | Contenido |
|---|---|
| Código | HU-43 |
| Título corto | Consultar estados válidos de solicitud |
| Historia | Como usuario de Talento Humano, quiero conocer los estados válidos de una solicitud, para interpretar correctamente el avance del trámite. |
| Criterios de aceptación | **CA-1 Estados válidos:** el conjunto incluye Pendiente, En revisión, Aprobada, Rechazada y Cancelada. **CA-2 Estado actual válido:** Pendiente se reconoce como válido para RAD-2026-038. **CA-3 Estado no definido:** el sistema no reconoce como válido un estado fuera del conjunto. **CA-4 Presentación:** muestra cada estado de forma comprensible y diferenciable. |
| Origen de la necesidad | RN-03 Estados válidos; CU-04 y CU-05; validación de consulta de catálogo pendiente. |
| RF derivados | RF-45 (nuevo; validar) |
| Prioridad | Media |

## 8.44 HU-44 — Consultar acciones registradas en el historial

| Campo | Contenido |
|---|---|
| Código | HU-44 |
| Título corto | Consultar acciones registradas en el historial |
| Historia | Como usuario de Talento Humano o Gerencia, quiero identificar el tipo de acción registrada en el historial, para interpretar cada evento de una solicitud. |
| Criterios de aceptación | **CA-1 Tipo válido:** el evento de aprobación de RAD-2026-039 muestra un tipo de acción válido. **CA-2 Acción asociada:** el evento aparece asociado a RAD-2026-039. **CA-3 Diferenciación:** permite distinguir eventos de creación, asignación y aprobación. **CA-4 Solo consulta:** consultar las acciones históricas no modifica los registros. |
| Origen de la necesidad | HU-15; RN-06 y RN-12; modelo TipoAccion. |
| RF derivados | RF-46 (nuevo; validar) |
| Prioridad | Media |

## 8.45 HU-45 — Consultar registros de acceso

| Campo | Contenido |
|---|---|
| Código | HU-45 |
| Título corto | Consultar registros de acceso |
| Historia | Como usuario autorizado de Talento Humano, quiero consultar los registros de acceso, para verificar cuándo se produjeron intentos de ingreso y cuál fue su resultado. |
| Criterios de aceptación | **CA-1 Información del registro:** identifica usuario, fecha y resultado; por ejemplo, un acceso de Ana Torres del 05/10/2026. **CA-2 Acceso exitoso:** identifica el registro como exitoso. **CA-3 Acceso fallido:** identifica el registro como intento fallido. **CA-4 Solo lectura:** consultar los registros no los modifica. |
| Origen de la necesidad | RNF-09 Registro automático de auditoría + RegistroAcceso del Diccionario; validación de permisos de consulta pendiente. |
| RF derivados | RF-47 (nuevo; validar) |
| Prioridad | Media |

## 8.46 HU-46 — Consultar auditoría de operaciones

| Campo | Contenido |
|---|---|
| Código | HU-46 |
| Título corto | Consultar auditoría de operaciones |
| Historia | Como usuario autorizado de Talento Humano o Gerencia, quiero consultar la auditoría de operaciones sobre información crítica, para verificar quién realizó una acción y cuándo. |
| Criterios de aceptación | **CA-1 Información de operación:** identifica usuario, entidad afectada, operación y fecha. **CA-2 Operaciones diferenciadas:** distingue INSERT, UPDATE y DELETE cuando estén registrados. **CA-3 Solo lectura:** consultar la auditoría no modifica sus registros. **CA-4 Operación no registrada:** no inventa información si no existe un registro. |
| Origen de la necesidad | RNF-09; RN-12; ACT-03 y ACT-04; validación de permisos de auditoría pendiente. |
| RF derivados | RF-48 (nuevo; validar) |
| Prioridad | Media |

## 8.47 HU-47 — Consultar detalle de un cambio auditado

| Campo | Contenido |
|---|---|
| Código | HU-47 |
| Título corto | Consultar detalle de un cambio auditado |
| Historia | Como usuario autorizado, quiero consultar los valores anterior y nuevo de un campo modificado, para entender exactamente qué información cambió. |
| Criterios de aceptación | **CA-1 Campo:** identifica el campo modificado, por ejemplo, "estado". **CA-2 Valores:** muestra "Pendiente" como valor anterior y "Aprobada" como valor nuevo cuando están registrados. **CA-3 Asociación:** el detalle permanece asociado a la auditoría correspondiente a RAD-2026-040. **CA-4 Valor no disponible:** muestra únicamente los valores disponibles. |
| Origen de la necesidad | RNF-09; modelo DetalleAuditoria; validación de alcance de consulta pendiente. |
| RF derivados | RF-49 (nuevo; validar) |
| Prioridad | Media |

## 8.48 HU-48 — Consultar saldo de vacaciones por período

| Campo | Contenido |
|---|---|
| Código | HU-48 |
| Título corto | Consultar saldo de vacaciones por período |
| Historia | Como usuario de Talento Humano, quiero consultar el saldo de vacaciones de un empleado por período, para revisar los días generados y utilizados. |
| Criterios de aceptación | **CA-1 Empleado y período:** identifica a Ana Torres y el período 2026. **CA-2 Días generados y utilizados:** muestra 15 días generados y 5 utilizados. **CA-3 Saldo por combinación:** presenta el saldo correspondiente a esa persona y período. **CA-4 Período sin saldo:** informa cuando no existe información para el período consultado. |
| Origen de la necesidad | HU-11; RN-05; restricción UNIQUE de SaldoVacaciones; validación de consulta independiente pendiente. |
| RF derivados | RF-50 (nuevo; validar) |
| Prioridad | Alta |

## 8.49 HU-49 — Consultar días disponibles de vacaciones

| Campo | Contenido |
|---|---|
| Código | HU-49 |
| Título corto | Consultar días disponibles de vacaciones |
| Historia | Como empleado, quiero conocer mis días disponibles de vacaciones, para verificar cuánto tiempo puedo solicitar. |
| Criterios de aceptación | **CA-1 Cálculo:** calcula la disponibilidad de Ana a partir de 15 días generados y 5 utilizados. **CA-2 Período:** corresponde al período consultado. **CA-3 Solo consulta:** consultar no modifica el saldo. **CA-4 Sin saldo:** informa cuando no hay información para calcular la disponibilidad del período. |
| Origen de la necesidad | HU-11; ACT-01; P-09; validación de autoservicio del saldo pendiente. |
| RF derivados | RF-51 (nuevo; validar) |
| Prioridad | Media |

## 8.50 HU-50 — Consultar reportes generados

| Campo | Contenido |
|---|---|
| Código | HU-50 |
| Título corto | Consultar reportes generados |
| Historia | Como usuario de Talento Humano o Gerencia, quiero consultar los reportes que ya fueron generados, para recuperar información de gestión previamente obtenida. |
| Criterios de aceptación | **CA-1 Tipo:** identifica el tipo de reporte generado, por ejemplo, tiempos de respuesta. **CA-2 Fecha:** muestra la fecha de generación, como 20/10/2026. **CA-3 Usuario autorizado:** permite acceder al reporte disponible para ese usuario. **CA-4 Sin autorización:** no presenta como disponible un reporte que no corresponde al usuario autorizado. |
| Origen de la necesidad | CU-07 Generar Reportes de Gestión; ACT-03 y ACT-04; validación de repositorio de reportes pendiente. |
| RF derivados | RF-52 (nuevo; validar) |
| Prioridad | Media |

## 8.51 HU-51 — Generar reporte por tipo de solicitud

| Campo | Contenido |
|---|---|
| Código | HU-51 |
| Título corto | Generar reporte por tipo de solicitud |
| Historia | Como usuario de Talento Humano o Gerencia, quiero generar reportes por tipo de solicitud, para analizar la cantidad y el estado de los trámites realizados. |
| Criterios de aceptación | **CA-1 Selección de tipo:** el usuario selecciona un tipo de solicitud y el sistema genera el reporte correspondiente. **CA-2 Resultados por tipo:** el reporte incluye únicamente solicitudes del tipo seleccionado. **CA-3 Período:** si se define un período, el reporte considera las solicitudes registradas dentro de ese intervalo. **CA-4 Sin resultados:** el sistema informa cuando no hay solicitudes que coincidan con los criterios. |
| Origen de la necesidad | HU-18 y HU-24; CU-07; RN-29 y RN-30. |
| RF derivados | RF-53 (nuevo; validar) |
| Prioridad | Media |

## 8.52 HU-52 — Generar reporte por responsable

| Campo | Contenido |
|---|---|
| Código | HU-52 |
| Título corto | Generar reporte por responsable |
| Historia | Como usuario de Talento Humano o Gerencia, quiero generar reportes por responsable, para revisar la gestión de las solicitudes asignadas. |
| Criterios de aceptación | **CA-1 Selección de responsable:** el usuario selecciona un responsable y el sistema genera el reporte correspondiente. **CA-2 Asignaciones registradas:** relaciona los resultados con las asignaciones registradas. **CA-3 Período:** el reporte considera el período seleccionado, cuando se indique. **CA-4 Sin resultados:** informa cuando no existen solicitudes coincidentes. |
| Origen de la necesidad | HU-18 y HU-24; CU-07; RN-29 y RN-30. |
| RF derivados | RF-54 (nuevo; validar) |
| Prioridad | Media |

## 8.53 HU-53 — Exportar reporte de gestión

| Campo | Contenido |
|---|---|
| Código | HU-53 |
| Título corto | Exportar reporte de gestión |
| Historia | Como usuario autorizado de Talento Humano o Gerencia, quiero exportar un reporte de gestión, para conservar o compartir la información consultada. |
| Criterios de aceptación | **CA-1 Exportación:** el usuario puede exportar un reporte generado. **CA-2 Correspondencia:** el archivo conserva la información del resultado consultado. **CA-3 Archivo disponible:** el sistema permite acceder al archivo exportado. **CA-4 Sin información:** informa cuando no hay resultados que exportar. |
| Origen de la necesidad | CU-07 Generar Reportes de Gestión; ACT-03 y ACT-04. |
| RF derivados | RF-55 (nuevo; validar) |
| Prioridad | Media |

## 8.54 HU-54 — Generar reporte consolidado por período

| Campo | Contenido |
|---|---|
| Código | HU-54 |
| Título corto | Generar reporte consolidado por período |
| Historia | Como usuario de Talento Humano o Gerencia, quiero generar un reporte consolidado para un período, para consultar en conjunto la gestión de solicitudes. |
| Criterios de aceptación | **CA-1 Período:** el usuario selecciona un período y el sistema genera el reporte consolidado correspondiente. **CA-2 Tipos incluidos:** el reporte incorpora los tipos de solicitud definidos para el informe. **CA-3 Solicitudes del período:** excluye las solicitudes que estén fuera del período seleccionado. **CA-4 Sin información:** informa cuando no hay datos para el período. |
| Origen de la necesidad | HU-24 y CU-07; RN-29 y RN-30. |
| RF derivados | RF-56 (nuevo; validar) |
| Prioridad | Media |

## 8.55 HU-55 — Consultar solicitudes por área

| Campo | Contenido |
|---|---|
| Código | HU-55 |
| Título corto | Consultar solicitudes por área |
| Historia | Como usuario autorizado de Talento Humano o Gerencia, quiero consultar solicitudes por área organizacional, para revisar los trámites asociados a cada área. |
| Criterios de aceptación | **CA-1 Selección de área:** el usuario selecciona un área y el sistema consulta las solicitudes correspondientes. **CA-2 Resultados filtrados:** muestra únicamente solicitudes asociadas al área seleccionada. **CA-3 Período:** aplica el período seleccionado, cuando corresponda. **CA-4 Sin coincidencias:** informa cuando no hay solicitudes que cumplan el filtro. |
| Origen de la necesidad | HU-25; CU-07; RN-27 y RN-29. |
| RF derivados | RF-57 (nuevo; validar) |
| Prioridad | Media |

## 8.56 HU-56 — Consultar solicitudes por cargo

| Campo | Contenido |
|---|---|
| Código | HU-56 |
| Título corto | Consultar solicitudes por cargo |
| Historia | Como usuario autorizado de Talento Humano o Gerencia, quiero consultar solicitudes por cargo, para revisar los trámites asociados a cada cargo organizacional. |
| Criterios de aceptación | **CA-1 Selección de cargo:** el usuario selecciona un cargo y el sistema consulta las solicitudes correspondientes. **CA-2 Resultados filtrados:** muestra únicamente solicitudes asociadas al cargo seleccionado. **CA-3 Período:** aplica el período seleccionado, cuando corresponda. **CA-4 Sin coincidencias:** informa cuando no hay solicitudes que cumplan el filtro. |
| Origen de la necesidad | HU-25; CU-07; RN-27 y RN-29. |
| RF derivados | RF-58 (nuevo; validar) |
| Prioridad | Media |

## 8.57 HU-57 — Consultar solicitudes por rol

| Campo | Contenido |
|---|---|
| Código | HU-57 |
| Título corto | Consultar solicitudes por rol |
| Historia | Como usuario autorizado de Talento Humano o Gerencia, quiero consultar solicitudes por rol, para revisar la información correspondiente a cada rol del sistema. |
| Criterios de aceptación | **CA-1 Selección de rol:** el usuario selecciona un rol y el sistema consulta las solicitudes correspondientes. **CA-2 Resultados filtrados:** muestra únicamente solicitudes que cumplen el criterio seleccionado. **CA-3 Autorización:** respeta los permisos del usuario que realiza la consulta. **CA-4 Sin coincidencias:** informa cuando no hay solicitudes que cumplan el filtro. |
| Origen de la necesidad | HU-25; CU-07; RN-27 y RN-29. |
| RF derivados | RF-59 (nuevo; validar) |
| Prioridad | Media |

## 8.58 HU-58 — Consultar historial de accesos de un usuario

| Campo | Contenido |
|---|---|
| Código | HU-58 |
| Título corto | Consultar historial de accesos de un usuario |
| Historia | Como usuario autorizado, quiero consultar el historial de accesos de un usuario, para revisar sus intentos de ingreso al sistema. |
| Criterios de aceptación | **CA-1 Selección de usuario y período:** el usuario autorizado selecciona una cuenta y un período. **CA-2 Registros:** el sistema muestra la fecha, el resultado y la dirección IP cuando estén registrados. **CA-3 Correspondencia:** el historial corresponde al usuario consultado. **CA-4 Sin registros:** informa cuando no hay accesos registrados para ese período. |
| Origen de la necesidad | HU-45; RegistroAcceso; RN-27 y RN-30. |
| RF derivados | RF-60 (nuevo; validar) |
| Prioridad | Media |

## 8.59 HU-59 — Consultar auditoría por usuario

| Campo | Contenido |
|---|---|
| Código | HU-59 |
| Título corto | Consultar auditoría por usuario |
| Historia | Como usuario autorizado, quiero consultar las operaciones auditadas por usuario, para revisar las acciones que realizó en el sistema. |
| Criterios de aceptación | **CA-1 Selección de usuario:** el usuario autorizado selecciona una cuenta y consulta sus operaciones auditadas. **CA-2 Información de auditoría:** muestra las operaciones correspondientes al usuario seleccionado. **CA-3 Autorización:** respeta las restricciones de consulta configuradas. **CA-4 Sin registros:** informa cuando no existen operaciones auditadas para ese usuario. |
| Origen de la necesidad | HU-46; modelo AuditoriaSistema; RN-27. |
| RF derivados | RF-61 (nuevo; validar) |
| Prioridad | Media |

## 8.60 HU-60 — Consultar solicitudes por período y estado

| Campo | Contenido |
|---|---|
| Código | HU-60 |
| Título corto | Consultar solicitudes por período y estado |
| Historia | Como usuario autorizado de Talento Humano o Gerencia, quiero consultar solicitudes combinando período y estado, para obtener resultados específicos de gestión. |
| Criterios de aceptación | **CA-1 Período y estado:** el usuario selecciona un período y un estado válido. **CA-2 Aplicación de criterios:** el sistema combina ambos filtros. **CA-3 Resultados:** muestra únicamente solicitudes que cumplen el período y estado seleccionados. **CA-4 Sin coincidencias:** informa cuando no hay solicitudes que cumplan ambos criterios. |
| Origen de la necesidad | CU-07; RN-03 y RN-30. |
| RF derivados | RF-62 (nuevo; validar) |
| Prioridad | Media |
