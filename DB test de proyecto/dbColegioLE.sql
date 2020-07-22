create database dbColegioLE
USE [dbColegioLE]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 14/07/2020 6:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[idAlumno] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](50) NULL,
	[apPaterno] [varchar](20) NULL,
	[apMaterno] [varchar](20) NULL,
	[edad] [int] NULL,
	[sexo] [char](1) NULL,
	[nroDocumento] [varchar](8) NULL,
	[direccion] [varchar](150) NULL,
	[telefono] [varchar](20) NULL,
	[estado] [bit] NULL,
	[imagen] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[idAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 14/07/2020 6:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[idTipoEmpleado] [int] NOT NULL,
	[nombres] [varchar](50) NULL,
	[apPaterno] [varchar](20) NULL,
	[apMaterno] [varchar](20) NULL,
	[nroDocumento] [varchar](8) NULL,
	[estado] [bit] NULL,
	[imagen] [varchar](500) NULL,
	[usuario] [varchar](50) NULL,
	[clave] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpleado]    Script Date: 14/07/2020 6:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEmpleado](
	[idTipoEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](25) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_TipoEmpleado] FOREIGN KEY([idTipoEmpleado])
REFERENCES [dbo].[TipoEmpleado] ([idTipoEmpleado])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_TipoEmpleado]
GO
/****** Object:  StoredProcedure [dbo].[spAccesoSistema]    Script Date: 14/07/2020 6:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spAccesoSistema]
@prmUser varchar(50),
@prmPass varchar(50)
AS
	BEGIN 
		SELECT E.idEmpleado, E.usuario, E.clave
		FROM Empleado E
		WHERE E.usuario = @prmUser and E.clave = @prmPass
	END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarDatosAlumno]    Script Date: 14/07/2020 6:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarDatosAlumno]
(@prmIdAlumno int,
--@prmEdad int, 
@prmDireccion varchar(150) 
)
AS
	BEGIN 
		UPDATE Alumno
		SET Alumno.direccion = @prmDireccion
			--Alumno.direccion = @prmDireccion
		WHERE
			Alumno.idAlumno = @prmIdAlumno
	END
GO
/****** Object:  StoredProcedure [dbo].[spListarAlumno]    Script Date: 14/07/2020 6:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarAlumno]
AS
	BEGIN 
		SELECT A.idAlumno, A.nombres, A.apPaterno, A.apMaterno, A.edad, A.sexo, A.nroDocumento, A.direccion
		FROM Alumno A
		WHERE A.estado = 1
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarAlumno]    Script Date: 14/07/2020 6:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarAlumno]
(@prmNombres varchar(50), 
@prmApPaterno varchar(50),
@prmApMaterno varchar(50), 
@prmEdad int, 
@prmSexo char(1), 
@prmNroDoc varchar(50), 
@prmDireccion varchar(50), 
@prmTelefono varchar(50), 
@prmEstado bit
)
AS
	BEGIN 
		INSERT INTO Alumno(nombres,apPaterno, apMaterno, edad, sexo, nroDocumento, direccion, telefono, estado)
		VALUES(@prmNombres,@prmApPaterno,@prmApMaterno,@prmEdad,@prmSexo,@prmNroDoc,@prmDireccion,@prmTelefono,@prmEstado)
	END
GO


select * from Alumno

select * from Empleado
select * from TipoEmpleado

insert into TipoEmpleado values ('usuario',1);
insert into TipoEmpleado values ('docente',1);
insert into TipoEmpleado values ('alumno',1);
insert into TipoEmpleado values ('director',1);
insert into TipoEmpleado values ('secretaria',1);

insert into Empleado values (1, 'Admin','apadmin','amadmin','12345678',1,null,'admin','admin')
insert into Empleado values (2, 'Docente1','ApDocente','ApmDocente','1234568',1,null,'docente','docente')
insert into Empleado values (3, 'alumno1','ApAlumno','ApmAlumno','1234566',1,null,'alumno','alumno')
insert into Empleado values (4, 'director1','ApDirector','ApmDirector','1234456',1,null,'director','director')
insert into Empleado values (5, 'secretaria1','ApSecretaria','ApmSecretaria','0234126',1,null,'secretaria','secretaria')




--*SP Actualizar Alumno*//
use dbColegio
select * from Alumno


CREATE PROCEDURE [dbo].[spActualizarDatosAlumno2]
(
@idAlumno int,
@prmNombres varchar(50), 
@prmApPaterno varchar(50),
@prmApMaterno varchar(50), 
@prmEdad int, 
@prmSexo char(1), 
@prmNroDoc varchar(50), 
@prmDireccion varchar(50), 
@prmTelefono varchar(50), 
@prmEstado bit
)
AS
	BEGIN 
		UPDATE Alumno
		SET nombres = @prmNombres,
		apPaterno = @prmApPaterno,
		ApMaterno = @prmApMaterno,
		Edad = @prmEdad,
		sexo = @prmSexo,
		nroDocumento = @prmNroDoc,
		direccion = @prmDireccion,
		telefono = @prmTelefono,
		estado = @prmEstado
		WHERE idAlumno = @idAlumno
	END
GO


CREATE PROCEDURE [dbo].[spActualizarDatosAlumno3]
(
@idAlumno int,
@direccionAlum varchar(50)
)
AS
	BEGIN 
		UPDATE Alumno
		SET direccion = @direccionAlum
		WHERE idAlumno = @idAlumno
	END
GO

select * from Alumno
exec spActualizarDatosAlumno3 1, 'test'

create procedure spEliminarAlumno
(@idAlumno int)
AS
	BEGIN
		UPDATE Alumno
		set estado = 0
		where idAlumno = @idAlumno
	END


use dbColegio
select * from Alumno
select * from TipoEmpleado
Select * from Empleado

create table matricula(idMatricula int primary key IDENTITY(1,1), idAlumno int, grado int)

select * from matricula

alter table matricula add constraint fk_1 foreign key (idAlumno) references Alumno (idAlumno)

alter table matricula add id_curso int


create table grado(idGrado int primary key IDENTITY(1,1), nameGrado varchar(40))
create table curso(idCurso int primary key IDENTITY(1,1), nameCurso varchar(40))

alter table matricula add constraint fk_2 foreign key (grado) references grado (idGrado)
alter table matricula add constraint fk_3 foreign key (id_curso) references curso (idCurso)

insert into curso values ('Matematica')
insert into curso values ('Ingles')
insert into curso values ('Historia')
insert into curso values ('Quimica')


insert into grado values ('Uno')
insert into grado values ('dos')
insert into grado values ('tres')
insert into grado values ('cuatro')
insert into grado values ('cinco')
insert into grado values ('seis')

select * from Alumno
select * from grado
select * from curso 
select * from matricula
drop table matricula
drop table curso
drop table grado


--crear spMatricula pendiente
use dbColegio
exec spMatricula 1,3,1





