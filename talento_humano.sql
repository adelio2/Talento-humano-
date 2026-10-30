CREATE DATABASE IF NOT EXISTS talento_humano
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE talento_humano;

CREATE TABLE Rol (
    id_rol INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200) NULL,
    PRIMARY KEY (id_rol),
    UNIQUE KEY uq_rol_nombre (nombre)
) ENGINE=InnoDB;

CREATE TABLE Area (
    id_area INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200) NULL,
    PRIMARY KEY (id_area),
    UNIQUE KEY uq_area_nombre (nombre)
) ENGINE=InnoDB;

CREATE TABLE Cargo (
    id_cargo INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200) NULL,
    PRIMARY KEY (id_cargo),
    UNIQUE KEY uq_cargo_nombre (nombre)
) ENGINE=InnoDB;

CREATE TABLE Usuario (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    documento VARCHAR(20) NOT NULL,
    correo VARCHAR(150) NOT NULL,
    contrasena_hash VARCHAR(255) NOT NULL,
    id_cargo INT NOT NULL,
    id_area INT NOT NULL,
    id_rol INT NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT 1,
    intentos_fallidos INT NOT NULL DEFAULT 0,
    bloqueado_hasta DATETIME NULL,
    PRIMARY KEY (id_usuario),
    UNIQUE KEY uq_usuario_documento (documento),
    UNIQUE KEY uq_usuario_correo (correo),
    CONSTRAINT fk_usuario_cargo FOREIGN KEY (id_cargo) REFERENCES Cargo (id_cargo),
    CONSTRAINT fk_usuario_area FOREIGN KEY (id_area) REFERENCES Area (id_area),
    CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES Rol (id_rol)
) ENGINE=InnoDB;

CREATE TABLE TipoSolicitud (
    id_tipo_solicitud INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200) NULL,
    PRIMARY KEY (id_tipo_solicitud),
    UNIQUE KEY uq_tiposolicitud_nombre (nombre)
) ENGINE=InnoDB;

CREATE TABLE EstadoSolicitud (
    id_estado INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(150) NULL,
    PRIMARY KEY (id_estado),
    UNIQUE KEY uq_estadosolicitud_nombre (nombre)
) ENGINE=InnoDB;

CREATE TABLE Solicitud (
    id_solicitud INT NOT NULL AUTO_INCREMENT,
    radicado VARCHAR(20) NOT NULL,
    id_usuario INT NOT NULL,
    id_tipo_solicitud INT NOT NULL,
    id_estado INT NOT NULL,
    fecha_registro DATETIME NOT NULL,
    PRIMARY KEY (id_solicitud),
    UNIQUE KEY uq_solicitud_radicado (radicado),
    CONSTRAINT fk_solicitud_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario),
    CONSTRAINT fk_solicitud_tipo FOREIGN KEY (id_tipo_solicitud) REFERENCES TipoSolicitud (id_tipo_solicitud),
    CONSTRAINT fk_solicitud_estado FOREIGN KEY (id_estado) REFERENCES EstadoSolicitud (id_estado)
) ENGINE=InnoDB;

CREATE TABLE TipoAccion (
    id_tipo_accion INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(150) NULL,
    PRIMARY KEY (id_tipo_accion),
    UNIQUE KEY uq_tipoaccion_nombre (nombre)
) ENGINE=InnoDB;

CREATE TABLE HistorialSolicitud (
    id_historial INT NOT NULL AUTO_INCREMENT,
    id_solicitud INT NOT NULL,
    id_usuario INT NOT NULL,
    id_tipo_accion INT NOT NULL,
    id_estado_anterior INT NULL,
    id_estado_nuevo INT NULL,
    fecha_accion DATETIME NOT NULL,
    comentario TEXT NULL,
    PRIMARY KEY (id_historial),
    CONSTRAINT fk_historial_solicitud FOREIGN KEY (id_solicitud) REFERENCES Solicitud (id_solicitud),
    CONSTRAINT fk_historial_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario),
    CONSTRAINT fk_historial_tipoaccion FOREIGN KEY (id_tipo_accion) REFERENCES TipoAccion (id_tipo_accion),
    CONSTRAINT fk_historial_estado_anterior FOREIGN KEY (id_estado_anterior) REFERENCES EstadoSolicitud (id_estado),
    CONSTRAINT fk_historial_estado_nuevo FOREIGN KEY (id_estado_nuevo) REFERENCES EstadoSolicitud (id_estado)
) ENGINE=InnoDB;

CREATE TABLE AsignacionSolicitud (
    id_asignacion INT NOT NULL AUTO_INCREMENT,
    id_solicitud INT NOT NULL,
    id_usuario_responsable INT NOT NULL,
    fecha_asignacion DATETIME NOT NULL,
    fecha_fin DATETIME NULL,
    motivo TEXT NULL,
    activa BOOLEAN NOT NULL DEFAULT 1,
    PRIMARY KEY (id_asignacion),
    CONSTRAINT fk_asignacion_solicitud FOREIGN KEY (id_solicitud) REFERENCES Solicitud (id_solicitud),
    CONSTRAINT fk_asignacion_usuario FOREIGN KEY (id_usuario_responsable) REFERENCES Usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE Documento (
    id_documento INT NOT NULL AUTO_INCREMENT,
    id_solicitud INT NOT NULL,
    id_usuario_carga INT NOT NULL,
    nombre_archivo VARCHAR(150) NOT NULL,
    tipo_archivo VARCHAR(50) NOT NULL,
    tamano_archivo INT NOT NULL,
    ruta_archivo VARCHAR(300) NOT NULL,
    fecha_carga DATETIME NOT NULL,
    PRIMARY KEY (id_documento),
    CONSTRAINT fk_documento_solicitud FOREIGN KEY (id_solicitud) REFERENCES Solicitud (id_solicitud),
    CONSTRAINT fk_documento_usuario FOREIGN KEY (id_usuario_carga) REFERENCES Usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE Notificacion (
    id_notificacion INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_solicitud INT NULL,
    asunto VARCHAR(150) NOT NULL,
    mensaje TEXT NOT NULL,
    fecha_envio DATETIME NOT NULL,
    leida BOOLEAN NOT NULL DEFAULT 0,
    PRIMARY KEY (id_notificacion),
    CONSTRAINT fk_notificacion_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario),
    CONSTRAINT fk_notificacion_solicitud FOREIGN KEY (id_solicitud) REFERENCES Solicitud (id_solicitud)
) ENGINE=InnoDB;

CREATE TABLE EstadoCertificado (
    id_estado_certificado INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(150) NULL,
    PRIMARY KEY (id_estado_certificado),
    UNIQUE KEY uq_estadocertificado_nombre (nombre)
) ENGINE=InnoDB;

CREATE TABLE CertificadoLaboral (
    id_certificado INT NOT NULL AUTO_INCREMENT,
    id_solicitud INT NOT NULL,
    id_estado_certificado INT NOT NULL,
    fecha_generacion DATETIME NOT NULL,
    ruta_archivo VARCHAR(300) NOT NULL,
    PRIMARY KEY (id_certificado),
    CONSTRAINT fk_certificado_solicitud FOREIGN KEY (id_solicitud) REFERENCES Solicitud (id_solicitud),
    CONSTRAINT fk_certificado_estado FOREIGN KEY (id_estado_certificado) REFERENCES EstadoCertificado (id_estado_certificado)
) ENGINE=InnoDB;

CREATE TABLE TipoPermiso (
    id_tipo_permiso INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL,
    descripcion VARCHAR(200) NULL,
    PRIMARY KEY (id_tipo_permiso),
    UNIQUE KEY uq_tipopermiso_nombre (nombre)
) ENGINE=InnoDB;

CREATE TABLE EstadoPermiso (
    id_estado_permiso INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(150) NULL,
    PRIMARY KEY (id_estado_permiso),
    UNIQUE KEY uq_estadopermiso_nombre (nombre)
) ENGINE=InnoDB;

CREATE TABLE PermisoLaboral (
    id_permiso INT NOT NULL AUTO_INCREMENT,
    id_solicitud INT NOT NULL,
    id_tipo_permiso INT NOT NULL,
    id_estado_permiso INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    motivo TEXT NOT NULL,
    PRIMARY KEY (id_permiso),
    UNIQUE KEY uq_permiso_solicitud (id_solicitud),
    CONSTRAINT fk_permiso_solicitud FOREIGN KEY (id_solicitud) REFERENCES Solicitud (id_solicitud),
    CONSTRAINT fk_permiso_tipo FOREIGN KEY (id_tipo_permiso) REFERENCES TipoPermiso (id_tipo_permiso),
    CONSTRAINT fk_permiso_estado FOREIGN KEY (id_estado_permiso) REFERENCES EstadoPermiso (id_estado_permiso),
    CONSTRAINT chk_permiso_fechas CHECK (fecha_fin >= fecha_inicio)
) ENGINE=InnoDB;

CREATE TABLE TipoVacacion (
    id_tipo_vacacion INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(150) NULL,
    PRIMARY KEY (id_tipo_vacacion),
    UNIQUE KEY uq_tipovacacion_nombre (nombre)
) ENGINE=InnoDB;

CREATE TABLE EstadoVacacion (
    id_estado_vacacion INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(150) NULL,
    PRIMARY KEY (id_estado_vacacion),
    UNIQUE KEY uq_estadovacacion_nombre (nombre)
) ENGINE=InnoDB;

CREATE TABLE Vacacion (
    id_vacacion INT NOT NULL AUTO_INCREMENT,
    id_solicitud INT NOT NULL,
    id_tipo_vacacion INT NOT NULL,
    id_estado_vacacion INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    motivo TEXT NOT NULL,
    PRIMARY KEY (id_vacacion),
    UNIQUE KEY uq_vacacion_solicitud (id_solicitud),
    CONSTRAINT fk_vacacion_solicitud FOREIGN KEY (id_solicitud) REFERENCES Solicitud (id_solicitud),
    CONSTRAINT fk_vacacion_tipo FOREIGN KEY (id_tipo_vacacion) REFERENCES TipoVacacion (id_tipo_vacacion),
    CONSTRAINT fk_vacacion_estado FOREIGN KEY (id_estado_vacacion) REFERENCES EstadoVacacion (id_estado_vacacion),
    CONSTRAINT chk_vacacion_fechas CHECK (fecha_fin >= fecha_inicio)
) ENGINE=InnoDB;

CREATE TABLE SaldoVacaciones (
    id_saldo INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    periodo VARCHAR(10) NOT NULL,
    dias_generados DECIMAL(5,2) NOT NULL,
    dias_utilizados DECIMAL(5,2) NOT NULL,
    fecha_actualizacion DATETIME NOT NULL,
    PRIMARY KEY (id_saldo),
    UNIQUE KEY uq_saldo_usuario_periodo (id_usuario, periodo),
    CONSTRAINT fk_saldo_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE TipoIncapacidad (
    id_tipo_incapacidad INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL,
    descripcion VARCHAR(200) NULL,
    PRIMARY KEY (id_tipo_incapacidad),
    UNIQUE KEY uq_tipoincapacidad_nombre (nombre)
) ENGINE=InnoDB;

CREATE TABLE EstadoIncapacidad (
    id_estado_incapacidad INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(150) NULL,
    PRIMARY KEY (id_estado_incapacidad),
    UNIQUE KEY uq_estadoincapacidad_nombre (nombre)
) ENGINE=InnoDB;

CREATE TABLE Incapacidad (
    id_incapacidad INT NOT NULL AUTO_INCREMENT,
    id_solicitud INT NOT NULL,
    id_tipo_incapacidad INT NOT NULL,
    id_estado_incapacidad INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    observacion TEXT NULL,
    PRIMARY KEY (id_incapacidad),
    UNIQUE KEY uq_incapacidad_solicitud (id_solicitud),
    CONSTRAINT fk_incapacidad_solicitud FOREIGN KEY (id_solicitud) REFERENCES Solicitud (id_solicitud),
    CONSTRAINT fk_incapacidad_tipo FOREIGN KEY (id_tipo_incapacidad) REFERENCES TipoIncapacidad (id_tipo_incapacidad),
    CONSTRAINT fk_incapacidad_estado FOREIGN KEY (id_estado_incapacidad) REFERENCES EstadoIncapacidad (id_estado_incapacidad),
    CONSTRAINT chk_incapacidad_fechas CHECK (fecha_fin >= fecha_inicio)
) ENGINE=InnoDB;

CREATE TABLE RecuperacionClave (
    id_recuperacion INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    token VARCHAR(255) NOT NULL,
    fecha_solicitud DATETIME NOT NULL,
    fecha_expiracion DATETIME NOT NULL,
    utilizada BOOLEAN NOT NULL DEFAULT 0,
    PRIMARY KEY (id_recuperacion),
    UNIQUE KEY uq_recuperacion_token (token),
    CONSTRAINT fk_recuperacion_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE TipoReporte (
    id_tipo_reporte INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL,
    descripcion VARCHAR(200) NULL,
    PRIMARY KEY (id_tipo_reporte),
    UNIQUE KEY uq_tiporeporte_nombre (nombre)
) ENGINE=InnoDB;

CREATE TABLE Reporte (
    id_reporte INT NOT NULL AUTO_INCREMENT,
    id_tipo_reporte INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha_generacion DATETIME NOT NULL,
    nombre_archivo VARCHAR(150) NULL,
    ruta_archivo VARCHAR(300) NULL,
    PRIMARY KEY (id_reporte),
    CONSTRAINT fk_reporte_tipo FOREIGN KEY (id_tipo_reporte) REFERENCES TipoReporte (id_tipo_reporte),
    CONSTRAINT fk_reporte_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE RegistroAcceso (
    id_acceso INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    fecha_intento DATETIME NOT NULL,
    exitoso BOOLEAN NOT NULL,
    direccion_ip VARCHAR(45) NULL,
    PRIMARY KEY (id_acceso),
    CONSTRAINT fk_acceso_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE AuditoriaSistema (
    id_auditoria INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    tabla_afectada VARCHAR(50) NOT NULL,
    accion_realizada VARCHAR(10) NOT NULL,
    fecha_accion DATETIME NOT NULL,
    PRIMARY KEY (id_auditoria),
    CONSTRAINT fk_auditoria_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario),
    CONSTRAINT chk_auditoria_accion CHECK (accion_realizada IN ('INSERT', 'UPDATE', 'DELETE'))
) ENGINE=InnoDB;

CREATE TABLE DetalleAuditoria (
    id_detalle INT NOT NULL AUTO_INCREMENT,
    id_auditoria INT NOT NULL,
    campo_modificado VARCHAR(100) NOT NULL,
    valor_anterior TEXT NULL,
    valor_nuevo TEXT NULL,
    PRIMARY KEY (id_detalle),
    CONSTRAINT fk_detalle_auditoria FOREIGN KEY (id_auditoria) REFERENCES AuditoriaSistema (id_auditoria)
) ENGINE=InnoDB;
