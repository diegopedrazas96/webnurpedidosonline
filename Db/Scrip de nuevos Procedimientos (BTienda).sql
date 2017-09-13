

/****************************************RECUPERACION****************************************/

USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[rsp_RECUPERACION_EliminarRecuperacion]    Script Date: 09/12/2017 17:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Eliminar Recuperacion
-- =============================================
CREATE PROCEDURE [dbo].[rsp_RECUPERACION_EliminarRecuperacion] 
	@intRecuperacionID	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE FROM [dbo].[tblRecuperacion]
    WHERE [recuperacionId] = @intRecuperacionID
END


USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[rsp_RECUPERACION_InsertarRecuperacion]    Script Date: 09/12/2017 17:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Insertar una Recuperacion
-- =============================================
CREATE PROCEDURE [dbo].[rsp_RECUPERACION_InsertarRecuperacion] 
	
	@codigoGenerado int,
	@fechaGenerado	date,
	@fechaActual	date,
	@tiempo			int,
	@estado			char(18),
	
	@recuperacionId	int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [bdTienda].[dbo].[tblRecuperacion]
           ([codigoGenerado]
           ,[fechaGenerado]
           ,[fechaActual]
           ,[tiempo]
           ,[estado])
     VALUES
           (
				@codigoGenerado,
				@fechaGenerado,
				@fechaActual,
				@tiempo,
				@estado
           )
	 SET	@recuperacionId = SCOPE_IDENTITY()
END


USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[rsp_RECUPERACION_MostrarRecuperacionId]    Script Date: 09/12/2017 17:57:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Mostrar Recuperacion por Id
-- =============================================
CREATE PROCEDURE [dbo].[rsp_RECUPERACION_MostrarRecuperacionId] 
	@intRecuperacionId	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT *
	FROM [dbo].[tblRecuperacion]
	WHERE  [recuperacionId] = @intRecuperacionId;
END


USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[rsp_RECUPERACION_MostrarTodos]    Script Date: 09/12/2017 17:58:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	MostrarTodos
-- =============================================
CREATE PROCEDURE [dbo].[rsp_RECUPERACION_MostrarTodos] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT *
	FROM [dbo].[tblRecuperacion]
END


USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[rsp_RECUPERACION_UpdateRecuperacion]    Script Date: 09/12/2017 17:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Actualizar un Recuperacion
-- =============================================
CREATE PROCEDURE [dbo].[rsp_RECUPERACION_UpdateRecuperacion] 
	@codigoGenerado int,
	@fechaGenerado	date,
	@fechaActual	date,
	@tiempo			int,
	@estado			char(18),
	
	@recuperacionId	int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [bdTienda].[dbo].[tblRecuperacion]
   SET [codigoGenerado] =@codigoGenerado
      ,[fechaGenerado] = @fechaGenerado
      ,[fechaActual] = @fechaActual
      ,[tiempo] = @tiempo
      ,[estado] = @estado
 WHERE [recuperacionId] =  @recuperacionId
END

/****************************************ROL****************************************/

USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[rsp_ROL_EliminarRol]    Script Date: 09/12/2017 17:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Eliminar un Rol
-- =============================================
ALTER PROCEDURE [dbo].[rsp_ROL_EliminarRol] 
	@intRolId	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE FROM [dbo].[tblRol]
    WHERE [rolId] = @intRolId
END


USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[rsp_ROL_InsertarRol]    Script Date: 09/12/2017 17:58:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Insertar un Rol
-- =============================================
ALTER PROCEDURE [dbo].[rsp_ROL_InsertarRol] 
	@nombre			nvarchar(50),
	@estado			char(18),
	@descripcion	nvarchar(250),
	
	@intUsuarioId	int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [bdTienda].[dbo].[tblRol]
           ([nombre]
           ,[descripcion]
           ,[estado])
     VALUES
           (
			@nombre,
			@estado,
			@descripcion
           )
	 SET	@intUsuarioId = SCOPE_IDENTITY()
END


USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[rsp_ROL_MostrarRolId]    Script Date: 09/12/2017 17:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Mostrar Usuario por Id
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
	WHERE  [rolId] = @intUsuarioId;
END

USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[rsp_ROL_MostrarTodos]    Script Date: 09/12/2017 17:59:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 11-09-2016
-- Description:	MostrarTodos
-- =============================================
ALTER PROCEDURE [dbo].[rsp_ROL_MostrarTodos] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT r.*
	FROM [dbo].[tblRol] r 
END


USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[rsp_ROL_UpdateRol]    Script Date: 09/12/2017 17:59:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Actualizar un Rol
-- =============================================
ALTER PROCEDURE [dbo].[rsp_ROL_UpdateRol] 
	@varNombre		nvarchar(50),
	@varEstado		char(18),
	@varDescripcion	nvarchar(250),
	@varUsuarioId	int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [bdTienda].[dbo].[tblRol]
    SET [nombre] = @varNombre
      ,[descripcion] = @varEstado
      ,[estado] = @varDescripcion
	WHERE [rolId] =  @varUsuarioId
END

/****************************************USUARIOROL****************************************/

USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[ursp_ROL_MostrarUsuarioRolId]    Script Date: 09/12/2017 17:59:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Mostrar UsuarioRol por Id
-- =============================================
ALTER PROCEDURE [dbo].[ursp_ROL_MostrarUsuarioRolId] 
	@intUsuarioRolId	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT *
	FROM [dbo].[tblUsuarioRol]
	WHERE  [idUsuarioRol] = @intUsuarioRolId;
END


USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[ursp_USUARIOROL_EliminarUsuarioRol]    Script Date: 09/12/2017 17:59:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Eliminar un UsuarioRol
-- =============================================
ALTER PROCEDURE [dbo].[ursp_USUARIOROL_EliminarUsuarioRol] 
	@intUsuarioRolId	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE FROM [dbo].[tblUsuarioRol]
    WHERE [idUsuarioRol] = @intUsuarioRolId
END


USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[ursp_USUARIOROL_InsertarUsuarioRol]    Script Date: 09/12/2017 17:59:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Insertar un UsuarioRol
-- =============================================
ALTER PROCEDURE [dbo].[ursp_USUARIOROL_InsertarUsuarioRol]

	@varEstado		int,
	@varRolId		int,
	@varUsuarioId	int,

	@intUsuarioRolId	int OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO [bdTienda].[dbo].[tblUsuarioRol]
           ([usuarioId]
           ,[rolId]
           ,[estado])
    VALUES
           (
			@varEstado,
			@varRolId,
			@varUsuarioId
           )          
	SET	@intUsuarioRolId = SCOPE_IDENTITY()
END


USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[ursp_USUARIOROL_MostrarTodos]    Script Date: 09/12/2017 18:00:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 11-09-2016
-- Description:	MostrarTodosTodos
-- =============================================
ALTER PROCEDURE [dbo].[ursp_USUARIOROL_MostrarTodos] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT *
	FROM [dbo].[tblUsuarioRol]
END


USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[ursp_USUARIOROL_UpdateUsuarioRol]    Script Date: 09/12/2017 18:00:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Actualizar un UsuarioRol
-- =============================================
ALTER PROCEDURE [dbo].[ursp_USUARIOROL_UpdateUsuarioRol] 

	@varEstado		char(18),
	@varRolId		int,	
	@varUsuarioId	int,
	
	@UsuarioRolId	int
	
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [bdTienda].[dbo].[tblUsuarioRol]
	SET [usuarioId] = @varUsuarioId 
      ,[rolId] = @varRolId
      ,[estado] = @varEstado
	WHERE [idUsuarioRol] = @UsuarioRolId
END

/****************************************USUARIO****************************************/

USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_EliminarUsuario]    Script Date: 09/12/2017 18:00:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 08-09-2016
-- Description:	Eliminar un Usuario
-- =============================================
ALTER PROCEDURE [dbo].[usp_USUARIO_EliminarUsuario] 
	@intUsuarioId	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE FROM [dbo].[tblUsuario]
    WHERE [usuarioId] = @intUsuarioId
END


USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_InsertarUsuario]    Script Date: 09/12/2017 18:00:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 08-09-2016
-- Description:	Insertar un Usuario
-- =============================================
ALTER PROCEDURE [dbo].[usp_USUARIO_InsertarUsuario] 
	@varNombre		nvarchar(50),
	@apellido		nvarchar(50),
	@correo			nvarchar(50),
	@varContraseña	char(16),
	@varTipoUsuario	nvarchar(50),
	@intUsuarioId	int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [bdTienda].[dbo].[tblUsuario]
           (
				[nombre]
				,[apellido]
				,[correo]
				,[contraseña]
				,[tipoUsuario]
			)
     VALUES
           (
			   @varNombre,
			   @apellido,
			   @correo,
			   @varContraseña,
			   @varTipoUsuario
           )           
	 SET	@intUsuarioId = SCOPE_IDENTITY()
END


USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_MostrarTodos]    Script Date: 09/12/2017 18:01:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 11-09-2016
-- Description:	MostrarTodos
-- =============================================
ALTER PROCEDURE [dbo].[usp_USUARIO_MostrarTodos] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT t.*
	FROM tblUsuario t 
END


USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_MostrarUsuariosId]    Script Date: 09/12/2017 18:01:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 08-09-2016
-- Description:	Mostrar Usuario por Id
-- =============================================
ALTER PROCEDURE [dbo].[usp_USUARIO_MostrarUsuariosId] 
	@intUsuarioId	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT u.*
	FROM tblUsuario u
	WHERE u.usuarioId = @intUsuarioId;
END


USE [bdTienda]
GO
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_UpdateUsuario]    Script Date: 09/12/2017 18:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 08-09-2016
-- Description:	Actualizar un Usuario
-- =============================================
ALTER PROCEDURE [dbo].[usp_USUARIO_UpdateUsuario] 
	@varNombre		nvarchar(50),
	@apellido		nvarchar(50),
	@intUsuarioId	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [bdTienda].[dbo].[tblUsuario]
	SET [nombre] = @varNombre
		,[apellido] = @apellido      
	WHERE [usuarioId] = @intUsuarioId
END
