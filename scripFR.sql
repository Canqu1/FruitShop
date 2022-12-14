USE [master]
GO
/****** Object:  Database [FruitShop]    Script Date: 7/12/2022 10:42:20 AM ******/
CREATE DATABASE [FruitShop]

begin
EXEC [FruitShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FruitShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FruitShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FruitShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FruitShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FruitShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [FruitShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FruitShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FruitShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FruitShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FruitShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FruitShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FruitShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FruitShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FruitShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FruitShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FruitShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FruitShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FruitShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FruitShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FruitShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FruitShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FruitShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FruitShop] SET RECOVERY FULL 
GO
ALTER DATABASE [FruitShop] SET  MULTI_USER 
GO
ALTER DATABASE [FruitShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FruitShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FruitShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FruitShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FruitShop', N'ON'
GO
USE [FruitShop]
GO
/****** Object:  Table [dbo].[account]    Script Date: 7/12/2022 10:42:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[a_id] [int] NOT NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[fullname] [varchar](255) NOT NULL,
	[phone] [varchar](255) NOT NULL,
	[email] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[a_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 7/12/2022 10:42:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 7/12/2022 10:42:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[productImage] [nvarchar](max) NOT NULL,
	[productPrice] [decimal](10, 2) NOT NULL,
	[quantity] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_order_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 7/12/2022 10:42:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[a_id] [int] NULL,
	[totalPrice] [float] NOT NULL,
	[created_date] [date] NOT NULL,
	[shipping_id] [int] NULL,
	[note] [text] NULL,
 CONSTRAINT [PK__orders__46596229604D2417] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 7/12/2022 10:42:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[product_quantity] [int] NULL,
	[category_id] [int] NOT NULL,
	[date_manufacture] [date] NOT NULL,
	[date_expriration] [date] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[product_img] [nvarchar](max) NULL,
	[product_description] [nvarchar](max) NULL,
 CONSTRAINT [PK__products__47027DF569D0D7EB] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shipping]    Script Date: 7/12/2022 10:42:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](50) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__stores__A2F2A30C3B84F576] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[account] ([a_id], [username], [password], [fullname], [phone], [email], [city], [role]) VALUES (1, N'User01', N'12345', N'Tran Van A', N'0999784512', N'AA@gmail.com', N'Ha Noi', N'User')
INSERT [dbo].[account] ([a_id], [username], [password], [fullname], [phone], [email], [city], [role]) VALUES (2, N'User02', N'11111', N'Vu Van Hoa', N'037456812', N'Hoahoa@gmail.com', N'Thai Nguyen', N'User')
INSERT [dbo].[account] ([a_id], [username], [password], [fullname], [phone], [email], [city], [role]) VALUES (3, N'User03', N'012012', N'Hoang Tien Long', N'0888456456', N'abc@gmail.com', N'Lao Cai', N'User')
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (1, N'Frozen fruit')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (2, N'Fresh fruit')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (3, N'Dried fruits')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (1, 1, N'Apricots', N'https://resources.commerceup.io/?key=https://prod-admin-images.s3.ap-south-1.amazonaws.com/oovzL7_ZJdjcvz-gwxHZ1/product/Dried-Apricot_1.jpg&width=800&resourceKey=oovzL7_ZJdjcvz-gwxHZ1', CAST(4.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[order_detail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (2, 1, N'Asian Pears', N'https://www.cmiapples.com/ecom_img/original-14-45-asian-pears.jpg', CAST(2.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[order_detail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (5, 4, N'Apricots', N'https://resources.commerceup.io/?key=https://prod-admin-images.s3.ap-south-1.amazonaws.com/oovzL7_ZJdjcvz-gwxHZ1/product/Dried-Apricot_1.jpg&width=800&resourceKey=oovzL7_ZJdjcvz-gwxHZ1', CAST(4.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(4, 2)))
INSERT [dbo].[order_detail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (6, 4, N'Barbados Cherries', N'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBQWEhgVFhYZGRgZHB0ZHBwcGR4dHRYYGRgaGRwdHRkcIS4lHx4rLSEcJjsnKy8xNTc1HCU7QDszPy40NTEBDAwMEA8QHhISHzQsJSs1NDE0NDQ3NDQ0NjQ0NjQ0NjQ9ND00NDQ0PTY0NDQ0ND00NDY0NDQ0NDQ0NDQ0NDQ0NP/AABEIANkA6AMBIgACEQEDEQH/xAAcAAEAAgMBAQEAAAAAAAAAAAAABAUDBgcBAgj/xAA6EAABAwIEAwUHAwMDBQAAAAABAAIRAyEEEjFBBVFhBiJxgZETMqGxwdHwQlJiFILhB3LCI5KisuL/xAAaAQEAAwEBAQAAAAAAAAAAAAAAAgMEBQEG/8QAKxEAAwACAQMDAwMFAQAAAAAAAAECAxEEEiExBUFRImGBEzKRcaGxwdEU/9oADAMBAAIRAxEAPwDsyIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIvEQHqIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAjY3FspML3mAPUnYAc1qeN49WqEhp9mzp7x8XbeSse2dJxoNe2SGPDnAfsggmOlvKVqNDEiJuJ/NFmy5NPRCqaeiU9rnGS95PMvdPrKMr12GWVXjxeSP+10hesrt/cPO3z1X3nG+vI6qra+SGy24b2ocCG12iP3t/5N+3otqpvDgCDIIkEaEFc8c0GR81YcG4m6gcrpNMm43YTuOnMfhtx5fZk5r5N3RY6bw4AtIINwRoQsi0kwiLFWqtY0ucQALknQIDKii4PG06rc1N7XDoZjxGylIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIi8QHhC0rjvZQgl+HFtTTnT/YTb+0+XJbo94GpVTj+0FGmDJkjkq8sTS1RKcVZO0rZzeo9zXFrwWuGrXCCPIr6ZWOx+o9Ctlxna3C1RlfTa9v8hJHgImdOSgMwmBqRlNSkTsHhzR1Oe8b6rm3xqb+itkq4GeVtyyuGIkzcEbtJ+RP2WZuJ/k13nl+DoHoSrCr2QrxmpVGVGnSZafqPioNTs7jG60Cf9rmH/kqljzQ+6Zmc0ifw7jZouESGnVjhAPVs79Qt5weLZUYHMMg+oO4I2K53Q4DjYhtFzR1ewA+IzX9FZ/0+LwlI1C5g0GVpuSTGkZTGtgtmHNkX7k9Ep6vBtmP4nRotmo9rd4JufBupWocY7SiuBTpghnvEu1dlu0ADQT9FFp9nsRi6grPdkDtXOEmGwBDba7aCx86rtTUoUnjC0KbnvaW9+7jUc5paWiLalthFweSvq6c71o0SpTNk7DYtoqVmEZXOLco55WukTz/AMrd4XJMA00sU2RD2awZh7bHyNx1ldKpcbw7tKzJ5FwaQeRBggrzDmVLT7NEL87LNF8MeCJBBHMGQvtaSIREQBERAEREAREQBERAEREAREQHigcV4kygzM6STYNGrjyCl1qga0uOgErmHani7qrywG2/h+36qrLkUTs2cLiPkZNe3uZeMdqH1LN7sW5i+sdOu61ytUqOEuJI1uNtjO6z4SgSRaRMH0lXFXCAiBGxIOsbW5SsHVV92z6aIxcfUyjVsoifz0XjzblPofz6KxxeDhziAB0Gw0VfVYdDNtuSr7ybpcWtov8Ast2mdQc2m4d2couQBLpM6jcwYC6th6oc0OEXG11wEyty7J8Xrlr6TXS8gAA73Heb1An5rXhz6WmcH1TgJJ5Y/JvfF+LikMrAHVNm/eN+ix4LAOqObWxF3atp/pp+I3d8ln4TwptIZnd6ofeceuoHT5q0V8zT+qv4PniNjQDTdLiwZTLgYLQNwVq3Yvs+1k4l/fe8ywuHea3vDNOxcD6QpvFXvxFduHY4ezbBrW1Egls87R4k8lsLu60wNBYeAsE7U9/A+xzTjnD6optxbDJc5zX82y45SPEm/koVOXsBe0F2kgifsfA+oW/9nH5qLmOGh06OE/dUnCOzdMV69Jzny3LkuILSDDoi5FvRZaxdWteH/kV3WmawzMzvMe5pGpYS2D/IDQ+OvVXXDu1uIpmKkVW9e64f3AQfMea8x+BNN5a6zhuP1NO/UdFW1qIGojr+k+X6T8PBZqnJhe5bKE2jofCuPUa4hjodux1nDy3HUSrVcefTIPIi4IsQdiDr5q/4V2trU4bWHtWfuHvtHyd5weq04edNdr7MsVL3OhIouBx1OswPpuDmnlqDyI1B6FS1vTT7okERF6AiIgCIiAIiIAiIgKLtbivZ4Y/ycG/M/RcoLySTzJK6b26bOEJm7SHDrl1+a5kwtc0uFiDDh47+d1z+ZvaPpPRWljb+WWHD6xaY525DXeFOpYltN5nvZoIOkNMnU67fdVFF4BkiylVsYXAtBhrROwsOX2WeL7HSy4uqvs/J7jK4zQOXpYfmvNVjnQ8GJAOnxWQscdZte+35ZZcPAOgJIIHiQQPjC9/cy1Kcc/JV1mwYmY3Hx1Uvh2Kcx7ajdWOa6dwAY9Cvl+HdLhrB1HovjA1Cyo2IIJGaf2zfzUpl9SYyuaxteex3PDVg9jXDRwBHgRKgce4l7GkS273SGjrufL5wqjsrxFjaLmud3W5nAftbM5R0vZZuF0jiKxxLx3WmKbZ5HWOnznkt902kl5f9j4jJHRbl+xZcCwXs6LS4d94Dnk65jeD4aeqtF8kr5zqyZUrRWVeAIbiKjRoe96H/AOlF7SCpTfTxFICWyx8/tN2z0mR5hZaTx/XPbvknyhitcRTD2OY4WcCD5qmZ3DS+Xo98FbxjBivSD2+8Bmb1BElv5uFqLXhwiLb+KueEcbbQpup1Sc1N5YANTrMdBBPmFrfGONUHYiaUgvu4bZuYPX81VdNVKp/lElx8lp1Mt6JDsJLY1jS/yO35ZQq+FLROw15jxCz0cXIUplWVnrDNeDO4ZWYPEVaLhUpOyncatcORG4XReBcXbiKeYDK4Wc3drvqDsVpFWk07QT6eiw4PEuw9ZtVgJaLPANnN3Ec9x1CswusT17Hk05emdTRY2OBAIuCJHUFZF0C4IiIAiIgCIiAIiIDVe3dqDXHTMWHwe0/YLmuEoQ97N8tjzhw+hXWu1WA9thKjAJdGZv8AubcfbzXJqVUMDX5JeHEbjK2Lm5gkzGgWLkLdLfwd30y9Y3rymfDXFZ2UiZPJCxrTecrhmaRy8L+YWN+IiQPXYrAp6X3PolfWux9vMCSdZB/ysft2yAJ290HWLWG6ivqzfqvkVWxp+dPzZTlntQku5sbGNLGiJabyDtE73Mn5KjxDmE5mNcGkEguiHX2vpB3jVY38T7obty8oA8FXOfNmwJ5W/AtG0/BkWNy22zdey8VHMpyYecsjaxeZ6QDHWF1GnRDW5WiAAAByAXMew1enRfnqOiKZdliZjcR0dGikce7Wuc4ta6G7Nyxa5kk6k+AstUtTPUz57kces/Iahfk6C/GUx7z2iLHvCxGoPIqBje0WFZd1Zv8Aac3/AKyuWv448j93Jrrg+PToFCxGMzmcjQdyBr/hRvkJLsaMPozp/U+xu1btNQbin4hr80tyhjg5pAht7jorMduMPkLpAdFhNiVy6tVJtEnnElRPL1us88hzvsb16Lha9zZuPPxFQuc9wcwy4im2W3NwQNepPmtYDQZgFZ6BcCCCbEOEHRw3HXqrlzGVw5zWxWh1gcodoSYJ11uNSb9IN9fdeTdELjpS12+V/shYLGvbqSR8fCfurejxdm5+Gn0VRhsOHdD8tdoVhh+Gg3IzCCIuL7GyhLr2M/K4HFyt01p/YsW8Sp/vHqrXhnDziSAC0MOpkSQNYA3WtV+H5adgRAGvTmpXZnixoVNCRcwOgnTrBHorov60q8HMzej4/wBN3jbbXszrtKmGtDRoAAPACF9rFRqhzWuGjgCPAiVlXRODrR6iIgCIiAIiIAiIgPlab2u7NNdTdVpNh0hzmgWdEyQNjefJbkShUahUtMtw5qxUqk4m1jgyHXaJIB2NpAPx9VW13A6W85XT+13BWZHVmw3TMNj1EaFc3r4QBoe2DMgiQCfCLH5rn5cLR9TwuYsk7Xb/AKQmidVje7Ub7fXT8sp7MA9zcwDoGuYZY9fosZwT795rAIlxcBE891Gcb+DXXIn5MNPFObRdTbZz3HM42DW6arzBcPDy55fkosk5yLlotad/qs3scOxodVq+0OrWMJM794mzQq7imJNWIGVggZAf5GL76+AmyumdeTFkz730/wAlzV4iwQ5vdzNaWjUsZ+nMf3EQ6OZO0KFhqhJl1zv4amOZ8U4tT/6rhm7rGi8bGA0ADfQeSUqLqeRzh77ZHS+niBB815be9E+NKUJ+7LWlgM1MOEl0mNe+A4DMAbgXBUWvRyGCPwq4bjmNY2QSQDe0gEifKYsFBq1yS42vBvebiGn+O8eqrvpNOF3t7RWvpxGZrrmeUiNII+PwT2UyQ23IbD5nxWetULnSST1Km4Knm2kadFTrb0anTidsqnN00+69p1Cx4c3Ufh2srirw5tnOmCJtztBVbiMKWa/KfET+aJqpeyP6k5FoncQAD2PAIbUGY3FnWDhHiQfMqyo4xuR7WA54tpcwY311KhY1ubCUzYEVYubCWunysF5w+sMh93M0WdAkTyPqrm9Pt7mDp6p0/Z6JmJM0xmJaRY3vvGh97mqMOyvDhsQfQrPXrEzJ9AAPh+XUUm8blZ6vdLRtxY+mHs7P2dqA4doGje6PAaK1VF2Taf6YE7kx5QPur0Lsz+1Hw3ISWSkvlnqIikVBERAEREAREQHiL1EBT9p6RdhKoAkhsgc4ufhK4fJDjyPpdfoUhcL7X4M4fFvNMEMzEZdgf2noQQR0IWbkR1JM63pefobj57mKninWzOJA8/wLDiqoeTr0/wArC6cocPdcLfCR5aeRX1SAJusPVS7M+gUxS6kiHWYLx6n7LCIDhOlt9BO5U7EOFwNFBe+PFXQzNljsWnE6QbVc0HVrYFuTSAY6SFhqVXvcXPk8tYaBayzPf7Wkx5MvEh3OxOXy28go7GX8SmXyXcV/Qt+UWOHeC2Dt8P8AKzAEiByi2/iolCysMOJtMba2/NPRZ29s2a0tkV1PcDpbw9VY4Nzmta5om97TNrSBfz2UOtIdIMaieh/Pis9DEgUyASCfK3ReTSTPMqdSW7q7i92Zpa0AwDFyIvJ8+ipOI1Q4xBEH1PNfT8c4TEX3Aj5fkKHVeXHWSbL2sm+yK8OFx3ZMxVRv9GGxBL2mP4w6D039FXUnRurDirGtNOlmALWhzieZsAP/ACP9ygU6GZ2VpDutwAOfgmVN6X4PMDldVPxtszMGbeALknQdSsvDMKa1UU6YL3OtJEBvMmNlHxDQ4+zYO603cf1OFj4AfE+S3/8A084bkBqAWuC6PfdMQ3+LdzzPRWYMO60zPzuZ+nibX4RueAwop02sGjQBPPmfNSkRdU+Pbbe2eoiIeBERAEREAREQBERAeLnv+p3BnupjE0wCWCKoj3mbO/t+R6LoS+HsBBBuDYyo1PUtFmLI8dqkfnWjiGMYGkEhxJOncIAggdbqUS4MgZXg6OAv956FdT4l2EwL2uytNIu3a6wOoIa6QPKFoWP7K1KE99jwTEsPoS3UeImPBZLwM7fH58b86+zNbrE/hUN5Vk/h779LxYW84XuA4WahOoHkZ6CD84CjONrsacvJhrex2exTc/sn+68yOUwQfPlpcRupRojMY21B1EfTqtq7OdiWEZ6r8hMQ1hBfG4LwSBOndv1CteI9jg3M6j3xMhrveYOTXjUdD8VdWJuTLg58TbW+xorGTob/ADUrC3JGYN8fupDuFua4gtIjUCBB8DELC+q0TmYSeYdHyCw1jaZ2Z5KpaRiqkyRb1lYw0kWClYd7C1zhTu2AMxkEm9udgTHRYqjKtSPdAmwENHrM+pUP0dnv/qXhL+TBWpubq0rLhS1g9o/b3W7ud9uqu8B2OrmnnAzE+60GG6a5tx4L13ZXEkAGgQd4dPoS/wCi0RxaT3oyZfU8TTnf9TW3OL3Go8S5x2OtthsBYar1znv7rAWNAk5TpG7juVtFPsxi9Bh2hvWpBnrAM+q2fgHA30WwaVMTqT3ifMq1cem9sxX6nimdLb+Pg0rg/Z6rjK0wWUp7zoAMcgYu71hdZweFbTptpsENaAAOQCyUQYuAPBZAtGLEoX3OTyuXfIa32S8I9XqIrTKEREAREQBERAEREAREQBERAY30mnUKHW4PQf7zAVYIgKV/ZnCmxpiOUmPRKXZnCt92k0K5RD3bIdLh1NvusAWR1A7GFIRDw13ifBKlW+ZhO2ZgK193YqtmzTSd0Id9HLoK9hRcS/KLZz5JWpbRzip2FrON6jQNYBt5CFYcJ7HVKL84e2dpEx4Taeq3deFRnFMvaRZfMzXPTT7EXD0Kg958+SlBq+kVhmPF6iIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiAIiIAiIgP//Z', CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[order_detail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (7, 4, N'Areca Nut

', N'https://sc04.alicdn.com/kf/U8076a16a95694a9f9df2cfe140630d02O.jpg', CAST(0.50 AS Decimal(10, 2)), CAST(1.00 AS Decimal(4, 2)))
INSERT [dbo].[order_detail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (8, 4, N'Tamarind', N'https://product.hstatic.net/200000352097/product/upload_b602f05de2fa4e14bebdb9befc55bd31.jpg', CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(4, 2)))
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [a_id], [totalPrice], [created_date], [shipping_id], [note]) VALUES (1, 1, 6, CAST(N'2022-07-12' AS Date), 2, NULL)
INSERT [dbo].[orders] ([order_id], [a_id], [totalPrice], [created_date], [shipping_id], [note]) VALUES (2, 1, 4000, CAST(N'2022-07-12' AS Date), 3, NULL)
INSERT [dbo].[orders] ([order_id], [a_id], [totalPrice], [created_date], [shipping_id], [note]) VALUES (3, 1, 4004, CAST(N'2022-07-12' AS Date), 4, NULL)
INSERT [dbo].[orders] ([order_id], [a_id], [totalPrice], [created_date], [shipping_id], [note]) VALUES (4, 1, 42.5, CAST(N'2022-07-12' AS Date), 5, NULL)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (1, N'Apple', 150, 1, CAST(N'2022-06-16' AS Date), CAST(N'2022-09-19' AS Date), CAST(2.00 AS Decimal(10, 2)), N'https://healthjade.com/wp-content/uploads/2017/10/apple-fruit.jpg', N'apple, (Malus domestica), fruit of the domesticated tree Malus domestica (family Rosaceae), one of the most widely cultivated tree fruits. The apple is a pome (fleshy) fruit, in which the ripened ovary and surrounding tissue both become fleshy and edible')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (2, N'Apricots', 100, 3, CAST(N'2022-06-19' AS Date), CAST(N'2023-06-19' AS Date), CAST(4.00 AS Decimal(10, 2)), N'https://resources.commerceup.io/?key=https://prod-admin-images.s3.ap-south-1.amazonaws.com/oovzL7_ZJdjcvz-gwxHZ1/product/Dried-Apricot_1.jpg&width=800&resourceKey=oovzL7_ZJdjcvz-gwxHZ1', N'The fruits are drupes with a large flat pit, or stone, within which is the seed. Similar in shape to a peach, the fruit is nearly smooth, round to oblong in some varieties, and somewhat flattened but with little to no hairiness when ripe. Its flesh is typically a rich yellow to yellowish orange')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (3, N'Asian Pears', 60, 1, CAST(N'2022-06-20' AS Date), CAST(N'2022-07-19' AS Date), CAST(2.00 AS Decimal(10, 2)), N'https://www.cmiapples.com/ecom_img/original-14-45-asian-pears.jpg', N'Asian pears are aromatic and have a sweet-tart flavor with delicate floral notes and low acidity. It is important to note that Asian pears retain their firm texture once picked and will not soften when kept in storage')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (4, N'Avocado', 55, 2, CAST(N'2022-06-20' AS Date), CAST(N'2022-06-28' AS Date), CAST(2.00 AS Decimal(10, 2)), N'https://befreshcorp.net/wp-content/uploads/2017/06/product-packshot-Avocado-558x600.jpg', N'Avocado fruits have greenish or yellowish flesh with a buttery consistency and a rich nutty flavour. They are often eaten in salads, and in many parts of the world they are eaten as a dessert')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (5, N'Banana', 150, 2, CAST(N'2022-06-22' AS Date), CAST(N'2022-07-01' AS Date), CAST(1.00 AS Decimal(10, 2)), N'https://img.freepik.com/free-vector/vector-ripe-yellow-banana-bunch-isolated-white-background_1284-45456.jpg', N'The fruit is variable in size, color, and firmness, but is usually elongated and curved, with soft flesh rich in starch covered with a rind, which may be green, yellow, red, purple, or brown when ripe. The fruits grow upward in clusters near the top of the plant.')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (6, N'Barbados Cherries', 200, 1, CAST(N'2022-06-18' AS Date), CAST(N'2022-07-01' AS Date), CAST(1.00 AS Decimal(10, 2)), N'data:image/jpeg;base64,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', N'The Barbados cherry is a small, round to oblate fruit, averaging about 1 inch in diameter. Some of the bright red to deep crimson colored fruit are said to resemble small apples. They have a thin, glossy skin that covers yellow-orange, soft, juicy pulp. The tart to sweet-tart flesh surrounds a number of seeds.')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (7, N'Blueberries', 100, 2, CAST(N'2022-06-23' AS Date), CAST(N'2022-05-07' AS Date), CAST(1.00 AS Decimal(10, 2)), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWCWH4KZUj-sSF7i4u0oyPLQ0Yl2fAvgXKzw&usqp=CAU', N'Blueberries are small round berries about 0.2 to 0.6 inches across. Their color can range from blue to purple. They are often eaten fresh but can also be enjoyed frozen, added to a wide variety of baked goods, or juiced or pureed')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (8, N'Coconut', 30, 2, CAST(N'2022-06-23' AS Date), CAST(N'2022-07-30' AS Date), CAST(2.00 AS Decimal(10, 2)), N'https://images.heb.com/is/image/HEBGrocery/000375273', N'Coconut is the fruit of a tropical palm plant. It has a hard shell, edible white flesh and clear liquid, sometimes referred to as “water,” which is often used as a beverage. Coconut flesh or “meat” is aromatic, chewy in texture and rich in taste.')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (9, N'Crenshaw Melon', 20, 2, CAST(N'2022-06-25' AS Date), CAST(N'2022-07-03' AS Date), CAST(2.00 AS Decimal(10, 2)), N'https://m.media-amazon.com/images/I/313-K2UEI6L._AC_.jpg', N'Crenshaw melons have rough, firm yellow-green to golden yellow rinds with wrinkles or furrows near the stem end. When ripe, their rind will feel slightly waxy. Crenshaw melons are somewhat large and can weigh 8-10 pounds.')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (10, N'Durian', 22, 1, CAST(N'2022-07-10' AS Date), CAST(N'2077-07-30' AS Date), CAST(3.00 AS Decimal(10, 2)), N'https://annam-gourmet.com/wp-content/uploads/2021/08/item_F159062.jpg', N'Durian is a tropical fruit distinguished by its large size and spiky, hard outer shell. It has a pungent smell, custard-like flesh with large seeds. There are several varieties, but the most common one is Durio zibethinus. The fruit''s flesh can range in color')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (11, N'Cactus Pear', 10, 1, CAST(N'2022-06-30' AS Date), CAST(N'2022-09-19' AS Date), CAST(8.00 AS Decimal(10, 2)), N'https://images.medicinenet.com/images/article/main_image/what-is-nopal-good-for.jpg', N'It bears large yellow flowers, 7.5 to 10 cm (3 to 4 inches) across, followed by white, yellow, or reddish purple fruits.')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (12, N'Dates', 100, 3, CAST(N'2022-06-19' AS Date), CAST(N'2023-06-19' AS Date), CAST(4.00 AS Decimal(10, 2)), N'https://i0.wp.com/post.healthline.com/wp-content/uploads/2019/11/medjool-dates-1296x728-header-1296x728.jpg?w=1155&h=1528', N'The date is a one-seeded fruit, or drupe, usually oblong but varying much in shape, size, colour, quality, and consistency of flesh, according to the conditions of culture and the variety. More than 1,000 dates may appear on a single bunch weighing 8 kg (18 pounds) or more.')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (13, N'Grapes', 20, 2, CAST(N'2022-07-01' AS Date), CAST(N'2022-08-30' AS Date), CAST(2.00 AS Decimal(10, 2)), N'https://post.healthline.com/wp-content/uploads/2022/05/black-grapes-732x549-thumbnail-732x549.jpg', N'Grapes are fleshy, rounded fruits that grow in clusters made up of many fruits of greenish, yellowish or purple skin')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (14, N'Guava', 55, 2, CAST(N'2022-06-30' AS Date), CAST(N'2022-07-28' AS Date), CAST(3.00 AS Decimal(10, 2)), N'https://grovefresh.vn/Data/Sites/1/Product/6349/oi-dl-ruot-hong.jpg', N'Guava produces solitary white flowers and a berry fruit. The fruit is oval in shape and green to yellow in color. The flesh inside can be white, yellow, pink or red in color and contains numerous yellowish seeds. Guava can reach grow to 10 m (33 ft) in height and lives for approximately 40 years.')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (15, N'Jackfruit', 50, 1, CAST(N'2022-06-22' AS Date), CAST(N'2022-07-01' AS Date), CAST(1.00 AS Decimal(10, 2)), N'https://vietnamtimes.org.vn/stores/news_dataimages/vietnamfriendshipcomvn/082018/06/14/how-jackfruit-can-be-a-sweet-treat-for-your-baby-14-.0056.jpg', N'Jackfruit is the largest tree-borne fruit in the world, reaching up to 60 cm (about 2 feet) long and weighing up to 18 kg (about 40 pounds). It is ellipsoidal and aggregate, composed of multiple “bulbs” of seed-containing flesh around a stringy core, all of which is enclosed by a bumpy rind.')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (16, N'Jujube', 200, 3, CAST(N'2022-06-30' AS Date), CAST(N'2023-07-30' AS Date), CAST(5.00 AS Decimal(10, 2)), N'https://goodprice.vn/files/common/9-cong-dung-cua-tao-tau-doi-voi-suc-khoe-g7unw.jpg', N'Jujube fruits are small and sweet. Dried, they have a chewy texture and taste similar to dates. When raw, these fruits have a sweet, apple-like flavor and can be eaten as a nutritious snack')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (17, N'Lemon', 100, 1, CAST(N'2022-06-23' AS Date), CAST(N'2022-09-07' AS Date), CAST(1.00 AS Decimal(10, 2)), N'data:image/jpeg;base64,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', N'The lemon is a round, slightly elongated fruit, it has a strong and resistant skin, with an intense bright yellow colour when it is totaly ripe, giving off a special aroma when it is cut. The pulp is pale yellow, juicy and acid, divided in gores.
')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (18, N'Mango', 30, 2, CAST(N'2022-06-23' AS Date), CAST(N'2022-07-30' AS Date), CAST(2.00 AS Decimal(10, 2)), N'https://img.freepik.com/free-photo/ripe-mango-with-green-leaf-isolated-white_252965-183.jpg?w=2000', N'The fruit varies greatly in size and character. Its form is oval, round, heart-shaped, kidney-shaped, or long and slender. The smallest mangoes are no larger than plums, while others may weigh 1.8 to 2.3 kg (4 to 5 pounds).')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (19, N'Orange', 50, 2, CAST(N'2022-06-25' AS Date), CAST(N'2022-07-15' AS Date), CAST(1.00 AS Decimal(10, 2)), N'https://barthfruit.ch/custom/images/contentBilder/big/orange.jpg', N'The term orange may refer to a number of citrus trees that produces fruit for people to eat. Oranges are a very good source of Vitamin C.[1] Orange juice is an important part of many people''s breakfast. The "sweet orange", which is the kind that are most often eaten today, grew first in South and East Asia but now grows in lots of parts of the world.')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (20, N'Watermelon', 22, 1, CAST(N'2022-07-10' AS Date), CAST(N'2077-07-30' AS Date), CAST(3.00 AS Decimal(10, 2)), N'https://santorino.org/wp-content/uploads/2021/07/an-dua-hau-do-nhieu-vitamin.jpg', N'WatermelonThe watermelon is a large fruit of a more or less spherical shape. It is usually eaten raw as table dessert. It has a sweet reddish or yellowish flesh. It is a very refreshing food that supplies very few calories. It also provides some vitamins and minerals')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (21, N'Longan', 55, 2, CAST(N'2022-07-04' AS Date), CAST(N'2022-11-08' AS Date), CAST(5.00 AS Decimal(10, 2)), N'https://media.istockphoto.com/photos/longan-fruit-on-a-white-background-picture-id485619126', N'Longan fruit has a musky flavour, while lychee has a floral taste. Unlike fresh lychees, it is pretty challenging to find fresh longans. You will often find them frozen, canned, or dried in grocery stores. In other words, fresh varieties of this fruit are not very easily available.

')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (22, N'Pineapple', 100, 1, CAST(N'2022-06-30' AS Date), CAST(N'2022-07-30' AS Date), CAST(3.00 AS Decimal(10, 2)), N'https://annam-gourmet.com/wp-content/uploads/2021/08/item_F137312-1.jpg', N'The pineapple (Ananas comosus) is a tropical plant with an edible fruit; it is the most economically significant plant in the family Bromeliaceae.
')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (23, N'Salak', 20, 3, CAST(N'2022-07-04' AS Date), CAST(N'2022-12-12' AS Date), CAST(6.00 AS Decimal(10, 2)), N'https://cdn.tridge.com/attachment/75b68201059a8c2e17e32d11474feae0552d893a.jpg', N'Salak (Salacca zalacca) is a species of palm tree (family Arecaceae) native to Java and Sumatra in Indonesia. It is cultivated in other regions of Indonesia as a food crop, and reportedly naturalized in Bali, Lombok, Timor, Maluku, and Sulawesi.[1][2]

The salak Salacca glabrecens was featured on a Malaysian stamp, issued 27 February 1999 under the rare fruits series of stamps.[3]')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (24, N'Yangmei', 33, 1, CAST(N'2022-05-03' AS Date), CAST(N'2022-06-03' AS Date), CAST(2.00 AS Decimal(10, 2)), N'https://img.freepik.com/free-photo/fresh-waxberry-yangmei-myrica-rubra-isolated-white-background_62856-5455.jpg', N'angmei fruit trees are evergreens that produce purplish round fruit that looks somewhat like a berry, hence their alternate name of Chinese strawberry. The fruit is actually not a berry, however, but a drupe like cherries.')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (26, N'Tejocote', 10, 3, CAST(N'2022-07-15' AS Date), CAST(N'2022-09-15' AS Date), CAST(1.00 AS Decimal(10, 2)), N'https://images.heb.com/is/image/HEBGrocery/001021639', N'Tejocote is the common name for Crataegus mexicana and 14 other species of Mexican hawthorns, native to the country''s highlands; the name is derived from the Nahuatl word “texocotl,” meaning stone fruit. In Guatemala, where the fruit also grows, it is called manzanilla, meaning little apple.')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (29, N'Areca Nut

', 11, 3, CAST(N'2022-06-06' AS Date), CAST(N'2023-06-06' AS Date), CAST(0.50 AS Decimal(10, 2)), N'https://sc04.alicdn.com/kf/U8076a16a95694a9f9df2cfe140630d02O.jpg', N'Betel nut is the seed of the fruit of the areca palm. It is also known as areca nut. The common names, preparations and specific ingredients vary by cultural group and individuals who use it.')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (30, N'Olives', 22, 3, CAST(N'2022-06-05' AS Date), CAST(N'2023-05-05' AS Date), CAST(0.50 AS Decimal(10, 2)), N'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2012/9/26/0/HE_olives_s4x3.jpg.rend.hgtvcom.616.462.suffix/1371610221577.jpeg', N'Olives are small fruits that grow on olive trees (Olea europaea). They belong to a group of fruit called drupes, or stone fruits, and are related to mangoes, cherries, peaches, almonds, and pistachios.')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (31, N'Pitaya', 10, 2, CAST(N'2022-07-16' AS Date), CAST(N'2023-01-06' AS Date), CAST(3.00 AS Decimal(10, 2)), N'https://png.pngtree.com/png-vector/20201011/ourlarge/pngtree-delicious-pitaya-png-image_2351162.jpg', N'Bright even coloured skin without too many blotches. A just ripe fruit will yield to slight pressure.

')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (32, N'Tamarind', 20, 3, CAST(N'2022-06-09' AS Date), CAST(N'2023-06-09' AS Date), CAST(1.00 AS Decimal(10, 2)), N'https://product.hstatic.net/200000352097/product/upload_b602f05de2fa4e14bebdb9befc55bd31.jpg', N'The bean-shaped thick pod in which the sticky pulp or fruit of the tamarind grows. The pods can vary in size from two to seven inches in length, and one inch in width.

')
INSERT [dbo].[products] ([product_id], [product_name], [product_quantity], [category_id], [date_manufacture], [date_expriration], [list_price], [product_img], [product_description]) VALUES (33, N'STRAWBERRIES', 150, 1, CAST(N'2022-07-05' AS Date), CAST(N'2022-07-20' AS Date), CAST(2.00 AS Decimal(10, 2)), N'https://www.eatthis.com/wp-content/uploads/sites/4/2021/08/strawberries-white-bowl.jpg?quality=82&strip=1', N'Firm, plump berries that are fully red with bright green caps. Strawberries do not ripen once picked.

')
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[shipping] ON 

INSERT [dbo].[shipping] ([id], [name], [email], [phone], [address]) VALUES (1, N'Van Quyet', NULL, N'0978178888', N'Hn')
INSERT [dbo].[shipping] ([id], [name], [email], [phone], [address]) VALUES (2, N'Pham Ba Long', N'longpbhe150090@fpt.edu.vn', N'0156489484', N'Hn')
INSERT [dbo].[shipping] ([id], [name], [email], [phone], [address]) VALUES (3, N'Debraaaa', N'qdev0102@gmail.com', N'12342343543', N'Lào')
INSERT [dbo].[shipping] ([id], [name], [email], [phone], [address]) VALUES (4, N'', N'', N'', N'')
INSERT [dbo].[shipping] ([id], [name], [email], [phone], [address]) VALUES (5, N'quao', N'hihihaha@gmail.com', N'12342343543', N'Hn')
SET IDENTITY_INSERT [dbo].[shipping] OFF
GO
ALTER TABLE [dbo].[order_detail] ADD  CONSTRAINT [DF__order_ite__disco__34C8D9D1]  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[orders] ADD  CONSTRAINT [DF_orders_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_orders]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_account] FOREIGN KEY([a_id])
REFERENCES [dbo].[account] ([a_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_account]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_shipping] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[shipping] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_shipping]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK__products__catego__3B75D760] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([category_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK__products__catego__3B75D760]
GO
USE [master]
GO
ALTER DATABASE [FruitShop] SET  READ_WRITE 
GO
