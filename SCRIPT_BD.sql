CREATE DATABASE Gerenciador
GO
USE [Gerenciador]
GO
/****** Object:  Table [dbo].[Relacao]    Script Date: 06/07/2013 09:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relacao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nchar](50) NOT NULL,
	[Tipo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Relacao] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Natureza]    Script Date: 06/07/2013 09:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Natureza](
	[nome] [nvarchar](50) NOT NULL,
	[descricao] [nvarchar](50) NULL,
 CONSTRAINT [PK_Natureza] PRIMARY KEY CLUSTERED 
(
	[nome] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 06/07/2013 09:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[nome] [varchar](50) NOT NULL,
	[senha] [varchar](50) NOT NULL,
 CONSTRAINT [PK_usuario_1] PRIMARY KEY CLUSTERED 
(
	[nome] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[email]    Script Date: 06/07/2013 09:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[email](
	[email] [varchar](50) NOT NULL,
	[smtp] [varchar](50) NOT NULL,
	[porta] [int] NOT NULL,
	[senha] [varchar](50) NOT NULL,
	[observacao] [varchar](50) NOT NULL,
 CONSTRAINT [PK_email_1] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Banco]    Script Date: 06/07/2013 09:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banco](
	[numero] [int] NOT NULL,
	[descricao] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Banco] PRIMARY KEY CLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agencia]    Script Date: 06/07/2013 09:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agencia](
	[numero] [int] NOT NULL,
	[banco] [int] NOT NULL,
	[descricao] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Agencia] PRIMARY KEY CLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conta]    Script Date: 06/07/2013 09:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conta](
	[numero] [int] NOT NULL,
	[agencia] [int] NOT NULL,
	[descricao] [nvarchar](50) NOT NULL,
	[saldo] [money] NOT NULL,
	[saldoInicial] [money] NULL,
	[data_criacao] [smalldatetime] NULL,
 CONSTRAINT [PK_Conta] PRIMARY KEY CLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Titulo]    Script Date: 06/07/2013 09:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Titulo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero] [int] NOT NULL,
	[relacao] [int] NOT NULL,
	[tipo] [nvarchar](50) NOT NULL,
	[qtd_parcela] [int] NOT NULL,
	[valor] [money] NOT NULL,
	[vencimento] [smalldatetime] NOT NULL,
	[natureza] [nvarchar](50) NOT NULL,
	[baixado] [nvarchar](20) NULL,
	[dta_baixa] [smalldatetime] NULL,
	[vlr_pagamento] [money] NULL,
	[descricao] [nvarchar](100) NULL,
	[conta_baixa] [int] NULL,
	[parcela] [int] NULL,
	[codigoBarras] [varchar](50) NULL,
 CONSTRAINT [PK_Titulo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Movimento]    Script Date: 06/07/2013 09:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[data] [smalldatetime] NOT NULL,
	[tipo] [nvarchar](10) NOT NULL,
	[valor] [money] NOT NULL,
	[numero] [nvarchar](20) NOT NULL,
	[descricao] [nvarchar](100) NOT NULL,
	[conta] [int] NOT NULL,
	[saldo] [money] NULL,
	[id_titulo] [int] NULL,
 CONSTRAINT [PK_Movimento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Agencia_Banco]    Script Date: 06/07/2013 09:19:26 ******/
ALTER TABLE [dbo].[Agencia]  WITH CHECK ADD  CONSTRAINT [FK_Agencia_Banco] FOREIGN KEY([banco])
REFERENCES [dbo].[Banco] ([numero])
GO
ALTER TABLE [dbo].[Agencia] CHECK CONSTRAINT [FK_Agencia_Banco]
GO
/****** Object:  ForeignKey [FK_Conta_Agencia]    Script Date: 06/07/2013 09:19:26 ******/
ALTER TABLE [dbo].[Conta]  WITH CHECK ADD  CONSTRAINT [FK_Conta_Agencia] FOREIGN KEY([agencia])
REFERENCES [dbo].[Agencia] ([numero])
GO
ALTER TABLE [dbo].[Conta] CHECK CONSTRAINT [FK_Conta_Agencia]
GO
/****** Object:  ForeignKey [FK_Movimento_Conta]    Script Date: 06/07/2013 09:19:27 ******/
ALTER TABLE [dbo].[Movimento]  WITH CHECK ADD  CONSTRAINT [FK_Movimento_Conta] FOREIGN KEY([conta])
REFERENCES [dbo].[Conta] ([numero])
GO
ALTER TABLE [dbo].[Movimento] CHECK CONSTRAINT [FK_Movimento_Conta]
GO
/****** Object:  ForeignKey [FK_Movimento_Titulo]    Script Date: 06/07/2013 09:19:27 ******/
ALTER TABLE [dbo].[Movimento]  WITH CHECK ADD  CONSTRAINT [FK_Movimento_Titulo] FOREIGN KEY([id_titulo])
REFERENCES [dbo].[Titulo] ([id])
GO
ALTER TABLE [dbo].[Movimento] CHECK CONSTRAINT [FK_Movimento_Titulo]
GO
/****** Object:  ForeignKey [FK_Titulo_Conta]    Script Date: 06/07/2013 09:19:27 ******/
ALTER TABLE [dbo].[Titulo]  WITH CHECK ADD  CONSTRAINT [FK_Titulo_Conta] FOREIGN KEY([conta_baixa])
REFERENCES [dbo].[Conta] ([numero])
GO
ALTER TABLE [dbo].[Titulo] CHECK CONSTRAINT [FK_Titulo_Conta]
GO
/****** Object:  ForeignKey [FK_Titulo_Natureza]    Script Date: 06/07/2013 09:19:27 ******/
ALTER TABLE [dbo].[Titulo]  WITH CHECK ADD  CONSTRAINT [FK_Titulo_Natureza] FOREIGN KEY([natureza])
REFERENCES [dbo].[Natureza] ([nome])
GO
ALTER TABLE [dbo].[Titulo] CHECK CONSTRAINT [FK_Titulo_Natureza]
GO
/****** Object:  ForeignKey [FK_Titulo_Relacao]    Script Date: 06/07/2013 09:19:27 ******/
ALTER TABLE [dbo].[Titulo]  WITH CHECK ADD  CONSTRAINT [FK_Titulo_Relacao] FOREIGN KEY([relacao])
REFERENCES [dbo].[Relacao] ([id])
GO
ALTER TABLE [dbo].[Titulo] CHECK CONSTRAINT [FK_Titulo_Relacao]
GO
