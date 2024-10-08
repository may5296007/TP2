USE [master]
GO
/****** Object:  Database [magasin]    Script Date: 2024-09-29 18:26:34 ******/
CREATE DATABASE [magasin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'magasin', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\magasin.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'magasin_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\magasin_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [magasin] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [magasin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [magasin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [magasin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [magasin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [magasin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [magasin] SET ARITHABORT OFF 
GO
ALTER DATABASE [magasin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [magasin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [magasin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [magasin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [magasin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [magasin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [magasin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [magasin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [magasin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [magasin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [magasin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [magasin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [magasin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [magasin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [magasin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [magasin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [magasin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [magasin] SET RECOVERY FULL 
GO
ALTER DATABASE [magasin] SET  MULTI_USER 
GO
ALTER DATABASE [magasin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [magasin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [magasin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [magasin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [magasin] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [magasin] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'magasin', N'ON'
GO
ALTER DATABASE [magasin] SET QUERY_STORE = ON
GO
ALTER DATABASE [magasin] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [magasin]
GO
/****** Object:  Table [dbo].[Achats]    Script Date: 2024-09-29 18:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Achats](
	[idAchat] [int] IDENTITY(1,1) NOT NULL,
	[idFournisseur] [int] NULL,
	[idProduit] [int] NULL,
	[quantite] [int] NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAchat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commandes]    Script Date: 2024-09-29 18:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commandes](
	[idCommande] [int] IDENTITY(1,1) NOT NULL,
	[idUtilisateur] [int] NULL,
	[dateCommande] [date] NULL,
	[statut] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCommande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fournisseurs]    Script Date: 2024-09-29 18:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fournisseurs](
	[idFournisseur] [int] IDENTITY(1,1) NOT NULL,
	[nomFournisseur] [nvarchar](100) NULL,
	[adresse] [nvarchar](100) NULL,
	[numTelephone] [nvarchar](15) NULL,
	[courriel] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idFournisseur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Magasin]    Script Date: 2024-09-29 18:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Magasin](
	[idMagasin] [int] IDENTITY(1,1) NOT NULL,
	[idUtilisateur] [int] NULL,
	[id_Produit] [int] NULL,
	[idFournisseur] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMagasin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OffreProduits]    Script Date: 2024-09-29 18:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OffreProduits](
	[id_offre] [int] IDENTITY(1,1) NOT NULL,
	[id_Produit] [int] NULL,
	[idUtilisateur] [int] NULL,
	[dateOffre] [date] NULL,
	[quantite] [int] NULL,
	[prixUnitaire] [decimal](10, 2) NULL,
	[modePaiementOffre] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_offre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produits]    Script Date: 2024-09-29 18:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produits](
	[id_Produit] [int] IDENTITY(1,1) NOT NULL,
	[nom_Produit] [nvarchar](100) NULL,
	[description_Produit] [nvarchar](255) NULL,
	[categorie_Produit] [nvarchar](50) NULL,
	[stock] [int] NULL,
	[prixUnitaire] [decimal](10, 2) NULL,
	[idMagasin] [int] NULL,
	[idUtilisateur] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Produit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilisateurs]    Script Date: 2024-09-29 18:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilisateurs](
	[idUtilisateur] [int] IDENTITY(1,1) NOT NULL,
	[nomU] [nvarchar](50) NULL,
	[prenomU] [nvarchar](50) NULL,
	[adresseU] [nvarchar](100) NULL,
	[courrielU] [nvarchar](100) NULL,
	[numTelephone] [nvarchar](15) NULL,
	[motdePasse] [nvarchar](50) NULL,
	[modePaiement] [nvarchar](50) NULL,
	[age] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUtilisateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Achats]  WITH CHECK ADD FOREIGN KEY([idFournisseur])
REFERENCES [dbo].[Fournisseurs] ([idFournisseur])
GO
ALTER TABLE [dbo].[Achats]  WITH CHECK ADD FOREIGN KEY([idProduit])
REFERENCES [dbo].[Produits] ([id_Produit])
GO
ALTER TABLE [dbo].[Commandes]  WITH CHECK ADD FOREIGN KEY([idUtilisateur])
REFERENCES [dbo].[Utilisateurs] ([idUtilisateur])
GO
ALTER TABLE [dbo].[Magasin]  WITH CHECK ADD FOREIGN KEY([idFournisseur])
REFERENCES [dbo].[Fournisseurs] ([idFournisseur])
GO
ALTER TABLE [dbo].[Magasin]  WITH CHECK ADD FOREIGN KEY([idUtilisateur])
REFERENCES [dbo].[Utilisateurs] ([idUtilisateur])
GO
ALTER TABLE [dbo].[OffreProduits]  WITH CHECK ADD FOREIGN KEY([id_Produit])
REFERENCES [dbo].[Produits] ([id_Produit])
GO
ALTER TABLE [dbo].[OffreProduits]  WITH CHECK ADD FOREIGN KEY([idUtilisateur])
REFERENCES [dbo].[Utilisateurs] ([idUtilisateur])
GO
ALTER TABLE [dbo].[Produits]  WITH CHECK ADD FOREIGN KEY([idMagasin])
REFERENCES [dbo].[Magasin] ([idMagasin])
GO
ALTER TABLE [dbo].[Produits]  WITH CHECK ADD FOREIGN KEY([idUtilisateur])
REFERENCES [dbo].[Utilisateurs] ([idUtilisateur])
GO
USE [master]
GO
ALTER DATABASE [magasin] SET  READ_WRITE 
GO
