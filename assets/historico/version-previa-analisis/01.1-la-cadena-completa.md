# 17. La cadena completa: una fila por historia

Esta matriz integra, por cada historia de usuario, sus criterios de aceptación, requisitos funcionales, reglas de negocio, caso de uso con sus pasos o flujos y la pantalla que permite ejecutar la acción. Cada referencia apunta a los artefactos desarrollados en este documento, de modo que la trazabilidad pueda revisarse de extremo a extremo sin duplicar sus descripciones.

La plantilla denomina la última columna «Método → Pantalla». El documento fuente no define métodos de implementación; por ello, se consigna el control o acción funcional ya especificado en la matriz de mockups y su pantalla asociada, sin inventar firmas de métodos.

| HU | CA | RF | RN | CU (pasos / flujos) | Método → Pantalla |
|---|---|---|---|---|---|
| HU-01 | CA-1 a CA-4 | RF-01 | — | CU-01: CA-1 y CA-4 → FB-02–FB-03; CA-2 → FA-01; CA-3 → FA-02 | Credenciales → MK-01 |
| HU-02 | CA-1 a CA-4 | RF-02 | RN-20 | CU-02: CA-1 y CA-3 → FB-01–FB-02; CA-2 → FA-01; CA-4 → FA-02 | Recuperación → MK-01 |
| HU-03 | CA-1 a CA-4 | RF-03 | RN-01, RN-23 | CU-03: CA-1–CA-2 → FB-02; CA-3 → FA-01; CA-4 → FB-04 | Registro → MK-03 |
| HU-04 | CA-1 a CA-4 | RF-04 | RN-01, RN-13, RN-23 | CU-03: CA-1–CA-3 → FB-02; CA-4 → FA-02 | Fechas/duración → MK-03 |
| HU-05 | CA-1 a CA-4 | RF-05 | RN-01, RN-23 | CU-03: CA-1–CA-2 → FB-02 y FB-04; CA-3–CA-4 → CU-10 <br> CU-10: CA-3–CA-4 → FB-01 y FA-01; CA-1–CA-2 → CU-03 | Solicitud / emisión → MK-03 / MK-08 |
| HU-06 | CA-1 a CA-4 | RF-06 | RN-01, RN-02, RN-23 | CU-03: CA-1–CA-2 → FB-02–FB-04; CA-3–CA-4 → FA-03 | Soporte clínico → MK-03 |
| HU-07 | CA-1 a CA-4 | RF-07 | RN-03, RN-05, RN-07 | CU-05: CA-1–CA-2, CA-4 → FB-01 y FB-03; CA-3 → FA-01 | Aprobar → MK-05 |
| HU-08 | CA-1 a CA-4 | RF-08 | RN-03, RN-06, RN-07 | CU-05: CA-1, CA-3–CA-4 → FB-03; CA-2 → FA-02 | Motivo rechazo → MK-05 |
| HU-09 | CA-1 a CA-4 | RF-09 | RN-08 | CU-04: CA-1–CA-3 → FB-01–FB-03; CA-4 → FA-01 | Asignación inicial → MK-06 |
| HU-10 | CA-1 a CA-4 | RF-10 | RN-11 | CU-09: CA-1, CA-3–CA-4 → FB-01; CA-2 → FA-01 | Alertas → MK-07 |
| HU-11 | CA-1 a CA-4 | RF-11 | RN-05, RN-12 | CU-05: CA-1–CA-2, CA-4 → FB-02; CA-3 → FA-03 | Saldo previo → MK-05 |
| HU-12 | CA-1 a CA-4 | RF-12 | RN-15 | CU-10: CA-1, CA-3–CA-4 → FB-01–FB-02; CA-2 → FA-01 | Generar → MK-08 |
| HU-13 | CA-1 a CA-4 | RF-13, RF-14 | RN-23 | CU-07: CA-1, CA-3–CA-4 → FB-01 y FB-03; CA-2 → FA-01 | Buscar radicado → MK-02 |
| HU-14 | CA-1 a CA-4 | RF-15 | RN-17, RN-18, RN-19 | CU-08: CA-1, CA-3–CA-4 → FB-01–FB-02; CA-2 → FA-01 | Adjuntar → MK-03 |
| HU-15 | CA-1 a CA-4 | RF-16, RF-26 | RN-07, RN-28 | CU-13: CA-1–CA-4 → FB-01–FB-03 | Historial → MK-04 |
| HU-16 | CA-1 a CA-4 | RF-17 | RN-07, RN-15 | CU-05: CA-1, CA-4 → FB-01 y FB-03; CA-2–CA-3 → FA-01 | Editar → MK-03 |
| HU-17 | CA-1 a CA-4 | RF-18 | RN-21 | CU-09: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-02 | Notificación → MK-07 |
| HU-18 | CA-1 a CA-4 | RF-19 | RN-29, RN-30 | CU-14: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Tiempos → MK-12 |
| HU-19 | CA-1 a CA-4 | RF-20 | RN-03, RN-07, RN-16 | CU-05: CA-1, CA-3–CA-4 → FB-03; CA-2 → FA-02 | Nota de revisión → MK-05 |
| HU-20 | CA-1 a CA-4 | RF-21 | RN-03, RN-24, RN-27 | CU-07: CA-1–CA-3 → FB-01; CA-4 → FA-01 | Filtros → MK-02 |
| HU-21 | CA-1 a CA-4 | RF-21 | RN-03, RN-24, RN-27 | CU-07: CA-1–CA-3 → FB-01–FB-03; CA-4 → FA-01 | Historial personal → MK-04 |
| HU-22 | CA-1 a CA-4 | RF-23 | RN-03, RN-04, RN-07 | CU-05: CA-1, CA-4 → FB-03; CA-2–CA-3 → FA-01 | Cancelar → MK-04 |
| HU-23 | CA-1 a CA-4 | RF-24 | RN-07, RN-09, RN-10 | CU-06: CA-1 y CA-4 → FB-03; CA-2–CA-3 → FA-01 | Reasignar → MK-06 |
| HU-24 | CA-1 a CA-4 | RF-25 | RN-29, RN-30 | CU-14: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Resumen → MK-12 |
| HU-25 | CA-1 a CA-4 | RF-27 | RN-25, RN-27 | CU-12: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Perfil → MK-10 |
| HU-26 | CA-1 a CA-4 | RF-28 | RN-23, RN-27 | CU-07: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Detalle → MK-04 |
| HU-27 | CA-1 a CA-4 | RF-29 | RN-26 | CU-06: CA-1–CA-3 → FB-01; CA-4 → FA-02 | Responsable vigente → MK-06 |
| HU-28 | CA-1 a CA-4 | RF-30 | RN-26 | CU-06: CA-1–CA-3 → FB-02; CA-4 → FA-02 | Historial asignación → MK-06 |
| HU-29 | CA-1 a CA-4 | RF-31 | RN-26 | CU-06: CA-1–CA-3 → FB-03; CA-4 → FA-03 | Finalizar → MK-06 |
| HU-30 | CA-1 a CA-4 | RF-32 | RN-10 | CU-06: CA-1–CA-2, CA-4 → FB-02; CA-3 → FA-04 | Motivo → MK-06 |
| HU-31 | CA-1 a CA-4 | RF-33 | RN-17, RN-18, RN-19 | CU-08: CA-1, CA-4 → FB-01–FB-02; CA-2–CA-3 → FA-01 | Soporte adicional → MK-04 |
| HU-32 | CA-1 a CA-4 | RF-34 | RN-17, RN-19 | CU-08: CA-1–CA-2, CA-4 → FB-03; CA-3 → FA-02 | Documentos → MK-04 |
| HU-33 | CA-1 a CA-4 | RF-35 | RN-18 | CU-08: CA-1, CA-4 → FB-01; CA-2–CA-3 → FA-01 | Validar archivo → MK-03 |
| HU-34 | CA-1 a CA-4 | RF-36 | — | CU-07: CA-1–CA-4 → FB-02 | Detalle permiso → MK-04 |
| HU-35 | CA-1 a CA-4 | RF-37 | RN-12, RN-13 | CU-07: CA-1–CA-4 → FB-02 | Detalle vacaciones → MK-04 |
| HU-36 | CA-1 a CA-4 | RF-38 | RN-17 | CU-07: CA-1–CA-4 → FB-02 | Detalle incapacidad → MK-04 |
| HU-37 | CA-1 a CA-4 | RF-39 | RN-15 | CU-10: CA-1–CA-3 → FB-03; CA-4 → FA-02 | Certificado → MK-08 |
| HU-38 | CA-1 a CA-4 | RF-40 | RN-15 | CU-10: CA-1–CA-4 → FB-03 y FA-02 | Estado certificado → MK-08 |
| HU-39 | CA-1 a CA-4 | RF-41 | RN-21 | CU-09: CA-1–CA-3 → FB-03; CA-4 → FA-03 | Bandeja → MK-07 |
| HU-40 | CA-1 a CA-4 | RF-42 | RN-22 | CU-09: CA-1–CA-3 → FB-03; CA-4 → FA-03 | Marcar leída → MK-07 |
| HU-41 | CA-1 a CA-4 | RF-43 | RN-20 | CU-02: CA-1–CA-4 → FB-03 y FA-02 | Enlace nuevo → MK-01 |
| HU-42 | CA-1 a CA-4 | RF-44 | — | CU-12: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-02 | Tipos → MK-10 |
| HU-43 | CA-1 a CA-4 | RF-45 | RN-03 | CU-12: CA-1–CA-2 → FB-01–FB-02; CA-3–CA-4 → FA-02 | Estados → MK-10 |
| HU-44 | CA-1 a CA-4 | RF-46 | RN-07 | CU-13: CA-1–CA-3 → FB-01; CA-4 → FB-03 | Acciones historial → MK-11 |
| HU-45 | CA-1 a CA-4 | RF-47 | RN-27 | CU-13: CA-1–CA-3 → FB-01; CA-4 → FA-02 | Registros acceso → MK-11 |
| HU-46 | CA-1 a CA-4 | RF-48 | RN-27, RN-28 | CU-13: CA-1–CA-3 → FB-01–FB-03; CA-4 → FA-01 | Auditoría → MK-11 |
| HU-47 | CA-1 a CA-4 | RF-49 | RN-27, RN-28 | CU-13: CA-1–CA-3 → FB-02; CA-4 → FA-03 | Detalle cambio → MK-11 |
| HU-48 | CA-1 a CA-4 | RF-50 | RN-12, RN-30 | CU-11: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Saldo período → MK-09 |
| HU-49 | CA-1 a CA-4 | RF-51 | RN-12 | CU-11: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Días disponibles → MK-09 |
| HU-50 | CA-1 a CA-4 | RF-52 | RN-27, RN-30 | CU-14: CA-1–CA-3 → FB-03; CA-4 → FA-02 | Reportes guardados → MK-12 |
| HU-51 | CA-1 a CA-4 | RF-53 | RN-27, RN-29 | CU-14: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Reporte por tipo → MK-12 |
| HU-52 | CA-1 a CA-4 | RF-54 | RN-27, RN-29, RN-30 | CU-14: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Reporte responsable → MK-12 |
| HU-53 | CA-1 a CA-4 | RF-55 | RN-27 | CU-14: CA-1–CA-3 → FB-03; CA-4 → FA-03 | Exportar → MK-12 |
| HU-54 | CA-1 a CA-4 | RF-56 | RN-27, RN-29, RN-30 | CU-14: CA-1–CA-4 → FB-01–FB-02 | Consolidado → MK-12 |
| HU-55 | CA-1 a CA-4 | RF-57 | RN-27, RN-29 | CU-14: CA-1–CA-4 → FB-01 | Área → MK-12 |
| HU-56 | CA-1 a CA-4 | RF-58 | RN-27, RN-29 | CU-14: CA-1–CA-4 → FB-01 | Cargo → MK-12 |
| HU-57 | CA-1 a CA-4 | RF-59 | RN-27, RN-29 | CU-14: CA-1–CA-2, CA-4 → FB-01; CA-3 → FA-01 | Rol → MK-12 |
| HU-58 | CA-1 a CA-4 | RF-60 | RN-27, RN-30 | CU-13: CA-1–CA-3 → FB-01; CA-4 → FA-02 | Historial accesos → MK-11 |
| HU-59 | CA-1 a CA-4 | RF-61 | RN-27 | CU-13: CA-1–CA-4 → FB-01; restricciones → FA-02 | Auditoría usuario → MK-11 |
| HU-60 | CA-1 a CA-4 | RF-62 | RN-03, RN-30 | CU-14: CA-1–CA-3 → FB-01–FB-02; CA-4 → FA-01 | Período + estado → MK-12 |

