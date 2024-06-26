USE [master]
GO
/****** Object:  Database [Cinema_Managment_System]    Script Date: 6/20/2023 10:54:50 PM ******/
CREATE DATABASE [Cinema_Managment_System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cinema_Managment_System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Cinema_Managment_System.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cinema_Managment_System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Cinema_Managment_System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Cinema_Managment_System] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cinema_Managment_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cinema_Managment_System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cinema_Managment_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cinema_Managment_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cinema_Managment_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cinema_Managment_System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET RECOVERY FULL 
GO
ALTER DATABASE [Cinema_Managment_System] SET  MULTI_USER 
GO
ALTER DATABASE [Cinema_Managment_System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cinema_Managment_System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cinema_Managment_System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cinema_Managment_System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cinema_Managment_System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cinema_Managment_System] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Cinema_Managment_System', N'ON'
GO
ALTER DATABASE [Cinema_Managment_System] SET QUERY_STORE = ON
GO
ALTER DATABASE [Cinema_Managment_System] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Cinema_Managment_System]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[movie_id] [int] NOT NULL,
	[title] [varchar](255) NULL,
	[genre_id] [int] NULL,
	[Movie_Cover] [varchar](255) NULL,
	[MovieStatusID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetAllMovieIDs]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetAllMovieIDs]()
RETURNS TABLE
AS
RETURN
(
    SELECT movie_id
    FROM Movie
)
GO
/****** Object:  Table [dbo].[MovieDetails]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieDetails](
	[MovieId] [int] NOT NULL,
	[Duration] [int] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Trailer] [varchar](max) NOT NULL,
	[Reviews] [varchar](max) NOT NULL,
	[Rating] [int] NOT NULL,
	[Cast] [varchar](max) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[Movietype] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hall]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hall](
	[hall_id] [int] NOT NULL,
	[hall_name] [varchar](255) NULL,
	[capacity] [int] NULL,
	[cinema_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[hall_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[AssignHallsToMovies]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AssignHallsToMovies]()
RETURNS TABLE
AS
RETURN
(
    WITH AvailableHalls AS (
        SELECT hall_id, Capacity, COUNT(*) AS ScreeningsCount
        FROM Hall
        GROUP BY hall_id, Capacity
    ),
    MoviesToAssign AS (
        SELECT M.movie_id, MD.Rating, M.MovieStatusID
        FROM Movie M
        JOIN MovieDetails MD ON M.movie_id = MD.movieid
        WHERE M.MovieStatusID = 1
    ),
    MoviesWithHall AS (
        SELECT MT.movie_id, AH.hall_id, AH.Capacity, MT.Rating,
               ROW_NUMBER() OVER (ORDER BY CASE WHEN MT.Rating >= 7 THEN AH.Capacity ELSE AH.Capacity - 1 END DESC) AS RowNum
        FROM MoviesToAssign MT
        LEFT JOIN AvailableHalls AH ON AH.ScreeningsCount < 5
    )
    SELECT movie_id, hall_id, Rating
    FROM MoviesWithHall
    WHERE RowNum = 1
)
GO
/****** Object:  Table [dbo].[Cinema_Site]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema_Site](
	[cinema_id] [int] NOT NULL,
	[cinema_name] [varchar](255) NULL,
	[location] [varchar](255) NULL,
	[contact_info] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[cinema_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CinemaHall]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CinemaHall](
	[cinema_hall_id] [int] NOT NULL,
	[cinema_id] [int] NULL,
	[hall_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cinema_hall_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[password] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[employee_id] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[contact_info] [varchar](255) NULL,
	[role_id] [int] NULL,
	[Password] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeRole]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeRole](
	[role_id] [int] NOT NULL,
	[role_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[genre_id] [int] NOT NULL,
	[genre_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[invoice_id] [int] NOT NULL,
	[customer_id] [int] NULL,
	[sale_id] [int] NULL,
	[amount] [decimal](10, 2) NULL,
	[invoice_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieStatus]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieStatus](
	[StatusID] [int] NOT NULL,
	[StatusName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieType]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieType](
	[TypeId] [int] NOT NULL,
	[Type] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payment_id] [int] NOT NULL,
	[reservation_id] [int] NULL,
	[amount] [decimal](10, 2) NULL,
	[payment_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[report_id] [int] NOT NULL,
	[report_type] [varchar](50) NULL,
	[report_date] [date] NULL,
	[report_content] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[report_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[reservation_id] [int] NOT NULL,
	[screening_id] [int] NULL,
	[customer_id] [int] NULL,
	[reservation_date] [date] NULL,
	[status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[review_id] [int] NOT NULL,
	[movie_id] [int] NULL,
	[customer_id] [int] NULL,
	[rating] [int] NULL,
	[comment] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[sales_id] [int] NOT NULL,
	[ticket_id] [int] NULL,
	[sale_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[sales_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Screening]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Screening](
	[screening_id] [int] NOT NULL,
	[movie_id] [int] NULL,
	[hall_id] [int] NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[screening_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seat]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seat](
	[seat_id] [int] NOT NULL,
	[hall_id] [int] NULL,
	[seat_number] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[seat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Showtime]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Showtime](
	[showtime_id] [int] NOT NULL,
	[screening_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[showtime_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 6/20/2023 10:54:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[ticket_id] [int] NOT NULL,
	[screening_id] [int] NULL,
	[seat_number] [varchar](10) NULL,
	[customer_id] [int] NULL,
	[price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cinema_Site] ([cinema_id], [cinema_name], [location], [contact_info]) VALUES (1, N'CineVerse', N'Main Rashid Minas Road', N'0300-2283439')
GO
INSERT [dbo].[CinemaHall] ([cinema_hall_id], [cinema_id], [hall_id]) VALUES (1, 1, 1)
INSERT [dbo].[CinemaHall] ([cinema_hall_id], [cinema_id], [hall_id]) VALUES (2, 1, 2)
INSERT [dbo].[CinemaHall] ([cinema_hall_id], [cinema_id], [hall_id]) VALUES (3, 1, 3)
INSERT [dbo].[CinemaHall] ([cinema_hall_id], [cinema_id], [hall_id]) VALUES (4, 1, 4)
INSERT [dbo].[CinemaHall] ([cinema_hall_id], [cinema_id], [hall_id]) VALUES (5, 1, 5)
INSERT [dbo].[CinemaHall] ([cinema_hall_id], [cinema_id], [hall_id]) VALUES (6, 1, 6)
INSERT [dbo].[CinemaHall] ([cinema_hall_id], [cinema_id], [hall_id]) VALUES (7, 1, 7)
INSERT [dbo].[CinemaHall] ([cinema_hall_id], [cinema_id], [hall_id]) VALUES (8, 1, 8)
INSERT [dbo].[CinemaHall] ([cinema_hall_id], [cinema_id], [hall_id]) VALUES (9, 1, 9)
INSERT [dbo].[CinemaHall] ([cinema_hall_id], [cinema_id], [hall_id]) VALUES (10, 1, 10)
GO
INSERT [dbo].[Customer] ([customer_id], [name], [email], [phone], [password]) VALUES (1, N'Arham', N'Arham@gmail.com', N'123-456-7890', N'   \"ãWZ¿i˜ò»6u®féZ6[Ó…€¥ËÊµOZ#ˆjQö$ýM¨Ê5p3F''')
INSERT [dbo].[Customer] ([customer_id], [name], [email], [phone], [password]) VALUES (2, N'Fatima', N'null', N'0324', N'   I|é8æûàÂHÚEŠ3ûJ›è<íÿ)×Mpûæ')
INSERT [dbo].[Customer] ([customer_id], [name], [email], [phone], [password]) VALUES (3, N'ZA13163', N'zuhaibak201@gmail.com', N'03151077956', N'   *»YØÔ?Q¼FQ2‡ˆ‡ˆû÷#÷¤Ïì`Ø§˜³º')
GO
INSERT [dbo].[Employee] ([employee_id], [name], [contact_info], [role_id], [Password]) VALUES (1, N'Arham', N'3002283439', 1, N'   ›xEþ7uÁ =f«Mo=E=¤à’¢g¹ßÅÚ¢õ™hA˜fñ¡çmŒc—Ô')
INSERT [dbo].[Employee] ([employee_id], [name], [contact_info], [role_id], [Password]) VALUES (2, N'Fatima', N'3362571789', 2, N'   bÎJ#®ˆ™¶³Ïøzø&œç9ÿ4~:^½…ÖãTÁbXëáÖkžå©ŠŽˆfn')
GO
INSERT [dbo].[EmployeeRole] ([role_id], [role_name]) VALUES (1, N'Manager')
INSERT [dbo].[EmployeeRole] ([role_id], [role_name]) VALUES (2, N'Staff')
GO
INSERT [dbo].[Genre] ([genre_id], [genre_name]) VALUES (1, N'Action')
INSERT [dbo].[Genre] ([genre_id], [genre_name]) VALUES (2, N'Comedy')
INSERT [dbo].[Genre] ([genre_id], [genre_name]) VALUES (3, N'Superhero')
INSERT [dbo].[Genre] ([genre_id], [genre_name]) VALUES (4, N'Fantasy')
INSERT [dbo].[Genre] ([genre_id], [genre_name]) VALUES (5, N'Sci-Fi')
INSERT [dbo].[Genre] ([genre_id], [genre_name]) VALUES (6, N'Horror')
INSERT [dbo].[Genre] ([genre_id], [genre_name]) VALUES (7, N'Animation')
INSERT [dbo].[Genre] ([genre_id], [genre_name]) VALUES (8, N'Adventure')
INSERT [dbo].[Genre] ([genre_id], [genre_name]) VALUES (9, N'Drama')
INSERT [dbo].[Genre] ([genre_id], [genre_name]) VALUES (10, N'Thriller')
INSERT [dbo].[Genre] ([genre_id], [genre_name]) VALUES (11, N'Crime')
INSERT [dbo].[Genre] ([genre_id], [genre_name]) VALUES (12, N'Romance')
INSERT [dbo].[Genre] ([genre_id], [genre_name]) VALUES (13, N'Biography')
GO
INSERT [dbo].[Hall] ([hall_id], [hall_name], [capacity], [cinema_id]) VALUES (1, N'Cinema 1', 100, 1)
INSERT [dbo].[Hall] ([hall_id], [hall_name], [capacity], [cinema_id]) VALUES (2, N'Cinema 2', 150, 1)
INSERT [dbo].[Hall] ([hall_id], [hall_name], [capacity], [cinema_id]) VALUES (3, N'Cinema 3', 100, 1)
INSERT [dbo].[Hall] ([hall_id], [hall_name], [capacity], [cinema_id]) VALUES (4, N'Cinema 4', 200, 1)
INSERT [dbo].[Hall] ([hall_id], [hall_name], [capacity], [cinema_id]) VALUES (5, N'Cinema 5', 150, 1)
INSERT [dbo].[Hall] ([hall_id], [hall_name], [capacity], [cinema_id]) VALUES (6, N'Cinema 6', 50, 1)
INSERT [dbo].[Hall] ([hall_id], [hall_name], [capacity], [cinema_id]) VALUES (7, N'Cinema 7', 100, 1)
INSERT [dbo].[Hall] ([hall_id], [hall_name], [capacity], [cinema_id]) VALUES (8, N'Cinema 8', 200, 1)
INSERT [dbo].[Hall] ([hall_id], [hall_name], [capacity], [cinema_id]) VALUES (9, N'Cinema 9', 250, 1)
INSERT [dbo].[Hall] ([hall_id], [hall_name], [capacity], [cinema_id]) VALUES (10, N'Cinema 10', 150, 1)
GO
INSERT [dbo].[Movie] ([movie_id], [title], [genre_id], [Movie_Cover], [MovieStatusID]) VALUES (1, N'Fast X', 1, N'C:\Users\Arham\Downloads\ProjectCinema\ProjectCinema\Resources\6.jpg', 1)
INSERT [dbo].[Movie] ([movie_id], [title], [genre_id], [Movie_Cover], [MovieStatusID]) VALUES (2, N'The Little Mermaid', 4, N'C:\Users\Arham\Downloads\ProjectCinema\ProjectCinema\Resources\11.jpg', 1)
INSERT [dbo].[Movie] ([movie_id], [title], [genre_id], [Movie_Cover], [MovieStatusID]) VALUES (3, N'Acid Man', 3, N'C:\Users\Arham\Downloads\ProjectCinema\ProjectCinema\Resources\2.jpg', 1)
INSERT [dbo].[Movie] ([movie_id], [title], [genre_id], [Movie_Cover], [MovieStatusID]) VALUES (4, N'Elemental', 4, N'C:\Users\Arham\Downloads\ProjectCinema\ProjectCinema\Resources\111.jpg', 1)
INSERT [dbo].[Movie] ([movie_id], [title], [genre_id], [Movie_Cover], [MovieStatusID]) VALUES (5, N'Quantumania', 3, N'C:\Users\Arham\Downloads\ProjectCinema\ProjectCinema\Resources\5.jpg', 1)
INSERT [dbo].[Movie] ([movie_id], [title], [genre_id], [Movie_Cover], [MovieStatusID]) VALUES (6, N'GOTG 3', 3, N'C:\Users\Arham\Downloads\ProjectCinema\ProjectCinema\Resources\8.jpg', 1)
INSERT [dbo].[Movie] ([movie_id], [title], [genre_id], [Movie_Cover], [MovieStatusID]) VALUES (7, N'Avatar 2', 4, N'C:\Users\Arham\Downloads\ProjectCinema\ProjectCinema\Resources\4.jpg', 1)
INSERT [dbo].[Movie] ([movie_id], [title], [genre_id], [Movie_Cover], [MovieStatusID]) VALUES (8, N'Evil Dead Rise', 6, N'C:\Users\Arham\Downloads\ProjectCinema\ProjectCinema\Resources\9.jpg', 1)
INSERT [dbo].[Movie] ([movie_id], [title], [genre_id], [Movie_Cover], [MovieStatusID]) VALUES (9, N'Barbie', 4, N'C:\Users\Arham\Downloads\ProjectCinema\ProjectCinema\Resources\7.jpg', 2)
INSERT [dbo].[Movie] ([movie_id], [title], [genre_id], [Movie_Cover], [MovieStatusID]) VALUES (10, N'Allahyar', 4, N'C:\Users\Arham\Downloads\ProjectCinema\ProjectCinema\Resources\10.jpg', 2)
INSERT [dbo].[Movie] ([movie_id], [title], [genre_id], [Movie_Cover], [MovieStatusID]) VALUES (11, N'DalDal', 9, N'C:\Users\Arham\Downloads\ProjectCinema\ProjectCinema\Resources\121.jpg', 2)
INSERT [dbo].[Movie] ([movie_id], [title], [genre_id], [Movie_Cover], [MovieStatusID]) VALUES (12, N'The Boogeyman', 6, N'C:\Users\Arham\Downloads\ProjectCinema\ProjectCinema\Resources\14.jpg', 2)
INSERT [dbo].[Movie] ([movie_id], [title], [genre_id], [Movie_Cover], [MovieStatusID]) VALUES (13, N'Blue Beetle', 3, N'C:\Users\Arham\Downloads\ProjectCinema\ProjectCinema\Resources\13.jpg', 2)
INSERT [dbo].[Movie] ([movie_id], [title], [genre_id], [Movie_Cover], [MovieStatusID]) VALUES (14, N'Mojave Diamonds', 9, N'C:\Users\Arham\Downloads\ProjectCinema\ProjectCinema\Resources\16.jpg', 2)
INSERT [dbo].[Movie] ([movie_id], [title], [genre_id], [Movie_Cover], [MovieStatusID]) VALUES (15, N'Deewana', 12, N'C:\Users\Arham\Downloads\ProjectCinema\ProjectCinema\Resources\15.jpg', 2)
INSERT [dbo].[Movie] ([movie_id], [title], [genre_id], [Movie_Cover], [MovieStatusID]) VALUES (16, N'Adam Driver 65', 13, N'C:\Users\Arham\Downloads\ProjectCinema\ProjectCinema\Resources\3.jpg', 2)
INSERT [dbo].[Movie] ([movie_id], [title], [genre_id], [Movie_Cover], [MovieStatusID]) VALUES (20, N'dfgdf', 4, N'C:\Users\Arham\Downloads\ProjectCinema\ProjectCinema\Resources\7.jpg', 1)
GO
INSERT [dbo].[MovieDetails] ([MovieId], [Duration], [Description], [Trailer], [Reviews], [Rating], [Cast], [ReleaseDate], [Movietype]) VALUES (1, 120, N'An action-packed movie about street racing', N'https://www.dailymotion.com/video/x8i6xlp', N'Great movie!', 9, N'Vin Diesel, Michelle Rodriguez', CAST(N'2023-06-17' AS Date), 1)
INSERT [dbo].[MovieDetails] ([MovieId], [Duration], [Description], [Trailer], [Reviews], [Rating], [Cast], [ReleaseDate], [Movietype]) VALUES (2, 120, N'A classic Disney animated film about a young mermaid', N'https://www.dailymotion.com/video/x8j1qjw', N'Amazing movie!', 8, N'Jodi Benson, Samuel E. Wright', CAST(N'2022-07-29' AS Date), 1)
INSERT [dbo].[MovieDetails] ([MovieId], [Duration], [Description], [Trailer], [Reviews], [Rating], [Cast], [ReleaseDate], [Movietype]) VALUES (3, 105, N'A thrilling action movie about a superhero with acidic powers', N'https://www.dailymotion.com/video/x8iy4v0', N'Mind-blowing action!', 7, N'Tom Hardy, Emma Stone', CAST(N'2023-02-17' AS Date), 1)
INSERT [dbo].[MovieDetails] ([MovieId], [Duration], [Description], [Trailer], [Reviews], [Rating], [Cast], [ReleaseDate], [Movietype]) VALUES (4, 130, N'A fantasy adventure movie featuring the four elements', N'https://www.dailymotion.com/video/x8jj6tm', N'Epic fantasy!', 9, N'Chris Hemsworth, Zendaya', CAST(N'2023-08-25' AS Date), 1)
INSERT [dbo].[MovieDetails] ([MovieId], [Duration], [Description], [Trailer], [Reviews], [Rating], [Cast], [ReleaseDate], [Movietype]) VALUES (5, 118, N'The next chapter in the Ant-Man series', N'https://www.dailymotion.com/video/x8h2qrj', N'Hilarious and action-packed!', 8, N'Paul Rudd, Evangeline Lilly', CAST(N'2023-11-03' AS Date), 1)
INSERT [dbo].[MovieDetails] ([MovieId], [Duration], [Description], [Trailer], [Reviews], [Rating], [Cast], [ReleaseDate], [Movietype]) VALUES (6, 140, N'The final installment of the Guardians of the Galaxy trilogy', N'https://www.dailymotion.com/video/x8fzquj', N'Emotional and action-packed!', 9, N'Chris Pratt, Zoe Saldana', CAST(N'2023-05-05' AS Date), 1)
INSERT [dbo].[MovieDetails] ([MovieId], [Duration], [Description], [Trailer], [Reviews], [Rating], [Cast], [ReleaseDate], [Movietype]) VALUES (7, 150, N'The highly anticipated sequel to Avatar', N'https://www.dailymotion.com/video/x8fr0h6', N'Visually stunning!', 9, N'Sam Worthington, Zoe Saldana', CAST(N'2024-12-19' AS Date), 1)
INSERT [dbo].[MovieDetails] ([MovieId], [Duration], [Description], [Trailer], [Reviews], [Rating], [Cast], [ReleaseDate], [Movietype]) VALUES (8, 95, N'A new installment in the Evil Dead horror franchise', N'https://www.dailymotion.com/video/x8gwqkr', N'Terrifying and intense!', 8, N'Jane Levy, Shiloh Fernandez', CAST(N'2023-10-20' AS Date), 1)
INSERT [dbo].[MovieDetails] ([MovieId], [Duration], [Description], [Trailer], [Reviews], [Rating], [Cast], [ReleaseDate], [Movietype]) VALUES (9, 90, N'A story about Barbie and her adventures', N'https://www.dailymotion.com/video/x8jstbh', N'Entertaining and fun!', 9, N'Margot Robbie, Ryan Gosling', CAST(N'2022-05-15' AS Date), 1)
INSERT [dbo].[MovieDetails] ([MovieId], [Duration], [Description], [Trailer], [Reviews], [Rating], [Cast], [ReleaseDate], [Movietype]) VALUES (10, 105, N'A thrilling adventure of Allahyar', N'https://www.dailymotion.com/video/x8jstbh', N'Amazing animation and heartfelt story.', 8, N'Azfar Jafri, Natasha Humera Ejaz', CAST(N'2020-07-20' AS Date), 1)
INSERT [dbo].[MovieDetails] ([MovieId], [Duration], [Description], [Trailer], [Reviews], [Rating], [Cast], [ReleaseDate], [Movietype]) VALUES (11, 130, N'A gripping drama set in a tumultuous environment', N'https://www.youtube.com/watch?v=6wOsGWocjOs', N'Powerful performances and thought-provoking storyline.', 9, N'Zahid Ahmed, Armeena Khan', CAST(N'2019-11-12' AS Date), 1)
INSERT [dbo].[MovieDetails] ([MovieId], [Duration], [Description], [Trailer], [Reviews], [Rating], [Cast], [ReleaseDate], [Movietype]) VALUES (12, 110, N'A terrifying horror movie about the Boogeyman', N'https://www.dailymotion.com/video/x8k6r1w', N'Scary and intense! Kept me on the edge of my seat.', 8, N'Sophie Thatcher, David Dastmalchian', CAST(N'2021-10-28' AS Date), 1)
INSERT [dbo].[MovieDetails] ([MovieId], [Duration], [Description], [Trailer], [Reviews], [Rating], [Cast], [ReleaseDate], [Movietype]) VALUES (13, 125, N'An action-packed adventure of the Blue Beetle', N'https://www.dailymotion.com/video/x8jq5he', N'A thrilling superhero movie with great visual effects.', 9, N'Xolo Maridueña, Bruna Marquezine', CAST(N'2023-03-17' AS Date), 1)
INSERT [dbo].[MovieDetails] ([MovieId], [Duration], [Description], [Trailer], [Reviews], [Rating], [Cast], [ReleaseDate], [Movietype]) VALUES (14, 140, N'A thrilling crime drama set in the Mojave Desert', N'https://www.dailymotion.com/video/x8jdoy6', N'An engaging story with a surprising twist.', 7, N'Weston Cage, Donald Cerrone', CAST(N'2022-08-05' AS Date), 1)
INSERT [dbo].[MovieDetails] ([MovieId], [Duration], [Description], [Trailer], [Reviews], [Rating], [Cast], [ReleaseDate], [Movietype]) VALUES (15, 135, N'A passionate romantic drama', N'https://www.dailymotion.com/playlist/x4hn9p', N'Heartwarming and beautifully acted.', 9, N'Shafiq-ur Rehman, Zara Akbar', CAST(N'2018-04-06' AS Date), 1)
INSERT [dbo].[MovieDetails] ([MovieId], [Duration], [Description], [Trailer], [Reviews], [Rating], [Cast], [ReleaseDate], [Movietype]) VALUES (16, 115, N'A captivating biographical drama about Adam Driver', N'https://www.youtube.com/watch?v=bHXejJq5vr0', N'Outstanding performance by Adam Driver.', 9, N'Adam Driver, Ariana Greenblatt', CAST(N'2023-01-10' AS Date), 1)
INSERT [dbo].[MovieDetails] ([MovieId], [Duration], [Description], [Trailer], [Reviews], [Rating], [Cast], [ReleaseDate], [Movietype]) VALUES (20, 45, N'g', N'f', N'd', 6, N'f', CAST(N'2023-06-07' AS Date), 1)
GO
INSERT [dbo].[MovieStatus] ([StatusID], [StatusName]) VALUES (1, N'Now Showing')
INSERT [dbo].[MovieStatus] ([StatusID], [StatusName]) VALUES (2, N'Coming Soon')
GO
INSERT [dbo].[MovieType] ([TypeId], [Type]) VALUES (1, N'Digital 2D')
INSERT [dbo].[MovieType] ([TypeId], [Type]) VALUES (2, N'Digital 3D')
GO
INSERT [dbo].[Screening] ([screening_id], [movie_id], [hall_id], [start_time], [end_time]) VALUES (1, 1, 1, CAST(N'2023-06-30T15:00:00.000' AS DateTime), CAST(N'2023-06-30T17:00:00.000' AS DateTime))
INSERT [dbo].[Screening] ([screening_id], [movie_id], [hall_id], [start_time], [end_time]) VALUES (2, 2, 2, CAST(N'2023-06-30T15:00:00.000' AS DateTime), CAST(N'2023-06-30T17:00:00.000' AS DateTime))
INSERT [dbo].[Screening] ([screening_id], [movie_id], [hall_id], [start_time], [end_time]) VALUES (3, 3, 3, CAST(N'2023-06-30T15:00:00.000' AS DateTime), CAST(N'2023-06-30T17:00:00.000' AS DateTime))
INSERT [dbo].[Screening] ([screening_id], [movie_id], [hall_id], [start_time], [end_time]) VALUES (4, 4, 5, CAST(N'2023-06-30T15:00:00.000' AS DateTime), CAST(N'2023-06-30T17:00:00.000' AS DateTime))
INSERT [dbo].[Screening] ([screening_id], [movie_id], [hall_id], [start_time], [end_time]) VALUES (6, 6, 6, CAST(N'2023-06-30T15:00:00.000' AS DateTime), CAST(N'2023-06-30T17:00:00.000' AS DateTime))
INSERT [dbo].[Screening] ([screening_id], [movie_id], [hall_id], [start_time], [end_time]) VALUES (7, 7, 7, CAST(N'2023-06-30T15:00:00.000' AS DateTime), CAST(N'2023-06-30T17:00:00.000' AS DateTime))
GO
INSERT [dbo].[Showtime] ([showtime_id], [screening_id]) VALUES (1, 1)
INSERT [dbo].[Showtime] ([showtime_id], [screening_id]) VALUES (2, 2)
INSERT [dbo].[Showtime] ([showtime_id], [screening_id]) VALUES (3, 3)
INSERT [dbo].[Showtime] ([showtime_id], [screening_id]) VALUES (4, 4)
INSERT [dbo].[Showtime] ([showtime_id], [screening_id]) VALUES (6, 6)
INSERT [dbo].[Showtime] ([showtime_id], [screening_id]) VALUES (7, 7)
GO
ALTER TABLE [dbo].[CinemaHall]  WITH CHECK ADD FOREIGN KEY([cinema_id])
REFERENCES [dbo].[Cinema_Site] ([cinema_id])
GO
ALTER TABLE [dbo].[CinemaHall]  WITH CHECK ADD FOREIGN KEY([hall_id])
REFERENCES [dbo].[Hall] ([hall_id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmployeeRole] FOREIGN KEY([role_id])
REFERENCES [dbo].[EmployeeRole] ([role_id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_EmployeeRole]
GO
ALTER TABLE [dbo].[Hall]  WITH CHECK ADD FOREIGN KEY([cinema_id])
REFERENCES [dbo].[Cinema_Site] ([cinema_id])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([sale_id])
REFERENCES [dbo].[Sales] ([sales_id])
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD FOREIGN KEY([genre_id])
REFERENCES [dbo].[Genre] ([genre_id])
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_MovieStatus] FOREIGN KEY([MovieStatusID])
REFERENCES [dbo].[MovieStatus] ([StatusID])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_MovieStatus]
GO
ALTER TABLE [dbo].[MovieDetails]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([movie_id])
GO
ALTER TABLE [dbo].[MovieDetails]  WITH CHECK ADD FOREIGN KEY([Movietype])
REFERENCES [dbo].[MovieType] ([TypeId])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([reservation_id])
REFERENCES [dbo].[Reservation] ([reservation_id])
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD FOREIGN KEY([screening_id])
REFERENCES [dbo].[Screening] ([screening_id])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movie] ([movie_id])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([ticket_id])
REFERENCES [dbo].[Ticket] ([ticket_id])
GO
ALTER TABLE [dbo].[Screening]  WITH CHECK ADD FOREIGN KEY([hall_id])
REFERENCES [dbo].[Hall] ([hall_id])
GO
ALTER TABLE [dbo].[Screening]  WITH CHECK ADD FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movie] ([movie_id])
GO
ALTER TABLE [dbo].[Seat]  WITH CHECK ADD FOREIGN KEY([hall_id])
REFERENCES [dbo].[Hall] ([hall_id])
GO
ALTER TABLE [dbo].[Showtime]  WITH CHECK ADD FOREIGN KEY([screening_id])
REFERENCES [dbo].[Screening] ([screening_id])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([screening_id])
REFERENCES [dbo].[Screening] ([screening_id])
GO
/****** Object:  StoredProcedure [dbo].[AssignScreeningsToMovies]    Script Date: 6/20/2023 10:54:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AssignScreeningsToMovies]
AS
BEGIN
    -- Declare variables
	declare @counter int =1;
    DECLARE @MovieID INT;
    DECLARE @HallID INT;
    DECLARE @StartTime DATETIME;
    DECLARE @MovieDuration INT;


    -- Get movie IDs and assigned hall IDs
    DECLARE @Assignments TABLE (movie_id INT, hall_id INT);
    INSERT INTO @Assignments (movie_id, hall_id)
    select movie_id , hall_id
    FROM dbo.AssignHallsToMovies();

    -- Set the initial start time to 3:00 PM
    SET @StartTime = '2023-06-19 15:00:00';

    -- Iterate over each movie assignment
    DECLARE movie_cursor CURSOR FOR
    SELECT movie_id, hall_id
    FROM @Assignments;

    OPEN movie_cursor;

    FETCH NEXT FROM movie_cursor INTO @MovieID, @HallID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Get the movie duration from the MovieDetails table based on the MovieID
        SELECT @MovieDuration = Duration
        FROM MovieDetails
        WHERE MovieID = @MovieID;

        -- Set the cinema closing time to 2:00 AM
        DECLARE @CinemaClosingTime DATETIME = '2023-06-20 02:00:00';

        -- Start assigning screenings
        WHILE @StartTime < @CinemaClosingTime
        BEGIN
            -- Insert a new screening record
            INSERT INTO Screening (screening_id, movie_id, Hall_ID, Start_Time, End_Time)
            VALUES (@counter, @MovieID, @HallID, @StartTime, DATEADD(MINUTE, @MovieDuration, @StartTime));
			set @counter=@counter+1;
            -- Increment the start time for the next screening by adding 30 minutes
            SET @StartTime = DATEADD(MINUTE, 30, DATEADD(MINUTE, @MovieDuration, @StartTime));
        END;

        FETCH NEXT FROM movie_cursor INTO @MovieID, @HallID;
    END;

    CLOSE movie_cursor;
    DEALLOCATE movie_cursor;
END;
EXEC dbo.AssignScreeningsToMovies;
select * from Screening
GO
/****** Object:  StoredProcedure [dbo].[AssignScreeningsToMovies3r]    Script Date: 6/20/2023 10:54:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AssignScreeningsToMovies3r]
AS
BEGIN
declare @counter int =1;
  -- Step 1: Retrieve movies with movie status ID 1
  SELECT *
  INTO #SelectedMovies
  FROM movie
  WHERE moviestatusid = 1;

  -- Step 2: Determine the number of available halls
  DECLARE @TotalHalls INT;
  SELECT @TotalHalls = COUNT(*) FROM hall;
  
  -- Step 3: Divide the halls equally among the selected movies
  WITH numbered_movies AS (
    SELECT movie_id, ROW_NUMBER() OVER (ORDER BY movie_id) AS rn
    FROM #SelectedMovies
  ),
  numbered_halls AS (
    SELECT hall_id, ROW_NUMBER() OVER (ORDER BY hall_id) AS rn
    FROM hall
  ),
  assigned_halls AS (
    SELECT nm.movie_id, nh.hall_id
    FROM numbered_movies nm
    INNER JOIN numbered_halls nh ON ((nm.rn - 1) % @TotalHalls) + 1 = nh.rn
  )
  SELECT *
  INTO #AssignedHalls
  FROM assigned_halls;

  -- Step 4: Calculate the start time and end time for each screening
  DECLARE @StartTime TIME = '15:00:00';  -- Start time for the first screening
  DECLARE @MaxEndTime TIME = '02:00:00';  -- Maximum end time (2:00 AM)

  INSERT INTO screening (screening_id,movie_id, hall_id, start_time, end_time)
  SELECT @counter,ah.movie_id, ah.hall_id,
         DATEADD(MINUTE, (s.rn - 1) * (md.duration + 30), @StartTime) AS startTime,
         DATEADD(MINUTE, s.rn * (md.duration + 30), @StartTime) AS endTime
  FROM #AssignedHalls ah
  CROSS JOIN (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn FROM sys.columns) s
  INNER JOIN #SelectedMovies m ON m.movie_id = ah.movie_id
  INNER JOIN moviedetails md ON md.MovieId = m.movie_id
  WHERE DATEADD(MINUTE, s.rn * (md.duration + 30), @StartTime) <= @MaxEndTime;

  set @counter=@counter+1;
  -- Clean up temporary tables
  DROP TABLE #SelectedMovies;
  DROP TABLE #AssignedHalls;
END;

EXEC AssignScreeningsToMovies3r;
select * from Screening
GO
/****** Object:  StoredProcedure [dbo].[AssignScreeningsToMoviesanotherone]    Script Date: 6/20/2023 10:54:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AssignScreeningsToMoviesanotherone]
AS
BEGIN
  -- Step 1: Retrieve movies with movie status ID 1
  SELECT *
  INTO #SelectedMovies
  FROM movie
  WHERE moviestatusid = 1;

  -- Step 2: Determine the number of available halls
  DECLARE @TotalHalls INT;
  SELECT @TotalHalls = COUNT(*) FROM hall;
  
  -- Step 3: Divide the halls equally among the selected movies
  WITH numbered_movies AS (
    SELECT movie_id, ROW_NUMBER() OVER (ORDER BY movie_id) AS rn
    FROM #SelectedMovies
  ),
  numbered_halls AS (
    SELECT hall_id, ROW_NUMBER() OVER (ORDER BY hall_id) AS rn
    FROM hall
  ),
  assigned_halls AS (
    SELECT nm.movie_id, nh.hall_id
    FROM numbered_movies nm
    INNER JOIN numbered_halls nh ON ((nm.rn - 1) % @TotalHalls) + 1 = nh.rn
  )
  SELECT *
  INTO #AssignedHalls
  FROM assigned_halls;

  -- Step 4: Calculate the start time and end time for each screening
  DECLARE @StartTime TIME = '15:00:00';  -- Start time for the first screening
  DECLARE @MaxEndTime TIME = '02:00:00';  -- Maximum end time (2:00 AM)

  DECLARE @MovieID INT, @HallID INT, @ScreeningCount INT;
  DECLARE @Counter INT = 1, @MaxScreenings INT = 5; -- Maximum screenings per movie

  -- Cursor to iterate over assigned halls
  DECLARE screening_cursor CURSOR FOR
    SELECT movie_id, hall_id
    FROM #AssignedHalls;

  OPEN screening_cursor;

  -- Fetch the first row
  FETCH NEXT FROM screening_cursor INTO @MovieID, @HallID;

  WHILE @@FETCH_STATUS = 0
  BEGIN
    SET @ScreeningCount = 1;

    WHILE @ScreeningCount <= @MaxScreenings
    BEGIN
      -- Calculate start and end time for each screening
      DECLARE @StartTimeCalc TIME, @EndTimeCalc TIME;

    DECLARE @TodayDate DATE;
SET @TodayDate = CAST(GETDATE() AS DATE);

SET @StartTimeCalc = DATEADD(MINUTE, (@Counter - 1) * 30, CAST(@StartTime AS TIME));
SET @EndTimeCalc = DATEADD(MINUTE, (@Counter - 1) * 30 + (SELECT duration FROM moviedetails WHERE MovieId = @MovieID), CAST(@StartTime AS TIME));
declare @value int=1;
INSERT INTO screening (screening_id,movie_id, hall_id, start_time, end_time)
      VALUES (@value,@MovieID, @HallID, @StartTimeCalc, @EndTimeCalc);
	 set  @value +=1;
      SET @ScreeningCount += 1;
      SET @Counter += 1;

      -- Check if the cinema closes or the maximum number of screenings per movie is reached
      IF DATEADD(MINUTE, (@Counter - 1) * 30, @StartTime) > @MaxEndTime OR @ScreeningCount > @MaxScreenings
        BREAK;
    END;

    -- Fetch the next row
    FETCH NEXT FROM screening_cursor INTO @MovieID, @HallID;
  END;

  CLOSE screening_cursor;
  DEALLOCATE screening_cursor;

  -- Clean up temporary tables
  DROP TABLE #SelectedMovies;
  DROP TABLE #AssignedHalls;
END;

EXEC AssignScreeningsToMoviesanotherone;
select * from Screening
delete from Screening
GO
/****** Object:  StoredProcedure [dbo].[InsertCustomer]    Script Date: 6/20/2023 10:54:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCustomer]
    @Name VARCHAR(100),
    @Password VARCHAR(100),
    @Email VARCHAR(100),
    @Phone VARCHAR(20)
AS
BEGIN
    DECLARE @customerId INT;
    SELECT @customerId = ISNULL(MAX(customer_id), 0) + 1 FROM Customer;

    INSERT INTO Customer (customer_id,name, Password, Email, Phone)
    VALUES (@customerId,@Name, ENCRYPTBYPASSPHRASE('13163', @Password), @Email, @Phone);
END
GO
/****** Object:  StoredProcedure [dbo].[RetrieveMoviesByStatus]    Script Date: 6/20/2023 10:54:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RetrieveMoviesByStatus]
    @StatusId int
AS
BEGIN
    SELECT m.title, m.movie_cover
    FROM movie AS m
    JOIN moviestatus AS s ON m.moviestatusid = s.statusid
    WHERE s.statusid = @StatusId
END
GO
USE [master]
GO
ALTER DATABASE [Cinema_Managment_System] SET  READ_WRITE 
GO
