# Requisitos No Funcionales (RNF)

Los Requisitos No Funcionales establecen criterios medibles de rendimiento, disponibilidad, seguridad, usabilidad, compatibilidad y recuperación para el sistema. Los umbrales de estas fichas son objetivos de aceptación propuestos y se verifican mediante las pruebas indicadas. Cada ficha señala su relación con las historias de usuario, requisitos funcionales y reglas de negocio pertinentes.

## 10.1 RNF-01 — Tiempo de respuesta en consultas

| Campo | Contenido |
|---|---|
| Código | RNF-01 |
| Categoría | Rendimiento |
| Enunciado con medida | Al consultar solicitudes mediante filtros o generar resúmenes de gestión, el sistema debe mostrar el resultado en un máximo de 2,5 segundos en al menos el 95 % de las consultas, bajo una carga de 25 sesiones concurrentes y un conjunto de 15.000 solicitudes. El tiempo se mide desde que se envía la consulta hasta que el resultado queda visible. |
| Verificación | Prueba de carga con 25 sesiones y 15.000 solicitudes; se registran los tiempos de respuesta y se comprueba que al menos el 95 % no supera 2,5 segundos. |
| Trazabilidad | HU-18, HU-20, HU-24 y HU-51 a HU-60; RF-19, RF-21, RF-25 y RF-53 a RF-62; RN-29 y RN-30. Corresponde a las consultas y reportes por período, estado, tipo, responsable y datos organizacionales. |

## 10.2 RNF-02 — Disponibilidad del servicio

| Campo | Contenido |
|---|---|
| Código | RNF-02 |
| Categoría | Disponibilidad |
| Enunciado con medida | Durante el horario oficial de operación definido por Nexa Servicios, el sistema debe alcanzar una disponibilidad mensual mínima del 99,5 %. Las ventanas de mantenimiento planificado se excluyen del cálculo cuando se anuncien con al menos 48 horas de anticipación. |
| Verificación | Calcular mensualmente la disponibilidad a partir de comprobaciones automáticas cada minuto dentro del horario oficial de operación y conservar el registro de mantenimientos planificados. |
| Trazabilidad | Objetivo general del proyecto; HU-03 a HU-06, HU-17, HU-20 y HU-21; RF-03 a RF-06, RF-18 y RF-21; RN-01 y RN-21. Estas funciones dependen de que el canal centralizado de solicitudes esté disponible. |

## 10.3 RNF-03 — Protección de acceso e información

| Campo | Contenido |
|---|---|
| Código | RNF-03 |
| Categoría | Seguridad y confidencialidad |
| Enunciado con medida | Toda comunicación entre el navegador y el sistema debe utilizar una conexión HTTPS. El 100 % de las pruebas de acceso sin autenticación o sin el rol autorizado a una función o registro protegido debe ser rechazado. Los soportes médicos y demás archivos adjuntos no deben poder consultarse mediante una dirección pública directa sin sesión válida y autorización para la solicitud asociada. |
| Verificación | Ejecutar pruebas negativas para cada rol y recurso protegido, comprobar el uso de HTTPS y probar que los enlaces directos a archivos rechazan solicitudes no autorizadas. Criterio: 100 % de rechazos esperados. |
| Trazabilidad | HU-01, HU-06, HU-14, HU-23, HU-25 y HU-31 a HU-33; RF-01, RF-06, RF-15, RF-24, RF-27 y RF-33 a RF-35; RN-02, RN-05, RN-09, RN-17 a RN-19 y RN-27. Se vincula con el acceso por rol y la protección de documentos asociados a solicitudes. |

## 10.4 RNF-04 — Facilidad de uso de los flujos frecuentes

| Campo | Contenido |
|---|---|
| Código | RNF-04 |
| Categoría | Usabilidad |
| Enunciado con medida | En una prueba con al menos 10 empleados representativos que no hayan usado antes el sistema, al menos el 90 % debe completar sin ayuda un flujo de solicitud frecuente —permiso laboral o vacaciones— y consultar su estado en un máximo de 4 minutos, sin errores que impidan terminarlo. |
| Verificación | Realizar una prueba de tareas con cronómetro y registrar finalización, tiempo y necesidad de ayuda para cada participante. Criterio: al menos 9 de cada 10 completan la tarea dentro del límite. |
| Trazabilidad | Encuesta del proyecto, pregunta 10, sobre preferencia por una solución digital; HU-03, HU-04 y HU-21; RF-03, RF-04 y RF-21. Atiende la creación de solicitudes y la consulta de su seguimiento por el empleado. |

## 10.5 RNF-05 — Compatibilidad y adaptación de pantalla

| Campo | Contenido |
|---|---|
| Código | RNF-05 |
| Categoría | Compatibilidad y adaptación |
| Enunciado con medida | Las pantallas para registrar, revisar y consultar solicitudes deben conservar sus controles y permitir completar las acciones principales en las versiones estables vigentes de Chrome, Edge y Firefox, con anchos de pantalla de 360, 768 y 1366 píxeles. En esos escenarios no debe aparecer desplazamiento horizontal para completar el flujo. |
| Verificación | Probar registro, revisión y consulta en cada navegador y ancho indicados. Criterio: todas las acciones principales disponibles, sin pérdida de contenido ni desplazamiento horizontal. |
| Trazabilidad | Encuesta del proyecto, pregunta 10, sobre preferencia por página web o aplicación móvil; HU-03, HU-04, HU-06 y HU-14; RF-03, RF-04, RF-06 y RF-15. Responde al acceso digital de empleados desde distintos dispositivos. |

## 10.6 RNF-06 — Copias de respaldo y recuperación

| Campo | Contenido |
|---|---|
| Código | RNF-06 |
| Categoría | Continuidad y recuperabilidad |
| Enunciado con medida | El sistema debe generar copias de respaldo automáticas con una separación máxima de 12 horas. Ante una falla que requiera restauración, el servicio debe volver a estar operativo en un máximo de 4 horas y la pérdida de información confirmada no debe superar las 12 horas previas a la falla. La restauración debe conservar la relación entre solicitudes, historial y documentos adjuntos. |
| Verificación | Inspeccionar la programación y resultado de los respaldos y realizar una restauración de prueba cada tres meses. Medir el tiempo hasta recuperar el servicio y comprobar solicitudes, historial y vínculos de documentos restaurados. |
| Trazabilidad | HU-14, HU-15, HU-31, HU-32 y HU-46; RF-15, RF-16, RF-26, RF-33, RF-34 y RF-48; RN-07, RN-17, RN-19 y RN-28. Protege la continuidad de los registros y evidencias que sustentan la trazabilidad de cada trámite. |
