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
/****** Object:  User [IIS APPPOOL\.NET v4.5]    Script Date: 10/12/2017 21:22:42 ******/
CREATE USER [IIS APPPOOL\.NET v4.5] FOR LOGIN [IIS APPPOOL\.NET v4.5]
GO
/****** Object:  User [IIS APPPOOL\.NET v4.5 Classic]    Script Date: 10/12/2017 21:22:42 ******/
CREATE USER [IIS APPPOOL\.NET v4.5 Classic] FOR LOGIN [IIS APPPOOL\.NET v4.5 Classic]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 10/12/2017 21:22:42 ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\.NET v4.5]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\.NET v4.5 Classic]
GO
/****** Object:  Schema [IIS APPPOOL\.NET v4.5 Classic]    Script Date: 10/12/2017 21:22:43 ******/
CREATE SCHEMA [IIS APPPOOL\.NET v4.5 Classic]
GO
/****** Object:  Schema [IIS APPPOOL\DefaultAppPool]    Script Date: 10/12/2017 21:22:43 ******/
CREATE SCHEMA [IIS APPPOOL\DefaultAppPool]
GO
/****** Object:  Table [dbo].[tbl_Version]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Version](
	[versionMayor] [int] NOT NULL,
	[versionMenor] [int] NOT NULL,
	[patch] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblConfigDash]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblConfigDash](
	[configId] [int] IDENTITY(1,1) NOT NULL,
	[dashId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[productoId] [int] NOT NULL,
	[empresaId] [int] NOT NULL,
	[cantidad] [decimal](10, 2) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[latitud] [varchar](15) NULL,
	[longitud] [varchar](15) NULL,
 CONSTRAINT [PK_tblConfigDash] PRIMARY KEY CLUSTERED 
(
	[configId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDash]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDash](
	[dashId] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tblDash] PRIMARY KEY CLUSTERED 
(
	[dashId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDetallePedido]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDetallePedido](
	[DetallePedidoId] [int] IDENTITY(1,1) NOT NULL,
	[PedidoId] [int] NOT NULL,
	[ProductoId] [int] NOT NULL,
	[Precio] [decimal](5, 2) NOT NULL,
	[Cantidad] [decimal](5, 2) NOT NULL,
	[SubTotal] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_tblDetallePedido] PRIMARY KEY CLUSTERED 
(
	[DetallePedidoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpresa]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  Table [dbo].[tblPedido]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPedido](
	[pedidoId] [int] IDENTITY(1,1) NOT NULL,
	[clienteId] [int] NOT NULL,
	[empresaId] [int] NOT NULL,
	[usuarioId] [int] NULL,
	[fecha] [datetime] NOT NULL,
	[Atendido] [bit] NOT NULL,
	[latitud] [varchar](15) NULL,
	[longitud] [varchar](15) NULL,
	[isMovil] [bit] NULL,
 CONSTRAINT [PK_tblPedido] PRIMARY KEY CLUSTERED 
(
	[pedidoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPermiso]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  Table [dbo].[tblProducto]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  Table [dbo].[tblRecuperacion]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  Table [dbo].[tblRol]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  Table [dbo].[tblRolPermiso]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRolPermiso](
	[idRolPermiso] [int] IDENTITY(1,1) NOT NULL,
	[rolId] [int] NOT NULL,
	[permisoId] [int] NOT NULL,
	[estado] [nchar](18) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTipoHijos]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  Table [dbo].[tblTipoMaestro]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  Table [dbo].[tblUsuarioPermiso]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  Table [dbo].[tblUsuarioRol]    Script Date: 10/12/2017 21:22:43 ******/
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
INSERT [dbo].[tbl_Version] ([versionMayor], [versionMenor], [patch]) VALUES (1, 8, 0)
GO
SET IDENTITY_INSERT [dbo].[tblConfigDash] ON 
GO
INSERT [dbo].[tblConfigDash] ([configId], [dashId], [userId], [productoId], [empresaId], [cantidad], [fecha], [latitud], [longitud]) VALUES (3, 2, 3, 2, 2, CAST(10.00 AS Decimal(10, 2)), CAST(N'2017-12-01T00:00:00.000' AS DateTime), N'-17.7834221', N'-63.1821761')
GO
INSERT [dbo].[tblConfigDash] ([configId], [dashId], [userId], [productoId], [empresaId], [cantidad], [fecha], [latitud], [longitud]) VALUES (5, 3, 3, 3, 2, CAST(2.00 AS Decimal(10, 2)), CAST(N'2017-12-01T00:00:00.000' AS DateTime), N'-17.7981931', N'-63.1470458')
GO
INSERT [dbo].[tblConfigDash] ([configId], [dashId], [userId], [productoId], [empresaId], [cantidad], [fecha], [latitud], [longitud]) VALUES (6, 2, 2, 1, 1, CAST(5.00 AS Decimal(10, 2)), CAST(N'2017-12-07T21:42:46.000' AS DateTime), N'-17.7689155', N'-63.1829717')
GO
INSERT [dbo].[tblConfigDash] ([configId], [dashId], [userId], [productoId], [empresaId], [cantidad], [fecha], [latitud], [longitud]) VALUES (12, 1, 6, 7, 5, CAST(12.00 AS Decimal(10, 2)), CAST(N'2017-12-10T21:10:29.000' AS DateTime), N'-17.8301552', N'-63.2246184')
GO
SET IDENTITY_INSERT [dbo].[tblConfigDash] OFF
GO
SET IDENTITY_INSERT [dbo].[tblDash] ON 
GO
INSERT [dbo].[tblDash] ([dashId], [codigo], [estado]) VALUES (1, N'12345', 1)
GO
INSERT [dbo].[tblDash] ([dashId], [codigo], [estado]) VALUES (2, N'67890', 1)
GO
INSERT [dbo].[tblDash] ([dashId], [codigo], [estado]) VALUES (3, N'99999', 1)
GO
INSERT [dbo].[tblDash] ([dashId], [codigo], [estado]) VALUES (4, N'55466', 1)
GO
SET IDENTITY_INSERT [dbo].[tblDash] OFF
GO
SET IDENTITY_INSERT [dbo].[tblDetallePedido] ON 
GO
INSERT [dbo].[tblDetallePedido] ([DetallePedidoId], [PedidoId], [ProductoId], [Precio], [Cantidad], [SubTotal]) VALUES (1, 1, 2, CAST(2.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[tblDetallePedido] ([DetallePedidoId], [PedidoId], [ProductoId], [Precio], [Cantidad], [SubTotal]) VALUES (9, 4, 8, CAST(19.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(38.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[tblDetallePedido] ([DetallePedidoId], [PedidoId], [ProductoId], [Precio], [Cantidad], [SubTotal]) VALUES (36, 42, 2, CAST(2.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[tblDetallePedido] ([DetallePedidoId], [PedidoId], [ProductoId], [Precio], [Cantidad], [SubTotal]) VALUES (37, 43, 1, CAST(5.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[tblDetallePedido] ([DetallePedidoId], [PedidoId], [ProductoId], [Precio], [Cantidad], [SubTotal]) VALUES (52, 60, 5, CAST(4.00 AS Decimal(5, 2)), CAST(4.00 AS Decimal(5, 2)), CAST(16.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[tblDetallePedido] ([DetallePedidoId], [PedidoId], [ProductoId], [Precio], [Cantidad], [SubTotal]) VALUES (53, 60, 6, CAST(5.00 AS Decimal(5, 2)), CAST(4.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[tblDetallePedido] ([DetallePedidoId], [PedidoId], [ProductoId], [Precio], [Cantidad], [SubTotal]) VALUES (54, 60, 2, CAST(2.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(4.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[tblDetallePedido] ([DetallePedidoId], [PedidoId], [ProductoId], [Precio], [Cantidad], [SubTotal]) VALUES (55, 61, 1, CAST(5.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[tblDetallePedido] ([DetallePedidoId], [PedidoId], [ProductoId], [Precio], [Cantidad], [SubTotal]) VALUES (56, 62, 8, CAST(3.00 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), CAST(69.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[tblDetallePedido] ([DetallePedidoId], [PedidoId], [ProductoId], [Precio], [Cantidad], [SubTotal]) VALUES (57, 63, 7, CAST(20.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(240.00 AS Decimal(5, 2)))
GO
SET IDENTITY_INSERT [dbo].[tblDetallePedido] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmpresa] ON 
GO
INSERT [dbo].[tblEmpresa] ([empresaId], [tipoIdc], [nit], [nombre], [gerente], [telefono], [estado]) VALUES (1, 2, N'8958473893', N'Hipermaxi', N'Maxi Perez', N'74892900', 1)
GO
INSERT [dbo].[tblEmpresa] ([empresaId], [tipoIdc], [nit], [nombre], [gerente], [telefono], [estado]) VALUES (2, 1, N'8958470800', N'Farmacord', N'Luisa Peña', N'3555555', 1)
GO
INSERT [dbo].[tblEmpresa] ([empresaId], [tipoIdc], [nit], [nombre], [gerente], [telefono], [estado]) VALUES (3, 4, N'8943318999', N'Librería Cañoto', N'José Manuel Cañoto', N'74892900', 1)
GO
INSERT [dbo].[tblEmpresa] ([empresaId], [tipoIdc], [nit], [nombre], [gerente], [telefono], [estado]) VALUES (4, 3, N'8509340992', N'Ferretería Don Marcos', N'Marcos Marquez', N'3091828', 1)
GO
INSERT [dbo].[tblEmpresa] ([empresaId], [tipoIdc], [nit], [nombre], [gerente], [telefono], [estado]) VALUES (5, 1, N'9495558899', N'Farmacias Chavez', N'Sheyla Chavez', N'793848983', 1)
GO
SET IDENTITY_INSERT [dbo].[tblEmpresa] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPedido] ON 
GO
INSERT [dbo].[tblPedido] ([pedidoId], [clienteId], [empresaId], [usuarioId], [fecha], [Atendido], [latitud], [longitud], [isMovil]) VALUES (1, 2, 2, NULL, CAST(N'2017-11-02T00:00:00.000' AS DateTime), 1, N'-17.7981913', N'-63.1683337', 0)
GO
INSERT [dbo].[tblPedido] ([pedidoId], [clienteId], [empresaId], [usuarioId], [fecha], [Atendido], [latitud], [longitud], [isMovil]) VALUES (4, 2, 5, NULL, CAST(N'2017-11-02T00:00:00.000' AS DateTime), 1, N'-17.7689831', N'-63.1829346', 1)
GO
INSERT [dbo].[tblPedido] ([pedidoId], [clienteId], [empresaId], [usuarioId], [fecha], [Atendido], [latitud], [longitud], [isMovil]) VALUES (42, 3, 2, NULL, CAST(N'2017-12-10T16:23:30.460' AS DateTime), 0, N'-17.7834221', N'-63.1821761', 0)
GO
INSERT [dbo].[tblPedido] ([pedidoId], [clienteId], [empresaId], [usuarioId], [fecha], [Atendido], [latitud], [longitud], [isMovil]) VALUES (43, 4, 1, NULL, CAST(N'2017-12-10T17:16:44.970' AS DateTime), 0, N'-17.7698915', N'-63.1829704', 0)
GO
INSERT [dbo].[tblPedido] ([pedidoId], [clienteId], [empresaId], [usuarioId], [fecha], [Atendido], [latitud], [longitud], [isMovil]) VALUES (60, 6, 2, NULL, CAST(N'2017-12-10T21:01:54.000' AS DateTime), 0, N'-17.8302301', N'-63.2246874', 0)
GO
INSERT [dbo].[tblPedido] ([pedidoId], [clienteId], [empresaId], [usuarioId], [fecha], [Atendido], [latitud], [longitud], [isMovil]) VALUES (61, 6, 1, NULL, CAST(N'2017-12-10T21:04:13.000' AS DateTime), 0, N'-17.8302301', N'-63.2246874', 0)
GO
INSERT [dbo].[tblPedido] ([pedidoId], [clienteId], [empresaId], [usuarioId], [fecha], [Atendido], [latitud], [longitud], [isMovil]) VALUES (62, 6, 5, NULL, CAST(N'2017-12-10T21:08:07.000' AS DateTime), 0, N'-17.8302155', N'-63.2247101', 1)
GO
INSERT [dbo].[tblPedido] ([pedidoId], [clienteId], [empresaId], [usuarioId], [fecha], [Atendido], [latitud], [longitud], [isMovil]) VALUES (63, 6, 5, NULL, CAST(N'2017-12-10T21:10:33.687' AS DateTime), 0, N'-17.8301552', N'-63.2246184', 0)
GO
SET IDENTITY_INSERT [dbo].[tblPedido] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPermiso] ON 
GO
INSERT [dbo].[tblPermiso] ([permisoId], [nombre], [descripcion], [url], [posicion], [estado]) VALUES (1, N'Insertar Productos', N'Permite agregar Productos', NULL, NULL, N'activo            ')
GO
INSERT [dbo].[tblPermiso] ([permisoId], [nombre], [descripcion], [url], [posicion], [estado]) VALUES (2, N'Eliminar Productos', N'Permite eliminar Productos', NULL, NULL, N'activo            ')
GO
INSERT [dbo].[tblPermiso] ([permisoId], [nombre], [descripcion], [url], [posicion], [estado]) VALUES (3, N'Modificar Productos', N'Permite modificar datos Productos', NULL, NULL, N'activo            ')
GO
INSERT [dbo].[tblPermiso] ([permisoId], [nombre], [descripcion], [url], [posicion], [estado]) VALUES (4, N'Registrar Usuarios', N'Permite agregar Usuarios', NULL, NULL, N'activo            ')
GO
INSERT [dbo].[tblPermiso] ([permisoId], [nombre], [descripcion], [url], [posicion], [estado]) VALUES (5, N'Eliminar Usuarios', N'Permite eliminar Usuarios', NULL, NULL, N'activo            ')
GO
INSERT [dbo].[tblPermiso] ([permisoId], [nombre], [descripcion], [url], [posicion], [estado]) VALUES (6, N'Modificar Usuarios', N'Permite modificar datos Usuarios', NULL, NULL, N'activo            ')
GO
INSERT [dbo].[tblPermiso] ([permisoId], [nombre], [descripcion], [url], [posicion], [estado]) VALUES (7, N'Registrar Empresa', N'Permite agregar Empresa', NULL, NULL, N'activo            ')
GO
INSERT [dbo].[tblPermiso] ([permisoId], [nombre], [descripcion], [url], [posicion], [estado]) VALUES (8, N'Eliminar Empresa', N'Permite eliminar Empresa', NULL, NULL, N'activo            ')
GO
INSERT [dbo].[tblPermiso] ([permisoId], [nombre], [descripcion], [url], [posicion], [estado]) VALUES (9, N'Modificar Empresa', N'Permite modificar datos Empresa', NULL, NULL, N'activo            ')
GO
INSERT [dbo].[tblPermiso] ([permisoId], [nombre], [descripcion], [url], [posicion], [estado]) VALUES (10, N'Ver Reportes', N'Permite observar los registros', NULL, NULL, N'activo            ')
GO
SET IDENTITY_INSERT [dbo].[tblPermiso] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProducto] ON 
GO
INSERT [dbo].[tblProducto] ([productoId], [tipoIdc], [empresaId], [nombre], [precio], [estado]) VALUES (1, 8, 1, N'Azucar', CAST(5.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[tblProducto] ([productoId], [tipoIdc], [empresaId], [nombre], [precio], [estado]) VALUES (2, 5, 2, N'Paracetamol', CAST(2.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[tblProducto] ([productoId], [tipoIdc], [empresaId], [nombre], [precio], [estado]) VALUES (3, 5, 2, N'Mentisan Pequeño', CAST(7.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[tblProducto] ([productoId], [tipoIdc], [empresaId], [nombre], [precio], [estado]) VALUES (4, 5, 2, N'Penicilina', CAST(15.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[tblProducto] ([productoId], [tipoIdc], [empresaId], [nombre], [precio], [estado]) VALUES (5, 5, 2, N'Digestan', CAST(4.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[tblProducto] ([productoId], [tipoIdc], [empresaId], [nombre], [precio], [estado]) VALUES (6, 5, 2, N'Alikal', CAST(5.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[tblProducto] ([productoId], [tipoIdc], [empresaId], [nombre], [precio], [estado]) VALUES (7, 5, 5, N'Dolorub', CAST(20.00 AS Decimal(10, 2)), 1)
GO
INSERT [dbo].[tblProducto] ([productoId], [tipoIdc], [empresaId], [nombre], [precio], [estado]) VALUES (8, 5, 5, N'COCA COLA', CAST(3.00 AS Decimal(10, 2)), 1)
GO
SET IDENTITY_INSERT [dbo].[tblProducto] OFF
GO
INSERT [dbo].[tblTipoHijos] ([tipoHijosId], [tipoMaestroId], [nombre], [valor], [estado]) VALUES (1, 1, N'Farmacia', N'0', 1)
GO
INSERT [dbo].[tblTipoHijos] ([tipoHijosId], [tipoMaestroId], [nombre], [valor], [estado]) VALUES (2, 1, N'Supermercado', N'0', 1)
GO
INSERT [dbo].[tblTipoHijos] ([tipoHijosId], [tipoMaestroId], [nombre], [valor], [estado]) VALUES (3, 1, N'Ferreteria', N'0', 1)
GO
INSERT [dbo].[tblTipoHijos] ([tipoHijosId], [tipoMaestroId], [nombre], [valor], [estado]) VALUES (4, 1, N'Libreria', N'0', 1)
GO
INSERT [dbo].[tblTipoHijos] ([tipoHijosId], [tipoMaestroId], [nombre], [valor], [estado]) VALUES (5, 2, N'Medicamento', N'0', 1)
GO
INSERT [dbo].[tblTipoHijos] ([tipoHijosId], [tipoMaestroId], [nombre], [valor], [estado]) VALUES (6, 2, N'Herramienta', N'0', 1)
GO
INSERT [dbo].[tblTipoHijos] ([tipoHijosId], [tipoMaestroId], [nombre], [valor], [estado]) VALUES (7, 2, N'Bebida', N'0', 1)
GO
INSERT [dbo].[tblTipoHijos] ([tipoHijosId], [tipoMaestroId], [nombre], [valor], [estado]) VALUES (8, 2, N'Alimento', N'0', 1)
GO
INSERT [dbo].[tblTipoHijos] ([tipoHijosId], [tipoMaestroId], [nombre], [valor], [estado]) VALUES (9, 2, N'Utencilio', N'0', 1)
GO
INSERT [dbo].[tblTipoHijos] ([tipoHijosId], [tipoMaestroId], [nombre], [valor], [estado]) VALUES (10, 2, N'Material Escolar', N'0', 1)
GO
INSERT [dbo].[tblTipoHijos] ([tipoHijosId], [tipoMaestroId], [nombre], [valor], [estado]) VALUES (11, 2, N'Vestimenta', N'0', 1)
GO
INSERT [dbo].[tblTipoHijos] ([tipoHijosId], [tipoMaestroId], [nombre], [valor], [estado]) VALUES (12, 2, N'Otro', N'0', 1)
GO
INSERT [dbo].[tblTipoMaestro] ([tipoMaestroId], [nombre]) VALUES (1, N'Tipo Empresas')
GO
INSERT [dbo].[tblTipoMaestro] ([tipoMaestroId], [nombre]) VALUES (2, N'Tipo Productos')
GO
SET IDENTITY_INSERT [dbo].[tblUsuario] ON 
GO
INSERT [dbo].[tblUsuario] ([usuarioId], [nombre], [apellido], [correo], [contraseña], [tipoUsuario]) VALUES (1, N'ADM', N'ADM', N'easywebsoft3@gmail.com', N'ADM             ', N'2')
GO
INSERT [dbo].[tblUsuario] ([usuarioId], [nombre], [apellido], [correo], [contraseña], [tipoUsuario]) VALUES (2, N'José Manuel', N'Cadima Aponte', N'jose@gmail.com', N'jose123         ', N'2')
GO
INSERT [dbo].[tblUsuario] ([usuarioId], [nombre], [apellido], [correo], [contraseña], [tipoUsuario]) VALUES (3, N'Diego', N'Stan', N'diego', N'diego           ', N'1')
GO
INSERT [dbo].[tblUsuario] ([usuarioId], [nombre], [apellido], [correo], [contraseña], [tipoUsuario]) VALUES (4, N'Manuel Jose', N'Aponte Cadima', N'manu@gmail.com', N'manu            ', N'1')
GO
INSERT [dbo].[tblUsuario] ([usuarioId], [nombre], [apellido], [correo], [contraseña], [tipoUsuario]) VALUES (5, N'Julio', N'Agreda', N'julio@gmail.com', N'julio           ', N'1')
GO
INSERT [dbo].[tblUsuario] ([usuarioId], [nombre], [apellido], [correo], [contraseña], [tipoUsuario]) VALUES (6, N'Flavia ', N'Veizaga', N'flavia@gmail.com', N'oracle          ', N'1')
GO
SET IDENTITY_INSERT [dbo].[tblUsuario] OFF
GO
ALTER TABLE [dbo].[tblConfigDash]  WITH CHECK ADD  CONSTRAINT [FK_tblConfigDash_tblDash] FOREIGN KEY([dashId])
REFERENCES [dbo].[tblDash] ([dashId])
GO
ALTER TABLE [dbo].[tblConfigDash] CHECK CONSTRAINT [FK_tblConfigDash_tblDash]
GO
ALTER TABLE [dbo].[tblConfigDash]  WITH CHECK ADD  CONSTRAINT [FK_tblConfigDash_tblEmpresa] FOREIGN KEY([empresaId])
REFERENCES [dbo].[tblEmpresa] ([empresaId])
GO
ALTER TABLE [dbo].[tblConfigDash] CHECK CONSTRAINT [FK_tblConfigDash_tblEmpresa]
GO
ALTER TABLE [dbo].[tblConfigDash]  WITH CHECK ADD  CONSTRAINT [FK_tblConfigDash_tblProducto] FOREIGN KEY([productoId])
REFERENCES [dbo].[tblProducto] ([productoId])
GO
ALTER TABLE [dbo].[tblConfigDash] CHECK CONSTRAINT [FK_tblConfigDash_tblProducto]
GO
ALTER TABLE [dbo].[tblConfigDash]  WITH CHECK ADD  CONSTRAINT [FK_tblConfigDash_tblUsuario] FOREIGN KEY([userId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblConfigDash] CHECK CONSTRAINT [FK_tblConfigDash_tblUsuario]
GO
ALTER TABLE [dbo].[tblDetallePedido]  WITH CHECK ADD  CONSTRAINT [FK_tblDetallePedido_tblPedido] FOREIGN KEY([PedidoId])
REFERENCES [dbo].[tblPedido] ([pedidoId])
GO
ALTER TABLE [dbo].[tblDetallePedido] CHECK CONSTRAINT [FK_tblDetallePedido_tblPedido]
GO
ALTER TABLE [dbo].[tblDetallePedido]  WITH CHECK ADD  CONSTRAINT [FK_tblDetallePedido_tblProducto] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[tblProducto] ([productoId])
GO
ALTER TABLE [dbo].[tblDetallePedido] CHECK CONSTRAINT [FK_tblDetallePedido_tblProducto]
GO
ALTER TABLE [dbo].[tblEmpresa]  WITH CHECK ADD  CONSTRAINT [FK_tblEmpresa_tblEmpresa] FOREIGN KEY([tipoIdc])
REFERENCES [dbo].[tblTipoHijos] ([tipoHijosId])
GO
ALTER TABLE [dbo].[tblEmpresa] CHECK CONSTRAINT [FK_tblEmpresa_tblEmpresa]
GO
ALTER TABLE [dbo].[tblPedido]  WITH CHECK ADD  CONSTRAINT [FK_tblPedido_tblEmpresa] FOREIGN KEY([empresaId])
REFERENCES [dbo].[tblEmpresa] ([empresaId])
GO
ALTER TABLE [dbo].[tblPedido] CHECK CONSTRAINT [FK_tblPedido_tblEmpresa]
GO
ALTER TABLE [dbo].[tblPedido]  WITH CHECK ADD  CONSTRAINT [FK_tblPedido_tblUsuario] FOREIGN KEY([clienteId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblPedido] CHECK CONSTRAINT [FK_tblPedido_tblUsuario]
GO
ALTER TABLE [dbo].[tblPedido]  WITH CHECK ADD  CONSTRAINT [FK_tblPedido_tblUsuario1] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblPedido] CHECK CONSTRAINT [FK_tblPedido_tblUsuario1]
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
/****** Object:  StoredProcedure [dbo].[CONF_DeleteConfigDash]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 05/11/2017
-- Description:	Eliminar configuración de Dash
-- =============================================
CREATE PROCEDURE [dbo].[CONF_DeleteConfigDash]
	-- Add the parameters for the stored procedure here
	@ConfigId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[tblConfigDash]
      WHERE [configId] = @ConfigId

END
GO
/****** Object:  StoredProcedure [dbo].[CONF_GetAllConfigDash]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 05/11/2017
-- Description:	Obtener toda las configuraciones del Dash
-- =============================================
CREATE PROCEDURE [dbo].[CONF_GetAllConfigDash]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM [tblConfigDash]
END
GO
/****** Object:  StoredProcedure [dbo].[CONF_GetConfigByDashId]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 01/12/2017
-- Description:	Obtener Configuracion por DashId
-- =============================================
CREATE PROCEDURE [dbo].[CONF_GetConfigByDashId]
	-- Add the parameters for the stored procedure here
	@DashId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tblConfigDash] 
	WHERE [dashId] = @DashId 

END
GO
/****** Object:  StoredProcedure [dbo].[CONF_InsertConfigDash]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 05/11/2017
-- Description:	Insertar configuración de Dash
-- =============================================
CREATE PROCEDURE [dbo].[CONF_InsertConfigDash]
	-- Add the parameters for the stored procedure here
	@DashId	INT,
	@UserId	INT,
	@ProductoId	INT,
	@EmpresaId	INT,
	@Cantidad	DECIMAL(10, 2),
	@Fecha	DATETIME,
	@Latitud	VARCHAR(15),
	@Longitud	VARCHAR(15),

	@ConfigId	INT OUTPUT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tblConfigDash]
           ([dashId]
           ,[userId]
           ,[productoId]
           ,[empresaId]
           ,[cantidad]
           ,[fecha]
		   ,[latitud]
		   ,[longitud])
     VALUES
           (@DashId
           ,@UserId
           ,@ProductoId
           ,@EmpresaId
           ,@Cantidad
           ,@Fecha
		   ,@Latitud
		   ,@Longitud)

	SET @ConfigId = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[CONF_UpdateConfigDash]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 05/11/2017
-- Description:	Actualizar configuración de Dash
-- =============================================
CREATE PROCEDURE [dbo].[CONF_UpdateConfigDash]
	-- Add the parameters for the stored procedure here
	@ConfigId	INT,
	@DashId	INT,
	@UserId	INT,
	@ProductoId	INT,
	@EmpresaId	INT,
	@Cantidad	DECIMAL(10, 2),
	@Fecha	DATETIME,
	@Latitud	VARCHAR(15),
	@Longitud	VARCHAR(15)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tblConfigDash]
	SET [dashId] = @DashId
      ,[userId] = @UserId
      ,[productoId] = @ProductoId
      ,[empresaId] = @EmpresaId
      ,[cantidad] = @Cantidad
      ,[fecha] = @Fecha
	  ,[latitud] = @Latitud
	  ,[longitud] = @Longitud
	WHERE [configId] = @ConfigId

END
GO
/****** Object:  StoredProcedure [dbo].[DASH_DeleteDash]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 05/11/2017
-- Description:	Eliminar Dispositivo DASH-BUTTON
-- =============================================
CREATE PROCEDURE [dbo].[DASH_DeleteDash]
	-- Add the parameters for the stored procedure here	
	@DashId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[tblDash]
    WHERE [dashId] = @DashId

END
GO
/****** Object:  StoredProcedure [dbo].[DASH_GetAllDash]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 05/11/2017
-- Description:	Obtener Dispositivos DASH-BUTTON
-- =============================================
CREATE PROCEDURE [dbo].[DASH_GetAllDash]
	-- Add the parameters for the stored procedure here		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM [tblDash]

END
GO
/****** Object:  StoredProcedure [dbo].[DASH_GetDashByCode]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 01/12/2017
-- Description:	Obtener Dash por codigo
-- =============================================
CREATE PROCEDURE [dbo].[DASH_GetDashByCode]
	-- Add the parameters for the stored procedure here
	@codigo	VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[tblDash] 
	WHERE [codigo] = @codigo
END
GO
/****** Object:  StoredProcedure [dbo].[DASH_InsertDash]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 05/11/2017
-- Description:	Insertar Dispositivo DASH-BUTTON
-- =============================================
CREATE PROCEDURE [dbo].[DASH_InsertDash]
	-- Add the parameters for the stored procedure here	
	@Codigo VARCHAR(50),
	@Estado BIT,

	@DashId	INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[tblDash]
           ([codigo]
           ,[estado])
     VALUES
           (@Codigo
           ,@Estado)

	SET @DashId = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[DASH_UpdateDash]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 05/11/2017
-- Description:	Actualizar Dispositivo DASH-BUTTON
-- =============================================
CREATE PROCEDURE [dbo].[DASH_UpdateDash]
	-- Add the parameters for the stored procedure here	
	@DashId	INT,
	@Codigo VARCHAR(50),
	@Estado BIT	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tblDash]
	SET [codigo] = @Codigo
      ,[estado] = @Estado
	WHERE [dashId] = @DashId
END
GO
/****** Object:  StoredProcedure [dbo].[emp_EMP_DeleteEmpresa]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[emp_EMP_GetEmpresaById]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[emp_EMP_GetEmpresaByName]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[emp_EMP_GetEmpresas]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[emp_EMP_InsertarEmpresa]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[emp_EMP_UpdateEmpresa]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[PED_AtenderPedido]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 02/11/2017
-- Description:	Atender Pedido
-- =============================================
CREATE PROCEDURE [dbo].[PED_AtenderPedido]
	-- Add the parameters for the stored procedure here
	@pedidoId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[tblPedido]
   SET [Atendido] = 1
     WHERE [pedidoId] = @pedidoId

END
GO
/****** Object:  StoredProcedure [dbo].[PED_GetPedidoById]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 02/11/2017
-- Description:	Obtener pedidos por ID
-- =============================================
CREATE PROCEDURE [dbo].[PED_GetPedidoById]
	-- Add the parameters for the stored procedure here
	@pedidoId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [pedidoId],
		[clienteId],
		pe.[empresaId],
		em.[nombre] [nombreEmpresa],
		pe.[usuarioId],		
		us.[nombre] + ' ' + us.[apellido] [nombreCliente],
		us.[correo] [correo],
		pe.[fecha],
		[Atendido],
		[latitud],
		[longitud],
		pe.[isMovil],
		(CASE WHEN(pe.[isMovil] = 1) THEN 'Teléfono Móvil' ELSE 'Dash-Button' END) [Dispositivo],
		(SELECT SUM(DP.SubTotal) [totalPago]
		FROM [dbo].[tblPedido] pe, [dbo].[tblDetallePedido] dp 
		WHERE pe.[pedidoId] = @PedidoId 
		AND dp.[PedidoId] = pe.[pedidoId] ) [totalPago]
	FROM [dbo].[tblPedido] pe 
	JOIN [dbo].[tblUsuario] us ON us.[usuarioId] = pe.[clienteId] 
	JOIN [dbo].[tblEmpresa] em ON em.[empresaId] = pe.[empresaId] 
	WHERE [pedidoId] = @pedidoId
END
GO
/****** Object:  StoredProcedure [dbo].[PED_GetPedidos]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


----------------------------------------------------

CREATE PROCEDURE [dbo].[PED_GetPedidos]
 
AS
BEGIN
 SET NOCOUNT OFF;

    SELECT [pedidoId],
		[clienteId],
		pe.[empresaId],
		em.[nombre] [nombreEmpresa],
		pe.[usuarioId],		
		us.[nombre] + ' ' + us.[apellido] [nombreCliente],
		us.[correo] [correo],
		pe.[fecha],
		[Atendido],
		[latitud],
		[longitud],
		pe.[isMovil],
		(CASE WHEN(pe.[isMovil] = 1) THEN 'Teléfono Móvil' ELSE 'Dash-Button' END) [Dispositivo], 
		(SELECT SUM(DP.SubTotal) [totalPago]
		FROM [dbo].[tblPedido] pd, [dbo].[tblDetallePedido] dp 
		WHERE pd.[pedidoId] = pe.pedidoId
		AND dp.[PedidoId] = pd.[pedidoId] ) [totalPago]
	FROM [dbo].[tblPedido] pe 
	JOIN [dbo].[tblUsuario] us ON us.[usuarioId] = pe.[clienteId] 
	JOIN [dbo].[tblEmpresa] em ON em.[empresaId] = pe.[empresaId] 	
	ORDER BY pe.[fecha] DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[PED_GetTotalPedido]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 07/11/2017
-- Description:	Obtener Total Pedido
-- =============================================
CREATE PROCEDURE [dbo].[PED_GetTotalPedido]
	-- Add the parameters for the stored procedure here
	@PedidoId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SUM(DP.SubTotal) [totalPago]
	FROM [dbo].[tblPedido] pe, [dbo].[tblDetallePedido] dp 
	WHERE pe.[pedidoId] = @PedidoId 
	AND dp.[PedidoId] = pe.[pedidoId] 
END
GO
/****** Object:  StoredProcedure [dbo].[PEDDET_GetDetallePedido]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PEDDET_GetDetallePedido]
  
AS
BEGIN
 SET NOCOUNT OFF;

    SELECT *
    FROM tblDetallePedido
END
GO
/****** Object:  StoredProcedure [dbo].[PEDDET_GetDetallePedidoByPedidoId]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 05/11/2017
-- Description:	Obtener Detalle de Pedido por PedidoId
-- =============================================
CREATE PROCEDURE [dbo].[PEDDET_GetDetallePedidoByPedidoId]
	-- Add the parameters for the stored procedure here
	@PedidoId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [DetallePedidoId],
		[PedidoId],
		dp.[ProductoId],				
		p.[nombre] [nombreProducto],
		dp.[Precio],
		[Cantidad],
		[SubTotal]
	FROM [dbo].[tblDetallePedido] dp 
	JOIN [dbo].[tblProducto] p ON p.[productoId] = dp.[ProductoId]
	WHERE [PedidoId] = @PedidoId

END
GO
/****** Object:  StoredProcedure [dbo].[PEDDET_InsertarDetallePedido]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PEDDET_InsertarDetallePedido]
  @PedidoId INT = NULL
 ,@ProductoId INT = NULL
 ,
@Precio DECIMAL(5, 2) = NULL
 ,@Cantidad DECIMAL(5, 2) = NULL
 ,@SubTotal DECIMAL(5, 2) = NULL 

AS
BEGIN
 SET NOCOUNT OFF;

    INSERT INTO tblDetallePedido(     
    PedidoId
    ,ProductoId
    ,Precio
    ,Cantidad
    ,SubTotal
 )
 VALUES(
     @PedidoId
    ,@ProductoId
    ,@Precio
    ,@Cantidad
    ,@SubTotal
 )
END
GO
/****** Object:  StoredProcedure [dbo].[PEDIDO_Insertar]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PEDIDO_Insertar]
	-- Add the parameters for the stored procedure here
	@clienteId INT = NULL
 ,@empresaId INT = NULL
 ,@usuarioId INT = NULL

 ,@fecha DATETIME = NULL
 ,@Atendido BIT = NULL
 ,@latitud VARCHAR(15) = NULL
 ,@longitud VARCHAR(15) = NULL
 ,@isMovil BIT = NULL
 ,@intPedidoId INT OUTPUT	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		INSERT INTO tblPedido(     
		clienteId
		,empresaId
		,usuarioId
		,fecha
		,Atendido
		,latitud
		,longitud
		,isMovil
	 )
 
	VALUES(
		 @clienteId
		,@empresaId
		,@usuarioId
		,@fecha
		,@Atendido
		,@latitud
		,@longitud
		,@isMovil
	 )

	SET @intPedidoId = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[prod_PROD_DeleteProducto]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[prod_PROD_GetProductos]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[prod_PROD_GetProductosById]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[prod_PROD_InsertProducto]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[prod_PROD_UpdateProducto]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[rsp_RECUPERACION_EliminarRecuperacion]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[rsp_RECUPERACION_InsertarRecuperacion]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[rsp_RECUPERACION_MostrarRecuperacionCode]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[rsp_RECUPERACION_MostrarRecuperacionId]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[rsp_RECUPERACION_MostrarTodos]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[rsp_RECUPERACION_UpdateRecuperacion]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[rsp_ROL_EliminarRol]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[rsp_ROL_InsertarRol]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[rsp_ROL_MostrarRolId]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	Mostrar Rol por Id
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
	WHERE  [rolId] = @intUsuarioId and estado = 'activo';
END
GO
/****** Object:  StoredProcedure [dbo].[rsp_ROL_MostrarTodos]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[rsp_ROL_UpdateRol]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblPERMISO_delete]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblPERMISO_insertar]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblPERMISO_selectAll]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblPERMISO_selectById]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblPERMISO_selectByName]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblPERMISO_totalDelete]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblPERMISO_update]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblROLPERMISO_delete]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblROLPERMISO_insert]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 12-09-2016
-- Description:	<creacion del procedimiento almanacenado para insertar en la tabla tblROLPERMISO>
-- =============================================
CREATE PROCEDURE [dbo].[tblROLPERMISO_insert]
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
/****** Object:  StoredProcedure [dbo].[tblROLPERMISO_MostrarIdByPermRol]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblROLPERMISO_selectAll]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblROLPERMISO_selectByID]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblROLPERMISO_totalDelete]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblROLPERMISO_update]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblUSUARIOPERMISO_delete]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblUSUARIOPERMISO_insert]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblUSUARIOPERMISO_selectAll]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblUSUARIOPERMISO_selectByID]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblUSUARIOPERMISO_totalDelete]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tblUSUARIOPERMISO_update]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[tipo_TIPO_GetHijos]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Manuel Cadima Aponte
-- Create date: 14/10/2017
-- Description:	Obtener todos los Tipo Hijos
-- =============================================
CREATE PROCEDURE [dbo].[tipo_TIPO_GetHijos]
	-- Add the parameters for the stored procedure here	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * 
	FROM [dbo].[tblTipoHijos] 	
	
END
GO
/****** Object:  StoredProcedure [dbo].[tipo_TIPO_GetHijosByIdMaestro]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[ursp_ROL_MostrarUsuarioRolId]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[ursp_USUARIOROL_EliminarUsuarioRol]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[ursp_USUARIOROL_InsertarUsuarioRol]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[ursp_USUARIOROL_MostrarTodos]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[ursp_USUARIOROL_UpdateUsuarioRol]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_EliminarUsuario]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_GetUsuariosByEmail]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_GetUsuariosByEmailPassword]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_InsertarUsuario]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_MostrarTodos]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_MostrarUsuariosId]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_UpdateUsuario]    Script Date: 10/12/2017 21:22:43 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_VERSION_GetVersion]    Script Date: 10/12/2017 21:22:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Flavia Veizaga Garcia
-- Create date: 2017-09-26
-- Description:	Obtiene informacion de la version de la base de datos
-- =============================================
CREATE PROCEDURE [dbo].[usp_VERSION_GetVersion]
	@intVersionMayor	INT OUTPUT,
	@intVersionMenor	INT OUTPUT,
	@intPatch			INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT TOP 1
		@intVersionMayor = [versionMayor],
		@intVersionMenor = [versionMenor],
		@intPatch = [patch]
    FROM [dbo].[tbl_Version]
    
    
END

GO
