USE [master]
GO
/****** Object:  Database [pruebas]    Script Date: 3/5/2023 2:44:33 AM ******/
CREATE DATABASE [pruebas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pruebas', FILENAME = N'D:\SVR-DB-02\pruebas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pruebas_log', FILENAME = N'L:\SVR-DB-02\pruebas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [pruebas] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pruebas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pruebas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pruebas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pruebas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pruebas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pruebas] SET ARITHABORT OFF 
GO
ALTER DATABASE [pruebas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pruebas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pruebas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pruebas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pruebas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pruebas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pruebas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pruebas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pruebas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pruebas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pruebas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pruebas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pruebas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pruebas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pruebas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pruebas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pruebas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pruebas] SET RECOVERY FULL 
GO
ALTER DATABASE [pruebas] SET  MULTI_USER 
GO
ALTER DATABASE [pruebas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pruebas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pruebas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pruebas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pruebas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pruebas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [pruebas] SET QUERY_STORE = OFF
GO
USE [pruebas]
GO
/****** Object:  User [OSG\edwinfrancisco.retan]    Script Date: 3/5/2023 2:44:33 AM ******/
CREATE USER [OSG\edwinfrancisco.retan] FOR LOGIN [OSG\edwinfrancisco.retan] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [OSG\edwinfrancisco.retan]
GO
/****** Object:  Table [dbo].[profesiones]    Script Date: 3/5/2023 2:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profesiones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[fk_grado] [int] NOT NULL,
 CONSTRAINT [PK_profesiones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 3/5/2023 2:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[id] [int] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellido1] [varchar](20) NOT NULL,
	[Apellido2] [varchar](20) NOT NULL,
	[FechaIngreso] [date] NOT NULL,
	[fk_edificio] [int] NOT NULL,
	[fk_profesion] [int] NOT NULL,
 CONSTRAINT [PK_dbo.empleados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[edificios]    Script Date: 3/5/2023 2:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[edificios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_edificios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salarios]    Script Date: 3/5/2023 2:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salarios](
	[id] [int] NOT NULL,
	[grado] [varchar](50) NOT NULL,
	[salario] [float] NOT NULL,
 CONSTRAINT [PK_salarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_empleados]    Script Date: 3/5/2023 2:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_empleados]
AS
SELECT        dbo.empleados.id, dbo.empleados.Nombre, dbo.empleados.Apellido1, dbo.empleados.Apellido2, dbo.empleados.FechaIngreso, dbo.edificios.nombre AS Edificio, dbo.profesiones.nombre AS Profesión, dbo.salarios.grado, 
                         dbo.salarios.salario
FROM            dbo.empleados INNER JOIN
                         dbo.edificios ON dbo.empleados.fk_edificio = dbo.edificios.id INNER JOIN
                         dbo.profesiones ON dbo.empleados.fk_profesion = dbo.profesiones.id INNER JOIN
                         dbo.salarios ON dbo.profesiones.fk_grado = dbo.salarios.id
GO
/****** Object:  Table [dbo].[ascensos]    Script Date: 3/5/2023 2:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ascensos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fk_empleado] [int] NOT NULL,
	[fk_puestoNuevo] [int] NOT NULL,
	[fk_puestoAnterior] [int] NOT NULL,
	[fecha_ascenso] [date] NOT NULL,
 CONSTRAINT [PK_ascensos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marcas]    Script Date: 3/5/2023 2:44:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marcas](
	[id] [int] NOT NULL,
	[fk_empleado] [int] NOT NULL,
	[marca] [datetime] NOT NULL,
 CONSTRAINT [PK_marcas_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[marcas] ADD  CONSTRAINT [DF_marcas_marca]  DEFAULT (getdate()) FOR [marca]
GO
ALTER TABLE [dbo].[ascensos]  WITH CHECK ADD  CONSTRAINT [FK_ascensos_empleados] FOREIGN KEY([fk_empleado])
REFERENCES [dbo].[empleados] ([id])
GO
ALTER TABLE [dbo].[ascensos] CHECK CONSTRAINT [FK_ascensos_empleados]
GO
ALTER TABLE [dbo].[ascensos]  WITH CHECK ADD  CONSTRAINT [FK_ascensos_profesiones] FOREIGN KEY([fk_puestoNuevo])
REFERENCES [dbo].[profesiones] ([id])
GO
ALTER TABLE [dbo].[ascensos] CHECK CONSTRAINT [FK_ascensos_profesiones]
GO
ALTER TABLE [dbo].[ascensos]  WITH CHECK ADD  CONSTRAINT [FK_ascensos_profesiones1] FOREIGN KEY([fk_puestoAnterior])
REFERENCES [dbo].[profesiones] ([id])
GO
ALTER TABLE [dbo].[ascensos] CHECK CONSTRAINT [FK_ascensos_profesiones1]
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [FK_empleados_edificios] FOREIGN KEY([fk_edificio])
REFERENCES [dbo].[edificios] ([id])
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [FK_empleados_edificios]
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [FK_empleados_profesiones] FOREIGN KEY([fk_profesion])
REFERENCES [dbo].[profesiones] ([id])
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [FK_empleados_profesiones]
GO
ALTER TABLE [dbo].[marcas]  WITH CHECK ADD  CONSTRAINT [FK_marcas_empleados1] FOREIGN KEY([fk_empleado])
REFERENCES [dbo].[empleados] ([id])
GO
ALTER TABLE [dbo].[marcas] CHECK CONSTRAINT [FK_marcas_empleados1]
GO
ALTER TABLE [dbo].[profesiones]  WITH CHECK ADD  CONSTRAINT [FK_profesiones_salarios] FOREIGN KEY([fk_grado])
REFERENCES [dbo].[salarios] ([id])
GO
ALTER TABLE [dbo].[profesiones] CHECK CONSTRAINT [FK_profesiones_salarios]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[21] 2[27] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "empleados"
            Begin Extent = 
               Top = 0
               Left = 70
               Bottom = 180
               Right = 240
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "edificios"
            Begin Extent = 
               Top = 3
               Left = 295
               Bottom = 99
               Right = 465
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "profesiones"
            Begin Extent = 
               Top = 116
               Left = 297
               Bottom = 229
               Right = 467
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "salarios"
            Begin Extent = 
               Top = 192
               Left = 38
               Bottom = 305
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_empleados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_empleados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_empleados'
GO
USE [master]
GO
ALTER DATABASE [pruebas] SET  READ_WRITE 
GO
