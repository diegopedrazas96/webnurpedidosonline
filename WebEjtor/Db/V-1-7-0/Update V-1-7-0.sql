Use [Master]
GO 

IF  NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'bdTienda')
	RAISERROR('La base de datos ''bdTienda'' no existe. Cree la base de datos primero',16,127)
GO

USE [bdTienda]
GO

PRINT 'Actualizando a la version 1.7.0'

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_VERSION_GetVersion]') AND type in (N'P', N'PC'))
BEGIN

	RAISERROR('La base de datos no esta inicializada',16,127)
	RETURN;

END

DECLARE @intVersionMayor int
DECLARE @intVersionMenor int
DECLARE @intPatch int

EXECUTE [dbo].[usp_VERSION_GetVersion] 
   @intVersionMayor OUTPUT
  ,@intVersionMenor OUTPUT
  ,@intPatch OUTPUT

IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL
BEGIN
	
	RAISERROR('La base de datos no esta inicializada',16,127)
	RETURN;

END


IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR NOT (@intVersionMayor = 1 AND @intVersionMenor = 6)
BEGIN
	
	RAISERROR('La base de datos no esta en la version 1.6. Este script solamente se apllica a la version 1.6',16,127)
	RETURN;

END
ELSE
BEGIN
	
	PRINT 'Version OK'

END

USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[tblPERMISO_selectById]    Script Date: 10/31/2017 07:27:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	<Mostrar por Nombre>
-- =============================================
CREATE PROCEDURE [dbo].[tblPERMISO_selectByName]
@Nombre NVARCHAR(50)
AS
BEGIN
	SELECT [permisoId]      
	FROM [dbo].[tblPermiso]
	WHERE nombre = @Nombre
END
GO

USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[tblROLPERMISO_insert]    Script Date: 10/31/2017 07:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	<creacion del procedimiento almanacenado para insertar en la tabla tblROLPERMISO>
-- =============================================
ALTER PROCEDURE [dbo].[tblROLPERMISO_insert]
@pRolId int,
@pPermisoID int,
@pEstado nchar(18),

@pIdRolPermiso int OUTPUT
AS
BEGIN
INSERT INTO [dbo].[tblRolPermiso]
           ([rolId]
           ,[permisoId]
           ,[estado])
     VALUES
           (@pRolId
           ,@pPermisoID
           ,@pEstado)
           
     SET	@pIdRolPermiso = SCOPE_IDENTITY()
END
GO

USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[rsp_ROL_MostrarRolId]    Script Date: 10/31/2017 10:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Mostrar Rol por Id
-- =============================================
ALTER PROCEDURE [dbo].[rsp_ROL_MostrarRolId] 
	@intUsuarioId	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT *
	FROM [dbo].[tblRol]
	WHERE  [rolId] = @intUsuarioId and estado = 'activo';
END
GO

USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[tblROLPERMISO_MostrarIdByPermRol]    Script Date: 10/31/2017 11:58:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	Mostrar Id
-- =============================================
CREATE PROCEDURE [dbo].[tblROLPERMISO_MostrarIdByPermRol]
@pRolId int,
@pPermisoID int

AS
BEGIN
SELECT *
  FROM [dbo].[tblRolPermiso]
	WHERE [rolId] = @pRolId and [permisoId] = @pPermisoID
END
GO

DELETE FROM [dbo].[tbl_Version]
GO

INSERT INTO [dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (1
           ,7
           ,0)
GO
