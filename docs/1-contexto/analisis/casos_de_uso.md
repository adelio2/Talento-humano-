# 15. Casos de Uso

## 15.1 Autenticarse en el Sistema

| Campo | Descripción |
|---------|-------------|
| ID | CU-01 |
| Nombre | Autenticarse en el Sistema |
| Actor Principal | Empleado, Jefe Inmediato, Usuario Talento Humano, Gerencia |
| Descripción | Permite a los usuarios acceder al sistema mediante credenciales válidas según su rol asignado. |
| Precondiciones | El usuario debe encontrarse registrado y activo en el sistema. |
| Flujo Principal | 1. El usuario ingresa usuario y contraseña.<br>2. El sistema valida las credenciales.<br>3. El sistema identifica el rol asociado.<br>4. El sistema muestra el menú principal correspondiente. |
| Flujos Alternativos | FA-01: El usuario selecciona la opción recordar sesión. |
| Flujos de Excepción | FE-01: Usuario o contraseña incorrectos.<br>FE-02: Usuario inactivo o bloqueado. |
| Postcondiciones | Usuario autenticado correctamente y con acceso a las funcionalidades permitidas según su rol. |
| RF Relacionados | RF-01 |
| RN Relacionadas | RN-12 |
| RNF Relacionados | RNF-03, RNF-04 |
| HU Relacionadas | HU-01 |
| Prioridad | Alta |
| Frecuencia de Uso | Alta |
| Notas / Observaciones | Este caso de uso es requerido por la mayoría de funcionalidades del sistema mediante relación `<<include>>`. |

---

## 15.2 Recuperar Contraseña

| Campo | Descripción |
|---------|-------------|
| ID | CU-02 |
| Nombre | Recuperar Contraseña |
| Actor Principal | Usuario |
| Descripción | Permite restablecer la contraseña mediante el correo electrónico registrado en el sistema. |
| Precondiciones | El usuario debe tener una cuenta activa y un correo electrónico registrado. |
| Flujo Principal | 1. El usuario selecciona la opción recuperar contraseña.<br>2. Ingresa su correo electrónico.<br>3. El sistema valida la información.<br>4. Envía un enlace de recuperación.<br>5. El usuario registra una nueva contraseña.<br>6. El sistema actualiza la contraseña. |
| Flujos Alternativos | FA-01: Solicitar un nuevo enlace de recuperación. |
| Flujos de Excepción | FE-01: Correo no registrado.<br>FE-02: Enlace expirado o inválido. |
| Postcondiciones | Contraseña actualizada exitosamente. |
| RF Relacionados | RF-02 |
| RN Relacionadas | RN-08 |
| RNF Relacionados | RNF-03, RNF-04 |
| HU Relacionadas | HU-02 |
| Prioridad | Alta |
| Frecuencia de Uso | Baja |
| Notas / Observaciones | Mantiene una relación `<<extend>>` con el caso de uso CU-01 Autenticarse en el Sistema. |

---

## 15.3 Registrar Solicitud de Talento Humano

| Campo | Descripción |
|---------|-------------|
| ID | CU-03 |
| Nombre | Registrar Solicitud de Talento Humano |
| Actor Principal | Empleado |
| Descripción | Permite registrar solicitudes de permisos laborales, vacaciones, incapacidades médicas y certificados laborales. |
| Precondiciones | El empleado debe encontrarse autenticado en el sistema. |
| Flujo Principal | 1. Selecciona el tipo de solicitud.<br>2. Diligencia la información requerida.<br>3. Adjunta documentos cuando aplique.<br>4. El sistema valida la información.<br>5. Genera automáticamente el número de radicado.<br>6. Asigna el responsable correspondiente.<br>7. Guarda la solicitud. |
| Flujos Alternativos | FA-01: Registro de solicitud sin documentos adjuntos cuando no sean requeridos. |
| Flujos de Excepción | FE-01: Campos obligatorios vacíos.<br>FE-02: Documento inválido o formato no permitido. |
| Postcondiciones | Solicitud registrada en estado Pendiente y asociada a un número de radicado único. |
| RF Relacionados | RF-03, RF-04, RF-05, RF-06, RF-09, RF-13, RF-15 |
| RN Relacionadas | RN-01, RN-02, RN-05, RN-09 |
| RNF Relacionados | RNF-03, RNF-05, RNF-06 |
| HU Relacionadas | HU-03, HU-04, HU-05, HU-06, HU-13, HU-14 |
| Prioridad | Alta |
| Frecuencia de Uso | Alta |
| Notas / Observaciones | Incluye la generación automática del radicado y la asignación inicial del responsable según el tipo de solicitud. |

---

## 15.4 Gestionar Solicitudes

| Campo | Descripción |
|---------|-------------|
| ID | CU-04 |
| Nombre | Gestionar Solicitudes |
| Actor Principal | Jefe Inmediato, Usuario Talento Humano |
| Descripción | Permite revisar, aprobar, rechazar, reasignar y actualizar el estado de las solicitudes registradas en el sistema. |
| Precondiciones | Debe existir una solicitud registrada y pendiente de gestión. El usuario debe estar autenticado y autorizado. |
| Flujo Principal | 1. Consulta las solicitudes asignadas.<br>2. Selecciona una solicitud.<br>3. Revisa la información y documentos adjuntos.<br>4. Aprueba, rechaza o actualiza el estado de la solicitud.<br>5. El sistema registra la acción realizada en el historial.<br>6. El sistema actualiza el estado correspondiente. |
| Flujos Alternativos | FA-01: Reasignar la solicitud a otro responsable autorizado.<br>FA-02: Cambiar el estado a "En Revisión" agregando observaciones. |
| Flujos de Excepción | FE-01: La solicitud ya fue procesada.<br>FE-02: El usuario no posee permisos suficientes. |
| Postcondiciones | Solicitud actualizada y registrada en el historial de trazabilidad. |
| RF Relacionados | RF-07, RF-08, RF-11, RF-17, RF-20, RF-23, RF-24 |
| RN Relacionadas | RN-03, RN-04, RN-05, RN-06, RN-07, RN-12 |
| RNF Relacionados | RNF-03, RNF-09 |
| HU Relacionadas | HU-07, HU-08, HU-11, HU-16, HU-19, HU-22, HU-23 |
| Prioridad | Alta |
| Frecuencia de Uso | Alta |
| Notas / Observaciones | Todas las acciones realizadas deben quedar registradas en el historial de la solicitud. |

---

## 15.5 Consultar Solicitudes e Historial

| Campo | Descripción |
|---------|-------------|
| ID | CU-05 |
| Nombre | Consultar Solicitudes e Historial |
| Actor Principal | Empleado, Usuario Talento Humano |
| Descripción | Permite consultar solicitudes registradas, estados, historial de cambios y trazabilidad asociada. |
| Precondiciones | Deben existir solicitudes registradas en el sistema. |
| Flujo Principal | 1. Accede al módulo de consultas.<br>2. Define criterios de búsqueda o filtros.<br>3. El sistema muestra las solicitudes encontradas.<br>4. Selecciona una solicitud.<br>5. Visualiza el historial completo y la trazabilidad asociada. |
| Flujos Alternativos | FA-01: Consulta mediante número de radicado.<br>FA-02: Consulta utilizando filtros por estado, tipo de solicitud o fecha. |
| Flujos de Excepción | FE-01: No existen resultados para los filtros seleccionados. |
| Postcondiciones | Información consultada correctamente. |
| RF Relacionados | RF-14, RF-16, RF-21, RF-26 |
| RN Relacionadas | RN-06, RN-10, RN-11, RN-12 |
| RNF Relacionados | RNF-01, RNF-02 |
| HU Relacionadas | HU-15, HU-20, HU-21 |
| Prioridad | Alta |
| Frecuencia de Uso | Alta |
| Notas / Observaciones | Permite consultar solicitudes mediante filtros y visualizar el historial completo de cada trámite. |

---

## 15.6 Generar Certificado Laboral

| Campo | Descripción |
|---------|-------------|
| ID | CU-06 |
| Nombre | Generar Certificado Laboral |
| Actor Principal | Usuario Talento Humano |
| Descripción | Permite generar certificados laborales digitales solicitados por los empleados. |
| Precondiciones | Debe existir una solicitud de certificado aprobada. |
| Flujo Principal | 1. Consulta las solicitudes de certificados laborales.<br>2. Selecciona una solicitud.<br>3. El sistema genera el certificado laboral.<br>4. Almacena el documento generado.<br>5. Lo deja disponible para consulta o descarga. |
| Flujos Alternativos | FA-01: Generación automática de certificados estándar. |
| Flujos de Excepción | FE-01: Información laboral incompleta o inconsistente. |
| Postcondiciones | Certificado laboral generado y disponible para descarga. |
| RF Relacionados | RF-05, RF-12 |
| RN Relacionadas | RN-05 |
| RNF Relacionados | RNF-01, RNF-04 |
| HU Relacionadas | HU-05, HU-12 |
| Prioridad | Media |
| Frecuencia de Uso | Media |
| Notas / Observaciones | El documento generado queda asociado a la solicitud correspondiente para futuras consultas. |

---

## 15.7 Generar Reportes de Gestión

| Campo | Descripción |
|---------|-------------|
| ID | CU-07 |
| Nombre | Generar Reportes de Gestión |
| Actor Principal | Usuario Talento Humano, Gerencia |
| Descripción | Permite consultar indicadores, estadísticas y reportes relacionados con las solicitudes gestionadas por el área de Talento Humano. |
| Precondiciones | Debe existir información registrada en el sistema. El usuario debe estar autenticado y autorizado para consultar reportes. |
| Flujo Principal | 1. Accede al módulo de reportes.<br>2. Selecciona el tipo de reporte requerido.<br>3. Define filtros de búsqueda.<br>4. El sistema procesa la información.<br>5. Genera el reporte solicitado.<br>6. Presenta los resultados. |
| Flujos Alternativos | FA-01: Exportar el reporte en formato PDF o Excel.<br>FA-02: Generar un nuevo reporte utilizando diferentes filtros. |
| Flujos de Excepción | FE-01: No existen datos para generar el reporte solicitado.<br>FE-02: El usuario no posee permisos suficientes para consultar determinada información. |
| Postcondiciones | Reporte generado y disponible para consulta o exportación. |
| RF Relacionados | RF-19, RF-25 |
| RN Relacionadas | RN-10 |
| RNF Relacionados | RNF-01, RNF-02, RNF-07 |
| HU Relacionadas | HU-18, HU-24 |
| Prioridad | Alta |
| Frecuencia de Uso | Media |
| Notas / Observaciones | Talento Humano consulta reportes operativos. La Gerencia consulta además reportes estratégicos y estadísticas organizacionales. |

---

## 15.8 Relaciones Include y Extend

| Tipo de Relación | Caso de Uso Origen | Caso de Uso Destino | Justificación |
|------------------|-------------------|---------------------|---------------|
| `<<include>>` | CU-03 Registrar Solicitud de Talento Humano | CU-01 Autenticarse en el Sistema | El empleado debe autenticarse antes de registrar solicitudes. |
| `<<include>>` | CU-04 Gestionar Solicitudes | CU-01 Autenticarse en el Sistema | Los responsables deben autenticarse antes de gestionar solicitudes. |
| `<<include>>` | CU-05 Consultar Solicitudes e Historial | CU-01 Autenticarse en el Sistema | Solo usuarios autenticados pueden consultar información. |
| `<<include>>` | CU-06 Generar Certificado Laboral | CU-01 Autenticarse en el Sistema | Talento Humano debe autenticarse para generar certificados. |
| `<<include>>` | CU-07 Generar Reportes de Gestión | CU-01 Autenticarse en el Sistema | Los usuarios autorizados deben autenticarse para consultar reportes. |
| `<<extend>>` | CU-02 Recuperar Contraseña | CU-01 Autenticarse en el Sistema | La recuperación de contraseña ocurre cuando el usuario no puede acceder al sistema. |

---

## 15.9 Diagrama UML de Casos de Uso

El siguiente diagrama representa gráficamente las interacciones entre los actores del Sistema de Gestión de Solicitudes de Talento Humano y los casos de uso identificados durante el proceso de Ingeniería de Requisitos. Se incluyen las relaciones `<<include>>` y `<<extend>>` definidas para el sistema.
<img width="908" height="494" alt="image" src="https://github.com/user-attachments/assets/7f7fedc9-64a6-4056-a4dc-f7ef05eca182" />

