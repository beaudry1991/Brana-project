USE [master]
GO
/****** Object:  Database [SemsBrana]   tres bien  Script Date: 1/27/2016 11:03:52 AM ******/
CREATE DATABASE [SemsBrana]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SemsBrana', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SemsBrana.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SemsBrana_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SemsBrana_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SemsBrana] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SemsBrana].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SemsBrana] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SemsBrana] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SemsBrana] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SemsBrana] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SemsBrana] SET ARITHABORT OFF 
GO
ALTER DATABASE [SemsBrana] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SemsBrana] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SemsBrana] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SemsBrana] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SemsBrana] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SemsBrana] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SemsBrana] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SemsBrana] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SemsBrana] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SemsBrana] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SemsBrana] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SemsBrana] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SemsBrana] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SemsBrana] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SemsBrana] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SemsBrana] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SemsBrana] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SemsBrana] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SemsBrana] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SemsBrana] SET  MULTI_USER 
GO
ALTER DATABASE [SemsBrana] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SemsBrana] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SemsBrana] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SemsBrana] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SemsBrana]
GO
/****** Object:  User [SemsBranaUser]    Script Date: 1/27/2016 11:03:53 AM ******/
CREATE USER [SemsBranaUser] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [SemsBranaUser]
GO
/****** Object:  StoredProcedure [dbo].[userlog]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[userlog]
	-- Add the parameters for the stored procedure here
	@email varchar(50), @password varchar(50), @idUser int
AS
BEGIN
	insert into Logins(mail,password,idUser)values(@email,@password,@idUser)
END


GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bouteilles]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bouteilles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[caisse] [varchar](100) NOT NULL,
	[depot] [varchar](100) NOT NULL,
	[qte] [int] NOT NULL,
	[type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Bouteilles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BouteilleSansCaisses]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BouteilleSansCaisses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeBout] [varchar](100) NOT NULL,
	[qte] [int] NOT NULL,
	[depot] [varchar](100) NOT NULL,
 CONSTRAINT [PK_BouteilleSansCaisses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Caisses]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Caisses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](100) NOT NULL,
	[depot] [varchar](100) NOT NULL,
	[capacite] [int] NOT NULL,
	[qte] [int] NOT NULL,
 CONSTRAINT [PK_Caisses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CaisseVides]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CaisseVides](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](100) NOT NULL,
	[qte] [int] NOT NULL,
	[capacite] [int] NOT NULL,
	[depot] [varchar](100) NOT NULL,
 CONSTRAINT [PK_CaisseVides] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Casse]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Casse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[id_produit] [int] NOT NULL,
	[id_depot] [int] NOT NULL,
	[qtite_casse] [int] NOT NULL,
	[motif] [text] NOT NULL,
	[id_superviseur] [int] NOT NULL,
	[date_casse] [datetime] NOT NULL,
	[type] [varchar](50) NOT NULL,
	[qtite_bout] [int] NOT NULL,
	[qtite_shortfill] [int] NOT NULL,
	[qtite_perte] [int] NOT NULL,
	[qtite_prod_man] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Casses]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Casses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[depot] [varchar](100) NOT NULL,
	[idUser] [int] NOT NULL,
	[typeBout] [varchar](50) NOT NULL,
	[qteBout] [int] NOT NULL,
	[shift] [varchar](50) NOT NULL,
	[dateCasse] [date] NOT NULL,
 CONSTRAINT [PK_Casses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categorie]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categorie](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NOT NULL,
	[type_fabrication] [varchar](50) NULL,
 CONSTRAINT [PK_Categorie] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Chauffeurs]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Chauffeurs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[prenom] [varchar](50) NOT NULL,
	[nom] [varchar](50) NOT NULL,
	[mail] [varchar](50) NULL,
	[phone] [varchar](50) NOT NULL,
	[photo] [varchar](50) NULL,
	[adresse] [varchar](50) NOT NULL,
	[aide1] [varchar](100) NULL,
	[aide2] [varchar](100) NULL,
	[noPermis] [varchar](50) NOT NULL,
	[dateEmission] [date] NOT NULL,
	[dateExpire] [date] NOT NULL,
 CONSTRAINT [PK_Chauffeurs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DebarquementAutres]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DebarquementAutres](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[shift] [varchar](50) NOT NULL,
	[noPlaque] [varchar](15) NOT NULL,
	[chauffeur] [varchar](100) NOT NULL,
	[client] [varchar](100) NULL,
	[provenance] [varchar](50) NULL,
	[noDeb] [varchar](10) NOT NULL,
	[dateDeb] [date] NOT NULL,
	[hreDebut] [datetime] NOT NULL,
	[hreFin] [datetime] NOT NULL,
	[stubby] [int] NOT NULL,
	[rstub] [int] NOT NULL,
	[gold] [int] NOT NULL,
	[rgold] [int] NOT NULL,
	[big] [int] NOT NULL,
	[rbig] [int] NOT NULL,
	[kingcola] [int] NOT NULL,
	[rcola] [int] NOT NULL,
	[sevenup] [int] NOT NULL,
	[r7up] [int] NOT NULL,
	[pepsi] [int] NOT NULL,
	[rpepsi] [int] NOT NULL,
	[redCratesHD] [int] NOT NULL,
	[redCratesFD] [int] NOT NULL,
	[yellowCratesFD] [int] NOT NULL,
	[qtePalette] [int] NOT NULL,
 CONSTRAINT [PK_DebarquementAutres] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DebarquementPleins]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DebarquementPleins](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[noDeb] [varchar](50) NOT NULL,
	[noloading] [varchar](50) NOT NULL,
	[shift] [varchar](50) NOT NULL,
	[prestige] [int] NOT NULL,
	[guinness] [int] NOT NULL,
	[malta] [int] NOT NULL,
	[kinanm341ml] [int] NOT NULL,
	[big] [int] NOT NULL,
	[kinanm500ml] [int] NOT NULL,
	[king] [int] NOT NULL,
	[sevenup] [int] NOT NULL,
	[pepsi] [int] NOT NULL,
 CONSTRAINT [PK_DebarquementPleins] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Debarquements]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Debarquements](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[noDeb] [varchar](20) NOT NULL,
	[noSp] [varchar](20) NOT NULL,
	[dateDeb] [date] NOT NULL,
	[hreDebut] [datetime] NOT NULL,
	[hreFin] [datetime] NOT NULL,
	[idChauffeur] [int] NOT NULL,
	[idVehicule] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[stubby] [int] NOT NULL,
	[rstub] [int] NOT NULL,
	[gold] [int] NOT NULL,
	[rgold] [int] NOT NULL,
	[big] [int] NOT NULL,
	[rbig] [int] NOT NULL,
	[kingcola] [int] NOT NULL,
	[rcola] [int] NOT NULL,
	[sevenup] [int] NOT NULL,
	[r7up] [int] NOT NULL,
	[pepsi] [int] NOT NULL,
	[rpepsi] [int] NOT NULL,
	[redCratesHD] [int] NOT NULL,
	[redCratesFD] [int] NOT NULL,
	[yellowCratesFD] [int] NOT NULL,
	[qtePalette] [int] NOT NULL,
	[shift] [varchar](50) NULL,
 CONSTRAINT [PK_Debarquements] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Debut_inventaire]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Debut_inventaire](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[qtite_bouteille] [int] NOT NULL,
	[date_debut_inventaire] [datetime] NOT NULL,
	[id_produit] [int] NOT NULL,
	[qtite_trouvee] [int] NOT NULL,
	[id_superviseur] [int] NOT NULL,
	[id_depot_fg] [int] NOT NULL,
	[caisse_theor] [int] NOT NULL,
	[bout_theor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Depot_FG]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Depot_FG](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NOT NULL,
	[adresse] [varchar](100) NOT NULL,
	[dateCreation] [datetime] NOT NULL,
 CONSTRAINT [PK_Depot_FG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Depot_Produit]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Depot_Produit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[id_depot] [int] NOT NULL,
	[id_produit] [int] NOT NULL,
	[qtite_produit_dispo] [int] NOT NULL,
	[qtite_bouteille] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DepotEmballages]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DepotEmballages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[noDeb] [varchar](50) NOT NULL,
	[noloading] [varchar](50) NOT NULL,
	[shift] [varchar](50) NOT NULL,
	[prestige] [int] NOT NULL,
	[guinness] [int] NOT NULL,
	[malta] [int] NOT NULL,
	[kinanm341ml] [int] NOT NULL,
	[big] [int] NOT NULL,
	[kinanm500ml] [int] NOT NULL,
	[king] [int] NOT NULL,
	[sevenup] [int] NOT NULL,
	[pepsi] [int] NOT NULL,
	[statut] [varchar](100) NOT NULL,
	[dateDepot] [date] NOT NULL,
	[datelivraison] [date] NULL,
 CONSTRAINT [PK_DepotEmballages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Depots]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Depots](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](100) NOT NULL,
	[adresse] [varchar](100) NOT NULL,
	[dateCreation] [datetime] NOT NULL,
	[typeDepot] [varchar](50) NULL,
 CONSTRAINT [PK_Depots] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Emballage]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Emballage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NOT NULL,
	[volume] [decimal](10, 4) NOT NULL,
	[qte_par_caisse] [int] NOT NULL,
	[id_utilisateur] [int] NOT NULL,
	[date_emb] [datetime] NOT NULL,
 CONSTRAINT [PK_Emballage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EntreeProductions]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EntreeProductions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeBout] [varchar](100) NOT NULL,
	[qte] [int] NOT NULL,
	[typeCaisse] [varchar](100) NOT NULL,
	[qteCaisses] [int] NOT NULL,
	[codeReq] [varchar](50) NOT NULL,
	[depot] [varchar](100) NOT NULL,
	[idUser] [int] NOT NULL,
	[comment] [text] NOT NULL,
	[dateEntree] [date] NOT NULL,
	[shift] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EntreeProductions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fin_Inventaire]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fin_Inventaire](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[id_superviseur] [int] NOT NULL,
	[date_fin_inventaire] [datetime] NOT NULL,
	[id_produit] [int] NOT NULL,
	[qtite_laissee] [int] NOT NULL,
	[id_depot_fg] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InjectionsBout]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InjectionsBout](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[iduser] [int] NOT NULL,
	[typeBout] [varchar](50) NOT NULL,
	[qteBout] [int] NOT NULL,
	[truckID] [varchar](50) NOT NULL,
	[po] [varchar](50) NOT NULL,
	[provenance] [varchar](100) NOT NULL,
	[grr] [varchar](50) NOT NULL,
	[comment] [text] NOT NULL,
	[dateInjection] [date] NOT NULL,
	[shift] [varchar](50) NOT NULL,
	[depot] [varchar](100) NOT NULL,
 CONSTRAINT [PK_InjectionsBout] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InjectionsCaisse]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InjectionsCaisse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[typeCaisse] [varchar](100) NOT NULL,
	[qteCaisse] [int] NOT NULL,
	[qtePalette] [int] NOT NULL,
	[truckID] [varchar](50) NOT NULL,
	[po] [varchar](50) NOT NULL,
	[provenance] [varchar](100) NOT NULL,
	[grr] [varchar](50) NOT NULL,
	[dateInjection] [date] NOT NULL,
	[shift] [varchar](50) NOT NULL,
	[comment] [text] NOT NULL,
	[depot] [varchar](50) NOT NULL,
	[capacite] [int] NOT NULL,
 CONSTRAINT [PK_InjectionsCaisse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[laboratoire_echantillon]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[laboratoire_echantillon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nom_recepteur] [varchar](100) NOT NULL,
	[qtite_donnee] [int] NOT NULL,
	[id_produit] [int] NOT NULL,
	[id_superviseur] [int] NOT NULL,
	[qtite_retour] [int] NULL,
	[id_depot] [int] NOT NULL,
	[date_donnee] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ligne_depot]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ligne_depot](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[id_ligne_production] [int] NOT NULL,
	[id_depot] [int] NOT NULL,
	[qtite_caisse] [int] NOT NULL,
	[date_ligne_depot] [datetime] NOT NULL,
	[id_superviseur] [int] NOT NULL,
	[id_data_clock] [int] NOT NULL,
	[id_produit] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ligne_production]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ligne_production](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NOT NULL,
	[id_utilisateur] [int] NOT NULL,
	[date_ligne_prod] [datetime] NOT NULL,
 CONSTRAINT [PK_Ligne_production] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ligne_Produit]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ligne_Produit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[id_produit] [int] NOT NULL,
	[id_ligne_production] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Loading]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Loading](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_loading] [date] NOT NULL,
	[heure_debut] [datetime] NOT NULL,
	[heure_fin] [datetime] NOT NULL,
	[id_chauffeur] [int] NOT NULL,
	[id_depot] [int] NOT NULL,
	[client] [varchar](50) NULL,
	[id_vehicule] [int] NOT NULL,
	[numero_sp] [varchar](20) NOT NULL,
	[numero_emb] [varchar](20) NOT NULL,
	[nbre_palette] [int] NULL,
	[type_emb] [varchar](20) NOT NULL,
	[retour] [int] NULL,
	[id_superviseur] [int] NOT NULL,
	[id_data_clock] [int] NOT NULL,
	[remarque] [text] NULL,
	[destination] [varchar](50) NULL,
 CONSTRAINT [PK_Loading] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Loading_prodiut]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loading_prodiut](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_produit] [int] NOT NULL,
	[qte_caisse_delivre] [int] NOT NULL,
	[qte_caisse_retourne] [int] NULL,
	[qte_bout_retourne] [int] NULL,
	[id_loading] [int] NOT NULL,
 CONSTRAINT [PK_Loading_prodiut] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Loading_produit]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Loading_produit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_produit] [int] NOT NULL,
	[qte_caisse_delivre] [int] NOT NULL,
	[qte_caisse_retourne] [int] NULL,
	[qte_bout_retourne] [int] NULL,
	[id_loading] [varchar](20) NOT NULL,
	[qte_bouteille_delivre] [int] NOT NULL,
 CONSTRAINT [PK_Loading_produit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Logins]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Logins](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [PK_Logins] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MiseEnCaisses]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MiseEnCaisses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeBout] [varchar](100) NOT NULL,
	[caisse] [varchar](100) NOT NULL,
	[depot] [varchar](100) NOT NULL,
	[idUser] [int] NOT NULL,
	[qte] [int] NOT NULL,
	[comment] [text] NOT NULL,
	[dateMEC] [date] NOT NULL,
 CONSTRAINT [PK_MiseEnCaisses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Palettes]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Palettes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[qte] [int] NOT NULL,
	[depot] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Palettes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Produit_Bloque]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produit_Bloque](
	[Id] [int] NOT NULL,
	[id_produit] [int] NOT NULL,
	[raison] [varchar](255) NOT NULL,
	[id_depot] [int] NOT NULL,
	[qtite_caisse_donnee] [int] NOT NULL,
	[qtite_caisse_retour] [int] NULL,
	[etat] [int] NOT NULL,
	[date_donnee] [datetime] NOT NULL,
	[date_retour] [datetime] NULL,
	[qtite_bout_donnee] [int] NOT NULL,
	[qtite_bout_retour] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Produits]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produits](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NOT NULL,
	[id_emballage] [int] NOT NULL,
	[id_categorie] [int] NOT NULL,
	[id_utilisateur] [int] NOT NULL,
	[date_prod] [date] NOT NULL,
	[type_fabrication] [varchar](50) NULL,
	[type_bout] [varchar](50) NULL,
 CONSTRAINT [PK_Produit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecyclagesBout]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecyclagesBout](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[depot] [varchar](50) NOT NULL,
	[typeBout] [varchar](100) NOT NULL,
	[qteBout] [int] NOT NULL,
	[dateRecycling] [date] NOT NULL,
	[idUser] [int] NOT NULL,
	[shift] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RecyclagesBout] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecyclagesCaisse]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecyclagesCaisse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[depot] [varchar](100) NOT NULL,
	[typeCaisse] [varchar](100) NOT NULL,
	[qteCaisse] [int] NOT NULL,
	[qtePalette] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[dateRecycling] [date] NOT NULL,
	[shift] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RecyclagesCaisse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReportFormats]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReportFormats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[stockDebutSystem] [varchar](50) NOT NULL,
	[StockDebutreel] [varchar](50) NOT NULL,
	[Reception] [varchar](50) NOT NULL,
	[Transfert] [varchar](50) NOT NULL,
	[EntreeProduction] [varchar](50) NOT NULL,
	[RetourProduction] [varchar](50) NOT NULL,
	[RetourVente] [varchar](50) NOT NULL,
	[Recyclage] [varchar](50) NOT NULL,
	[Casse] [varchar](50) NOT NULL,
	[sortiePalette] [varchar](50) NOT NULL,
	[retourPalette] [varchar](50) NOT NULL,
	[StockFinSystem] [varchar](50) NOT NULL,
	[StockFinreel] [varchar](50) NOT NULL,
	[difference] [varchar](50) NOT NULL,
	[Perte] [varchar](50) NOT NULL,
	[Shift] [varchar](50) NOT NULL,
	[DateLog] [date] NOT NULL,
	[idUser] [int] NOT NULL,
	[depot] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ReportFormats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[stockDebutSystem] [int] NOT NULL,
	[StockDebutreel] [int] NOT NULL,
	[Reception] [int] NOT NULL,
	[Transfert] [int] NOT NULL,
	[EntreeProduction] [int] NOT NULL,
	[RetourProduction] [int] NOT NULL,
	[RetourVente] [int] NOT NULL,
	[Recyclage] [int] NOT NULL,
	[Casse] [int] NOT NULL,
	[sortiePalette] [int] NOT NULL,
	[retourPalette] [int] NOT NULL,
	[StockFinSystem] [int] NOT NULL,
	[StockFinreel] [int] NOT NULL,
	[difference] [int] NOT NULL,
	[Perte] [int] NOT NULL,
	[Shift] [varchar](50) NOT NULL,
	[DateLog] [date] NOT NULL,
	[idUser] [int] NOT NULL,
	[depot] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RetourProductions]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RetourProductions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeBout] [varchar](100) NULL,
	[qte] [int] NOT NULL,
	[typeCaisse] [varchar](100) NULL,
	[qteCaisses] [int] NOT NULL,
	[codeReq] [varchar](50) NOT NULL,
	[depot] [varchar](100) NOT NULL,
	[idUser] [int] NOT NULL,
	[comment] [text] NOT NULL,
	[dateRetour] [date] NOT NULL,
	[shift] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RetourProductions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockDebuEmptyCrates]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockDebuEmptyCrates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](100) NOT NULL,
	[qte] [int] NOT NULL,
	[depot] [varchar](100) NOT NULL,
	[dateLog] [date] NOT NULL,
	[idUser] [int] NOT NULL,
	[shift] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StockDebuEmptyCrates] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockDebutPalettes]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockDebutPalettes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[qte] [int] NOT NULL,
	[depot] [varchar](100) NOT NULL,
	[dateLog] [date] NOT NULL,
	[idUser] [int] NOT NULL,
	[shift] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockDebutreels]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockDebutreels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeBout] [varchar](100) NOT NULL,
	[InCrates] [int] NOT NULL,
	[NotInCrates] [int] NOT NULL,
	[resteInCrates] [int] NOT NULL,
	[ResteNotInCrates] [int] NOT NULL,
	[depot] [varchar](100) NOT NULL,
	[idUser] [int] NOT NULL,
	[shift] [varchar](50) NOT NULL,
	[dateLog] [date] NOT NULL,
 CONSTRAINT [PK_StockDebutreels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockFinEmptyCrates]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockFinEmptyCrates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](100) NULL,
	[qte] [int] NOT NULL,
	[depot] [varchar](100) NOT NULL,
	[dateLog] [date] NOT NULL,
	[idUser] [int] NOT NULL,
	[shift] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockFinPalettes]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockFinPalettes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[qte] [int] NOT NULL,
	[depot] [varchar](100) NOT NULL,
	[dateLog] [date] NOT NULL,
	[idUser] [int] NOT NULL,
	[shift] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockFinreels]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockFinreels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[typeBout] [varchar](100) NOT NULL,
	[InCrates] [int] NOT NULL,
	[NotInCrates] [int] NOT NULL,
	[resteInCrates] [int] NOT NULL,
	[ResteNotInCrates] [int] NOT NULL,
	[depot] [varchar](100) NOT NULL,
	[idUser] [int] NOT NULL,
	[shift] [varchar](50) NOT NULL,
	[DateLog] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tampons]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tampons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeBout] [varchar](100) NOT NULL,
	[InCrates] [int] NOT NULL,
	[NotIncrates] [int] NOT NULL,
	[resteInCrates] [int] NOT NULL,
	[ResteNotInCrates] [int] NOT NULL,
	[typeCaisseEmpty] [varchar](100) NULL,
	[qteCaisseEmpty] [int] NOT NULL,
	[qtePalette] [int] NOT NULL,
	[depot] [varchar](100) NOT NULL,
	[idUser] [int] NOT NULL,
	[shift] [varchar](50) NOT NULL,
	[dateLog] [date] NOT NULL,
 CONSTRAINT [PK_Tampons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TamponsEmptyCrates]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TamponsEmptyCrates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](100) NOT NULL,
	[qte] [int] NOT NULL,
	[capacite] [int] NOT NULL,
	[depot] [varchar](100) NOT NULL,
	[dateLog] [date] NOT NULL,
	[idUser] [int] NOT NULL,
	[shift] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TamponsEmptyCrates] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TamponsPals]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TamponsPals](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[qte] [int] NOT NULL,
	[depot] [varchar](100) NOT NULL,
	[dateLog] [date] NOT NULL,
	[idUser] [int] NOT NULL,
	[shift] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TamponsPals] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transfers]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transfers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[provenance] [varchar](100) NOT NULL,
	[destination] [varchar](100) NOT NULL,
	[typeBout] [varchar](100) NULL,
	[qteBout] [int] NOT NULL,
	[caisse] [varchar](100) NOT NULL,
	[qteCaisse] [int] NOT NULL,
	[palette] [int] NOT NULL,
	[dateTrans] [date] NOT NULL,
	[dateVal] [date] NOT NULL,
	[codeTR] [varchar](50) NOT NULL,
	[idSender] [int] NOT NULL,
	[depot] [varchar](50) NOT NULL,
	[shift] [varchar](50) NOT NULL,
	[idReceiver] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transfert_dep]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transfert_dep](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_depot_source] [int] NOT NULL,
	[id_depot_dest] [int] NOT NULL,
	[quantite_palette] [int] NULL,
	[id_chauffeur] [int] NULL,
	[id_vehicule] [int] NULL,
	[id_superviseur] [int] NOT NULL,
	[id_data_clock] [int] NOT NULL,
	[date_transfert] [datetime] NOT NULL,
	[process] [int] NULL,
	[num_transfert] [varchar](50) NOT NULL,
	[id_superviseur_recu] [int] NOT NULL,
 CONSTRAINT [PK_Transfert_dep] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transfert_Produit]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transfert_Produit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[id_transfert] [int] NOT NULL,
	[qtite_caisse] [int] NOT NULL,
	[qtite_bout] [int] NOT NULL,
	[id_produit] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transits]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[provenance] [varchar](100) NOT NULL,
	[destination] [varchar](100) NOT NULL,
	[typeBout] [varchar](100) NULL,
	[qteBout] [int] NOT NULL,
	[caisse] [varchar](100) NOT NULL,
	[qteCaisse] [int] NOT NULL,
	[palette] [int] NOT NULL,
	[dateTrans] [date] NOT NULL,
	[codeTR] [varchar](50) NOT NULL,
	[perC] [int] NOT NULL,
	[etat] [varchar](150) NOT NULL,
	[idSender] [int] NOT NULL,
	[shift] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Unloading]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unloading](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[id_loading] [int] NOT NULL,
	[qtite_palette_retr] [int] NOT NULL,
	[time_unloading_debut] [datetime] NOT NULL,
	[time_unloading_fin] [datetime] NOT NULL,
	[remarque] [text] NULL,
	[qtite_casse] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Utilisateurs]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Utilisateurs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NOT NULL,
	[prenom] [varchar](50) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[adresse] [varchar](50) NOT NULL,
	[fonction] [varchar](50) NOT NULL,
	[shift] [varchar](50) NULL,
	[depot] [varchar](50) NULL,
 CONSTRAINT [PK_Utilisateurs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vehicules]    Script Date: 1/27/2016 11:03:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vehicules](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[plaque] [varchar](50) NOT NULL,
	[model] [varchar](50) NULL,
	[marque] [varchar](50) NULL,
	[annee] [int] NULL,
	[capacite] [int] NOT NULL,
	[numero] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Vehicules] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201512261643480_InitialCreate', N'BRANA_FinishGood.Models.BddContext', 0x1F8B0800000000000400CD58C96E233710BD07C83F34FA94001ED1CB25315A3390656B6064641B6ECF5C0DAA599288B0C90EC936A46F9B433E29BF9062EF8BF631824017A958F56A61D5EB6AFDF3FDEFE0D32A16DE1B68C3951CFA178373DF031929C6E562E8A776FEE137FFD3C79F7F0AEE58BCF2BE957A574E0F2DA519FA4B6B936B424CB484989A41CC23AD8C9ADB41A46242992297E7E7BF938B0B0208E12396E705CFA9B43C86EC07FE1C2B194162532AA68A8130851C4FC20CD57BA03198844630F46F9E470FA3D70997DC2C3F2BC506B989EF8D04A7184E0862EE7B544A65A9C560AFBF1A08AD5672112628A0E2659D00EACDA9305024715DAB1F9ACFF9A5CB87D4862554941AABE223012FAE8A0291AEF94965F6AB026209EFB0D476EDB2CECA38F49FB46229B7BED7F5753D16DAE96D2DF2A0303DF3BA0A67556F600BB9CF99374E854D350C25A4565371E63DA533C1A33F60FDA2FE043994A910CD4031543C6B0950841E13D076FD0CF3227CCE7C8FB4ED48D7B0326BD8E499DD4B7B75E97B0FE89CCE04547DD0A842689586CF2041530BEC895A0B1AAFF19E4156C99EF78E2FA9E2D219F61DCE91EF4DE9EA0BC8855D0E7DFCEA7B13BE02564A8A00BE4A8E63874656A7B0CF0767AF10CF28E6B0807D99ED458A30CD85D2FCC79152CB05370897EA1FC36288F19A60B39530B7287841C6D8831490BADBFB3380346329C77B2DBCDC30E644B0DA340B481BC53898E24EDA11E79021D8F6542111D521E46C34A8066E53A8555035E9919CF54A76245BE83198D224C1FE6AD06521F1C29C2BC71FC2E3F923CE31486436D048156DE50987059BB0738AAE31D209D7C6E2CDD11975173566714FAD71055BCA5B3AEA54B9CB1375D14B03F7BDB8E7DD6CD6C5AAEB38C1D4629CFA2C4BA842AA29B467993DB2A8A07A03018D954863B98DC476596794D234CF0487DBB7E9A21D47F3E428C4066D74101B274721B6E8A383D93A3B1CB541244DC086B88F1590CEF5777B8DF49AADF338EA36EFAEB1EFAA54DEABF1EF8C79508CDCFE55A93783B98AEF6191DE3873F317AE8D8578E01406E15F622C38E65B2B4CA9E47330367F62FBB8A85C7616ADFFCFD2438C61E2B0CDE73FDF3AB82BEADEBDE2C8876463D1906F54474BAA7F89E9EAD726D0A9CB4416F03BAC1227E26C58244E41EAAD114E60DF7B8DE83FEA0EDA14762D0AF9A062BC3385A1E771D60BC6896B449F3702D27C110B6EC1F0450DE15ECB24446E206BD052E75ECE55596D4CAD1951A9D2B98C29588AF5A7236DF99C46168F2330265B90BF5191A2CA5D3C03762F1F539BA476640CB6A568EDDB01D9ED3FDB95DA31078F89FB65DE23050C93BB167A94372917AC8A7BB2A185B640B866293800A3C217043731EB0AE941C903818AF2DD4202D231C80BC4894030F32843FA06A7C4862BEF1758D0685DD2FF7690FD17D12E7B70CBE942D3D81418B5BDFB7381B87F173EFE0B09F4E7428F100000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Casse] ON 

INSERT [dbo].[Casse] ([Id], [id_produit], [id_depot], [qtite_casse], [motif], [id_superviseur], [date_casse], [type], [qtite_bout], [qtite_shortfill], [qtite_perte], [qtite_prod_man]) VALUES (1027, 1, 1, 0, N'en etat d''ivress', 1, CAST(0x0000A59300F255E4 AS DateTime), N'Perte', 12, 0, 12, 0)
INSERT [dbo].[Casse] ([Id], [id_produit], [id_depot], [qtite_casse], [motif], [id_superviseur], [date_casse], [type], [qtite_bout], [qtite_shortfill], [qtite_perte], [qtite_prod_man]) VALUES (1028, 3, 1, 0, N'en etat d''ivress', 1, CAST(0x0000A59300F255E4 AS DateTime), N'Perte', 2, 0, 89, 0)
INSERT [dbo].[Casse] ([Id], [id_produit], [id_depot], [qtite_casse], [motif], [id_superviseur], [date_casse], [type], [qtite_bout], [qtite_shortfill], [qtite_perte], [qtite_prod_man]) VALUES (1029, 1, 1, 0, N'manque de controle', 1, CAST(0x0000A59300F28BCC AS DateTime), N'Perte', 3, 0, 23, 0)
INSERT [dbo].[Casse] ([Id], [id_produit], [id_depot], [qtite_casse], [motif], [id_superviseur], [date_casse], [type], [qtite_bout], [qtite_shortfill], [qtite_perte], [qtite_prod_man]) VALUES (1030, 3, 1, 0, N'manque de controle', 1, CAST(0x0000A59300F28BCC AS DateTime), N'Perte', 4, 0, 34, 0)
INSERT [dbo].[Casse] ([Id], [id_produit], [id_depot], [qtite_casse], [motif], [id_superviseur], [date_casse], [type], [qtite_bout], [qtite_shortfill], [qtite_perte], [qtite_prod_man]) VALUES (1032, 1, 1, 54, N'kfikdj', 1, CAST(0x0000A59300F2DF00 AS DateTime), N'Casse', 5, 0, 0, 0)
INSERT [dbo].[Casse] ([Id], [id_produit], [id_depot], [qtite_casse], [motif], [id_superviseur], [date_casse], [type], [qtite_bout], [qtite_shortfill], [qtite_perte], [qtite_prod_man]) VALUES (1033, 3, 1, 43, N'kfikdj', 1, CAST(0x0000A59300F28BCC AS DateTime), N'Casse', 4, 0, 0, 0)
INSERT [dbo].[Casse] ([Id], [id_produit], [id_depot], [qtite_casse], [motif], [id_superviseur], [date_casse], [type], [qtite_bout], [qtite_shortfill], [qtite_perte], [qtite_prod_man]) VALUES (1034, 1, 1, 0, N'tet chcaje', 1, CAST(0x0000A59300F28BCC AS DateTime), N'Short fill', 3, 13, 0, 0)
INSERT [dbo].[Casse] ([Id], [id_produit], [id_depot], [qtite_casse], [motif], [id_superviseur], [date_casse], [type], [qtite_bout], [qtite_shortfill], [qtite_perte], [qtite_prod_man]) VALUES (1035, 3, 1, 0, N'tet chcaje', 1, CAST(0x0000A59300F28BCC AS DateTime), N'Short fill', 10, 54, 0, 0)
INSERT [dbo].[Casse] ([Id], [id_produit], [id_depot], [qtite_casse], [motif], [id_superviseur], [date_casse], [type], [qtite_bout], [qtite_shortfill], [qtite_perte], [qtite_prod_man]) VALUES (1036, 1, 1, 34, N'fffffffffffffffff', 1002, CAST(0x0000A59600A4CFCF AS DateTime), N'Casse', 4, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Casse] OFF
SET IDENTITY_INSERT [dbo].[Categorie] ON 

INSERT [dbo].[Categorie] ([id], [nom], [type_fabrication]) VALUES (1, N'Prestige', NULL)
INSERT [dbo].[Categorie] ([id], [nom], [type_fabrication]) VALUES (2, N'Kinanm', NULL)
INSERT [dbo].[Categorie] ([id], [nom], [type_fabrication]) VALUES (3, N'Guiness', NULL)
INSERT [dbo].[Categorie] ([id], [nom], [type_fabrication]) VALUES (6, N'Malta', NULL)
INSERT [dbo].[Categorie] ([id], [nom], [type_fabrication]) VALUES (7, N'Carbonated Drink', NULL)
INSERT [dbo].[Categorie] ([id], [nom], [type_fabrication]) VALUES (8, N'Energy Drink', NULL)
INSERT [dbo].[Categorie] ([id], [nom], [type_fabrication]) VALUES (9, N'Heineken', NULL)
INSERT [dbo].[Categorie] ([id], [nom], [type_fabrication]) VALUES (10, N'Mineralized Water', NULL)
INSERT [dbo].[Categorie] ([id], [nom], [type_fabrication]) VALUES (11, N'Desperado', NULL)
SET IDENTITY_INSERT [dbo].[Categorie] OFF
SET IDENTITY_INSERT [dbo].[Chauffeurs] ON 

INSERT [dbo].[Chauffeurs] ([id], [prenom], [nom], [mail], [phone], [photo], [adresse], [aide1], [aide2], [noPermis], [dateEmission], [dateExpire]) VALUES (1, N'Morantus ', N'Hensso', N'jean@toto.com', N'46895875', NULL, N'nazon', NULL, NULL, N'KK-72991-TB', CAST(0xD53A0B00 AS Date), CAST(0x92410B00 AS Date))
INSERT [dbo].[Chauffeurs] ([id], [prenom], [nom], [mail], [phone], [photo], [adresse], [aide1], [aide2], [noPermis], [dateEmission], [dateExpire]) VALUES (2, N'Bertholin ', N'Joly', N'katalaya@gmail.com', N'47625258', NULL, N'cite soleil', N'kiko', N'ti mamoun', N'KK-72891-TB', CAST(0x473A0B00 AS Date), CAST(0x943C0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Chauffeurs] OFF
SET IDENTITY_INSERT [dbo].[Debut_inventaire] ON 

INSERT [dbo].[Debut_inventaire] ([Id], [qtite_bouteille], [date_debut_inventaire], [id_produit], [qtite_trouvee], [id_superviseur], [id_depot_fg], [caisse_theor], [bout_theor]) VALUES (1, 1, CAST(0x0000A59300000000 AS DateTime), 1, 270, 2, 1, 0, 0)
INSERT [dbo].[Debut_inventaire] ([Id], [qtite_bouteille], [date_debut_inventaire], [id_produit], [qtite_trouvee], [id_superviseur], [id_depot_fg], [caisse_theor], [bout_theor]) VALUES (1024, 1003, CAST(0x0000A59300000000 AS DateTime), 4, 1112, 1002, 4, 0, 0)
INSERT [dbo].[Debut_inventaire] ([Id], [qtite_bouteille], [date_debut_inventaire], [id_produit], [qtite_trouvee], [id_superviseur], [id_depot_fg], [caisse_theor], [bout_theor]) VALUES (1026, 1, CAST(0x0000A5930116C604 AS DateTime), 8, 67, 1004, 3, 0, 0)
INSERT [dbo].[Debut_inventaire] ([Id], [qtite_bouteille], [date_debut_inventaire], [id_produit], [qtite_trouvee], [id_superviseur], [id_depot_fg], [caisse_theor], [bout_theor]) VALUES (1027, 1004, CAST(0x0000A59500C85A0A AS DateTime), 1, 45, 2, 1, 0, 0)
INSERT [dbo].[Debut_inventaire] ([Id], [qtite_bouteille], [date_debut_inventaire], [id_produit], [qtite_trouvee], [id_superviseur], [id_depot_fg], [caisse_theor], [bout_theor]) VALUES (1040, 2434, CAST(0x0000A59500C85974 AS DateTime), 4, 546, 1004, 3, 0, 0)
INSERT [dbo].[Debut_inventaire] ([Id], [qtite_bouteille], [date_debut_inventaire], [id_produit], [qtite_trouvee], [id_superviseur], [id_depot_fg], [caisse_theor], [bout_theor]) VALUES (1054, 12, CAST(0x0000A59800F200FF AS DateTime), 1, 224, 1002, 1, 0, 0)
INSERT [dbo].[Debut_inventaire] ([Id], [qtite_bouteille], [date_debut_inventaire], [id_produit], [qtite_trouvee], [id_superviseur], [id_depot_fg], [caisse_theor], [bout_theor]) VALUES (1055, 18, CAST(0x0000A59800F200FF AS DateTime), 3, 562, 1002, 1, 0, 0)
INSERT [dbo].[Debut_inventaire] ([Id], [qtite_bouteille], [date_debut_inventaire], [id_produit], [qtite_trouvee], [id_superviseur], [id_depot_fg], [caisse_theor], [bout_theor]) VALUES (1056, 0, CAST(0x0000A59800F200FF AS DateTime), 5, 183, 1002, 1, 0, 0)
INSERT [dbo].[Debut_inventaire] ([Id], [qtite_bouteille], [date_debut_inventaire], [id_produit], [qtite_trouvee], [id_superviseur], [id_depot_fg], [caisse_theor], [bout_theor]) VALUES (1057, 5, CAST(0x0000A59800F200FF AS DateTime), 8, 24, 1002, 1, 0, 0)
INSERT [dbo].[Debut_inventaire] ([Id], [qtite_bouteille], [date_debut_inventaire], [id_produit], [qtite_trouvee], [id_superviseur], [id_depot_fg], [caisse_theor], [bout_theor]) VALUES (1058, 4, CAST(0x0000A59800F200FF AS DateTime), 11, 72, 1002, 1, 0, 0)
INSERT [dbo].[Debut_inventaire] ([Id], [qtite_bouteille], [date_debut_inventaire], [id_produit], [qtite_trouvee], [id_superviseur], [id_depot_fg], [caisse_theor], [bout_theor]) VALUES (1059, 23, CAST(0x0000A59900575DAC AS DateTime), 1, 356, 2, 1, 0, 0)
INSERT [dbo].[Debut_inventaire] ([Id], [qtite_bouteille], [date_debut_inventaire], [id_produit], [qtite_trouvee], [id_superviseur], [id_depot_fg], [caisse_theor], [bout_theor]) VALUES (1060, 20, CAST(0x0000A59900575DAC AS DateTime), 3, 150, 2, 1, 0, 0)
INSERT [dbo].[Debut_inventaire] ([Id], [qtite_bouteille], [date_debut_inventaire], [id_produit], [qtite_trouvee], [id_superviseur], [id_depot_fg], [caisse_theor], [bout_theor]) VALUES (1061, 6, CAST(0x0000A59900575DAC AS DateTime), 7, 420, 2, 1, 0, 0)
INSERT [dbo].[Debut_inventaire] ([Id], [qtite_bouteille], [date_debut_inventaire], [id_produit], [qtite_trouvee], [id_superviseur], [id_depot_fg], [caisse_theor], [bout_theor]) VALUES (1062, 0, CAST(0x0000A59900575DAC AS DateTime), 11, 40, 2, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[Debut_inventaire] OFF
SET IDENTITY_INSERT [dbo].[Depot_FG] ON 

INSERT [dbo].[Depot_FG] ([id], [nom], [adresse], [dateCreation]) VALUES (1, N'depot1', N'route de l''aeroport', CAST(0x0000A56C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Depot_FG] OFF
SET IDENTITY_INSERT [dbo].[Depot_Produit] ON 

INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (11, 1, 1, 35, 10)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (12, 1, 2, 10, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (13, 1, 3, 46, 20)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (14, 1, 4, 85, 33)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (15, 1, 5, 34, 12)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (16, 1, 6, 25, 3)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (17, 1, 7, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (18, 1, 8, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (19, 1, 9, 33, 3)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (20, 1, 10, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (21, 1, 11, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (22, 1, 12, 12, 3)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (23, 1, 13, 87, 18)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (24, 1, 14, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (25, 1, 15, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (26, 1, 16, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (27, 1, 17, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (28, 1, 18, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (29, 1, 19, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (30, 1, 20, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (31, 1, 21, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (32, 1, 22, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (33, 2, 1, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (34, 2, 2, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (35, 2, 3, 23, 6)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (36, 2, 4, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (37, 2, 5, 50, 13)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (38, 2, 6, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (39, 2, 7, 80, 12)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (40, 2, 8, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (41, 2, 9, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (42, 2, 10, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (43, 2, 11, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (44, 2, 12, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (45, 2, 13, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (46, 2, 14, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (47, 2, 15, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (48, 2, 16, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (49, 2, 17, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (50, 2, 18, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (51, 2, 19, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (52, 2, 20, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (53, 2, 21, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (54, 2, 22, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (55, 3, 1, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (56, 3, 2, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (57, 3, 3, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (58, 3, 4, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (59, 3, 5, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (60, 3, 6, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (61, 3, 7, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (62, 3, 8, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (63, 3, 9, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (64, 3, 10, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (65, 3, 11, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (66, 3, 12, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (67, 3, 13, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (68, 3, 14, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (69, 3, 15, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (70, 3, 16, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (71, 3, 17, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (72, 3, 18, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (73, 3, 19, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (74, 3, 20, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (75, 3, 21, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (76, 3, 22, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (77, 1, 23, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (78, 2, 23, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (79, 3, 23, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (80, 1, 24, 13, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (81, 2, 24, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (82, 3, 24, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (83, 4, 1, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (84, 4, 2, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (85, 4, 3, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (86, 4, 4, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (87, 4, 5, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (88, 4, 6, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (89, 4, 7, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (90, 4, 8, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (91, 4, 9, 52, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (92, 4, 10, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (93, 4, 11, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (94, 4, 12, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (95, 4, 13, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (96, 4, 14, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (97, 4, 15, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (98, 4, 16, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (99, 4, 17, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (100, 4, 18, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (101, 4, 19, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (102, 4, 20, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (103, 4, 21, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (104, 4, 22, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (105, 4, 23, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (106, 4, 24, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (107, 5, 1, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (108, 5, 2, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (109, 5, 3, 0, 0)
GO
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (110, 5, 4, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (111, 5, 5, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (112, 5, 6, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (113, 5, 7, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (114, 5, 8, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (115, 5, 9, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (116, 5, 10, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (117, 5, 11, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (118, 5, 12, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (119, 5, 13, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (120, 5, 14, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (121, 5, 15, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (122, 5, 16, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (123, 5, 17, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (124, 5, 18, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (125, 5, 19, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (126, 5, 20, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (127, 5, 21, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (128, 5, 22, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (129, 5, 23, 0, 0)
INSERT [dbo].[Depot_Produit] ([Id], [id_depot], [id_produit], [qtite_produit_dispo], [qtite_bouteille]) VALUES (130, 5, 24, 29, 0)
SET IDENTITY_INSERT [dbo].[Depot_Produit] OFF
SET IDENTITY_INSERT [dbo].[Depots] ON 

INSERT [dbo].[Depots] ([id], [nom], [adresse], [dateCreation], [typeDepot]) VALUES (1, N'Depot1', N'Tabarre 42', CAST(0x0000A57700000000 AS DateTime), N'FinishGood')
INSERT [dbo].[Depots] ([id], [nom], [adresse], [dateCreation], [typeDepot]) VALUES (2, N'Depot2', N'rue lamarre', CAST(0x0000A56C00000000 AS DateTime), N'FinishGood')
INSERT [dbo].[Depots] ([id], [nom], [adresse], [dateCreation], [typeDepot]) VALUES (3, N'Depot3', N'Trois mains', CAST(0x0000A58A00A952B6 AS DateTime), N'FinishGood')
INSERT [dbo].[Depots] ([id], [nom], [adresse], [dateCreation], [typeDepot]) VALUES (4, N'Depot4', N'Rue Magloire ', CAST(0x0000A58E00C6D543 AS DateTime), N'FinishGood')
INSERT [dbo].[Depots] ([id], [nom], [adresse], [dateCreation], [typeDepot]) VALUES (5, N'Depot5', N'nazon', CAST(0x0000A5930101CC82 AS DateTime), N'FinishGood')
SET IDENTITY_INSERT [dbo].[Depots] OFF
SET IDENTITY_INSERT [dbo].[Emballage] ON 

INSERT [dbo].[Emballage] ([id], [nom], [volume], [qte_par_caisse], [id_utilisateur], [date_emb]) VALUES (21, N'PET 330', CAST(330.0000 AS Decimal(10, 4)), 24, 1003, CAST(0x0000A56C00C5C100 AS DateTime))
INSERT [dbo].[Emballage] ([id], [nom], [volume], [qte_par_caisse], [id_utilisateur], [date_emb]) VALUES (22, N'PET 250', CAST(250.0000 AS Decimal(10, 4)), 24, 1003, CAST(0x0000A58700912E13 AS DateTime))
INSERT [dbo].[Emballage] ([id], [nom], [volume], [qte_par_caisse], [id_utilisateur], [date_emb]) VALUES (23, N'PET 591', CAST(591.0000 AS Decimal(10, 4)), 24, 1003, CAST(0x0000A58700913E32 AS DateTime))
INSERT [dbo].[Emballage] ([id], [nom], [volume], [qte_par_caisse], [id_utilisateur], [date_emb]) VALUES (24, N'PET 500', CAST(500.0000 AS Decimal(10, 4)), 24, 1003, CAST(0x0000A58700915EC6 AS DateTime))
INSERT [dbo].[Emballage] ([id], [nom], [volume], [qte_par_caisse], [id_utilisateur], [date_emb]) VALUES (25, N'PET 1500', CAST(1500.0000 AS Decimal(10, 4)), 6, 1003, CAST(0x0000A58700917DB4 AS DateTime))
INSERT [dbo].[Emballage] ([id], [nom], [volume], [qte_par_caisse], [id_utilisateur], [date_emb]) VALUES (26, N'RGB 341', CAST(341.0000 AS Decimal(10, 4)), 24, 1003, CAST(0x0000A5870091D36D AS DateTime))
INSERT [dbo].[Emballage] ([id], [nom], [volume], [qte_par_caisse], [id_utilisateur], [date_emb]) VALUES (27, N'RGB 355', CAST(355.0000 AS Decimal(10, 4)), 24, 1003, CAST(0x0000A5870091EEB8 AS DateTime))
INSERT [dbo].[Emballage] ([id], [nom], [volume], [qte_par_caisse], [id_utilisateur], [date_emb]) VALUES (28, N'RGB 500', CAST(500.0000 AS Decimal(10, 4)), 20, 1003, CAST(0x0000A58700920375 AS DateTime))
INSERT [dbo].[Emballage] ([id], [nom], [volume], [qte_par_caisse], [id_utilisateur], [date_emb]) VALUES (29, N'RGB 330', CAST(330.0000 AS Decimal(10, 4)), 24, 1003, CAST(0x0000A58700921E83 AS DateTime))
INSERT [dbo].[Emballage] ([id], [nom], [volume], [qte_par_caisse], [id_utilisateur], [date_emb]) VALUES (30, N'SD 500', CAST(500.0000 AS Decimal(10, 4)), 24, 1003, CAST(0x0000A587009272CA AS DateTime))
INSERT [dbo].[Emballage] ([id], [nom], [volume], [qte_par_caisse], [id_utilisateur], [date_emb]) VALUES (31, N'CAN 355', CAST(355.0000 AS Decimal(10, 4)), 24, 1003, CAST(0x0000A5870092991D AS DateTime))
INSERT [dbo].[Emballage] ([id], [nom], [volume], [qte_par_caisse], [id_utilisateur], [date_emb]) VALUES (32, N'CAN 330', CAST(330.0000 AS Decimal(10, 4)), 24, 1003, CAST(0x0000A5870092ADDF AS DateTime))
SET IDENTITY_INSERT [dbo].[Emballage] OFF
SET IDENTITY_INSERT [dbo].[Fin_Inventaire] ON 

INSERT [dbo].[Fin_Inventaire] ([Id], [id_superviseur], [date_fin_inventaire], [id_produit], [qtite_laissee], [id_depot_fg]) VALUES (2, 1002, CAST(0x0000A59600A9F02B AS DateTime), 1, 12, 1)
SET IDENTITY_INSERT [dbo].[Fin_Inventaire] OFF
SET IDENTITY_INSERT [dbo].[laboratoire_echantillon] ON 

INSERT [dbo].[laboratoire_echantillon] ([Id], [nom_recepteur], [qtite_donnee], [id_produit], [id_superviseur], [qtite_retour], [id_depot], [date_donnee]) VALUES (2, N'lka', 120, 1, 1, 120, 1, CAST(0x0000A6DA00C5C100 AS DateTime))
INSERT [dbo].[laboratoire_echantillon] ([Id], [nom_recepteur], [qtite_donnee], [id_produit], [id_superviseur], [qtite_retour], [id_depot], [date_donnee]) VALUES (3, N'lolo', 103, 2, 1, 101, 1, CAST(0x00009E4A00C5C100 AS DateTime))
INSERT [dbo].[laboratoire_echantillon] ([Id], [nom_recepteur], [qtite_donnee], [id_produit], [id_superviseur], [qtite_retour], [id_depot], [date_donnee]) VALUES (4, N'kiko', 123, 1, 2, 124, 1, CAST(0x00009E4A00C5C100 AS DateTime))
INSERT [dbo].[laboratoire_echantillon] ([Id], [nom_recepteur], [qtite_donnee], [id_produit], [id_superviseur], [qtite_retour], [id_depot], [date_donnee]) VALUES (5, N'lolao', 120, 1, 1, 14, 2, CAST(0x0000A58300960EA6 AS DateTime))
INSERT [dbo].[laboratoire_echantillon] ([Id], [nom_recepteur], [qtite_donnee], [id_produit], [id_superviseur], [qtite_retour], [id_depot], [date_donnee]) VALUES (6, N'kdiaiei', 1230, 1, 2, 1208, 1, CAST(0x0000A583009AAC69 AS DateTime))
INSERT [dbo].[laboratoire_echantillon] ([Id], [nom_recepteur], [qtite_donnee], [id_produit], [id_superviseur], [qtite_retour], [id_depot], [date_donnee]) VALUES (1002, N'lll', 120, 2, 1002, 102, 2, CAST(0x0000A584008D2C71 AS DateTime))
INSERT [dbo].[laboratoire_echantillon] ([Id], [nom_recepteur], [qtite_donnee], [id_produit], [id_superviseur], [qtite_retour], [id_depot], [date_donnee]) VALUES (1003, N'lkkkk', 102, 1, 1, 102, 2, CAST(0x0000A584008D8240 AS DateTime))
INSERT [dbo].[laboratoire_echantillon] ([Id], [nom_recepteur], [qtite_donnee], [id_produit], [id_superviseur], [qtite_retour], [id_depot], [date_donnee]) VALUES (1004, N'lmjij', 102, 2, 2, 100, 1, CAST(0x0000A58400915DBA AS DateTime))
INSERT [dbo].[laboratoire_echantillon] ([Id], [nom_recepteur], [qtite_donnee], [id_produit], [id_superviseur], [qtite_retour], [id_depot], [date_donnee]) VALUES (1006, N'Pierre Mario', 5, 1, 1, 0, 1, CAST(0x0000A58C00FD3E3B AS DateTime))
INSERT [dbo].[laboratoire_echantillon] ([Id], [nom_recepteur], [qtite_donnee], [id_produit], [id_superviseur], [qtite_retour], [id_depot], [date_donnee]) VALUES (1011, N'rwrwr', 32, 1, 1, 0, 1, CAST(0x0000A58E008D2DD7 AS DateTime))
INSERT [dbo].[laboratoire_echantillon] ([Id], [nom_recepteur], [qtite_donnee], [id_produit], [id_superviseur], [qtite_retour], [id_depot], [date_donnee]) VALUES (1013, N'ok', 76, 1, 1, 0, 1, CAST(0x0000A58E008F2AC4 AS DateTime))
INSERT [dbo].[laboratoire_echantillon] ([Id], [nom_recepteur], [qtite_donnee], [id_produit], [id_superviseur], [qtite_retour], [id_depot], [date_donnee]) VALUES (1014, N'rerrrrrrrr', 32, 1, 1002, 0, 1, CAST(0x0000A59600AD4E9F AS DateTime))
INSERT [dbo].[laboratoire_echantillon] ([Id], [nom_recepteur], [qtite_donnee], [id_produit], [id_superviseur], [qtite_retour], [id_depot], [date_donnee]) VALUES (1015, N'lf', 34, 1, 1002, 0, 1, CAST(0x0000A59600ADD6B8 AS DateTime))
SET IDENTITY_INSERT [dbo].[laboratoire_echantillon] OFF
SET IDENTITY_INSERT [dbo].[Ligne_depot] ON 

INSERT [dbo].[Ligne_depot] ([Id], [id_ligne_production], [id_depot], [qtite_caisse], [date_ligne_depot], [id_superviseur], [id_data_clock], [id_produit]) VALUES (5, 1, 1, 0, CAST(0x0000A6DA009450C0 AS DateTime), 1, 1003, 1)
INSERT [dbo].[Ligne_depot] ([Id], [id_ligne_production], [id_depot], [qtite_caisse], [date_ligne_depot], [id_superviseur], [id_data_clock], [id_produit]) VALUES (6, 3, 3, 1000, CAST(0x0000A6B1009450C0 AS DateTime), 2, 1003, 3)
INSERT [dbo].[Ligne_depot] ([Id], [id_ligne_production], [id_depot], [qtite_caisse], [date_ligne_depot], [id_superviseur], [id_data_clock], [id_produit]) VALUES (7, 1, 1, 23, CAST(0x0000A6DA009450C0 AS DateTime), 1, 1003, 1)
INSERT [dbo].[Ligne_depot] ([Id], [id_ligne_production], [id_depot], [qtite_caisse], [date_ligne_depot], [id_superviseur], [id_data_clock], [id_produit]) VALUES (8, 1, 1, 8, CAST(0x0000A6DA009450C0 AS DateTime), 1, 1003, 1)
INSERT [dbo].[Ligne_depot] ([Id], [id_ligne_production], [id_depot], [qtite_caisse], [date_ligne_depot], [id_superviseur], [id_data_clock], [id_produit]) VALUES (9, 1, 1, 3, CAST(0x0000A6DA009450C0 AS DateTime), 1, 1003, 1)
INSERT [dbo].[Ligne_depot] ([Id], [id_ligne_production], [id_depot], [qtite_caisse], [date_ligne_depot], [id_superviseur], [id_data_clock], [id_produit]) VALUES (10, 1, 1, 100, CAST(0x0000A6CF009450C0 AS DateTime), 1, 1003, 1)
INSERT [dbo].[Ligne_depot] ([Id], [id_ligne_production], [id_depot], [qtite_caisse], [date_ligne_depot], [id_superviseur], [id_data_clock], [id_produit]) VALUES (11, 1, 1, 20, CAST(0x0000A6CF009450C0 AS DateTime), 1, 1003, 1)
INSERT [dbo].[Ligne_depot] ([Id], [id_ligne_production], [id_depot], [qtite_caisse], [date_ligne_depot], [id_superviseur], [id_data_clock], [id_produit]) VALUES (12, 1, 1, 100, CAST(0x0000A6DA009450C0 AS DateTime), 1, 1003, 1)
INSERT [dbo].[Ligne_depot] ([Id], [id_ligne_production], [id_depot], [qtite_caisse], [date_ligne_depot], [id_superviseur], [id_data_clock], [id_produit]) VALUES (13, 1, 1, 90, CAST(0x0000A6DA009450C0 AS DateTime), 1, 1003, 1)
INSERT [dbo].[Ligne_depot] ([Id], [id_ligne_production], [id_depot], [qtite_caisse], [date_ligne_depot], [id_superviseur], [id_data_clock], [id_produit]) VALUES (14, 1, 1, 90, CAST(0x0000A6B1009450C0 AS DateTime), 1, 1003, 1)
INSERT [dbo].[Ligne_depot] ([Id], [id_ligne_production], [id_depot], [qtite_caisse], [date_ligne_depot], [id_superviseur], [id_data_clock], [id_produit]) VALUES (15, 1, 1, 190, CAST(0x0000A6DA009450C0 AS DateTime), 1, 1003, 1)
INSERT [dbo].[Ligne_depot] ([Id], [id_ligne_production], [id_depot], [qtite_caisse], [date_ligne_depot], [id_superviseur], [id_data_clock], [id_produit]) VALUES (16, 1, 1, 13, CAST(0x0000A6CF009450C0 AS DateTime), 1, 1003, 24)
INSERT [dbo].[Ligne_depot] ([Id], [id_ligne_production], [id_depot], [qtite_caisse], [date_ligne_depot], [id_superviseur], [id_data_clock], [id_produit]) VALUES (17, 1, 1, 200, CAST(0x0000A6DA009450C0 AS DateTime), 1, 1003, 3)
SET IDENTITY_INSERT [dbo].[Ligne_depot] OFF
SET IDENTITY_INSERT [dbo].[Ligne_production] ON 

INSERT [dbo].[Ligne_production] ([id], [nom], [id_utilisateur], [date_ligne_prod]) VALUES (1, N'L1', 1003, CAST(0x0000A56C00000000 AS DateTime))
INSERT [dbo].[Ligne_production] ([id], [nom], [id_utilisateur], [date_ligne_prod]) VALUES (2, N'L2', 1003, CAST(0x0000A58100000000 AS DateTime))
INSERT [dbo].[Ligne_production] ([id], [nom], [id_utilisateur], [date_ligne_prod]) VALUES (3, N'L3', 1003, CAST(0x0000A5830098280C AS DateTime))
INSERT [dbo].[Ligne_production] ([id], [nom], [id_utilisateur], [date_ligne_prod]) VALUES (1003, N'L4', 1003, CAST(0x0000A58700933044 AS DateTime))
INSERT [dbo].[Ligne_production] ([id], [nom], [id_utilisateur], [date_ligne_prod]) VALUES (1004, N'L5', 1003, CAST(0x0000A587009338D5 AS DateTime))
INSERT [dbo].[Ligne_production] ([id], [nom], [id_utilisateur], [date_ligne_prod]) VALUES (1005, N'L6', 1003, CAST(0x0000A5870093448B AS DateTime))
SET IDENTITY_INSERT [dbo].[Ligne_production] OFF
SET IDENTITY_INSERT [dbo].[Loading] ON 

INSERT [dbo].[Loading] ([id], [date_loading], [heure_debut], [heure_fin], [id_chauffeur], [id_depot], [client], [id_vehicule], [numero_sp], [numero_emb], [nbre_palette], [type_emb], [retour], [id_superviseur], [id_data_clock], [remarque], [destination]) VALUES (1057, CAST(0xEE3A0B00 AS Date), CAST(0x0000A593009450C0 AS DateTime), CAST(0x0000A5930099CF00 AS DateTime), 1, 4, N'Chez Jean', 1, N'SP00243083', N'087662', 3, N'Regulier', 0, 2, 1003, N'Aucun', N'Gonaive')
INSERT [dbo].[Loading] ([id], [date_loading], [heure_debut], [heure_fin], [id_chauffeur], [id_depot], [client], [id_vehicule], [numero_sp], [numero_emb], [nbre_palette], [type_emb], [retour], [id_superviseur], [id_data_clock], [remarque], [destination]) VALUES (1061, CAST(0xF33A0B00 AS Date), CAST(0x0000A42B009450C0 AS DateTime), CAST(0x0000A42B00970FE0 AS DateTime), 2, 1, N'St baptisme depot', 1, N'sp43244534', N'345764', 8, N'Exclusif', 0, 1002, 1003, N'Tout est ok', N'Saint-Marc')
INSERT [dbo].[Loading] ([id], [date_loading], [heure_debut], [heure_fin], [id_chauffeur], [id_depot], [client], [id_vehicule], [numero_sp], [numero_emb], [nbre_palette], [type_emb], [retour], [id_superviseur], [id_data_clock], [remarque], [destination]) VALUES (1062, CAST(0xF43A0B00 AS Date), CAST(0x0000A56C009450C0 AS DateTime), CAST(0x0000A56C0099CF00 AS DateTime), 1, 2, N'lfof', 1, N'sp85285285', N'123582', 12, N'Exclusif', 0, 1, 1003, N'kifkfi', N'lolo')
SET IDENTITY_INSERT [dbo].[Loading] OFF
SET IDENTITY_INSERT [dbo].[Loading_produit] ON 

INSERT [dbo].[Loading_produit] ([id], [id_produit], [qte_caisse_delivre], [qte_caisse_retourne], [qte_bout_retourne], [id_loading], [qte_bouteille_delivre]) VALUES (22, 1, 200, 124, 10, N'087662', 30)
INSERT [dbo].[Loading_produit] ([id], [id_produit], [qte_caisse_delivre], [qte_caisse_retourne], [qte_bout_retourne], [id_loading], [qte_bouteille_delivre]) VALUES (31, 1, 123, 6, 14, N'087662', 2)
INSERT [dbo].[Loading_produit] ([id], [id_produit], [qte_caisse_delivre], [qte_caisse_retourne], [qte_bout_retourne], [id_loading], [qte_bouteille_delivre]) VALUES (38, 7, 66, 66, 12, N'087663', 12)
INSERT [dbo].[Loading_produit] ([id], [id_produit], [qte_caisse_delivre], [qte_caisse_retourne], [qte_bout_retourne], [id_loading], [qte_bouteille_delivre]) VALUES (39, 9, 99, 44, 0, N'087692', 0)
INSERT [dbo].[Loading_produit] ([id], [id_produit], [qte_caisse_delivre], [qte_caisse_retourne], [qte_bout_retourne], [id_loading], [qte_bouteille_delivre]) VALUES (40, 5, 34, 0, 0, N'345764', 12)
INSERT [dbo].[Loading_produit] ([id], [id_produit], [qte_caisse_delivre], [qte_caisse_retourne], [qte_bout_retourne], [id_loading], [qte_bouteille_delivre]) VALUES (41, 9, 45, 0, 0, N'345764', 6)
INSERT [dbo].[Loading_produit] ([id], [id_produit], [qte_caisse_delivre], [qte_caisse_retourne], [qte_bout_retourne], [id_loading], [qte_bouteille_delivre]) VALUES (42, 13, 87, 0, 0, N'345764', 18)
INSERT [dbo].[Loading_produit] ([id], [id_produit], [qte_caisse_delivre], [qte_caisse_retourne], [qte_bout_retourne], [id_loading], [qte_bouteille_delivre]) VALUES (43, 3, 23, 0, 0, N'123582', 43)
SET IDENTITY_INSERT [dbo].[Loading_produit] OFF
SET IDENTITY_INSERT [dbo].[Logins] ON 

INSERT [dbo].[Logins] ([id], [mail], [password], [idUser]) VALUES (1, N'mylis@outlook.com', N'69-4E-4F-E7-9F-7A-A5-5B-E6-EF-47-B6-E2-F1-2F-12', 1)
INSERT [dbo].[Logins] ([id], [mail], [password], [idUser]) VALUES (2, N'malherbe.billy@gmail.com', N'w', 2)
INSERT [dbo].[Logins] ([id], [mail], [password], [idUser]) VALUES (1002, N'ricartho@gmail.com', N'rafa', 1003)
INSERT [dbo].[Logins] ([id], [mail], [password], [idUser]) VALUES (1003, N'sauvenel2013@gmail.com', N'vp', 1002)
INSERT [dbo].[Logins] ([id], [mail], [password], [idUser]) VALUES (1004, N'johnbob@gmail.com', N'john', 1004)
SET IDENTITY_INSERT [dbo].[Logins] OFF
SET IDENTITY_INSERT [dbo].[Palettes] ON 

INSERT [dbo].[Palettes] ([id], [qte], [depot]) VALUES (1, 12, N'Mitchel')
SET IDENTITY_INSERT [dbo].[Palettes] OFF
SET IDENTITY_INSERT [dbo].[Produits] ON 

INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (1, N'PRESTIGE-RGB-341-REG', 26, 1, 1003, CAST(0xC73A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (2, N'PRESTIGE SIX PACK RGB-341-REG', 26, 1, 1003, CAST(0xDA3A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (3, N'KINANM RGB-341-REG', 26, 2, 1003, CAST(0xE23A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (4, N'GUINESS-RGB-341-REG', 26, 3, 1003, CAST(0xE23A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (5, N'MALTA-RGB-341-REG', 26, 6, 1003, CAST(0xE23A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (6, N'PEPSI SD-500-REG', 30, 7, 1003, CAST(0xE23A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (7, N'SEVEN UP SD-500-REG', 30, 7, 1003, CAST(0xE23A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (8, N'KC BANANA SD-500-REG', 30, 7, 1003, CAST(0xE23A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (9, N'TORO SD-500-REG', 30, 8, 1003, CAST(0xE23A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (10, N'PEPSI PET-591-REG', 23, 7, 1003, CAST(0xE23A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (11, N'SOURCE CRYSTAL PET-591-REG', 23, 10, 1003, CAST(0xE23A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (12, N'HEINEKEN RGB-330-IMPORTED', 29, 9, 1003, CAST(0xE23A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (13, N'DESPERADO RGB-330-IMPORTED', 29, 11, 1003, CAST(0xE23A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (14, N'MALTA PET-330-REG', 21, 6, 1003, CAST(0xE23A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (15, N'RADDLER RGB-341-REG', 26, 8, 1003, CAST(0xE93A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (16, N'GRAPE SD-500-REG', 30, 7, 1003, CAST(0xE93A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (17, N'BON BOISSON', 21, 8, 1003, CAST(0xE93A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (18, N'BOISSON MICHAN', 31, 8, 1003, CAST(0xE93A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (19, N'KIKIKIKIKI', 21, 3, 1003, CAST(0xE93A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (20, N'BASSS', 21, 1, 1003, CAST(0xE93A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (21, N'BIGO', 25, 1, 1003, CAST(0xE93A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (22, N'GOGO', 21, 10, 1003, CAST(0xE93A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (23, N'BE COOL', 25, 1, 1003, CAST(0xE93A0B00 AS Date), NULL, NULL)
INSERT [dbo].[Produits] ([id], [nom], [id_emballage], [id_categorie], [id_utilisateur], [date_prod], [type_fabrication], [type_bout]) VALUES (24, N'KIKO', 21, 6, 1003, CAST(0xE93A0B00 AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Produits] OFF
SET IDENTITY_INSERT [dbo].[Transfert_dep] ON 

INSERT [dbo].[Transfert_dep] ([id], [id_depot_source], [id_depot_dest], [quantite_palette], [id_chauffeur], [id_vehicule], [id_superviseur], [id_data_clock], [date_transfert], [process], [num_transfert], [id_superviseur_recu]) VALUES (1, 2, 1, 26, 1, 1, 1, 1003, CAST(0x0000A59300083D60 AS DateTime), 0, N'0', 0)
SET IDENTITY_INSERT [dbo].[Transfert_dep] OFF
SET IDENTITY_INSERT [dbo].[Transfert_Produit] ON 

INSERT [dbo].[Transfert_Produit] ([Id], [id_transfert], [qtite_caisse], [qtite_bout], [id_produit]) VALUES (1, 1, 4, 4, 1)
INSERT [dbo].[Transfert_Produit] ([Id], [id_transfert], [qtite_caisse], [qtite_bout], [id_produit]) VALUES (2, 1, 20, 6, 1)
INSERT [dbo].[Transfert_Produit] ([Id], [id_transfert], [qtite_caisse], [qtite_bout], [id_produit]) VALUES (9, 1, 34, 23, 3)
SET IDENTITY_INSERT [dbo].[Transfert_Produit] OFF
SET IDENTITY_INSERT [dbo].[Unloading] ON 

INSERT [dbo].[Unloading] ([Id], [id_loading], [qtite_palette_retr], [time_unloading_debut], [time_unloading_fin], [remarque], [qtite_casse]) VALUES (33, 1057, 3, CAST(0x0000A59300C5C100 AS DateTime), CAST(0x0000A59300C88020 AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Unloading] OFF
SET IDENTITY_INSERT [dbo].[Utilisateurs] ON 

INSERT [dbo].[Utilisateurs] ([id], [nom], [prenom], [mail], [phone], [adresse], [fonction], [shift], [depot]) VALUES (1, N'Mylis', N'Mitchel', N'mylis@outlook.com', N'37759691', N'Cayes', N'ADMIN', N'Soir', N'Depot2')
INSERT [dbo].[Utilisateurs] ([id], [nom], [prenom], [mail], [phone], [adresse], [fonction], [shift], [depot]) VALUES (2, N'Malherbe', N'Billy', N'malherbe.billy@gmail.com', N'47519725', N'nazon', N'super_FG', N'Matin', N'Depot1')
INSERT [dbo].[Utilisateurs] ([id], [nom], [prenom], [mail], [phone], [adresse], [fonction], [shift], [depot]) VALUES (1002, N'Jean Sauvenel', N'Beaudry', N'sauvenel2013@gmail.com', N'38195414', N'Canape vert ', N'super_FG', N'Median', N'Depot1')
INSERT [dbo].[Utilisateurs] ([id], [nom], [prenom], [mail], [phone], [adresse], [fonction], [shift], [depot]) VALUES (1003, N'Franck', N'Ricartho', N'ricartho@gmail.com', N'32285869', N'Carrefour', N'admin_FG', N'Median', NULL)
INSERT [dbo].[Utilisateurs] ([id], [nom], [prenom], [mail], [phone], [adresse], [fonction], [shift], [depot]) VALUES (1004, N'John', N'Bob', N'johnbob@gmail.com', N'45892587', N'Impasse Inconnue', N'super_FG', N'Soir', N'Depot1')
SET IDENTITY_INSERT [dbo].[Utilisateurs] OFF
SET IDENTITY_INSERT [dbo].[Vehicules] ON 

INSERT [dbo].[Vehicules] ([id], [plaque], [model], [marque], [annee], [capacite], [numero]) VALUES (1, N'AA-98983', N'mack', N'jack', 1998, 20, N'B-098')
SET IDENTITY_INSERT [dbo].[Vehicules] OFF
ALTER TABLE [dbo].[Bouteilles] ADD  CONSTRAINT [DF_Bouteilles_qte]  DEFAULT ((0)) FOR [qte]
GO
ALTER TABLE [dbo].[BouteilleSansCaisses] ADD  CONSTRAINT [DF_BouteilleSansCaisses_qte]  DEFAULT ((0)) FOR [qte]
GO
ALTER TABLE [dbo].[Caisses] ADD  CONSTRAINT [DF_Caisses_capacite]  DEFAULT ((0)) FOR [capacite]
GO
ALTER TABLE [dbo].[Caisses] ADD  CONSTRAINT [DF_Caisses_qte]  DEFAULT ((0)) FOR [qte]
GO
ALTER TABLE [dbo].[CaisseVides] ADD  CONSTRAINT [DF_CaisseVides_qte]  DEFAULT ((0)) FOR [qte]
GO
ALTER TABLE [dbo].[CaisseVides] ADD  CONSTRAINT [DF_CaisseVides_capacite]  DEFAULT ((0)) FOR [capacite]
GO
ALTER TABLE [dbo].[Casse] ADD  DEFAULT ((0)) FOR [qtite_casse]
GO
ALTER TABLE [dbo].[Casse] ADD  DEFAULT ((0)) FOR [qtite_bout]
GO
ALTER TABLE [dbo].[Casse] ADD  DEFAULT ((0)) FOR [qtite_shortfill]
GO
ALTER TABLE [dbo].[Casse] ADD  DEFAULT ((0)) FOR [qtite_perte]
GO
ALTER TABLE [dbo].[Casse] ADD  DEFAULT ((0)) FOR [qtite_prod_man]
GO
ALTER TABLE [dbo].[Casses] ADD  CONSTRAINT [DF_Casses_qteBout]  DEFAULT ((0)) FOR [qteBout]
GO
ALTER TABLE [dbo].[DebarquementAutres] ADD  CONSTRAINT [DF_DebarquementAutres_stubby]  DEFAULT ((0)) FOR [stubby]
GO
ALTER TABLE [dbo].[DebarquementAutres] ADD  CONSTRAINT [DF_DebarquementAutres_rstub]  DEFAULT ((0)) FOR [rstub]
GO
ALTER TABLE [dbo].[DebarquementAutres] ADD  CONSTRAINT [DF_DebarquementAutres_gold]  DEFAULT ((0)) FOR [gold]
GO
ALTER TABLE [dbo].[DebarquementAutres] ADD  CONSTRAINT [DF_DebarquementAutres_rgold]  DEFAULT ((0)) FOR [rgold]
GO
ALTER TABLE [dbo].[DebarquementAutres] ADD  CONSTRAINT [DF_DebarquementAutres_big]  DEFAULT ((0)) FOR [big]
GO
ALTER TABLE [dbo].[DebarquementAutres] ADD  CONSTRAINT [DF_DebarquementAutres_rbig]  DEFAULT ((0)) FOR [rbig]
GO
ALTER TABLE [dbo].[DebarquementAutres] ADD  CONSTRAINT [DF_DebarquementAutres_kingcola]  DEFAULT ((0)) FOR [kingcola]
GO
ALTER TABLE [dbo].[DebarquementAutres] ADD  CONSTRAINT [DF_DebarquementAutres_rcola]  DEFAULT ((0)) FOR [rcola]
GO
ALTER TABLE [dbo].[DebarquementAutres] ADD  CONSTRAINT [DF_DebarquementAutres_sevenup]  DEFAULT ((0)) FOR [sevenup]
GO
ALTER TABLE [dbo].[DebarquementAutres] ADD  CONSTRAINT [DF_DebarquementAutres_r7up]  DEFAULT ((0)) FOR [r7up]
GO
ALTER TABLE [dbo].[DebarquementAutres] ADD  CONSTRAINT [DF_DebarquementAutres_pepsi]  DEFAULT ((0)) FOR [pepsi]
GO
ALTER TABLE [dbo].[DebarquementAutres] ADD  CONSTRAINT [DF_DebarquementAutres_rpepsi]  DEFAULT ((0)) FOR [rpepsi]
GO
ALTER TABLE [dbo].[DebarquementAutres] ADD  CONSTRAINT [DF_DebarquementAutres_redCratesHD]  DEFAULT ((0)) FOR [redCratesHD]
GO
ALTER TABLE [dbo].[DebarquementAutres] ADD  CONSTRAINT [DF_DebarquementAutres_redCratesFD]  DEFAULT ((0)) FOR [redCratesFD]
GO
ALTER TABLE [dbo].[DebarquementAutres] ADD  CONSTRAINT [DF_DebarquementAutres_yellowCratesFD]  DEFAULT ((0)) FOR [yellowCratesFD]
GO
ALTER TABLE [dbo].[DebarquementAutres] ADD  CONSTRAINT [DF_DebarquementAutres_qtePalette]  DEFAULT ((0)) FOR [qtePalette]
GO
ALTER TABLE [dbo].[DebarquementPleins] ADD  CONSTRAINT [DF_DebarquementPleins_prestige]  DEFAULT ((0)) FOR [prestige]
GO
ALTER TABLE [dbo].[DebarquementPleins] ADD  CONSTRAINT [DF_DebarquementPleins_guinness]  DEFAULT ((0)) FOR [guinness]
GO
ALTER TABLE [dbo].[DebarquementPleins] ADD  CONSTRAINT [DF_DebarquementPleins_malta]  DEFAULT ((0)) FOR [malta]
GO
ALTER TABLE [dbo].[DebarquementPleins] ADD  CONSTRAINT [DF_DebarquementPleins_kinanm341ml]  DEFAULT ((0)) FOR [kinanm341ml]
GO
ALTER TABLE [dbo].[DebarquementPleins] ADD  CONSTRAINT [DF_DebarquementPleins_big]  DEFAULT ((0)) FOR [big]
GO
ALTER TABLE [dbo].[DebarquementPleins] ADD  CONSTRAINT [DF_DebarquementPleins_kinanm500ml]  DEFAULT ((0)) FOR [kinanm500ml]
GO
ALTER TABLE [dbo].[DebarquementPleins] ADD  CONSTRAINT [DF_DebarquementPleins_king]  DEFAULT ((0)) FOR [king]
GO
ALTER TABLE [dbo].[DebarquementPleins] ADD  CONSTRAINT [DF_DebarquementPleins_sevenup]  DEFAULT ((0)) FOR [sevenup]
GO
ALTER TABLE [dbo].[DebarquementPleins] ADD  CONSTRAINT [DF_DebarquementPleins_pepsi]  DEFAULT ((0)) FOR [pepsi]
GO
ALTER TABLE [dbo].[Debarquements] ADD  CONSTRAINT [DF_Debarquements_stubby]  DEFAULT ((0)) FOR [stubby]
GO
ALTER TABLE [dbo].[Debarquements] ADD  CONSTRAINT [DF_Debarquements_rstub]  DEFAULT ((0)) FOR [rstub]
GO
ALTER TABLE [dbo].[Debarquements] ADD  CONSTRAINT [DF_Debarquements_gold]  DEFAULT ((0)) FOR [gold]
GO
ALTER TABLE [dbo].[Debarquements] ADD  CONSTRAINT [DF_Debarquements_rgold]  DEFAULT ((0)) FOR [rgold]
GO
ALTER TABLE [dbo].[Debarquements] ADD  CONSTRAINT [DF_Debarquements_big]  DEFAULT ((0)) FOR [big]
GO
ALTER TABLE [dbo].[Debarquements] ADD  CONSTRAINT [DF_Debarquements_rbig]  DEFAULT ((0)) FOR [rbig]
GO
ALTER TABLE [dbo].[Debarquements] ADD  CONSTRAINT [DF_Debarquements_kingcola]  DEFAULT ((0)) FOR [kingcola]
GO
ALTER TABLE [dbo].[Debarquements] ADD  CONSTRAINT [DF_Debarquements_rcola]  DEFAULT ((0)) FOR [rcola]
GO
ALTER TABLE [dbo].[Debarquements] ADD  CONSTRAINT [DF_Debarquements_sevenup]  DEFAULT ((0)) FOR [sevenup]
GO
ALTER TABLE [dbo].[Debarquements] ADD  CONSTRAINT [DF_Debarquements_r7up]  DEFAULT ((0)) FOR [r7up]
GO
ALTER TABLE [dbo].[Debarquements] ADD  CONSTRAINT [DF_Debarquements_pepsi]  DEFAULT ((0)) FOR [pepsi]
GO
ALTER TABLE [dbo].[Debarquements] ADD  CONSTRAINT [DF_Debarquements_rpepsi]  DEFAULT ((0)) FOR [rpepsi]
GO
ALTER TABLE [dbo].[Debarquements] ADD  CONSTRAINT [DF_Debarquements_redCratesHD]  DEFAULT ((0)) FOR [redCratesHD]
GO
ALTER TABLE [dbo].[Debarquements] ADD  CONSTRAINT [DF_Debarquements_redCratesFD]  DEFAULT ((0)) FOR [redCratesFD]
GO
ALTER TABLE [dbo].[Debarquements] ADD  CONSTRAINT [DF_Debarquements_yellowCratesFD]  DEFAULT ((0)) FOR [yellowCratesFD]
GO
ALTER TABLE [dbo].[Debarquements] ADD  CONSTRAINT [DF_Debarquements_qtePalette]  DEFAULT ((0)) FOR [qtePalette]
GO
ALTER TABLE [dbo].[Debut_inventaire] ADD  DEFAULT ((0)) FOR [qtite_bouteille]
GO
ALTER TABLE [dbo].[Debut_inventaire] ADD  DEFAULT ((0)) FOR [qtite_trouvee]
GO
ALTER TABLE [dbo].[Debut_inventaire] ADD  DEFAULT ((0)) FOR [caisse_theor]
GO
ALTER TABLE [dbo].[Debut_inventaire] ADD  DEFAULT ((0)) FOR [bout_theor]
GO
ALTER TABLE [dbo].[DepotEmballages] ADD  CONSTRAINT [DF_DepotEmballages_prestige]  DEFAULT ((0)) FOR [prestige]
GO
ALTER TABLE [dbo].[DepotEmballages] ADD  CONSTRAINT [DF_DepotEmballages_guinness]  DEFAULT ((0)) FOR [guinness]
GO
ALTER TABLE [dbo].[DepotEmballages] ADD  CONSTRAINT [DF_DepotEmballages_malta]  DEFAULT ((0)) FOR [malta]
GO
ALTER TABLE [dbo].[DepotEmballages] ADD  CONSTRAINT [DF_DepotEmballages_kinanm341ml]  DEFAULT ((0)) FOR [kinanm341ml]
GO
ALTER TABLE [dbo].[DepotEmballages] ADD  CONSTRAINT [DF_DepotEmballages_big]  DEFAULT ((0)) FOR [big]
GO
ALTER TABLE [dbo].[DepotEmballages] ADD  CONSTRAINT [DF_DepotEmballages_kinanm500ml]  DEFAULT ((0)) FOR [kinanm500ml]
GO
ALTER TABLE [dbo].[DepotEmballages] ADD  CONSTRAINT [DF_DepotEmballages_king]  DEFAULT ((0)) FOR [king]
GO
ALTER TABLE [dbo].[DepotEmballages] ADD  CONSTRAINT [DF_DepotEmballages_sevenup]  DEFAULT ((0)) FOR [sevenup]
GO
ALTER TABLE [dbo].[DepotEmballages] ADD  CONSTRAINT [DF_DepotEmballages_pepsi]  DEFAULT ((0)) FOR [pepsi]
GO
ALTER TABLE [dbo].[EntreeProductions] ADD  CONSTRAINT [DF_EntreeProductions_qte]  DEFAULT ((0)) FOR [qte]
GO
ALTER TABLE [dbo].[EntreeProductions] ADD  CONSTRAINT [DF_EntreeProductions_qteCaisses]  DEFAULT ((0)) FOR [qteCaisses]
GO
ALTER TABLE [dbo].[InjectionsBout] ADD  CONSTRAINT [DF_InjectionsBout_qteBout]  DEFAULT ((0)) FOR [qteBout]
GO
ALTER TABLE [dbo].[InjectionsCaisse] ADD  CONSTRAINT [DF_InjectionsCaisse_qteCaisse]  DEFAULT ((0)) FOR [qteCaisse]
GO
ALTER TABLE [dbo].[InjectionsCaisse] ADD  CONSTRAINT [DF_InjectionsCaisse_qtePalette]  DEFAULT ((0)) FOR [qtePalette]
GO
ALTER TABLE [dbo].[InjectionsCaisse] ADD  CONSTRAINT [DF_InjectionsCaisse_capacite]  DEFAULT ((0)) FOR [capacite]
GO
ALTER TABLE [dbo].[Ligne_depot] ADD  DEFAULT ((0)) FOR [id_data_clock]
GO
ALTER TABLE [dbo].[Loading] ADD  DEFAULT ((0)) FOR [retour]
GO
ALTER TABLE [dbo].[Loading] ADD  DEFAULT ((0)) FOR [id_superviseur]
GO
ALTER TABLE [dbo].[Loading] ADD  DEFAULT ((0)) FOR [id_data_clock]
GO
ALTER TABLE [dbo].[MiseEnCaisses] ADD  CONSTRAINT [DF_MiseEnCaisses_qte]  DEFAULT ((0)) FOR [qte]
GO
ALTER TABLE [dbo].[Palettes] ADD  CONSTRAINT [DF_Palettes_qte]  DEFAULT ((0)) FOR [qte]
GO
ALTER TABLE [dbo].[Produit_Bloque] ADD  DEFAULT ((0)) FOR [etat]
GO
ALTER TABLE [dbo].[RecyclagesBout] ADD  CONSTRAINT [DF_RecyclagesBout_qteBout]  DEFAULT ((0)) FOR [qteBout]
GO
ALTER TABLE [dbo].[RecyclagesCaisse] ADD  CONSTRAINT [DF_RecyclagesCaisse_qteCaisse]  DEFAULT ((0)) FOR [qteCaisse]
GO
ALTER TABLE [dbo].[RecyclagesCaisse] ADD  CONSTRAINT [DF_RecyclagesCaisse_qtePalette]  DEFAULT ((0)) FOR [qtePalette]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT ((0)) FOR [stockDebutSystem]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT ((0)) FOR [StockDebutreel]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT ((0)) FOR [Reception]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT ((0)) FOR [Transfert]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT ((0)) FOR [EntreeProduction]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT ((0)) FOR [RetourProduction]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT ((0)) FOR [RetourVente]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT ((0)) FOR [Recyclage]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT ((0)) FOR [Casse]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT ((0)) FOR [sortiePalette]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT ((0)) FOR [retourPalette]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT ((0)) FOR [StockFinSystem]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT ((0)) FOR [StockFinreel]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT ((0)) FOR [difference]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT ((0)) FOR [Perte]
GO
ALTER TABLE [dbo].[RetourProductions] ADD  CONSTRAINT [DF_RetourProductions_qte]  DEFAULT ((0)) FOR [qte]
GO
ALTER TABLE [dbo].[RetourProductions] ADD  CONSTRAINT [DF_RetourProductions_qteCaisses]  DEFAULT ((0)) FOR [qteCaisses]
GO
ALTER TABLE [dbo].[StockDebuEmptyCrates] ADD  CONSTRAINT [DF_StockDebuEmptyCrates_qte]  DEFAULT ((0)) FOR [qte]
GO
ALTER TABLE [dbo].[StockDebutPalettes] ADD  DEFAULT ((0)) FOR [qte]
GO
ALTER TABLE [dbo].[StockDebutreels] ADD  CONSTRAINT [DF_StockDebutreels_InCrates]  DEFAULT ((0)) FOR [InCrates]
GO
ALTER TABLE [dbo].[StockDebutreels] ADD  CONSTRAINT [DF_StockDebutreels_NotInCrates]  DEFAULT ((0)) FOR [NotInCrates]
GO
ALTER TABLE [dbo].[StockDebutreels] ADD  CONSTRAINT [DF_StockDebutreels_resteInCrates]  DEFAULT ((0)) FOR [resteInCrates]
GO
ALTER TABLE [dbo].[StockDebutreels] ADD  CONSTRAINT [DF_StockDebutreels_ResteNotInCrates]  DEFAULT ((0)) FOR [ResteNotInCrates]
GO
ALTER TABLE [dbo].[StockFinEmptyCrates] ADD  DEFAULT ((0)) FOR [qte]
GO
ALTER TABLE [dbo].[StockFinPalettes] ADD  DEFAULT ((0)) FOR [qte]
GO
ALTER TABLE [dbo].[StockFinreels] ADD  DEFAULT ((0)) FOR [InCrates]
GO
ALTER TABLE [dbo].[StockFinreels] ADD  DEFAULT ((0)) FOR [NotInCrates]
GO
ALTER TABLE [dbo].[StockFinreels] ADD  DEFAULT ((0)) FOR [resteInCrates]
GO
ALTER TABLE [dbo].[StockFinreels] ADD  DEFAULT ((0)) FOR [ResteNotInCrates]
GO
ALTER TABLE [dbo].[Tampons] ADD  CONSTRAINT [DF_Tampons_InCrates]  DEFAULT ((0)) FOR [InCrates]
GO
ALTER TABLE [dbo].[Tampons] ADD  CONSTRAINT [DF_Tampons_NotIncrates]  DEFAULT ((0)) FOR [NotIncrates]
GO
ALTER TABLE [dbo].[Tampons] ADD  CONSTRAINT [DF_Tampons_resteInCrates]  DEFAULT ((0)) FOR [resteInCrates]
GO
ALTER TABLE [dbo].[Tampons] ADD  CONSTRAINT [DF_Tampons_ResteNotInCrates]  DEFAULT ((0)) FOR [ResteNotInCrates]
GO
ALTER TABLE [dbo].[Tampons] ADD  CONSTRAINT [DF_Tampons_qteCaisseEmpty]  DEFAULT ((0)) FOR [qteCaisseEmpty]
GO
ALTER TABLE [dbo].[Tampons] ADD  CONSTRAINT [DF_Tampons_qtePalette]  DEFAULT ((0)) FOR [qtePalette]
GO
ALTER TABLE [dbo].[TamponsEmptyCrates] ADD  CONSTRAINT [DF_TamponsEmptyCrates_qte]  DEFAULT ((0)) FOR [qte]
GO
ALTER TABLE [dbo].[TamponsEmptyCrates] ADD  CONSTRAINT [DF_TamponsEmptyCrates_capacite]  DEFAULT ((0)) FOR [capacite]
GO
ALTER TABLE [dbo].[TamponsPals] ADD  CONSTRAINT [DF_TamponsPals_qte]  DEFAULT ((0)) FOR [qte]
GO
ALTER TABLE [dbo].[Transfers] ADD  DEFAULT ((0)) FOR [qteBout]
GO
ALTER TABLE [dbo].[Transfers] ADD  DEFAULT ((0)) FOR [qteCaisse]
GO
ALTER TABLE [dbo].[Transfers] ADD  DEFAULT ((0)) FOR [palette]
GO
ALTER TABLE [dbo].[Transfert_dep] ADD  DEFAULT ((0)) FOR [num_transfert]
GO
ALTER TABLE [dbo].[Transfert_dep] ADD  DEFAULT ((0)) FOR [id_superviseur_recu]
GO
ALTER TABLE [dbo].[Transits] ADD  DEFAULT ((0)) FOR [qteBout]
GO
ALTER TABLE [dbo].[Transits] ADD  DEFAULT ((0)) FOR [qteCaisse]
GO
ALTER TABLE [dbo].[Transits] ADD  DEFAULT ((0)) FOR [palette]
GO
ALTER TABLE [dbo].[Unloading] ADD  DEFAULT ((0)) FOR [qtite_casse]
GO
ALTER TABLE [dbo].[Casse]  WITH CHECK ADD  CONSTRAINT [FK_Casse_depot] FOREIGN KEY([id_depot])
REFERENCES [dbo].[Depots] ([id])
GO
ALTER TABLE [dbo].[Casse] CHECK CONSTRAINT [FK_Casse_depot]
GO
ALTER TABLE [dbo].[Casse]  WITH CHECK ADD  CONSTRAINT [FK_Casse_produit] FOREIGN KEY([id_produit])
REFERENCES [dbo].[Produits] ([id])
GO
ALTER TABLE [dbo].[Casse] CHECK CONSTRAINT [FK_Casse_produit]
GO
ALTER TABLE [dbo].[Casse]  WITH CHECK ADD  CONSTRAINT [FK_Casse_superviseur] FOREIGN KEY([id_superviseur])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[Casse] CHECK CONSTRAINT [FK_Casse_superviseur]
GO
ALTER TABLE [dbo].[DebarquementAutres]  WITH CHECK ADD  CONSTRAINT [FK_Autres_User] FOREIGN KEY([idUser])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[DebarquementAutres] CHECK CONSTRAINT [FK_Autres_User]
GO
ALTER TABLE [dbo].[DebarquementPleins]  WITH CHECK ADD  CONSTRAINT [FK_PL_user] FOREIGN KEY([idUser])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[DebarquementPleins] CHECK CONSTRAINT [FK_PL_user]
GO
ALTER TABLE [dbo].[Debarquements]  WITH CHECK ADD  CONSTRAINT [FK_DEB_USER] FOREIGN KEY([idUser])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[Debarquements] CHECK CONSTRAINT [FK_DEB_USER]
GO
ALTER TABLE [dbo].[Debarquements]  WITH CHECK ADD  CONSTRAINT [FK_deb_veh] FOREIGN KEY([idVehicule])
REFERENCES [dbo].[Vehicules] ([id])
GO
ALTER TABLE [dbo].[Debarquements] CHECK CONSTRAINT [FK_deb_veh]
GO
ALTER TABLE [dbo].[Debut_inventaire]  WITH CHECK ADD  CONSTRAINT [FK_Debut_inventaire_depot] FOREIGN KEY([id_depot_fg])
REFERENCES [dbo].[Depots] ([id])
GO
ALTER TABLE [dbo].[Debut_inventaire] CHECK CONSTRAINT [FK_Debut_inventaire_depot]
GO
ALTER TABLE [dbo].[Debut_inventaire]  WITH CHECK ADD  CONSTRAINT [FK_Debut_inventaire_Produit] FOREIGN KEY([id_produit])
REFERENCES [dbo].[Produits] ([id])
GO
ALTER TABLE [dbo].[Debut_inventaire] CHECK CONSTRAINT [FK_Debut_inventaire_Produit]
GO
ALTER TABLE [dbo].[Debut_inventaire]  WITH CHECK ADD  CONSTRAINT [FK_Debut_inventaire_superviseur] FOREIGN KEY([id_superviseur])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[Debut_inventaire] CHECK CONSTRAINT [FK_Debut_inventaire_superviseur]
GO
ALTER TABLE [dbo].[Depot_Produit]  WITH CHECK ADD  CONSTRAINT [FK_Depot_produit_depot] FOREIGN KEY([id_depot])
REFERENCES [dbo].[Depots] ([id])
GO
ALTER TABLE [dbo].[Depot_Produit] CHECK CONSTRAINT [FK_Depot_produit_depot]
GO
ALTER TABLE [dbo].[Depot_Produit]  WITH CHECK ADD  CONSTRAINT [FK_Depot_produit_produit] FOREIGN KEY([id_produit])
REFERENCES [dbo].[Produits] ([id])
GO
ALTER TABLE [dbo].[Depot_Produit] CHECK CONSTRAINT [FK_Depot_produit_produit]
GO
ALTER TABLE [dbo].[DepotEmballages]  WITH CHECK ADD  CONSTRAINT [FK_Dep_User] FOREIGN KEY([idUser])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[DepotEmballages] CHECK CONSTRAINT [FK_Dep_User]
GO
ALTER TABLE [dbo].[Emballage]  WITH CHECK ADD  CONSTRAINT [FK_Emballage_Utilisateur] FOREIGN KEY([id_utilisateur])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[Emballage] CHECK CONSTRAINT [FK_Emballage_Utilisateur]
GO
ALTER TABLE [dbo].[Fin_Inventaire]  WITH CHECK ADD  CONSTRAINT [FK_Fin_inventaire_depot] FOREIGN KEY([id_depot_fg])
REFERENCES [dbo].[Depots] ([id])
GO
ALTER TABLE [dbo].[Fin_Inventaire] CHECK CONSTRAINT [FK_Fin_inventaire_depot]
GO
ALTER TABLE [dbo].[Fin_Inventaire]  WITH CHECK ADD  CONSTRAINT [FK_Fin_inventaire_Produit] FOREIGN KEY([id_produit])
REFERENCES [dbo].[Produits] ([id])
GO
ALTER TABLE [dbo].[Fin_Inventaire] CHECK CONSTRAINT [FK_Fin_inventaire_Produit]
GO
ALTER TABLE [dbo].[Fin_Inventaire]  WITH CHECK ADD  CONSTRAINT [FK_Fin_inventaire_superviseur] FOREIGN KEY([id_superviseur])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[Fin_Inventaire] CHECK CONSTRAINT [FK_Fin_inventaire_superviseur]
GO
ALTER TABLE [dbo].[laboratoire_echantillon]  WITH CHECK ADD  CONSTRAINT [FK_Laboratoire_echantillon_depot] FOREIGN KEY([id_depot])
REFERENCES [dbo].[Depots] ([id])
GO
ALTER TABLE [dbo].[laboratoire_echantillon] CHECK CONSTRAINT [FK_Laboratoire_echantillon_depot]
GO
ALTER TABLE [dbo].[laboratoire_echantillon]  WITH CHECK ADD  CONSTRAINT [FK_Laboratoire_echantillon_produit] FOREIGN KEY([id_produit])
REFERENCES [dbo].[Produits] ([id])
GO
ALTER TABLE [dbo].[laboratoire_echantillon] CHECK CONSTRAINT [FK_Laboratoire_echantillon_produit]
GO
ALTER TABLE [dbo].[laboratoire_echantillon]  WITH CHECK ADD  CONSTRAINT [FK_Laboratoire_echantillon_superviseur] FOREIGN KEY([id_superviseur])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[laboratoire_echantillon] CHECK CONSTRAINT [FK_Laboratoire_echantillon_superviseur]
GO
ALTER TABLE [dbo].[Ligne_depot]  WITH CHECK ADD  CONSTRAINT [FK_Ligne_depot_data_clock] FOREIGN KEY([id_data_clock])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[Ligne_depot] CHECK CONSTRAINT [FK_Ligne_depot_data_clock]
GO
ALTER TABLE [dbo].[Ligne_depot]  WITH CHECK ADD  CONSTRAINT [FK_Ligne_depot_depot] FOREIGN KEY([id_depot])
REFERENCES [dbo].[Depots] ([id])
GO
ALTER TABLE [dbo].[Ligne_depot] CHECK CONSTRAINT [FK_Ligne_depot_depot]
GO
ALTER TABLE [dbo].[Ligne_depot]  WITH CHECK ADD  CONSTRAINT [FK_Ligne_depot_id_produit] FOREIGN KEY([id_produit])
REFERENCES [dbo].[Produits] ([id])
GO
ALTER TABLE [dbo].[Ligne_depot] CHECK CONSTRAINT [FK_Ligne_depot_id_produit]
GO
ALTER TABLE [dbo].[Ligne_depot]  WITH CHECK ADD  CONSTRAINT [FK_Ligne_depot_ligne_production] FOREIGN KEY([id_ligne_production])
REFERENCES [dbo].[Ligne_production] ([id])
GO
ALTER TABLE [dbo].[Ligne_depot] CHECK CONSTRAINT [FK_Ligne_depot_ligne_production]
GO
ALTER TABLE [dbo].[Ligne_depot]  WITH CHECK ADD  CONSTRAINT [FK_Ligne_depot_superviseur] FOREIGN KEY([id_superviseur])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[Ligne_depot] CHECK CONSTRAINT [FK_Ligne_depot_superviseur]
GO
ALTER TABLE [dbo].[Ligne_production]  WITH CHECK ADD  CONSTRAINT [FK_Ligne_production_utilisateur] FOREIGN KEY([id_utilisateur])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[Ligne_production] CHECK CONSTRAINT [FK_Ligne_production_utilisateur]
GO
ALTER TABLE [dbo].[Ligne_Produit]  WITH CHECK ADD  CONSTRAINT [FK_Ligne_produit_ligne_production] FOREIGN KEY([id_ligne_production])
REFERENCES [dbo].[Ligne_production] ([id])
GO
ALTER TABLE [dbo].[Ligne_Produit] CHECK CONSTRAINT [FK_Ligne_produit_ligne_production]
GO
ALTER TABLE [dbo].[Ligne_Produit]  WITH CHECK ADD  CONSTRAINT [FK_Ligne_produit_produit] FOREIGN KEY([id_produit])
REFERENCES [dbo].[Produits] ([id])
GO
ALTER TABLE [dbo].[Ligne_Produit] CHECK CONSTRAINT [FK_Ligne_produit_produit]
GO
ALTER TABLE [dbo].[Loading]  WITH CHECK ADD  CONSTRAINT [FK_Loading_Chauffeurs] FOREIGN KEY([id_chauffeur])
REFERENCES [dbo].[Chauffeurs] ([id])
GO
ALTER TABLE [dbo].[Loading] CHECK CONSTRAINT [FK_Loading_Chauffeurs]
GO
ALTER TABLE [dbo].[Loading]  WITH CHECK ADD  CONSTRAINT [FK_Loading_dataclock] FOREIGN KEY([id_data_clock])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[Loading] CHECK CONSTRAINT [FK_Loading_dataclock]
GO
ALTER TABLE [dbo].[Loading]  WITH CHECK ADD  CONSTRAINT [FK_Loading_depot] FOREIGN KEY([id_depot])
REFERENCES [dbo].[Depots] ([id])
GO
ALTER TABLE [dbo].[Loading] CHECK CONSTRAINT [FK_Loading_depot]
GO
ALTER TABLE [dbo].[Loading]  WITH CHECK ADD  CONSTRAINT [FK_Loading_superviseur] FOREIGN KEY([id_superviseur])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[Loading] CHECK CONSTRAINT [FK_Loading_superviseur]
GO
ALTER TABLE [dbo].[Loading]  WITH CHECK ADD  CONSTRAINT [FK_Loading_vehicule] FOREIGN KEY([id_vehicule])
REFERENCES [dbo].[Vehicules] ([id])
GO
ALTER TABLE [dbo].[Loading] CHECK CONSTRAINT [FK_Loading_vehicule]
GO
ALTER TABLE [dbo].[Loading_prodiut]  WITH CHECK ADD  CONSTRAINT [FK_Loading_produit_loading] FOREIGN KEY([id_loading])
REFERENCES [dbo].[Loading] ([id])
GO
ALTER TABLE [dbo].[Loading_prodiut] CHECK CONSTRAINT [FK_Loading_produit_loading]
GO
ALTER TABLE [dbo].[Loading_prodiut]  WITH CHECK ADD  CONSTRAINT [FK_Loading_produit_produit] FOREIGN KEY([id_produit])
REFERENCES [dbo].[Produits] ([id])
GO
ALTER TABLE [dbo].[Loading_prodiut] CHECK CONSTRAINT [FK_Loading_produit_produit]
GO
ALTER TABLE [dbo].[Loading_produit]  WITH CHECK ADD  CONSTRAINT [FK_Loading_prod_produit] FOREIGN KEY([id_produit])
REFERENCES [dbo].[Produits] ([id])
GO
ALTER TABLE [dbo].[Loading_produit] CHECK CONSTRAINT [FK_Loading_prod_produit]
GO
ALTER TABLE [dbo].[Logins]  WITH CHECK ADD  CONSTRAINT [FK_Log_user] FOREIGN KEY([idUser])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[Logins] CHECK CONSTRAINT [FK_Log_user]
GO
ALTER TABLE [dbo].[Produit_Bloque]  WITH CHECK ADD  CONSTRAINT [FK_Produit_Bloque_ToTable] FOREIGN KEY([id_produit])
REFERENCES [dbo].[Produits] ([id])
GO
ALTER TABLE [dbo].[Produit_Bloque] CHECK CONSTRAINT [FK_Produit_Bloque_ToTable]
GO
ALTER TABLE [dbo].[Produit_Bloque]  WITH CHECK ADD  CONSTRAINT [FK_Produit_Bloque_ToTable_1] FOREIGN KEY([id_depot])
REFERENCES [dbo].[Depots] ([id])
GO
ALTER TABLE [dbo].[Produit_Bloque] CHECK CONSTRAINT [FK_Produit_Bloque_ToTable_1]
GO
ALTER TABLE [dbo].[Produits]  WITH CHECK ADD  CONSTRAINT [FK_Produit_Categorie] FOREIGN KEY([id_categorie])
REFERENCES [dbo].[Categorie] ([id])
GO
ALTER TABLE [dbo].[Produits] CHECK CONSTRAINT [FK_Produit_Categorie]
GO
ALTER TABLE [dbo].[Produits]  WITH CHECK ADD  CONSTRAINT [FK_Produit_Emballage] FOREIGN KEY([id_emballage])
REFERENCES [dbo].[Emballage] ([id])
GO
ALTER TABLE [dbo].[Produits] CHECK CONSTRAINT [FK_Produit_Emballage]
GO
ALTER TABLE [dbo].[Produits]  WITH CHECK ADD  CONSTRAINT [FK_Produit_Utilisateur] FOREIGN KEY([id_utilisateur])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[Produits] CHECK CONSTRAINT [FK_Produit_Utilisateur]
GO
ALTER TABLE [dbo].[Transfert_dep]  WITH CHECK ADD  CONSTRAINT [FK_Transfert_chauffeur] FOREIGN KEY([id_chauffeur])
REFERENCES [dbo].[Chauffeurs] ([id])
GO
ALTER TABLE [dbo].[Transfert_dep] CHECK CONSTRAINT [FK_Transfert_chauffeur]
GO
ALTER TABLE [dbo].[Transfert_dep]  WITH CHECK ADD  CONSTRAINT [FK_Transfert_dataclock] FOREIGN KEY([id_data_clock])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[Transfert_dep] CHECK CONSTRAINT [FK_Transfert_dataclock]
GO
ALTER TABLE [dbo].[Transfert_dep]  WITH CHECK ADD  CONSTRAINT [FK_Transfert_depot_destination] FOREIGN KEY([id_depot_dest])
REFERENCES [dbo].[Depots] ([id])
GO
ALTER TABLE [dbo].[Transfert_dep] CHECK CONSTRAINT [FK_Transfert_depot_destination]
GO
ALTER TABLE [dbo].[Transfert_dep]  WITH CHECK ADD  CONSTRAINT [FK_Transfert_depot_source] FOREIGN KEY([id_depot_source])
REFERENCES [dbo].[Depots] ([id])
GO
ALTER TABLE [dbo].[Transfert_dep] CHECK CONSTRAINT [FK_Transfert_depot_source]
GO
ALTER TABLE [dbo].[Transfert_dep]  WITH CHECK ADD  CONSTRAINT [FK_Transfert_superviseur] FOREIGN KEY([id_superviseur])
REFERENCES [dbo].[Utilisateurs] ([id])
GO
ALTER TABLE [dbo].[Transfert_dep] CHECK CONSTRAINT [FK_Transfert_superviseur]
GO
ALTER TABLE [dbo].[Transfert_dep]  WITH CHECK ADD  CONSTRAINT [FK_Transfert_vehicule] FOREIGN KEY([id_vehicule])
REFERENCES [dbo].[Vehicules] ([id])
GO
ALTER TABLE [dbo].[Transfert_dep] CHECK CONSTRAINT [FK_Transfert_vehicule]
GO
ALTER TABLE [dbo].[Transfert_Produit]  WITH CHECK ADD  CONSTRAINT [FK_Transfert_Produit_Produit] FOREIGN KEY([id_produit])
REFERENCES [dbo].[Produits] ([id])
GO
ALTER TABLE [dbo].[Transfert_Produit] CHECK CONSTRAINT [FK_Transfert_Produit_Produit]
GO
ALTER TABLE [dbo].[Transfert_Produit]  WITH CHECK ADD  CONSTRAINT [FK_Transfert_Produit_transfert] FOREIGN KEY([id_transfert])
REFERENCES [dbo].[Transfert_dep] ([id])
GO
ALTER TABLE [dbo].[Transfert_Produit] CHECK CONSTRAINT [FK_Transfert_Produit_transfert]
GO
ALTER TABLE [dbo].[Unloading]  WITH CHECK ADD  CONSTRAINT [FK_Unloading_produit_loading] FOREIGN KEY([id_loading])
REFERENCES [dbo].[Loading] ([id])
GO
ALTER TABLE [dbo].[Unloading] CHECK CONSTRAINT [FK_Unloading_produit_loading]
GO
USE [master]
GO
ALTER DATABASE [SemsBrana] SET  READ_WRITE 
GO
