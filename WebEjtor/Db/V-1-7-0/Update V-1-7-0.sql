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
ALTER PROCEDURE [dbo].[tblROLPERMISO_MostrarIdByPermRol]
@pRolId int,
@pPermisoID int

AS
BEGIN
SELECT *
  FROM [dbo].[tblRolPermiso]
	WHERE [rolId] = @pRolId and [permisoId] = @pPermisoID
END



