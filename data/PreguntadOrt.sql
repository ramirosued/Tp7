USE [master]
GO
/****** Object:  Database [PreguntadOrt]    Script Date: 8/8/2023 08:34:44 ******/
CREATE DATABASE [PreguntadOrt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntadOrt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreguntadOrt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntadOrt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntadOrt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntadOrt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntadOrt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntadOrt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntadOrt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntadOrt] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntadOrt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntadOrt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntadOrt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntadOrt] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PreguntadOrt', N'ON'
GO
ALTER DATABASE [PreguntadOrt] SET QUERY_STORE = OFF
GO
USE [PreguntadOrt]
GO
/****** Object:  User [alumno]    Script Date: 8/8/2023 08:34:44 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 8/8/2023 08:34:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 8/8/2023 08:34:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[IdDificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 8/8/2023 08:34:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[FkCategoria] [int] NOT NULL,
	[FkDificultad] [int] NOT NULL,
	[Enunciado] [varchar](350) NOT NULL,
	[Foto] [varchar](600) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 8/8/2023 08:34:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[FkPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](50) NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (1, N'Deporte', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (2, N'Geografia', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (3, N'Ciencia', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (4, N'Cine', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (5, N'Historia', NULL)
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (1, N'Dificil')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (2, N'Facil')
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (2, 1, 1, N'¿Cuantos deportes hay en los juegos olimpicos?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (3, 1, 1, N'¿Quien es la siguiente persona?', N'https://depor.com/resizer/k2NB3EivMZjInVAHkug6Fx5qBMY=/1200x1200/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/JAEKLERKR5AGDPMZ45JJALG4XY.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (4, 1, 1, N'¿Quien fue el ultimo ganador del grand slam?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (5, 1, 1, N'¿Cual es el deporte mas popular en Indonesia?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (6, 1, 2, N'¿Que deporte practica Lionel Andres Messi?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (7, 1, 2, N'¿Quien es la siguiente persona?', N'https://www.elciudadanoweb.com/wp-content/uploads/2023/06/del-potro.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (8, 1, 2, N'¿Cuantos jugadores de Basquet son titulares en un equipo?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (9, 1, 2, N'¿Como se apoda al siguiente equipo de hokey?', N'https://tn.com.ar/resizer/lRURnzAeG-aLGyJVK4vd0LwQ1z0=/767x0/smart/filters:format(webp)/cloudfront-us-east-1.images.arcpublishing.com/artear/RK5XN3FFGZEXNGUI3P5AKWQIJI.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (10, 2, 1, N'¿Cuantos kilometros tiene el planeta Tierra?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (11, 2, 1, N'¿De que pais es esta bandera?', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJbKQJKgNQbNXjQqe5EpzApBeErCQJqyf9Rw&usqp=CAU')
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (12, 2, 1, N'¿Por cuantos paises esta constituido el continente asiatico?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (15, 2, 1, N'¿Cual es el pais mas chico de Europa?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (16, 2, 2, N'¿Cual es el pais mas grande del mundo?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (17, 2, 2, N'¿De que pais es esta bandera?', N'https://img.asmedia.epimg.net/resizer/LQyBk5T2TfVttC_yVM8n5HuEYpM=/1472x828/cloudfront-eu-central-1.images.arcpublishing.com/diarioas/53YSJXSIZFHNTBV52Z4AMKISUM.png')
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (18, 2, 2, N'¿Cuantos continentes hay?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (19, 2, 2, N'¿Cuantas provincias tiene Argentina?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (21, 3, 1, N'¿Quien es el siguiente cientifico?', N'https://fotos.perfil.com/2021/06/28/alan-turing-1196447.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (22, 3, 1, N'¿En que año se desarrollo la vacuna contra la fiebre amarilla?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (26, 3, 1, N'¿Quien es la siguiente cientifica?', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxzEEcV5OvOWLtDDcrlHA1ENTRxztfVEGpAQ&usqp=CAU')
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (27, 3, 2, N'¿Cuál es el proceso mediante el cual las plantas convierten la luz solar en energía alimentaria?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (28, 3, 2, N'¿Cual es la formula quimica del agua?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (30, 3, 2, N'¿Cómo está formado el aire atmosférico de nuestro planeta?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (32, 4, 1, N'¿Cuál es la película con más premios Oscar ganados en la historia ?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (33, 4, 1, N'¿Cuál es el nombre del primer largometraje de la historia del cine?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (34, 4, 1, N'¿Cuál es el nombre del director de cine japonés conocido por sus películas surrealistas y oníricas, como "El viaje de Chihiro" y "El castillo ambulante', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (36, 4, 2, N'¿Cuál es la película de ciencia ficción de Steven Spielberg donde un niño establece contacto con un amistoso extraterrestre?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (37, 4, 2, N'¿Qué película animada cuenta la historia de un león joven que debe enfrentar a su malvado tío para reclamar su lugar como rey?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (38, 4, 2, N'¿Qué película animada de Disney presenta a una joven princesa que sueña con escapar de su torr?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (39, 5, 1, N'¿Cuando se construyo el Muro de Berlín?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (40, 5, 1, N'¿Cual es el famoso objeto utilizado en la Guerra de Troya?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (43, 5, 2, N'¿Qué líder político y militar francés lideró las fuerzas durante la Revolución Francesa y se convirtió en el emperador de Francia?
', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [FkCategoria], [FkDificultad], [Enunciado], [Foto]) VALUES (44, 5, 2, N'¿En qué año se firmó la Declaración de Independencia de los Estados Unidos?

', NULL)
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (5, 2, 1, N'31', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (6, 2, 2, N'33', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (7, 2, 3, N'34', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (8, 3, 1, N'Delfina Pignatiello', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (9, 3, 2, N'Macarena Ceballos', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (10, 3, 3, N'Andrea Berrino', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (12, 4, 1, N'Novak Djokovic', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (13, 4, 2, N'Roger Federer', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (14, 4, 3, N'Rafael Nadal', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (16, 5, 1, N'Futbol', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (17, 5, 2, N'bádminton', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (18, 5, 3, N'tenis', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (20, 6, 1, N'basketball', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (21, 6, 2, N'tenis', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (22, 6, 3, N'futbol', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (24, 7, 1, N'Novak Djokovic', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (25, 7, 2, N'Del Potro', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (26, 7, 3, N'Daniil Medvédev', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (27, 8, 1, N'5', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (28, 8, 2, N'6', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (29, 8, 3, N'4', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (31, 9, 1, N'Estrellas', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (33, 9, 2, N'Leonas', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (34, 9, 3, N'Gladiadoras', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (35, 10, 1, N'510 millones', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (36, 10, 2, N'550 millones', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (37, 10, 3, N'590 millones', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (38, 11, 1, N'Mali', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (39, 11, 2, N'Tanzania', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (40, 11, 3, N'Kenia', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (41, 12, 1, N'50', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (42, 12, 2, N'55', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (43, 12, 3, N'51', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (44, 15, 1, N'Mónaco', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (45, 15, 2, N'Vaticano', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (46, 15, 3, N'Nauru', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (47, 16, 1, N'Rusia', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (48, 16, 2, N'España', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (49, 16, 3, N'Inglaterra', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (50, 17, 1, N'Alemania', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (51, 17, 2, N'Francia', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (52, 17, 3, N'España', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (53, 18, 1, N'6', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (54, 18, 2, N'7', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (55, 18, 3, N'5', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (56, 19, 1, N'24', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (57, 19, 2, N'25', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (58, 19, 3, N'23', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (59, 21, 1, N'Alan Turing', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (60, 21, 2, N'Albert Einstein', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (61, 21, 3, N'Nikola Tesla', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (62, 22, 1, N'1941', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (63, 22, 2, N'1952', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (64, 22, 3, N'1937', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (65, 26, 1, N'Caroline Herschel', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (66, 26, 2, N'Rosalind Franklin', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (67, 26, 3, N'Marie Curie', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (68, 27, 1, N'Fotokinesis', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (69, 27, 2, N'Fotosintesis', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (71, 27, 3, N'Fotoplantis', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (72, 28, 1, N'O²', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (73, 28, 2, N'H²O', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (74, 28, 3, N'H²O²', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (76, 30, 1, N'Oxígeno y metano', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (77, 30, 2, N'Oxígeno', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (78, 30, 3, N'Oxígeno y nitrógeno', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (79, 32, 1, N'Titanic', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (80, 32, 2, N'Lo que el viento se llevó', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (81, 32, 3, N'La lista de Schindler', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (83, 33, 1, N'Mickey Mouse', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (84, 33, 2, N'El nacimiento de una nación', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (85, 33, 3, N'El apóstol', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (86, 34, 1, N'Hayao Miyazaki', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (87, 34, 2, N'Hirokazu Koreeda', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (88, 34, 3, N'
Katsuhito Ishii', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (89, 36, 1, N'La guerra de los mundos', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (90, 36, 2, N'ET', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (91, 36, 3, N'Encuentros cercanos del tercer tipo', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (92, 37, 1, N'El rey león', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (93, 37, 2, N'El gran león', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (94, 37, 3, N'El camino del león', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (95, 38, 1, N'Cenicienta', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (96, 38, 2, N'Enredados', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (97, 38, 3, N'La bella durmiente', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (98, 39, 1, N'El 13 de agosto de 1961', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (99, 39, 2, N'El 22 de septiembre de 1958', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (100, 39, 3, N'El 10 de octubre de 1965', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (101, 40, 1, N'Un caballo de madera', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (102, 40, 2, N'Una gran espada', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (103, 40, 3, N'Un anillo', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (104, 43, 1, N'Nicolas Sarkozy', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (105, 43, 2, N'Napoleón Bonaparte.', 1, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (106, 43, 3, N'Maximilien Robespierre ', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (107, 44, 1, N'1786', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (108, 44, 2, N'1780', 0, NULL)
INSERT [dbo].[Respuestas] ([IdRespuesta], [FkPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (109, 44, 3, N'1776', 1, NULL)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([FkCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([FkDificultad])
REFERENCES [dbo].[Dificultades] ([IdDificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([FkPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
USE [master]
GO
ALTER DATABASE [PreguntadOrt] SET  READ_WRITE 
GO
