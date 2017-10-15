/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2008 (10.0.6241)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [bdTienda]
GO
/****** Object:  Table [dbo].[tblEmpresa]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpresa](
	[empresaId] [int] IDENTITY(1,1) NOT NULL,
	[tipoIdc] [int] NOT NULL,
	[nit] [nvarchar](50) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[gerente] [nvarchar](50) NOT NULL,
	[telefono] [nvarchar](10) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tblEmpresa] PRIMARY KEY CLUSTERED 
(
	[empresaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPermiso]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPermiso](
	[permisoId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](250) NULL,
	[url] [nvarchar](250) NULL,
	[posicion] [nchar](10) NULL,
	[estado] [nchar](18) NULL,
 CONSTRAINT [XPKtblPermiso] PRIMARY KEY CLUSTERED 
(
	[permisoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducto]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducto](
	[productoId] [int] IDENTITY(1,1) NOT NULL,
	[tipoIdc] [int] NOT NULL,
	[empresaId] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[precio] [decimal](10, 2) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tblProducto] PRIMARY KEY CLUSTERED 
(
	[productoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRecuperacion]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRecuperacion](
	[recuperacionId] [int] IDENTITY(1,1) NOT NULL,
	[usuarioId] [int] NOT NULL,
	[codigoGenerado] [nvarchar](15) NULL,
	[fechaGenerado] [datetime] NULL,
	[fechaActual] [datetime] NULL,
	[tiempo] [int] NULL,
	[estado] [char](15) NULL,
 CONSTRAINT [XPKtblRecuperacion] PRIMARY KEY CLUSTERED 
(
	[recuperacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRol]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRol](
	[rolId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](250) NULL,
	[estado] [nchar](18) NULL,
 CONSTRAINT [XPKtblRol] PRIMARY KEY CLUSTERED 
(
	[rolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRolPermiso]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRolPermiso](
	[idRolPermiso] [int] NOT NULL,
	[rolId] [int] NOT NULL,
	[permisoId] [int] NOT NULL,
	[estado] [nchar](18) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTipoHijos]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTipoHijos](
	[tipoHijosId] [int] NOT NULL,
	[tipoMaestroId] [int] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[valor] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tblTipoHijos] PRIMARY KEY CLUSTERED 
(
	[tipoHijosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTipoMaestro]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTipoMaestro](
	[tipoMaestroId] [int] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblTipoMaestro] PRIMARY KEY CLUSTERED 
(
	[tipoMaestroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuario](
	[usuarioId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
	[correo] [nvarchar](50) NULL,
	[contraseña] [char](16) NOT NULL,
	[tipoUsuario] [nvarchar](50) NULL,
 CONSTRAINT [XPKtblUsuario] PRIMARY KEY CLUSTERED 
(
	[usuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuarioPermiso]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuarioPermiso](
	[usuarioId] [int] IDENTITY(1,1) NOT NULL,
	[permisoId] [int] NOT NULL,
	[estado] [nchar](18) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuarioRol]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuarioRol](
	[idUsuarioRol] [int] IDENTITY(1,1) NOT NULL,
	[usuarioId] [int] NOT NULL,
	[rolId] [int] NOT NULL,
	[estado] [nchar](18) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblEmpresa]  WITH CHECK ADD  CONSTRAINT [FK_tblEmpresa_tblEmpresa] FOREIGN KEY([tipoIdc])
REFERENCES [dbo].[tblTipoHijos] ([tipoHijosId])
GO
ALTER TABLE [dbo].[tblEmpresa] CHECK CONSTRAINT [FK_tblEmpresa_tblEmpresa]
GO
ALTER TABLE [dbo].[tblProducto]  WITH CHECK ADD  CONSTRAINT [FK_tblProducto_tblEmpresa] FOREIGN KEY([empresaId])
REFERENCES [dbo].[tblEmpresa] ([empresaId])
GO
ALTER TABLE [dbo].[tblProducto] CHECK CONSTRAINT [FK_tblProducto_tblEmpresa]
GO
ALTER TABLE [dbo].[tblProducto]  WITH CHECK ADD  CONSTRAINT [FK_tblProducto_tblTipoHijos] FOREIGN KEY([tipoIdc])
REFERENCES [dbo].[tblTipoHijos] ([tipoHijosId])
GO
ALTER TABLE [dbo].[tblProducto] CHECK CONSTRAINT [FK_tblProducto_tblTipoHijos]
GO
ALTER TABLE [dbo].[tblRecuperacion]  WITH CHECK ADD  CONSTRAINT [FK_tblRecuperacion_tblUsuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblRecuperacion] CHECK CONSTRAINT [FK_tblRecuperacion_tblUsuario]
GO
ALTER TABLE [dbo].[tblRolPermiso]  WITH CHECK ADD  CONSTRAINT [FK_tblRolPermiso_tblPermiso] FOREIGN KEY([permisoId])
REFERENCES [dbo].[tblPermiso] ([permisoId])
GO
ALTER TABLE [dbo].[tblRolPermiso] CHECK CONSTRAINT [FK_tblRolPermiso_tblPermiso]
GO
ALTER TABLE [dbo].[tblRolPermiso]  WITH CHECK ADD  CONSTRAINT [FK_tblRolPermiso_tblRol] FOREIGN KEY([rolId])
REFERENCES [dbo].[tblRol] ([rolId])
GO
ALTER TABLE [dbo].[tblRolPermiso] CHECK CONSTRAINT [FK_tblRolPermiso_tblRol]
GO
ALTER TABLE [dbo].[tblTipoHijos]  WITH CHECK ADD  CONSTRAINT [FK_tblTipoHijos_tblTipoMaestro] FOREIGN KEY([tipoMaestroId])
REFERENCES [dbo].[tblTipoMaestro] ([tipoMaestroId])
GO
ALTER TABLE [dbo].[tblTipoHijos] CHECK CONSTRAINT [FK_tblTipoHijos_tblTipoMaestro]
GO
ALTER TABLE [dbo].[tblUsuarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioPermiso_tblPermiso] FOREIGN KEY([permisoId])
REFERENCES [dbo].[tblPermiso] ([permisoId])
GO
ALTER TABLE [dbo].[tblUsuarioPermiso] CHECK CONSTRAINT [FK_tblUsuarioPermiso_tblPermiso]
GO
ALTER TABLE [dbo].[tblUsuarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioPermiso_tblUsuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblUsuarioPermiso] CHECK CONSTRAINT [FK_tblUsuarioPermiso_tblUsuario]
GO
ALTER TABLE [dbo].[tblUsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioRol_tblRol1] FOREIGN KEY([rolId])
REFERENCES [dbo].[tblRol] ([rolId])
GO
ALTER TABLE [dbo].[tblUsuarioRol] CHECK CONSTRAINT [FK_tblUsuarioRol_tblRol1]
GO
ALTER TABLE [dbo].[tblUsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioRol_tblUsuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblUsuarioRol] CHECK CONSTRAINT [FK_tblUsuarioRol_tblUsuario]
GO
/****** Object:  StoredProcedure [dbo].[emp_EMP_DeleteEmpresa]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jose Manuel Cadima
-- Create date: 13/10/2017
-- Description:	Eliminar Empresa
-- =============================================
CREATE PROCEDURE [dbo].[emp_EMP_DeleteEmpresa]
	-- Add the parameters for the stored procedure here
	@intEmpresaId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[tblEmpresa]
	SET [estado] = 0
	WHERE [empresaId] = @intEmpresaId
      
END
GO
/****** Object:  StoredProcedure [dbo].[emp_EMP_GetEmpresaById]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 13/10/2017
-- Description:	Obtener Empresas por Id
-- =============================================
CREATE PROCEDURE [dbo].[emp_EMP_GetEmpresaById]
	-- Add the parameters for the stored procedure here
	@intEmpresaId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM[dbo].[tblEmpresa]
	WHERE [empresaId] = @intEmpresaId
END
GO
/****** Object:  StoredProcedure [dbo].[emp_EMP_GetEmpresaByName]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 13/10/2017
-- Description:	Obtener Empresas por Nombre
-- =============================================
CREATE PROCEDURE [dbo].[emp_EMP_GetEmpresaByName]
	-- Add the parameters for the stored procedure here
	@nvarNombre NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM[dbo].[tblEmpresa]
	WHERE [nombre] = @nvarNombre
END
GO
/****** Object:  StoredProcedure [dbo].[emp_EMP_GetEmpresas]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima 
-- Create date: 13/10/2017
-- Description:	Obtener Empresas
-- =============================================
CREATE PROCEDURE [dbo].[emp_EMP_GetEmpresas]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [empresaId]
      ,[tipoIdc]
      ,[nit]
      ,[nombre]
      ,[gerente]
      ,[telefono]
      ,[estado]
	FROM [dbo].[tblEmpresa]	

END
GO
/****** Object:  StoredProcedure [dbo].[emp_EMP_InsertarEmpresa]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 13/10/2017
-- Description:	Insertar la empresa
-- =============================================
CREATE PROCEDURE [dbo].[emp_EMP_InsertarEmpresa]
	-- Add the parameters for the stored procedure here
	@intTipoIdc INT,
	@nvarNit NVARCHAR(50),
	@nvarNombre NVARCHAR(50),
	@nvarGerente NVARCHAR(50),
	@nvarTelefono NVARCHAR(10),	
	@ncharEstado BIT,

	@intEmpresaId INT OUTPUT	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [dbo].[tblEmpresa]
           ([tipoIdc]
		   ,[nit]
           ,[nombre]
           ,[gerente]
           ,[telefono]           
           ,[estado])
     VALUES
           (
				@intTipoIdc,
				@nvarNit, 
				@nvarNombre, 
				@nvarGerente, 
				@nvarTelefono, 				
				@ncharEstado							
		   )

	SET @intEmpresaId = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[emp_EMP_UpdateEmpresa]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima
-- Create date: 13/10/2017
-- Description: Actualizar empresa
-- =============================================
CREATE PROCEDURE [dbo].[emp_EMP_UpdateEmpresa]
	-- Add the parameters for the stored procedure here
	@intTipoIdc INT,
	@nvarNit NVARCHAR(50),
	@nvarNombre NVARCHAR(50),
	@nvarGerente NVARCHAR(50),
	@nvarTelefono NVARCHAR(10),		

	@intEmpresaId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tblEmpresa]
   SET [tipoIdc] = @intTipoIdc
      ,[nit] = @nvarNit
      ,[nombre] = @nvarNombre
      ,[gerente] = @nvarGerente
      ,[telefono] = @nvarTelefono      
 WHERE [empresaId] = @intEmpresaId

END
GO
/****** Object:  StoredProcedure [dbo].[prod_PROD_DeleteProducto]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima
-- Create date: 13/10/2017
-- Description: Eliminar producto
-- =============================================
CREATE PROCEDURE [dbo].[prod_PROD_DeleteProducto]
	-- Add the parameters for the stored procedure here	
	@intProductoId INT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[tblProducto]
	SET [estado] = 0		
	WHERE [productoId] = @intProductoId	
END
GO
/****** Object:  StoredProcedure [dbo].[prod_PROD_GetProductos]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima 
-- Create date: 13/10/2017
-- Description:	Obtener Productos
-- =============================================
CREATE PROCEDURE [dbo].[prod_PROD_GetProductos]
	-- Add the parameters for the stored procedure here	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT [productoId]
		,[tipoIdc]
		,[empresaId]
		,[nombre]
		,[precio]
		,[estado]
  FROM [dbo].[tblProducto]

END
GO
/****** Object:  StoredProcedure [dbo].[prod_PROD_GetProductosById]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 13/10/2017
-- Description:	Obtener Productos por Id
-- =============================================
CREATE PROCEDURE [dbo].[prod_PROD_GetProductosById]
	-- Add the parameters for the stored procedure here
	@intProductoId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM[dbo].[tblProducto]
	WHERE [productoId] = @intProductoId
END
GO
/****** Object:  StoredProcedure [dbo].[prod_PROD_InsertProducto]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima
-- Create date: 13/10/2017
-- Description: Insertar producto
-- =============================================
CREATE PROCEDURE [dbo].[prod_PROD_InsertProducto]
	-- Add the parameters for the stored procedure here
	@intTipoIdc INT,
	@intEmpresaId INT,
	@nvarNombre NVARCHAR(50),
	@decPrecio DECIMAL(10,2),
	@bitEstado BIT,

	@intProductoId INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	INSERT INTO [dbo].[tblProducto]
           ([tipoIdc]
           ,[empresaId]
           ,[nombre]
           ,[precio]
           ,[estado])
     VALUES
           (@intTipoIdc
           ,@intEmpresaId
           ,@nvarNombre
           ,@decPrecio
           ,@bitEstado
		   )
	
	SET @intProductoId = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[prod_PROD_UpdateProducto]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima
-- Create date: 13/10/2017
-- Description: Actualizar producto
-- =============================================
CREATE PROCEDURE [dbo].[prod_PROD_UpdateProducto]
	-- Add the parameters for the stored procedure here
	@intTipoIdc INT,
	@intEmpresaId INT,
	@nvarNombre NVARCHAR(50),
	@decPrecio DECIMAL(10,2),	

	@intProductoId INT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[tblProducto]
	SET [tipoIdc] = @intTipoIdc
		,[empresaId] = @intEmpresaId
		,[nombre] = @nvarNombre
		,[precio] = @decPrecio		
	WHERE [productoId] = @intProductoId	
END
GO
/****** Object:  StoredProcedure [dbo].[rsp_RECUPERACION_EliminarRecuperacion]    Script Date: 15/10/2017 11:04:11 ******/
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
GO
/****** Object:  StoredProcedure [dbo].[rsp_RECUPERACION_InsertarRecuperacion]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[rsp_RECUPERACION_InsertarRecuperacion] 
	@usuarioId 		int,
	@varcodigoGenerado nvarchar(15),
	@fechaGenerado	datetime,
	@fechaActual	datetime,
	@tiempo			int,
	@estado			char(18),
	
	@recuperacionId	int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [bdTienda].[dbo].[tblRecuperacion]
           ([usuarioId]
           ,[codigoGenerado]
           ,[fechaGenerado]
           ,[fechaActual]
           ,[tiempo]
           ,[estado])
     VALUES
           (
           		@usuarioId,
				@varcodigoGenerado,
				@fechaGenerado,
				@fechaActual,
				@tiempo,
				@estado
           )
	 SET	@recuperacionId = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[rsp_RECUPERACION_MostrarRecuperacionCode]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Mostrar Recuperacion por Id
-- =============================================
CREATE PROCEDURE [dbo].[rsp_RECUPERACION_MostrarRecuperacionCode] 
	@varCodigo	nvarchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT *
	FROM [dbo].[tblRecuperacion]
	WHERE  [codigoGenerado] = @varCodigo;
END
GO
/****** Object:  StoredProcedure [dbo].[rsp_RECUPERACION_MostrarRecuperacionId]    Script Date: 15/10/2017 11:04:11 ******/
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
GO
/****** Object:  StoredProcedure [dbo].[rsp_RECUPERACION_MostrarTodos]    Script Date: 15/10/2017 11:04:11 ******/
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
GO
/****** Object:  StoredProcedure [dbo].[rsp_RECUPERACION_UpdateRecuperacion]    Script Date: 15/10/2017 11:04:11 ******/
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
	@codigoGenerado nvarchar(15),
	@fechaGenerado	datetime,
	@fechaActual	datetime,
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
GO
/****** Object:  StoredProcedure [dbo].[rsp_ROL_EliminarRol]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Eliminar un Rol
-- =============================================
CREATE PROCEDURE [dbo].[rsp_ROL_EliminarRol] 
	@intRolId	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE FROM [dbo].[tblRol]
    WHERE [rolId] = @intRolId
END
GO
/****** Object:  StoredProcedure [dbo].[rsp_ROL_InsertarRol]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Insertar un Rol
-- =============================================
CREATE PROCEDURE [dbo].[rsp_ROL_InsertarRol] 
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
GO
/****** Object:  StoredProcedure [dbo].[rsp_ROL_MostrarRolId]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Mostrar Usuario por Id
-- =============================================
CREATE PROCEDURE [dbo].[rsp_ROL_MostrarRolId] 
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
GO
/****** Object:  StoredProcedure [dbo].[rsp_ROL_MostrarTodos]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 11-09-2016
-- Description:	MostrarTodos
-- =============================================
CREATE PROCEDURE [dbo].[rsp_ROL_MostrarTodos] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT r.*
	FROM [dbo].[tblRol] r 
END
GO
/****** Object:  StoredProcedure [dbo].[rsp_ROL_UpdateRol]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Actualizar un Rol
-- =============================================
CREATE PROCEDURE [dbo].[rsp_ROL_UpdateRol] 
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
GO
/****** Object:  StoredProcedure [dbo].[tblPERMISO_delete]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para borrar en la tabla TBLPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblPERMISO_delete]
@pPermisoId int,
@pNombre nvarchar(50),
@pDescripcion nvarchar(50),
@pUrl nvarchar(250),
@pPosicion nchar(10),
@pEstado nchar(18)
	
AS
BEGIN

UPDATE [bdTienda].[dbo].[tblPermiso]
   SET [nombre] = @pNombre
      ,[descripcion] = @pDescripcion
      ,[url] = @pUrl
      ,[posicion] = @pPosicion
      ,[estado] = @pEstado
 WHERE permisoId = @pPermisoId

END
GO
/****** Object:  StoredProcedure [dbo].[tblPERMISO_insertar]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para insertar en la tabla TBLPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblPERMISO_insertar]
@pNombre nvarchar(50),
@pDescripcion nvarchar(50),
@pUrl nvarchar(250),
@pPosicion nchar(10),
@pEstado nchar(18)
	
AS
BEGIN
	INSERT INTO [bdTienda].[dbo].[tblPermiso]
           ([nombre]
           ,[descripcion]
           ,[url]
           ,[posicion]
           ,[estado])
     VALUES
           (@pNombre, @pDescripcion, @pUrl, @pPosicion, @pEstado)

END
GO
/****** Object:  StoredProcedure [dbo].[tblPERMISO_selectAll]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para SELECCIONAR en la tabla TBLPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblPERMISO_selectAll]
AS
BEGIN
	SELECT [permisoId]
      ,[nombre]
      ,[descripcion]
      ,[url]
      ,[posicion]
      ,[estado]
  FROM [bdTienda].[dbo].[tblPermiso]
END
GO
/****** Object:  StoredProcedure [dbo].[tblPERMISO_selectById]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para SELECCIONAR POR ID en la tabla TBLPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblPERMISO_selectById]
@pPermisoId int
AS
BEGIN
	SELECT [permisoId]
      ,[nombre]
      ,[descripcion]
      ,[url]
      ,[posicion]
      ,[estado]
  FROM [bdTienda].[dbo].[tblPermiso]
  WHERE permisoId = @pPermisoId
END
GO
/****** Object:  StoredProcedure [dbo].[tblPERMISO_totalDelete]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para borrar(defenitivamente) en la tabla TBLPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblPERMISO_totalDelete]
@pPermisoId int
	
AS
BEGIN
	DELETE FROM [bdTienda].[dbo].[tblPermiso]
      WHERE permisoId = @pPermisoId
END
GO
/****** Object:  StoredProcedure [dbo].[tblPERMISO_update]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para actualizar en la tabla TBLPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblPERMISO_update]
@pPermisoId int,
@pNombre nvarchar(50),
@pDescripcion nvarchar(50),
@pUrl nvarchar(250),
@pPosicion nchar(10),
@pEstado nchar(18)
	
AS
BEGIN

UPDATE [bdTienda].[dbo].[tblPermiso]
   SET [nombre] = @pNombre
      ,[descripcion] = @pDescripcion
      ,[url] = @pUrl
      ,[posicion] = @pPosicion
      ,[estado] = @pEstado
 WHERE permisoId = @pPermisoId

END
GO
/****** Object:  StoredProcedure [dbo].[tblROLPERMISO_delete]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para borrar en la tabla tblROLPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblROLPERMISO_delete]
@pIdRolPermiso int,
@pRolId int,
@pPermisoID int,
@pEstado nchar(18)
AS
BEGIN
	UPDATE [bdTienda].[dbo].[tblRolPermiso]
   SET [estado] = @pEstado
 WHERE [idRolPermiso] = @pIdRolPermiso
       and [rolId] = @pRolId and
      [permisoId] = @pPermisoID
END
GO
/****** Object:  StoredProcedure [dbo].[tblROLPERMISO_insert]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para insertar en la tabla tblROLPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblROLPERMISO_insert]
@pIdRolPermiso int,
@pRolId int,
@pPermisoID int,
@pEstado nchar(18)
AS
BEGIN
INSERT INTO [bdTienda].[dbo].[tblRolPermiso]
           ([idRolPermiso]
           ,[rolId]
           ,[permisoId]
           ,[estado])
     VALUES
           (@pIdRolPermiso,@pRolId, @pPermisoID, @pEstado)
END
GO
/****** Object:  StoredProcedure [dbo].[tblROLPERMISO_selectAll]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para seleccionar todo en la tabla tblROLPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblROLPERMISO_selectAll]
AS
BEGIN
SELECT *
  FROM [bdTienda].[dbo].[tblRolPermiso]
END
GO
/****** Object:  StoredProcedure [dbo].[tblROLPERMISO_selectByID]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para seleccionar por ID en la tabla tblROLPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblROLPERMISO_selectByID]
@pIdRolPermiso int,
@pRolId int,
@pPermisoID int

AS
BEGIN
SELECT *
  FROM [bdTienda].[dbo].[tblRolPermiso]
	WHERE [idRolPermiso] = @pIdRolPermiso
       and [rolId] = @pRolId and
      [permisoId] = @pPermisoID
END
GO
/****** Object:  StoredProcedure [dbo].[tblROLPERMISO_totalDelete]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para borrar definitivo en la tabla tblROLPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblROLPERMISO_totalDelete]
@pIdRolPermiso int,
@pRolId int,
@pPermisoID int
AS
BEGIN
DELETE FROM [bdTienda].[dbo].[tblRolPermiso]
 WHERE [idRolPermiso] = @pIdRolPermiso
       and [rolId] = @pRolId and
      [permisoId] = @pPermisoID
END
GO
/****** Object:  StoredProcedure [dbo].[tblROLPERMISO_update]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para actualizar en la tabla tblROLPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblROLPERMISO_update]
@pIdRolPermiso int,
@pRolId int,
@pPermisoID int,
@pEstado nchar(18)
AS
BEGIN
	UPDATE [bdTienda].[dbo].[tblRolPermiso]
   SET [estado] = @pEstado
 WHERE [idRolPermiso] = @pIdRolPermiso
       and [rolId] = @pRolId and
      [permisoId] = @pPermisoID
END
GO
/****** Object:  StoredProcedure [dbo].[tblUSUARIOPERMISO_delete]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para borrar en la tabla tblUSUARIOPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblUSUARIOPERMISO_delete]
@pUsuarioID int,
@pPermisoID int,
@pEstado nchar(18)
AS
BEGIN
UPDATE [bdTienda].[dbo].[tblUsuarioPermiso]
   SET [permisoId] = permisoId
      ,[estado] = @pEstado
 WHERE usuarioId = @pUsuarioID
END
GO
/****** Object:  StoredProcedure [dbo].[tblUSUARIOPERMISO_insert]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para insertar en la tabla tblUSUARIOPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblUSUARIOPERMISO_insert]
@pPermisoID int,
@pEstado nchar(18)
AS
BEGIN
INSERT INTO [bdTienda].[dbo].[tblUsuarioPermiso]
           ([permisoId]
           ,[estado])
     VALUES
           (@pPermisoID,@pEstado)
END
GO
/****** Object:  StoredProcedure [dbo].[tblUSUARIOPERMISO_selectAll]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para seleccionar todo en la tabla tblUSUARIOPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblUSUARIOPERMISO_selectAll]
AS
BEGIN
SELECT *
  FROM [bdTienda].[dbo].[tblUsuarioPermiso]
END
GO
/****** Object:  StoredProcedure [dbo].[tblUSUARIOPERMISO_selectByID]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para seleccionar POR id en la tabla tblUSUARIOPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblUSUARIOPERMISO_selectByID]
@pUsurioID int,
@pPermisoID int
AS
BEGIN
SELECT *
  FROM [bdTienda].[dbo].[tblUsuarioPermiso]
  where usuarioId = @pUsurioID and permisoId = @pPermisoID
END
GO
/****** Object:  StoredProcedure [dbo].[tblUSUARIOPERMISO_totalDelete]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para borrar definitivamente en la tabla tblUSUARIOPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblUSUARIOPERMISO_totalDelete]
@pUsuarioID int
AS
BEGIN
DELETE FROM [bdTienda].[dbo].[tblUsuarioPermiso]
      WHERE usuarioId = @pUsuarioID
END
GO
/****** Object:  StoredProcedure [dbo].[tblUSUARIOPERMISO_update]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Flavia Veizaga>
-- Create date: <19,08,2017>
-- Description:	<creacion del procedimiento almanacenado para actualizar en la tabla tblUSUARIOPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblUSUARIOPERMISO_update]
@pUsuarioID int,
@pPermisoID int,
@pEstado nchar(18)
AS
BEGIN
UPDATE [bdTienda].[dbo].[tblUsuarioPermiso]
   SET [permisoId] = permisoId
      ,[estado] = @pEstado
 WHERE usuarioId = @pUsuarioID
END
GO
/****** Object:  StoredProcedure [dbo].[tipo_TIPO_GetHijosByIdMaestro]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 14/10/2017
-- Description:	Obtener los Tipo Hijos por Padre
-- =============================================
CREATE PROCEDURE [dbo].[tipo_TIPO_GetHijosByIdMaestro]
	-- Add the parameters for the stored procedure here
	@intTipoMaestroId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * 
	FROM [dbo].[tblTipoHijos] 
	WHERE [tipoMaestroId] = @intTipoMaestroId
	
END
GO
/****** Object:  StoredProcedure [dbo].[ursp_ROL_MostrarUsuarioRolId]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Mostrar UsuarioRol por Id
-- =============================================
CREATE PROCEDURE [dbo].[ursp_ROL_MostrarUsuarioRolId] 
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
GO
/****** Object:  StoredProcedure [dbo].[ursp_USUARIOROL_EliminarUsuarioRol]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Eliminar un UsuarioRol
-- =============================================
CREATE PROCEDURE [dbo].[ursp_USUARIOROL_EliminarUsuarioRol] 
	@intUsuarioRolId	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE FROM [dbo].[tblUsuarioRol]
    WHERE [idUsuarioRol] = @intUsuarioRolId
END
GO
/****** Object:  StoredProcedure [dbo].[ursp_USUARIOROL_InsertarUsuarioRol]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Insertar un UsuarioRol
-- =============================================
CREATE PROCEDURE [dbo].[ursp_USUARIOROL_InsertarUsuarioRol]

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
GO
/****** Object:  StoredProcedure [dbo].[ursp_USUARIOROL_MostrarTodos]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 11-09-2016
-- Description:	MostrarTodosTodos
-- =============================================
CREATE PROCEDURE [dbo].[ursp_USUARIOROL_MostrarTodos] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT *
	FROM [dbo].[tblUsuarioRol]
END
GO
/****** Object:  StoredProcedure [dbo].[ursp_USUARIOROL_UpdateUsuarioRol]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Actualizar un UsuarioRol
-- =============================================
CREATE PROCEDURE [dbo].[ursp_USUARIOROL_UpdateUsuarioRol] 

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
GO
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_EliminarUsuario]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 08-09-2016
-- Description:	Eliminar un Usuario
-- =============================================
CREATE PROCEDURE [dbo].[usp_USUARIO_EliminarUsuario] 
	@intUsuarioId	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE FROM [dbo].[tblUsuario]
    WHERE [usuarioId] = @intUsuarioId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_GetUsuariosByEmail]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 17/09/2017
-- Description:	Obtener usuarios por Email
-- =============================================
CREATE PROCEDURE [dbo].[usp_USUARIO_GetUsuariosByEmail] 
	@varCorreo NVARCHAR (50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [usuarioId]
		  ,[nombre]
		  ,[apellido]
		  ,[correo]
		  ,[contraseña]
		  ,[tipoUsuario]
	FROM [dbo].[tblUsuario]
	WHERE [correo] = @varCorreo
END
GO
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_GetUsuariosByEmailPassword]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_USUARIO_GetUsuariosByEmailPassword] 
	@varCorreo NVARCHAR (50),
	@varPassword NVARCHAR (50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [usuarioId]
		  ,[nombre]
		  ,[apellido]
		  ,[correo]
		  ,[contraseña]
		  ,[tipoUsuario]
	FROM [dbo].[tblUsuario]
	WHERE [correo] = @varCorreo and [contraseña] = @varPassword
END
GO
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_InsertarUsuario]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 08-09-2016
-- Description:	Insertar un Usuario
-- =============================================
CREATE PROCEDURE [dbo].[usp_USUARIO_InsertarUsuario] 
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
GO
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_MostrarTodos]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 11-09-2016
-- Description:	MostrarTodos
-- =============================================
CREATE PROCEDURE [dbo].[usp_USUARIO_MostrarTodos] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT t.*
	FROM tblUsuario t 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_MostrarUsuariosId]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 08-09-2016
-- Description:	Mostrar Usuario por Id
-- =============================================
CREATE PROCEDURE [dbo].[usp_USUARIO_MostrarUsuariosId] 
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
GO
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_UpdateUsuario]    Script Date: 15/10/2017 11:04:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 08-09-2016
-- Description:	Actualizar un Usuario
-- =============================================
CREATE PROCEDURE [dbo].[usp_USUARIO_UpdateUsuario] 
	@varNombre		nvarchar(50),
	@apellido		nvarchar(50),
	@varcorreo		nvarchar(50),
	@charContraseña char(16),
	@intUsuarioId	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [bdTienda].[dbo].[tblUsuario]
	SET [nombre] = @varNombre
		,[apellido] = @apellido 
		,[correo] = @varcorreo
		,[contraseña] = @charContraseña		     
	WHERE [usuarioId] = @intUsuarioId
END
GO


INSERT INTO tblTipoMaestro 
VALUES (1, 'Tipo Empresas'), (2, 'Tipo Productos');

INSERT INTO tblTipoHijos 
VALUES (1, 1, 'Farmacia', 0, 1), (2, 1, 'Supermercado', 0, 1), (3, 1, 'Ferreteria', 0, 1), (4, 1, 'Libreria', 0, 1);
