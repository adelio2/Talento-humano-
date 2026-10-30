15. Casos de Uso (CU)

Este capítulo documenta las interacciones del sistema con sus actores. Cada ficha conserva la plantilla de actor, precondición, flujo básico en Evento/Respuesta, alternativas y excepciones, poscondición y procedencia. La matriz final permite rastrear las HU y sus criterios de aceptación hasta el caso y el flujo que los cubre.

## 15.1 Diagrama general de casos de uso UML

 

*Figura 1. Diagrama general de casos de uso del Sistema de Gestión de Solicitudes de Talento Humano.*

La frontera delimita el sistema; los actores quedan fuera y se conectan con los casos que inician o utilizan. Las asociaciones son líneas continuas. <<include>> apunta al caso incluido y representa el comportamiento obligatorio; <<extend>> apunta al caso base y representa un comportamiento condicionado. Los flujos alternativos se especifican en las fichas, no como óvalos adicionales. Relaciones de este modelo: CU-03 incluye CU-04; CU-02 extiende CU-01; CU-08 extiende CU-03.

Catálogo de casos de uso. La tabla resume su operación, las historias que los originan y los requisitos funcionales que implementan.

| Caso de uso | Nombre | CRUD | Nace de | Implementa |
|---|---|---|---|---|
| CU-01 | Autenticarse en el sistema | R | HU-01 | RF-01 |
| CU-02 | Recuperar contraseña | U | HU-02, HU-41 | RF-02, RF-43 |
| CU-03 | Registrar solicitud de Talento Humano | C | HU-03, HU-04, HU-05, HU-06 | RF-03, RF-04, RF-05, RF-06, RF-13 |
| CU-04 | Asignar responsable inicial | U | HU-09 | RF-09 |
| CU-05 | Gestionar solicitudes | R/U | HU-07, HU-08, HU-11, HU-16, HU-19, HU-22 | RF-07, RF-08, RF-11, RF-17, RF-20, RF-23 |
| CU-06 | Gestionar asignaciones y responsables | C/R/U | HU-23, HU-27, HU-28, HU-29, HU-30 | RF-24, RF-29, RF-30, RF-31, RF-32 |
| CU-07 | Consultar solicitudes e historial personal | R | HU-13, HU-20, HU-21, HU-26, HU-34, HU-35, HU-36 | RF-13, RF-14, RF-21, RF-28, RF-36, RF-37, RF-38 |
| CU-08 | Gestionar documentos adjuntos | C/R | HU-14, HU-31, HU-32, HU-33 | RF-15, RF-33, RF-34, RF-35 |
| CU-09 | Gestionar notificaciones y alertas | C/R | HU-10, HU-17, HU-39, HU-40 | RF-10, RF-18, RF-41, RF-42 |
| CU-10 | Generar y consultar certificados laborales | C/R | HU-05, HU-12, HU-37, HU-38 | RF-05, RF-12, RF-39, RF-40 |
| CU-11 | Consultar saldos y días de vacaciones | R | HU-48, HU-49 | RF-50, RF-51 |
| CU-12 | Consultar perfiles organizacionales y catálogos | R | HU-25, HU-42, HU-43 | RF-27, RF-44, RF-45 |
| CU-13 | Consultar historial y auditoría | R | HU-15, HU-44, HU-45, HU-46, HU-47, HU-58, HU-59 | RF-16, RF-26, RF-46, RF-47, RF-48, RF-49, RF-60, RF-61 |
| CU-14 | Generar, consultar y exportar reportes | R | HU-18, HU-24, HU-50, HU-51, HU-52, HU-53, HU-54, HU-55, HU-56, HU-57, HU-60 | RF-19, RF-25, RF-52, RF-53, RF-54, RF-55, RF-56, RF-57, RF-58, RF-59, RF-62 |

## 15.2 CU-01 — Autenticarse en el sistema

| Campo | Contenido | Procedencia |
|---|---|---|
| Código | CU-01 | — |
| Nombre | Autenticarse en el sistema | — |
| Actor | Actor principal: ACT-01 Empleado, ACT-02 Jefe inmediato, ACT-03 Usuario de Talento Humano o ACT-04 Gerencia. | Actores ACT definidos en el contexto del proyecto. |
| Precondición | El usuario tiene una cuenta registrada y activa y se encuentra en la pantalla de acceso. | Antecedentes de las HU relacionadas y RN aplicables. |
| Flujo básico (Evento / Respuesta) | 1. El usuario abre la opción de acceso e ingresa su correo y contraseña. / El sistema recibe las credenciales para validarlas. <br> 2. El usuario solicita iniciar sesión. / El sistema valida las credenciales y determina el rol asociado a la cuenta. <br> 3. El usuario presenta credenciales válidas. / El sistema crea la sesión y muestra únicamente el menú y las funciones permitidas para el rol. | Paso 1: HU-01 CA-1 <br> Paso 2: HU-01 CA-1, CA-4; RF-01 <br> Paso 3: HU-01 CA-1, CA-4; RNF-03 |
| Flujo alternativo FA-01 | FA-01 Credenciales incorrectas. El sistema rechaza el acceso, informa que las credenciales no son válidas y mantiene al usuario fuera de las funciones internas. | HU-01 CA-2 |
| Flujo alternativo FA-02 | FA-02 Correo no registrado. El sistema rechaza el acceso y muestra un mensaje de credenciales no válidas sin revelar información interna. | HU-01 CA-3 |
| Poscondición | El usuario queda autenticado con una sesión asociada a su rol, o permanece sin acceso si la validación falla. | Criterios de aceptación: HU-01 CA-1 y CA-4 → FB-02–FB-03; CA-2 → FA-01; CA-3 → FA-02. |

## 15.3 CU-02 — Recuperar contraseña

| Campo | Contenido | Procedencia |
|---|---|---|
| Código | CU-02 | — |
| Nombre | Recuperar contraseña | — |
| Actor | Actor principal: ACT-01 Empleado, ACT-02 Jefe inmediato, ACT-03 Usuario de Talento Humano o ACT-04 Gerencia. Actor secundario: ACT-05 Sistema de Correo y Notificaciones. | Actores ACT definidos en el contexto del proyecto. |
| Precondición | El usuario tiene una cuenta activa y un correo registrado. Para solicitar un nuevo enlace, el mecanismo anterior expiró o dejó de ser utilizable. | Antecedentes de las HU relacionadas y RN aplicables. |
| Flujo básico (Evento / Respuesta) | 1. El usuario selecciona recuperar contraseña e ingresa el correo registrado. / El sistema valida la cuenta y solicita el envío de un mecanismo temporal al correo. <br> 2. El usuario abre el enlace vigente y registra una nueva contraseña. / El sistema valida la vigencia del mecanismo, actualiza la contraseña e invalida el mecanismo utilizado. <br> 3. El usuario solicita otro enlace cuando el anterior ya no es utilizable. / El sistema invalida el mecanismo anterior y envía uno nuevo con vigencia definida. | Paso 1: HU-02 CA-1; RF-02 <br> Paso 2: HU-02 CA-3; RN-20 <br> Paso 3: HU-41 CA-1–CA-4; RF-43; RN-20 |
| Flujo alternativo FA-01 | FA-01 Correo no registrado. El sistema no inicia la recuperación y muestra una respuesta controlada. | HU-02 CA-2 |
| Flujo alternativo FA-02 | FA-02 Enlace expirado o inválido. El sistema rechaza el mecanismo y permite solicitar uno nuevo. | HU-02 CA-4; HU-41 CA-1 |
| Poscondición | La contraseña queda actualizada solo después de validar un mecanismo temporal vigente; el mecanismo anterior deja de ser utilizable. | Criterios de aceptación: HU-02 CA-1 y CA-3 → FB-01–FB-02; CA-2 → FA-01; CA-4 → FA-02.; HU-41 CA-1–CA-4 → FB-03 y FA-02. |

## 15.4 CU-03 — Registrar solicitud de Talento Humano

| Campo | Contenido | Procedencia |
|---|---|---|
| Código | CU-03 | — |
| Nombre | Registrar solicitud de Talento Humano | — |
| Actor | Actor principal: ACT-01 Empleado. | Actores ACT definidos en el contexto del proyecto. |
| Precondición | El empleado tiene una cuenta activa y está autenticado. Los tipos de solicitud habilitados están disponibles para consulta. | Antecedentes de las HU relacionadas y RN aplicables. |
| Flujo básico (Evento / Respuesta) | 1. El empleado consulta los tipos disponibles y selecciona permiso, vacaciones, certificado o incapacidad. / El sistema presenta los campos correspondientes al tipo seleccionado. <br> 2. El empleado diligencia la información requerida y envía la solicitud. / El sistema valida campos obligatorios y, para vacaciones, fechas y duración; para incapacidad, exige el soporte clínico. <br> 3. El empleado adjunta soporte cuando el tipo de solicitud lo exige o cuando complementa la información. / El sistema valida y asocia el archivo a la solicitud mediante CU-08. <br> 4. El empleado confirma el envío. / El sistema registra la solicitud con estado inicial, genera su radicado único y determina el responsable inicial. | Paso 1: HU-03 a HU-06 CA-1; consulta de HU-42 en CU-12 <br> Paso 2: HU-03 CA-1–CA-2; HU-04 CA-1–CA-3; HU-05 CA-1–CA-2; HU-06 CA-1–CA-2; RN-01, RN-02, RN-13 <br> Paso 3: HU-06 CA-2; HU-14 CA-1; RN-17–RN-19 <br> Paso 4: HU-03 CA-4; HU-04 CA-3; HU-05 CA-2; HU-06 CA-1; HU-09 CA-1–CA-3; RF-03–RF-06, RF-13; RN-01, RN-08, RN-23 |
| Flujo alternativo FA-01 | FA-01 Información obligatoria incompleta. El sistema no registra la solicitud e identifica la información que debe completarse. | HU-03 CA-3; RN-01 |
| Flujo alternativo FA-02 | FA-02 Fechas de vacaciones inválidas. El sistema rechaza el período y solicita corregir las fechas. | HU-04 CA-4; RN-13 |
| Flujo alternativo FA-03 | FA-03 Falta o invalidez del soporte médico. El sistema no registra la incapacidad hasta que se adjunte un soporte válido. | HU-06 CA-3; RN-02, RN-18 |
| Flujo alternativo FA-04 | FA-04 No hay responsable inicial disponible. El sistema conserva la solicitud registrada sin asignarla a un responsable no autorizado y deja el evento identificable para su atención. | HU-09 CA-4; RN-08 |
| Poscondición | La solicitud queda asociada al empleado, con radicado único, estado inicial y responsable cuando existe uno autorizado; los datos inválidos no se guardan como una solicitud completa. | Criterios de aceptación: HU-03 CA-1–CA-2 → FB-02; CA-3 → FA-01; CA-4 → FB-04.; HU-04 CA-1–CA-3 → FB-02; CA-4 → FA-02.; HU-05 CA-1–CA-2 → FB-02 y FB-04; CA-3–CA-4 → CU-10.; HU-06 CA-1–CA-2 → FB-02–FB-04; CA-3–CA-4 → FA-03. |

## 15.5 CU-04 — Asignar responsable inicial

| Campo | Contenido | Procedencia |
|---|---|---|
| Código | CU-04 | — |
| Nombre | Asignar responsable inicial | — |
| Actor | Caso automático ejecutado por el sistema durante el registro de una solicitud. No requiere interacción directa de un actor externo. | Actores ACT definidos en el contexto del proyecto. |
| Precondición | Se ha completado el registro de una solicitud y existe una regla de asignación asociada al tipo de trámite. | Antecedentes de las HU relacionadas y RN aplicables. |
| Flujo básico (Evento / Respuesta) | 1. CU-03 solicita determinar el responsable inicial. / El sistema consulta el tipo de solicitud y la asignación configurada para ese tipo. <br> 2. El sistema identifica un responsable autorizado. / El sistema crea la asignación y registra responsable, solicitud y fecha de asignación. <br> 3. La asignación queda creada. / El sistema deja disponible la identidad del responsable vigente para la gestión del trámite. | Paso 1: HU-09 CA-1; RF-09; RN-08 <br> Paso 2: HU-09 CA-2–CA-3; RN-08 <br> Paso 3: HU-09 CA-1–CA-3; RF-09; RN-26 |
| Flujo alternativo FA-01 | FA-01 No se encuentra responsable disponible. El sistema no asigna la solicitud a una persona no autorizada y mantiene identificable que falta completar la asignación. | HU-09 CA-4; RN-08 |
| Poscondición | La solicitud tiene una asignación inicial vigente o queda identificada para que Talento Humano complete la asignación conforme a la autorización definida. | Criterios de aceptación: HU-09 CA-1–CA-3 → FB-01–FB-03; CA-4 → FA-01. |

## 15.6 CU-05 — Gestionar solicitudes

| Campo | Contenido | Procedencia |
|---|---|---|
| Código | CU-05 | — |
| Nombre | Gestionar solicitudes | — |
| Actor | Actor principal: ACT-02 Jefe inmediato o ACT-03 Usuario de Talento Humano. Para editar o cancelar una solicitud pendiente, actor principal: ACT-01 Empleado. | Actores ACT definidos en el contexto del proyecto. |
| Precondición | La solicitud existe. El usuario está autenticado, autorizado para la operación y la solicitud se encuentra en un estado que permite realizarla. | Antecedentes de las HU relacionadas y RN aplicables. |
| Flujo básico (Evento / Respuesta) | 1. El usuario consulta la solicitud y selecciona una acción permitida. / El sistema muestra el detalle y verifica el rol, el estado y las reglas aplicables. <br> 2. Para aprobar una solicitud de vacaciones, el responsable solicita la aprobación. / El sistema consulta el saldo del período y permite continuar solo si es suficiente. <br> 3. El responsable aprueba, rechaza con motivo o cambia el estado a En revisión con nota; el empleado puede editar o cancelar mientras siga permitido. / El sistema aplica la acción, actualiza el estado y registra usuario, fecha, motivo o nota cuando corresponda. | Paso 1: HU-07 CA-1, HU-08 CA-1, HU-16 CA-1, HU-19 CA-1, HU-22 CA-1; RN-03–RN-05, RN-15 <br> Paso 2: HU-11 CA-1–CA-4; RF-11; RN-12, RN-13 <br> Paso 3: HU-07 CA-1–CA-4; HU-08 CA-1–CA-4; HU-16 CA-1, CA-4; HU-19 CA-1, CA-3–CA-4; HU-22 CA-1, CA-4; RN-03–RN-07, RN-15–RN-16 |
| Flujo alternativo FA-01 | FA-01 Solicitud en estado no permitido o ya procesada. El sistema no realiza la acción y conserva el estado y el historial existentes. | HU-07 CA-3; HU-16 CA-2–CA-3; HU-22 CA-2–CA-3; RN-03–RN-04, RN-15 |
| Flujo alternativo FA-02 | FA-02 Rechazo sin motivo o cambio a En revisión sin nota. El sistema solicita el dato obligatorio y no confirma la operación hasta recibirlo. | HU-08 CA-2; HU-19 CA-2; RN-06, RN-16 |
| Flujo alternativo FA-03 | FA-03 Saldo de vacaciones insuficiente. El sistema impide aprobar la solicitud de vacaciones y presenta el saldo correspondiente al período. | HU-11 CA-3–CA-4; RN-12–RN-13 |
| Flujo alternativo FA-04 | FA-04 Usuario no autorizado. El sistema rechaza la operación y no modifica la solicitud. | HU-07 CA-1; RN-05 |
| Poscondición | La solicitud conserva el estado resultante de la operación autorizada y el historial incluye la evidencia requerida; si una validación falla, no se aplica el cambio. | Criterios de aceptación: HU-07 CA-1–CA-2, CA-4 → FB-01 y FB-03; CA-3 → FA-01.; HU-08 CA-1, CA-3–CA-4 → FB-03; CA-2 → FA-02.; HU-11 CA-1–CA-2, CA-4 → FB-02; CA-3 → FA-03.; HU-16 CA-1, CA-4 → FB-01 y FB-03; CA-2–CA-3 → FA-01.; HU-19 CA-1, CA-3–CA-4 → FB-03; CA-2 → FA-02.; HU-22 CA-1, CA-4 → FB-03; CA-2–CA-3 → FA-01. |

## 15.7 CU-06 — Gestionar asignaciones y responsables

| Campo | Contenido | Procedencia |
|---|---|---|
| Código | CU-06 | — |
| Nombre | Gestionar asignaciones y responsables | — |
| Actor | Actor principal: ACT-03 Usuario de Talento Humano. | Actores ACT definidos en el contexto del proyecto. |
| Precondición | La solicitud existe y el usuario está autenticado y autorizado para consultar o modificar asignaciones. | Antecedentes de las HU relacionadas y RN aplicables. |
| Flujo básico (Evento / Respuesta) | 1. El usuario busca la solicitud y abre su sección de responsables. / El sistema muestra el responsable vigente y distingue las asignaciones finalizadas. <br> 2. El usuario solicita consultar el historial o el motivo de una asignación. / El sistema presenta la secuencia, fechas y motivos registrados, sin modificar la solicitud. <br> 3. El usuario reasigna a un responsable autorizado o finaliza una asignación vigente. / El sistema registra motivo y fechas, conserva la asignación anterior y actualiza quién queda vigente. | Paso 1: HU-27 CA-1–CA-3; RF-29; RN-26 <br> Paso 2: HU-28 CA-1–CA-3; HU-30 CA-1–CA-2, CA-4; RF-30, RF-32; RN-10, RN-26 <br> Paso 3: HU-23 CA-1, CA-3–CA-4; HU-29 CA-1–CA-3; RF-24, RF-31; RN-07, RN-09–RN-10, RN-26 |
| Flujo alternativo FA-01 | FA-01 Responsable no autorizado o motivo obligatorio ausente. El sistema rechaza la reasignación y conserva la asignación vigente. | HU-23 CA-2–CA-3; RN-09–RN-10 |
| Flujo alternativo FA-02 | FA-02 No existe responsable vigente o no hay asignaciones. El sistema informa que no hay asignación vigente o historial para mostrar. | HU-27 CA-4; HU-28 CA-4 |
| Flujo alternativo FA-03 | FA-03 La asignación ya fue finalizada. El sistema no la finaliza por segunda vez y mantiene su fecha de cierre. | HU-29 CA-4 |
| Flujo alternativo FA-04 | FA-04 Asignación sin motivo registrado. El sistema indica que no hay motivo disponible, sin inventar información. | HU-30 CA-3 |
| Poscondición | Las asignaciones mantienen su secuencia e historial; solo una reasignación válida cambia el responsable vigente. | Criterios de aceptación: HU-23 CA-1 y CA-4 → FB-03; CA-2–CA-3 → FA-01.; HU-27 CA-1–CA-3 → FB-01; CA-4 → FA-02.; HU-28 CA-1–CA-3 → FB-02; CA-4 → FA-02.; HU-29 CA-1–CA-3 → FB-03; CA-4 → FA-03.; HU-30 CA-1–CA-2, CA-4 → FB-02; CA-3 → FA-04. |

## 15.8 CU-07 — Consultar solicitudes e historial personal

| Campo | Contenido | Procedencia |
|---|---|---|
| Código | CU-07 | — |
| Nombre | Consultar solicitudes e historial personal | — |
| Actor | Actor principal: ACT-01 Empleado. Actores secundarios: ACT-02 Jefe inmediato y ACT-03 Usuario de Talento Humano, según permisos. | Actores ACT definidos en el contexto del proyecto. |
| Precondición | El usuario está autenticado. La solicitud existe para consultar el detalle; las consultas personales se limitan al empleado autenticado. | Antecedentes de las HU relacionadas y RN aplicables. |
| Flujo básico (Evento / Respuesta) | 1. El usuario ingresa un radicado o combina filtros permitidos por tipo, estado, fecha y empleado. / El sistema busca las solicitudes que cumplen los criterios y respeta los permisos del usuario. <br> 2. El usuario selecciona una solicitud o consulta su historial personal. / El sistema muestra radicado, tipo, fecha, estado, responsable vigente cuando exista y las respuestas disponibles. <br> 3. El usuario revisa los resultados. / El sistema conserva los datos y no modifica la solicitud por el hecho de consultarla. | Paso 1: HU-13 CA-1, CA-3; HU-20 CA-1–CA-3; HU-21 CA-1–CA-2; HU-26 CA-1–CA-3; RF-14, RF-21, RF-28; RN-23–RN-24, RN-27 <br> Paso 2: HU-21 CA-2–CA-3; HU-26 CA-1–CA-3; HU-34 CA-1–CA-4; HU-35 CA-1–CA-4; HU-36 CA-1–CA-4; RF-28, RF-36–RF-38 <br> Paso 3: HU-13 CA-4; HU-21 CA-1–CA-3; HU-34 a HU-36 CA-4 |
| Flujo alternativo FA-01 | FA-01 Radicado inexistente, filtros sin coincidencias o historial vacío. El sistema informa que no encontró resultados y mantiene disponible la consulta. | HU-13 CA-2; HU-20 CA-4; HU-21 CA-4; HU-26 CA-4 |
| Flujo alternativo FA-02 | FA-02 El usuario intenta consultar información personal de otro empleado. El sistema aplica las restricciones de autorización y no muestra solicitudes ajenas. | HU-21 CA-1; RN-24, RN-27 |
| Flujo alternativo FA-03 | FA-03 No hay responsable asociado o el detalle solicitado no está disponible. El sistema presenta únicamente la información registrada y señala el dato ausente. | HU-26 CA-3–CA-4; RN-26 |
| Poscondición | La información se presenta conforme a los filtros y permisos; la consulta no modifica solicitudes ni historiales. | Criterios de aceptación: HU-13 CA-1, CA-3–CA-4 → FB-01 y FB-03; CA-2 → FA-01.; HU-20 CA-1–CA-3 → FB-01; CA-4 → FA-01.; HU-21 CA-1–CA-3 → FB-01–FB-03; CA-4 → FA-01.; HU-26 CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01.; HU-34 CA-1–CA-4 → FB-02.; HU-35 CA-1–CA-4 → FB-02.; HU-36 CA-1–CA-4 → FB-02. |

## 15.9 CU-08 — Gestionar documentos adjuntos

| Campo | Contenido | Procedencia |
|---|---|---|
| Código | CU-08 | — |
| Nombre | Gestionar documentos adjuntos | — |
| Actor | Actor principal: ACT-01 Empleado. Actor secundario: ACT-03 Usuario de Talento Humano. | Actores ACT definidos en el contexto del proyecto. |
| Precondición | La solicitud existe y el usuario tiene autorización para adjuntar o consultar documentos asociados a ella. | Antecedentes de las HU relacionadas y RN aplicables. |
| Flujo básico (Evento / Respuesta) | 1. El empleado selecciona el archivo y la solicitud a la que pertenece. / El sistema comprueba formato y tamaño antes de aceptar el archivo. <br> 2. El archivo cumple las condiciones. / El sistema almacena el documento asociado a la solicitud y registra quién lo cargó y cuándo. <br> 3. El usuario consulta los documentos asociados. / El sistema presenta los datos disponibles de cada documento, únicamente para la solicitud autorizada. | Paso 1: HU-14 CA-1–CA-2; HU-31 CA-1–CA-3; HU-33 CA-1–CA-4; RF-15, RF-33, RF-35; RN-18 <br> Paso 2: HU-14 CA-3–CA-4; HU-31 CA-4; RF-15, RF-33; RN-17, RN-19 <br> Paso 3: HU-32 CA-1–CA-2, CA-4; RF-34; RN-17, RN-19, RN-27 |
| Flujo alternativo FA-01 | FA-01 Formato o tamaño no permitido. El sistema rechaza el archivo e indica la condición que debe corregirse antes de cargarlo. | HU-14 CA-2; HU-31 CA-2–CA-3; HU-33 CA-2–CA-3; RF-35; RN-18 |
| Flujo alternativo FA-02 | FA-02 El documento pertenece a otra solicitud o el usuario no tiene permiso. El sistema no asocia ni muestra el documento en la solicitud consultada. | HU-32 CA-3; RN-17, RN-27 |
| Flujo alternativo FA-03 | FA-03 La solicitud no tiene documentos asociados. El sistema informa que no hay documentos para mostrar. | HU-32 CA-1, CA-4 |
| Poscondición | Los documentos válidos quedan asociados a su solicitud con evidencia de carga; los archivos rechazados no quedan disponibles como soportes. | Criterios de aceptación: HU-14 CA-1, CA-3–CA-4 → FB-01–FB-02; CA-2 → FA-01.; HU-31 CA-1, CA-4 → FB-01–FB-02; CA-2–CA-3 → FA-01.; HU-32 CA-1–CA-2, CA-4 → FB-03; CA-3 → FA-02.; HU-33 CA-1, CA-4 → FB-01; CA-2–CA-3 → FA-01. |

## 15.10 CU-09 — Gestionar notificaciones y alertas

| Campo | Contenido | Procedencia |
|---|---|---|
| Código | CU-09 | — |
| Nombre | Gestionar notificaciones y alertas | — |
| Actor | Actor principal: ACT-01 Empleado o ACT-03 Usuario de Talento Humano, según el aviso. Actor secundario: ACT-05 Sistema de Correo y Notificaciones. | Actores ACT definidos en el contexto del proyecto. |
| Precondición | El usuario tiene una cuenta y existen eventos o notificaciones dirigidos a él. Para una alerta de demora, la solicitud superó el plazo definido sin movimiento. | Antecedentes de las HU relacionadas y RN aplicables. |
| Flujo básico (Evento / Respuesta) | 1. Se produce un cambio de estado o se supera el plazo de tres días sin movimiento. / El sistema identifica la solicitud y el destinatario correspondiente; para la demora, dirige la alerta a Talento Humano. <br> 2. El sistema genera el aviso. / El sistema crea la notificación interna y envía correo cuando el canal está configurado. <br> 3. El empleado consulta sus notificaciones internas y marca una como leída. / El sistema muestra solo avisos del empleado y cambia únicamente su estado de lectura. | Paso 1: HU-10 CA-1, CA-3–CA-4; HU-17 CA-1–CA-2; RN-11, RN-21 <br> Paso 2: HU-17 CA-1, CA-3–CA-4; RF-10, RF-18, RF-41; RN-21 <br> Paso 3: HU-39 CA-1–CA-4; HU-40 CA-1–CA-3; RF-41–RF-42; RN-21–RN-22 |
| Flujo alternativo FA-01 | FA-01 La solicitud aún no supera tres días sin movimiento. El sistema no genera la alerta de demora. | HU-10 CA-2; RN-11 |
| Flujo alternativo FA-02 | FA-02 Correo no configurado. El sistema conserva la notificación interna sin reportar un envío de correo no realizado. | HU-17 CA-4 |
| Flujo alternativo FA-03 | FA-03 No hay notificaciones o el aviso pertenece a otro usuario. El sistema informa que no hay avisos propios disponibles y rechaza modificar notificaciones ajenas. | HU-39 CA-4; HU-40 CA-4; RN-21–RN-22 |
| Poscondición | El aviso queda asociado al destinatario correcto; el estado leído se actualiza solo para la notificación seleccionada. | Criterios de aceptación: HU-10 CA-1, CA-3–CA-4 → FB-01; CA-2 → FA-01.; HU-17 CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-02.; HU-39 CA-1–CA-3 → FB-03; CA-4 → FA-03.; HU-40 CA-1–CA-3 → FB-03; CA-4 → FA-03. |

## 15.11 CU-10 — Generar y consultar certificados laborales

| Campo | Contenido | Procedencia |
|---|---|---|
| Código | CU-10 | — |
| Nombre | Generar y consultar certificados laborales | — |
| Actor | Actor principal: ACT-03 Usuario de Talento Humano para generar el certificado; ACT-01 Empleado para consultar y descargarlo. | Actores ACT definidos en el contexto del proyecto. |
| Precondición | Existe una solicitud de certificado asociada al empleado. Para generar el documento, la solicitud debe estar aprobada y la información laboral necesaria debe estar disponible. | Antecedentes de las HU relacionadas y RN aplicables. |
| Flujo básico (Evento / Respuesta) | 1. Talento Humano selecciona una solicitud de certificado aprobada. / El sistema verifica el estado de la solicitud antes de habilitar la generación. <br> 2. Talento Humano confirma la generación. / El sistema genera y almacena el certificado asociado a la solicitud y actualiza el estado del trámite. <br> 3. El empleado consulta el estado o solicita el certificado generado. / El sistema presenta el estado asociado a la solicitud y, si existe, permite consultar o descargar el archivo correcto. | Paso 1: HU-05 CA-3; HU-12 CA-1–CA-2; RF-12; RN-14–RN-15 <br> Paso 2: HU-12 CA-1, CA-3–CA-4; RF-12, RF-39–RF-40; RN-14–RN-15 <br> Paso 3: HU-05 CA-1–CA-2; HU-37 CA-1–CA-3; HU-38 CA-1–CA-3; RF-39–RF-40; RN-15 |
| Flujo alternativo FA-01 | FA-01 La solicitud no está aprobada. El sistema no genera el certificado y mantiene el trámite en el estado correspondiente. | HU-05 CA-4; HU-12 CA-2; RN-14 |
| Flujo alternativo FA-02 | FA-02 El certificado aún no se ha generado o no está disponible. El sistema informa que no hay archivo para consultar o descargar. | HU-37 CA-4; HU-38 CA-1–CA-4 |
| Poscondición | El certificado, cuando se genera, queda asociado a su solicitud y su estado puede consultarse sin mezclar trámites de otros empleados. | Criterios de aceptación: HU-05 CA-3–CA-4 → FB-01 y FA-01; CA-1–CA-2 → CU-03.; HU-12 CA-1, CA-3–CA-4 → FB-01–FB-02; CA-2 → FA-01.; HU-37 CA-1–CA-3 → FB-03; CA-4 → FA-02.; HU-38 CA-1–CA-4 → FB-03 y FA-02. |

## 15.12 CU-11 — Consultar saldos y días de vacaciones

| Campo | Contenido | Procedencia |
|---|---|---|
| Código | CU-11 | — |
| Nombre | Consultar saldos y días de vacaciones | — |
| Actor | Actor principal: ACT-01 Empleado para consultar sus días disponibles; ACT-03 Usuario de Talento Humano para consultar el saldo de un empleado por período. | Actores ACT definidos en el contexto del proyecto. |
| Precondición | El usuario está autenticado y puede consultar el saldo propio o el de un empleado conforme a sus permisos. | Antecedentes de las HU relacionadas y RN aplicables. |
| Flujo básico (Evento / Respuesta) | 1. El usuario selecciona el empleado y el período, o solicita su propio saldo disponible. / El sistema consulta el saldo correspondiente sin modificarlo. <br> 2. El sistema encuentra el saldo del período. / El sistema presenta días generados, utilizados y disponibles y mantiene la asociación al empleado y período correctos. | Paso 1: HU-48 CA-1; HU-49 CA-1–CA-3; RF-50–RF-51; RN-12, RN-30 <br> Paso 2: HU-48 CA-2–CA-3; HU-49 CA-1–CA-2; RF-50–RF-51; RN-12 |
| Flujo alternativo FA-01 | FA-01 No hay información de saldo para el período o empleado. El sistema informa que no existe saldo registrado y no calcula valores sin respaldo. | HU-48 CA-4; HU-49 CA-4 |
| Flujo alternativo FA-02 | FA-02 El empleado intenta consultar el saldo de otra persona. El sistema limita la consulta al saldo propio. | HU-49 CA-3; RN-27 |
| Poscondición | El saldo se presenta para el empleado y período solicitados; la consulta no modifica los valores almacenados. | Criterios de aceptación: HU-48 CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01.; HU-49 CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01. |

## 15.13 CU-12 — Consultar perfiles organizacionales y catálogos

| Campo | Contenido | Procedencia |
|---|---|---|
| Código | CU-12 | — |
| Nombre | Consultar perfiles organizacionales y catálogos | — |
| Actor | Actor principal: ACT-03 Usuario de Talento Humano para consultar perfil; ACT-01 Empleado para consultar tipos; ACT-03 Usuario de Talento Humano para consultar estados. | Actores ACT definidos en el contexto del proyecto. |
| Precondición | El usuario está autenticado y tiene permiso para consultar la información seleccionada. | Antecedentes de las HU relacionadas y RN aplicables. |
| Flujo básico (Evento / Respuesta) | 1. El usuario selecciona el empleado, tipo de solicitud o estados que desea consultar. / El sistema verifica el criterio y la autorización correspondiente. <br> 2. El sistema encuentra la información solicitada. / El sistema muestra área, cargo y rol del empleado, o el catálogo de tipos y estados sin mezclar registros. | Paso 1: HU-25 CA-1; HU-42 CA-1–CA-3; HU-43 CA-1–CA-2; RF-27, RF-44–RF-45; RN-25, RN-27 <br> Paso 2: HU-25 CA-2–CA-3; HU-42 CA-1–CA-3; HU-43 CA-1–CA-2; RN-03, RN-25 |
| Flujo alternativo FA-01 | FA-01 El empleado no tiene datos organizacionales registrados. El sistema identifica los datos que no están disponibles sin sustituirlos por los de otra persona. | HU-25 CA-4 |
| Flujo alternativo FA-02 | FA-02 Tipo no habilitado o estado no definido. El sistema no presenta el valor como una opción válida y conserva la consulta en modo de solo lectura. | HU-42 CA-4; HU-43 CA-3–CA-4; RN-03 |
| Flujo alternativo FA-03 | FA-03 El usuario no tiene autorización para consultar el perfil. El sistema rechaza la consulta. | HU-25 CA-1; RN-27 |
| Poscondición | La información de referencia se muestra en modo de consulta y corresponde al empleado o catálogo solicitado. | Criterios de aceptación: HU-25 CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01.; HU-42 CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-02.; HU-43 CA-1–CA-2 → FB-01–FB-02; CA-3–CA-4 → FA-02. |

## 15.14 CU-13 — Consultar historial y auditoría

| Campo | Contenido | Procedencia |
|---|---|---|
| Código | CU-13 | — |
| Nombre | Consultar historial y auditoría | — |
| Actor | Actor principal: ACT-03 Usuario de Talento Humano o ACT-04 Gerencia, según los permisos de consulta. | Actores ACT definidos en el contexto del proyecto. |
| Precondición | El usuario está autenticado y autorizado para consultar el historial, registros de acceso u operaciones auditadas. | Antecedentes de las HU relacionadas y RN aplicables. |
| Flujo básico (Evento / Respuesta) | 1. El usuario selecciona el tipo de consulta y define solicitud, usuario o período. / El sistema valida permisos y presenta los registros que coinciden con los criterios. <br> 2. El usuario selecciona una operación auditada para ver su detalle. / El sistema muestra entidad, operación, usuario, fecha y los valores anterior y nuevo cuando estén registrados. <br> 3. El usuario termina la consulta. / El sistema mantiene el historial y la auditoría sin modificaciones. | Paso 1: HU-15 CA-1–CA-2; HU-44 CA-1–CA-3; HU-45 CA-1–CA-3; HU-46 CA-1–CA-3; HU-58 CA-1–CA-3; HU-59 CA-1–CA-4; RF-16, RF-26, RF-46–RF-48, RF-60–RF-61; RN-07, RN-27–RN-28 <br> Paso 2: HU-15 CA-3; HU-47 CA-1–CA-3; RF-49; RN-28 <br> Paso 3: HU-15 CA-4; HU-44 CA-4; HU-45 CA-4; HU-46 CA-3; RF-16, RF-46–RF-49 |
| Flujo alternativo FA-01 | FA-01 No hay registros que coincidan o la operación no quedó registrada. El sistema informa que no hay resultados para mostrar. | HU-46 CA-4; HU-47 CA-4 |
| Flujo alternativo FA-02 | FA-02 El usuario no está autorizado para consultar los registros. El sistema rechaza la consulta y no revela datos auditados. | HU-46 CA-1; HU-59 CA-4; RN-27 |
| Flujo alternativo FA-03 | FA-03 El valor anterior o nuevo no está disponible. El sistema presenta únicamente los valores registrados e indica cuál no está disponible. | HU-47 CA-4; RN-28 |
| Poscondición | La consulta es de solo lectura y no altera las evidencias históricas o de acceso. | Criterios de aceptación: HU-15 CA-1–CA-4 → FB-01–FB-03.; HU-44 CA-1–CA-3 → FB-01; CA-4 → FB-03.; HU-45 CA-1–CA-3 → FB-01; CA-4 → FA-02.; HU-46 CA-1–CA-3 → FB-01–FB-03; CA-4 → FA-01.; HU-47 CA-1–CA-3 → FB-02; CA-4 → FA-03.; HU-58 CA-1–CA-3 → FB-01; CA-4 → FA-02.; HU-59 CA-1–CA-4 → FB-01; restricciones → FA-02. |

## 15.15 CU-14 — Generar, consultar y exportar reportes

| Campo | Contenido | Procedencia |
|---|---|---|
| Código | CU-14 | — |
| Nombre | Generar, consultar y exportar reportes | — |
| Actor | Actor principal: ACT-03 Usuario de Talento Humano para reportes operativos; ACT-04 Gerencia para resúmenes globales y reportes organizacionales. | Actores ACT definidos en el contexto del proyecto. |
| Precondición | Existe información registrada. El usuario está autenticado y autorizado para consultar el alcance de reporte solicitado. | Antecedentes de las HU relacionadas y RN aplicables. |
| Flujo básico (Evento / Respuesta) | 1. El usuario selecciona el reporte y combina tipo, responsable, área, cargo, rol, estado o período según corresponda. / El sistema valida los criterios y los permisos asociados al usuario. <br> 2. El usuario solicita generar el reporte. / El sistema procesa los datos, diferencia los resultados por los criterios y presenta el reporte con su período. <br> 3. El usuario abre reportes ya generados o elige exportar el resultado. / El sistema presenta el reporte autorizado o exporta el mismo resultado consultado en un formato habilitado. | Paso 1: HU-18 CA-1–CA-3; HU-24 CA-1–CA-3; HU-51 CA-1–CA-3; HU-52 CA-1–CA-3; HU-54 CA-1–CA-3; HU-55–HU-57 CA-1–CA-4; HU-60 CA-1–CA-3; RF-19, RF-25, RF-53–RF-54, RF-56–RF-59, RF-62; RN-27, RN-29–RN-30 <br> Paso 2: HU-18 CA-2–CA-3; HU-24 CA-2–CA-3; HU-51 CA-2–CA-3; HU-52 CA-2–CA-3; HU-54 CA-2–CA-4; HU-60 CA-2–CA-3 <br> Paso 3: HU-50 CA-1–CA-3; HU-53 CA-1–CA-3; RF-52, RF-55; RN-27 |
| Flujo alternativo FA-01 | FA-01 No existen datos para los criterios seleccionados. El sistema informa que no hay resultados y conserva los filtros para que puedan ajustarse. | HU-18 CA-4; HU-24 CA-4; HU-51 CA-4; HU-52 CA-4; HU-57 CA-3; HU-60 CA-4; RN-29–RN-30 |
| Flujo alternativo FA-02 | FA-02 El usuario no tiene permiso para consultar o exportar la información. El sistema rechaza la consulta o exportación y no entrega datos fuera del alcance autorizado. | HU-50 CA-3–CA-4; HU-57 CA-4; HU-59 CA-4; RN-27 |
| Flujo alternativo FA-03 | FA-03 Formato de exportación no habilitado. El sistema informa los formatos disponibles y conserva el reporte generado. | HU-53 CA-4 |
| Poscondición | El reporte queda presentado o exportado conforme al alcance y filtros seleccionados; los resultados no incluyen solicitudes ajenas a los criterios o permisos. | Criterios de aceptación: HU-18 CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01.; HU-24 CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01.; HU-50 CA-1–CA-3 → FB-03; CA-4 → FA-02.; HU-51 CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01.; HU-52 CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01.; HU-53 CA-1–CA-3 → FB-03; CA-4 → FA-03.; HU-54 CA-1–CA-4 → FB-01–FB-02.; HU-55 CA-1–CA-4 → FB-01.; HU-56 CA-1–CA-4 → FB-01.; HU-57 CA-1–CA-2, CA-4 → FB-01; CA-3 → FA-01.; HU-60 CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01. |

## 15.16 Matriz de trazabilidad de HU a casos de uso

Cada HU aparece con sus criterios de aceptación, RF, RN y RNF asociados, y el caso y flujo donde se cubre.

| HU | Criterios | RF | RN | RNF | CU y flujo de cobertura |
|---|---|---|---|---|---|
| HU-01 | CA-1, CA-2, CA-3, CA-4 | RF-01 | — | RNF-03 | CU-01: CA-1 y CA-4 → FB-02–FB-03; CA-2 → FA-01; CA-3 → FA-02 |
| HU-02 | CA-1, CA-2, CA-3, CA-4 | RF-02 | RN-20 | RNF-03, RNF-05 | CU-02: CA-1 y CA-3 → FB-01–FB-02; CA-2 → FA-01; CA-4 → FA-02 |
| HU-03 | CA-1, CA-2, CA-3, CA-4 | RF-03 | RN-01, RN-23 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-03: CA-1–CA-2 → FB-02; CA-3 → FA-01; CA-4 → FB-04 |
| HU-04 | CA-1, CA-2, CA-3, CA-4 | RF-04 | RN-01, RN-13, RN-23 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-03: CA-1–CA-3 → FB-02; CA-4 → FA-02 |
| HU-05 | CA-1, CA-2, CA-3, CA-4 | RF-05 | RN-01, RN-23 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-03: CA-1–CA-2 → FB-02 y FB-04; CA-3–CA-4 → CU-10 <br> CU-10: CA-3–CA-4 → FB-01 y FA-01; CA-1–CA-2 → CU-03 |
| HU-06 | CA-1, CA-2, CA-3, CA-4 | RF-06 | RN-01, RN-02, RN-23 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-03: CA-1–CA-2 → FB-02–FB-04; CA-3–CA-4 → FA-03 |
| HU-07 | CA-1, CA-2, CA-3, CA-4 | RF-07 | RN-03, RN-05, RN-07 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-05: CA-1–CA-2, CA-4 → FB-01 y FB-03; CA-3 → FA-01 |
| HU-08 | CA-1, CA-2, CA-3, CA-4 | RF-08 | RN-03, RN-06, RN-07 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-05: CA-1, CA-3–CA-4 → FB-03; CA-2 → FA-02 |
| HU-09 | CA-1, CA-2, CA-3, CA-4 | RF-09 | RN-08 | RNF-01, RNF-02, RNF-03, RNF-06 | CU-04: CA-1–CA-3 → FB-01–FB-03; CA-4 → FA-01 |
| HU-10 | CA-1, CA-2, CA-3, CA-4 | RF-10 | RN-11 | RNF-02, RNF-03, RNF-04 | CU-09: CA-1, CA-3–CA-4 → FB-01; CA-2 → FA-01 |
| HU-11 | CA-1, CA-2, CA-3, CA-4 | RF-11 | RN-05, RN-12 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-05: CA-1–CA-2, CA-4 → FB-02; CA-3 → FA-03 |
| HU-12 | CA-1, CA-2, CA-3, CA-4 | RF-12 | RN-15 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-10: CA-1, CA-3–CA-4 → FB-01–FB-02; CA-2 → FA-01 |
| HU-13 | CA-1, CA-2, CA-3, CA-4 | RF-13, RF-14 | RN-23 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07: CA-1, CA-3–CA-4 → FB-01 y FB-03; CA-2 → FA-01 |
| HU-14 | CA-1, CA-2, CA-3, CA-4 | RF-15 | RN-17, RN-18, RN-19 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-08: CA-1, CA-3–CA-4 → FB-01–FB-02; CA-2 → FA-01 |
| HU-15 | CA-1, CA-2, CA-3, CA-4 | RF-16, RF-26 | RN-07, RN-28 | RNF-01, RNF-02, RNF-03, RNF-06 | CU-13: CA-1–CA-4 → FB-01–FB-03 |
| HU-16 | CA-1, CA-2, CA-3, CA-4 | RF-17 | RN-07, RN-15 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-05: CA-1, CA-4 → FB-01 y FB-03; CA-2–CA-3 → FA-01 |
| HU-17 | CA-1, CA-2, CA-3, CA-4 | RF-18 | RN-21 | RNF-02, RNF-03, RNF-04 | CU-09: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-02 |
| HU-18 | CA-1, CA-2, CA-3, CA-4 | RF-19 | RN-29, RN-30 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 |
| HU-19 | CA-1, CA-2, CA-3, CA-4 | RF-20 | RN-03, RN-07, RN-16 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-05: CA-1, CA-3–CA-4 → FB-03; CA-2 → FA-02 |
| HU-20 | CA-1, CA-2, CA-3, CA-4 | RF-21 | RN-03, RN-24, RN-27 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07: CA-1–CA-3 → FB-01; CA-4 → FA-01 |
| HU-21 | CA-1, CA-2, CA-3, CA-4 | RF-21 | RN-03, RN-24, RN-27 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07: CA-1–CA-3 → FB-01–FB-03; CA-4 → FA-01 |
| HU-22 | CA-1, CA-2, CA-3, CA-4 | RF-23 | RN-03, RN-04, RN-07 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-05: CA-1, CA-4 → FB-03; CA-2–CA-3 → FA-01 |
| HU-23 | CA-1, CA-2, CA-3, CA-4 | RF-24 | RN-07, RN-09, RN-10 | RNF-01, RNF-02, RNF-03, RNF-06 | CU-06: CA-1 y CA-4 → FB-03; CA-2–CA-3 → FA-01 |
| HU-24 | CA-1, CA-2, CA-3, CA-4 | RF-25 | RN-29, RN-30 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 |
| HU-25 | CA-1, CA-2, CA-3, CA-4 | RF-27 | RN-25, RN-27 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05 | CU-12: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 |
| HU-26 | CA-1, CA-2, CA-3, CA-4 | RF-28 | RN-23, RN-27 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 |
| HU-27 | CA-1, CA-2, CA-3, CA-4 | RF-29 | RN-26 | RNF-01, RNF-02, RNF-03, RNF-06 | CU-06: CA-1–CA-3 → FB-01; CA-4 → FA-02 |
| HU-28 | CA-1, CA-2, CA-3, CA-4 | RF-30 | RN-26 | RNF-01, RNF-02, RNF-03, RNF-06 | CU-06: CA-1–CA-3 → FB-02; CA-4 → FA-02 |
| HU-29 | CA-1, CA-2, CA-3, CA-4 | RF-31 | RN-26 | RNF-01, RNF-02, RNF-03, RNF-06 | CU-06: CA-1–CA-3 → FB-03; CA-4 → FA-03 |
| HU-30 | CA-1, CA-2, CA-3, CA-4 | RF-32 | RN-10 | RNF-01, RNF-02, RNF-03, RNF-06 | CU-06: CA-1–CA-2, CA-4 → FB-02; CA-3 → FA-04 |
| HU-31 | CA-1, CA-2, CA-3, CA-4 | RF-33 | RN-17, RN-18, RN-19 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-08: CA-1, CA-4 → FB-01–FB-02; CA-2–CA-3 → FA-01 |
| HU-32 | CA-1, CA-2, CA-3, CA-4 | RF-34 | RN-17, RN-19 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-08: CA-1–CA-2, CA-4 → FB-03; CA-3 → FA-02 |
| HU-33 | CA-1, CA-2, CA-3, CA-4 | RF-35 | RN-18 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-08: CA-1, CA-4 → FB-01; CA-2–CA-3 → FA-01 |
| HU-34 | CA-1, CA-2, CA-3, CA-4 | RF-36 | — | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07: CA-1–CA-4 → FB-02 |
| HU-35 | CA-1, CA-2, CA-3, CA-4 | RF-37 | RN-12, RN-13 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07: CA-1–CA-4 → FB-02 |
| HU-36 | CA-1, CA-2, CA-3, CA-4 | RF-38 | RN-17 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-07: CA-1–CA-4 → FB-02 |
| HU-37 | CA-1, CA-2, CA-3, CA-4 | RF-39 | RN-15 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-10: CA-1–CA-3 → FB-03; CA-4 → FA-02 |
| HU-38 | CA-1, CA-2, CA-3, CA-4 | RF-40 | RN-15 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-10: CA-1–CA-4 → FB-03 y FA-02 |
| HU-39 | CA-1, CA-2, CA-3, CA-4 | RF-41 | RN-21 | RNF-02, RNF-03, RNF-04 | CU-09: CA-1–CA-3 → FB-03; CA-4 → FA-03 |
| HU-40 | CA-1, CA-2, CA-3, CA-4 | RF-42 | RN-22 | RNF-02, RNF-03, RNF-04 | CU-09: CA-1–CA-3 → FB-03; CA-4 → FA-03 |
| HU-41 | CA-1, CA-2, CA-3, CA-4 | RF-43 | RN-20 | RNF-03, RNF-05 | CU-02: CA-1–CA-4 → FB-03 y FA-02 |
| HU-42 | CA-1, CA-2, CA-3, CA-4 | RF-44 | — | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05 | CU-12: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-02 |
| HU-43 | CA-1, CA-2, CA-3, CA-4 | RF-45 | RN-03 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05 | CU-12: CA-1–CA-2 → FB-01–FB-02; CA-3–CA-4 → FA-02 |
| HU-44 | CA-1, CA-2, CA-3, CA-4 | RF-46 | RN-07 | RNF-01, RNF-02, RNF-03, RNF-06 | CU-13: CA-1–CA-3 → FB-01; CA-4 → FB-03 |
| HU-45 | CA-1, CA-2, CA-3, CA-4 | RF-47 | RN-27 | RNF-01, RNF-02, RNF-03, RNF-06 | CU-13: CA-1–CA-3 → FB-01; CA-4 → FA-02 |
| HU-46 | CA-1, CA-2, CA-3, CA-4 | RF-48 | RN-27, RN-28 | RNF-01, RNF-02, RNF-03, RNF-06 | CU-13: CA-1–CA-3 → FB-01–FB-03; CA-4 → FA-01 |
| HU-47 | CA-1, CA-2, CA-3, CA-4 | RF-49 | RN-27, RN-28 | RNF-01, RNF-02, RNF-03, RNF-06 | CU-13: CA-1–CA-3 → FB-02; CA-4 → FA-03 |
| HU-48 | CA-1, CA-2, CA-3, CA-4 | RF-50 | RN-12, RN-30 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-11: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 |
| HU-49 | CA-1, CA-2, CA-3, CA-4 | RF-51 | RN-12 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-11: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 |
| HU-50 | CA-1, CA-2, CA-3, CA-4 | RF-52 | RN-27, RN-30 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-3 → FB-03; CA-4 → FA-02 |
| HU-51 | CA-1, CA-2, CA-3, CA-4 | RF-53 | RN-27, RN-29 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 |
| HU-52 | CA-1, CA-2, CA-3, CA-4 | RF-54 | RN-27, RN-29, RN-30 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 |
| HU-53 | CA-1, CA-2, CA-3, CA-4 | RF-55 | RN-27 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-3 → FB-03; CA-4 → FA-03 |
| HU-54 | CA-1, CA-2, CA-3, CA-4 | RF-56 | RN-27, RN-29, RN-30 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-4 → FB-01–FB-02 |
| HU-55 | CA-1, CA-2, CA-3, CA-4 | RF-57 | RN-27, RN-29 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-4 → FB-01 |
| HU-56 | CA-1, CA-2, CA-3, CA-4 | RF-58 | RN-27, RN-29 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-4 → FB-01 |
| HU-57 | CA-1, CA-2, CA-3, CA-4 | RF-59 | RN-27, RN-29 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-2, CA-4 → FB-01; CA-3 → FA-01 |
| HU-58 | CA-1, CA-2, CA-3, CA-4 | RF-60 | RN-27, RN-30 | RNF-01, RNF-02, RNF-03, RNF-06 | CU-13: CA-1–CA-3 → FB-01; CA-4 → FA-02 |
| HU-59 | CA-1, CA-2, CA-3, CA-4 | RF-61 | RN-27 | RNF-01, RNF-02, RNF-03, RNF-06 | CU-13: CA-1–CA-4 → FB-01; restricciones → FA-02 |
| HU-60 | CA-1, CA-2, CA-3, CA-4 | RF-62 | RN-03, RN-30 | RNF-01, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06 | CU-14: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 |

<img width="930" height="589" alt="image" src="https://github.com/user-attachments/assets/4867be38-77ab-406f-8c76-354365e803c9" />
