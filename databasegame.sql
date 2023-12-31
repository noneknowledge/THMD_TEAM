USE [master]
GO
/****** Object:  Database [nhom_2]    Script Date: 13/12/2023 1:03:19 AM ******/
CREATE DATABASE [nhom_2]

ALTER DATABASE [nhom_2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [nhom_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [nhom_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [nhom_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [nhom_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [nhom_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [nhom_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [nhom_2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [nhom_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [nhom_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [nhom_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [nhom_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [nhom_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [nhom_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [nhom_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [nhom_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [nhom_2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [nhom_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [nhom_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [nhom_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [nhom_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [nhom_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [nhom_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [nhom_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [nhom_2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [nhom_2] SET  MULTI_USER 
GO
ALTER DATABASE [nhom_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [nhom_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [nhom_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [nhom_2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [nhom_2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [nhom_2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'nhom_2', N'ON'
GO
ALTER DATABASE [nhom_2] SET QUERY_STORE = ON
GO
ALTER DATABASE [nhom_2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [nhom_2]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 13/12/2023 1:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [nvarchar](50) NOT NULL,
	[AdName] [nvarchar](255) NULL,
	[PassWord] [nvarchar](255) NULL,
	[FullName] [nvarchar](255) NULL,
	[IsActive] [nvarchar](255) NULL,
	[IsHide] [nchar](10) NULL,
	[RandomKey] [nvarchar](10) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 13/12/2023 1:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CateID] [nvarchar](50) NOT NULL,
	[CateName] [nvarchar](255) NULL,
	[CateDes] [nvarchar](max) NOT NULL,
	[Alias] [nvarchar](255) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 13/12/2023 1:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[UID] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[PassWord] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](12) NULL,
	[IsActive] [nvarchar](10) NULL,
	[IsHide] [nvarchar](10) NULL,
	[RandomKey] [nvarchar](10) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Developer]    Script Date: 13/12/2023 1:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Developer](
	[Dev_ID] [nvarchar](50) NOT NULL,
	[Developer] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Logo] [nvarchar](255) NULL,
	[IsHide] [nvarchar](10) NULL,
	[Alias] [nvarchar](255) NULL,
 CONSTRAINT [PK_Developer] PRIMARY KEY CLUSTERED 
(
	[Dev_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 13/12/2023 1:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[GameID] [nvarchar](50) NOT NULL,
	[GameName] [nvarchar](255) NULL,
	[GameDes] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Thumbnail] [nvarchar](255) NULL,
	[Video] [nvarchar](255) NULL,
	[DevID] [nvarchar](50) NULL,
	[PublisherID] [nvarchar](50) NULL,
	[ReleaseDate] [date] NULL,
	[View] [int] NULL,
	[isActive] [nvarchar](10) NULL,
	[discount] [int] NULL,
	[startDis] [date] NULL,
	[endDis] [date] NULL,
	[Alias] [nvarchar](255) NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game_Categories]    Script Date: 13/12/2023 1:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game_Categories](
	[GameID] [nvarchar](50) NOT NULL,
	[CateID] [nvarchar](50) NOT NULL,
	[Note] [nvarchar](255) NULL,
 CONSTRAINT [PK_Game_Categories] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC,
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game_Image]    Script Date: 13/12/2023 1:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game_Image](
	[GameID] [nvarchar](50) NOT NULL,
	[ImageID] [nvarchar](50) NOT NULL,
	[ImageName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Game_Image] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC,
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libraries]    Script Date: 13/12/2023 1:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libraries](
	[UID] [nvarchar](50) NOT NULL,
	[GameID] [nvarchar](50) NOT NULL,
	[FeedBack] [nvarchar](255) NULL,
	[isLiked] [nvarchar](10) NULL,
 CONSTRAINT [PK_Libraries] PRIMARY KEY CLUSTERED 
(
	[UID] ASC,
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 13/12/2023 1:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [nvarchar](50) NOT NULL,
	[UID] [nvarchar](50) NOT NULL,
	[OrderDate] [date] NULL,
	[PaymentID] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_Order_1] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 13/12/2023 1:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [nvarchar](50) NOT NULL,
	[GameID] [nvarchar](50) NOT NULL,
	[Prices] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 13/12/2023 1:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[GameID] [nvarchar](50) NOT NULL,
	[UID] [nvarchar](50) NOT NULL,
	[Des] [nvarchar](max) NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC,
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'1df21144-63d2-4c4b-ae38-5c2a423757e9', N'FPS', N'Bắn súng góc nhìn người thứ nhất là một thể loại trò chơi điện tử tập trung xung quanh các loại súng và các cuộc chiến dựa trên vũ khí theo góc nhìn người thứ nhất; đó là góc nhìn của người chơi trải nghiệm hành động thông qua mắt của nhân vật chính.', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'24441dcb-8608-4637-b1d3-7f600c740aeb', N'Board Game', N'Trò chơi bàn cờ là một trò chơi trên bàn, gồm các quân trên bàn được cho di chuyển hoặc đặt trên một bề mặt phẳng hay bảng được đánh dấu sẵn và thường bao gồm các yếu tố của trò chơi trên bàn, thẻ bài, nhập vai và trò chơi thu nhỏ. Hầu hết là sự cạnh tranh giữa hai hoặc nhiều người chơi.', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'4e2f9786-a289-4966-874f-90b2c7d9ea1b', N'RPG', N'Trò chơi nhập vai xuất phát từ trò chơi nhập vai bút-và-giấy Dungeons & Dragons. Người chơi diễn xuất bằng cách tường thuật bằng lời hay văn bản, hoặc bằng cách ra các quyết định theo một cấu trúc đã được định sẵn để phát triển nhân vật hay tình tiết.', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'599468af-be7c-4028-8622-17d13d9ba1fd', N'Simulator', N'Trò chơi mô phỏng mô tả một trò chơi video đa dạng, thường được thiết kế để mô phỏng chặt chẽ các hoạt động trong thế giới thực. Một trò chơi mô phỏng cố gắng sao chép các hoạt động khác nhau từ đời thực dưới dạng trò chơi cho các mục đích khác nhau như đào tạo, phân tích hoặc dự đoán.', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'5ebf9854-f0d6-4f26-94ba-e276aeac1d0a', N'Action', N'Trò chơi hành động là thể loại trò chơi video nhấn mạnh những thách thức về thể chất, bao gồm phối hợp mắt - tay và thời gian phản ứng. Thể loại này bao gồm rất nhiều thể loại phụ, chẳng hạn như trò chơi chiến đấu, beat ''em up, trò chơi bắn súng và trò chơi platform.', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'6c03e4ae-daaa-4adf-bc67-2a4c12786531', N'Shoot ''Em Up', N'Shoot ''em up là một thể loại phụ của trò chơi hành động. Không có sự đồng thuận nào về việc các yếu tố thiết kế nào tạo nên một cảnh quay; một số hạn chế định nghĩa đối với các trò chơi có tàu vũ trụ và một số kiểu chuyển động của nhân vật, trong khi những trò chơi khác cho phép định nghĩa rộng hơn bao gồm các nhân vật ...', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'713b6934-becd-419b-a224-8e37c9916601', N'Casual Game', N'Game casual là thể loại game phổ thông, dễ chơi, game thường có độ dài ngắn. Game casual thường được chơi trực tuyến trên các trình duyệt web bằng máy tính hay điện thoại di động. Thời gian gần đây trò chơi loại này cũng được phổ biến trên các máy chơi game.', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'75526337-0f52-49cd-bd8d-9cf0de500a1c', N'Adventure', N'Trò chơi phiêu lưu hay trò chơi mạo hiểm là một thể loại video game mà trong đó giả định người chơi là nhân vật chính trong một câu chuyện có tính tương tác tiến triển theo hướng khám phá và vượt qua thử thách.', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'895e9a7e-c7ab-43b5-87b3-fe65d2fe95e2', N'Indie', N'Game indie là trò chơi điện tử độc lập (tiếng Anh là Independent video games). Là những trò chơi được phát triển và sản xuất bởi những nhóm nhỏ hoặc các cá nhân, mà không có sự đầu tư lớn về kinh phí cũng như là truyền thông từ các hãng sản xuất trò chơi điện tử lớn trên thế giới. ', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'8c079714-b0a5-43e5-85bc-114938d59a92', N'3D', N'Đồ hoạ 3D là quá trình tạo nên một tựa game có không gian ba chiều, bao gồm việc toàn bộ đối tượng và vật thể đều phải được nhìn thấy từ mọi phía.', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'991b81b9-106c-49ed-bd73-ef3ead0abb60', N'Soundtrack', N'Soundtrack liên kết với trò chơi trên Steam: nếu trò chơi của bạn được bán trên Steam, soundtrack có thể được tính như nội dung bổ sung cho trò chơi đó, tương tự như DLC. Bạn có thể tạo một soundtrack mới liên kết với trò chơi từ đường dẫn Gói liên kết, DLC, Demo, và Công cụ trên trang đáp ứng dụng.', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'aa80ed8e-f115-4b61-8e32-ce1266cab286', N'Roguelike', N'Roguelike là một nhánh con của trò chơi điện tử nhập vai có đặc điểm truyền thống là khám phá ngục tối thông qua các cấp độ được tạo theo thủ tục, lối chơi theo lượt, di chuyển theo lưới và cái chết vĩnh viễn của nhân vật người chơi.', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'ad6669c8-ff12-4421-b169-2256cadb4de9', N'MMO', N'Trò chơi nhập vai trực tuyến nhiều người chơi thường gọi là MMORPG là sự kết hợp giữa các trò chơi video nhập vai và các trò chơi trực tuyến nhiều người chơi, trong đó một số lượng rất lớn người chơi tương tác với nhau trong một thế giới ảo.', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'ad86757f-b5a4-41de-be07-655b0aae2c51', N'2D', N'Game 2D là game không thể xoay góc quay và không có ấn tượng ba chiều rõ rệt. Game này cuộn bản đồ theo hai chiều là ngang và thẳng. Bên cạnh đó, từ nhân vật, tiền cảnh, hậu cảnh,… của game 2D giống phim hoạt hình cắt giấy (mọi thứ đều từ hình vẽ trên giấy).', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'ae23c089-a377-4007-9265-bf37cd3bb3fe', N'Rhythm', N'Trò chơi nhịp điệu là một thể loại trò chơi điện tử âm nhạc thử thách nhịp điệu của người chơi. Các trò chơi trong thể loại này thường tập trung vào nhảy hoặc mô phỏng nốt nhạc, và yêu cầu người chơi nhấn các nút theo trình tự được chỉ định trên màn hình.', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'b56b779e-fef0-464c-9a65-39e8a32a97f5', N'DLC', N'Nội dung tải về là những nội dung bổ sung được tạo ra dành cho các trò chơi điện tử đã phát hành và được nhà phát hành của trò chơi đó phân phối qua Internet.', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'b8a06cb5-02ae-404d-85a0-a910663d58ba', N'Hack and slash', N'Hack and slash hoặc hack and slay, viết tắt là H&S hay HnS hoặc slash ''em up, đề cập đến thể loại trò chơi video có lối chơi nhấn mạnh đến tính chiến đấu bằng vũ khí cận chiến. Cũng có thể có một số vũ khí dựa trên đạn làm vũ khí phụ.', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'd66349f8-3646-47bb-8ac6-06a0339c6781', N'Fighting', N'Trò chơi điện tử đối kháng là một thể loại trò chơi điện tử hay còn gọi là trò chơi đánh nhau. Trò chơi điện tử đối kháng là các trò chơi mà trong đó người chơi điều khiển một nhân vật tham gia một cuộc đấu tay đôi với một nhân vật khác trên một màn hình có giới hạn. Các nhân vật thường sẽ có khả năng ngang nhau.', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'f405a161-9570-498a-9447-5f1aeb8e7f57', N'Moba', N'Đấu trường trận chiến trực tuyến nhiều người chơi, cũng biết đến với tên khác là chiến lược hành động thời gian thực là một thể loại con của thể loại trò chơi video chiến lược thời gian thực, trong đó một người chơi có thể điều khiển một nhân vật thuộc một trong hai đội tham gia.', NULL)
INSERT [dbo].[Categories] ([CateID], [CateName], [CateDes], [Alias]) VALUES (N'f76a8a30-7933-4a23-904a-f6c76dadd8b1', N'Online Co-Op', N'Trò chơi điện tử hợp tác, thường được viết tắt là co-op, là một trò chơi điện tử cho phép người chơi làm việc cùng nhau như đồng đội, thường chống lại một hoặc nhiều đối thủ là nhân vật không phải người chơi.', NULL)
GO
INSERT [dbo].[Client] ([UID], [FullName], [UserName], [PassWord], [Email], [Phone], [IsActive], [IsHide], [RandomKey]) VALUES (N'4fb27cc9-0ab0-4cc3-85b9-301bce48d166', N'Nguyễn hoàng Phúc', N'taikhoan2', N'qOOu/3pTJ60gv6cl1YdB2Bc4u7AO9dw8Yp367BtAZwlMSoIAQeNiG3xQQepEEnNR5/AADEoN6tw+c5AEb4AcfA==', N'hoangphuc160802@gmail.com', N'1234567891', N'true', N'false', N'$h$9H')
INSERT [dbo].[Client] ([UID], [FullName], [UserName], [PassWord], [Email], [Phone], [IsActive], [IsHide], [RandomKey]) VALUES (N'875a19d0-048a-4e43-ac23-5df4b968d154', N'Lê Văn', N'taikhoan5', N'iAuh7UeWkyu6dQmLdBxrlIzsGNvKuu7EYTVMM9qfhkD1yxkTqWUqmUyQ1tixvXbd09QesvthXXJN2btkIU8dIg==', N'2000003640@nttu.edu.vn', N'0123345678', N'true', N'false', N'TQqvw')
INSERT [dbo].[Client] ([UID], [FullName], [UserName], [PassWord], [Email], [Phone], [IsActive], [IsHide], [RandomKey]) VALUES (N'a29102fc-42da-482d-bd6b-f09147cb3262', N'Phúc', N'user1', N'123456', N'hoangphuc@gmail.com', N'01123445781', N'True', NULL, NULL)
INSERT [dbo].[Client] ([UID], [FullName], [UserName], [PassWord], [Email], [Phone], [IsActive], [IsHide], [RandomKey]) VALUES (N'd5e7feef-f625-4c8b-9d19-480ee2a7fafb', N'lê lợi', N'taikhoan6', N'43CKeleFjxAv9hZyXJpjy+ofZR/GY0AxTWd8oeVKj7xQH3j0d/aVlD1iny2klo+TvyuKnMWtBE0LuQsX+H98vg==', N'2000003640@nttu.edu.vn', N'1093245502', N'false', N'false', N'FxU17')
INSERT [dbo].[Client] ([UID], [FullName], [UserName], [PassWord], [Email], [Phone], [IsActive], [IsHide], [RandomKey]) VALUES (N'ed17f996-ad42-43df-89c8-ed8ac9dadf9f', N'Phúc hoàng nguyễn', N'taikhoan3', N'4R/oiD8ke2cPd5edeoWONXr/ulU/KzrnwV0XQNKx2QiULUkzd1A9K3NIGUL/QOmRou2L8m7vzcKt8zSHaFssPQ==', N'2000003640@nttu.edu.vn', N'0123345678', N'true', N'false', N'TcFrq')
GO
INSERT [dbo].[Developer] ([Dev_ID], [Developer], [Description], [Logo], [IsHide], [Alias]) VALUES (N'0a246ba0-bc03-49e8-8f26-f1b0848b12c2', N'Tequila Works', N'', N'string', N'True', N'tequilla-works')
INSERT [dbo].[Developer] ([Dev_ID], [Developer], [Description], [Logo], [IsHide], [Alias]) VALUES (N'290f37ec-fe10-4ba7-9eeb-a56645764f44', N'Tribute Games Inc.', N'Develops 2d pixel art games.', N'string', N'True', N'tribute-games-inc')
INSERT [dbo].[Developer] ([Dev_ID], [Developer], [Description], [Logo], [IsHide], [Alias]) VALUES (N'394b7672-8a3d-46ee-9f8e-d3bc3f36af56', N'DrinkBox Studios', N'Toronto-based game studio behind Nobody Saves the World, Guacamelee! 1+2, Severed, and Mutant Blobs Attack.', N'string', N'True', N'drinkbox-studios')
INSERT [dbo].[Developer] ([Dev_ID], [Developer], [Description], [Logo], [IsHide], [Alias]) VALUES (N'3ad8681c-13de-4a79-8891-b8c8f311a1d1', N'Digital Sun', N'Digital Sun is a multi-game studio on a mission to create games that are truly worth playing, and have fun while we’re doing it.', N'string', N'True', N'digital-sun')
INSERT [dbo].[Developer] ([Dev_ID], [Developer], [Description], [Logo], [IsHide], [Alias]) VALUES (N'5fa0130c-1164-4c82-84f6-e27c82105b2b', N'Studio MDHR', N'Studio MDHR is an independent video game company founded by brothers Chad & Jared Moldenhauer. Working remotely with a team from across North America, Studio MDHR launched Cuphead on Xbox One and PC.', N'string', N'True', N'studio-mdhr')
INSERT [dbo].[Developer] ([Dev_ID], [Developer], [Description], [Logo], [IsHide], [Alias]) VALUES (N'70e23e58-a592-4c37-b6b7-14ffd7ffa997', N'Dotemu', N'Dotemu is a French video game company specializing in modern releases of beloved retro games.', N'string', N'True', N'dotemu')
INSERT [dbo].[Developer] ([Dev_ID], [Developer], [Description], [Logo], [IsHide], [Alias]) VALUES (N'80cba021-04b4-455b-832b-dad8d4fb7d29', N'Playdead', N'Playdead is an independent game developer and publisher based in Copenhagen, Denmark. We are hard at work on bringing LIMBO and INSIDE to more players - and on making new games.', N'string', N'True', N'playdead')
INSERT [dbo].[Developer] ([Dev_ID], [Developer], [Description], [Logo], [IsHide], [Alias]) VALUES (N'8ccb9a66-fea7-49ae-b78a-1a8dfbc2efee', N'Arc System Works', N'ACTION. REVOLUTION. CHALLENGE.', N'string', N'True', N'arc-system-works')
INSERT [dbo].[Developer] ([Dev_ID], [Developer], [Description], [Logo], [IsHide], [Alias]) VALUES (N'8e3f8bbd-7c4a-4be5-9ece-4f6665d0899d', N'HoYoverse', N'Tech Otakus Save The World', N'string', N'True', N'hoyoverse')
INSERT [dbo].[Developer] ([Dev_ID], [Developer], [Description], [Logo], [IsHide], [Alias]) VALUES (N'9411f62a-2fd3-43a6-a30e-c0527331be11', N'Klei Entertainment', N'It Rhymes With Play', N'string', N'True', N'klei-entertainment')
INSERT [dbo].[Developer] ([Dev_ID], [Developer], [Description], [Logo], [IsHide], [Alias]) VALUES (N'a3453e0e-c108-48bd-ae89-906a94ef9daf', N'Bandai Namco Entertainment', N'Bandai Namco exists to share dreams, fun and inspiration with people around the world. Do you wish to enjoy every single day to the fullest? What we want is for people like you to always have a reason to smile.', N'string', N'True', N'bandai-namco')
INSERT [dbo].[Developer] ([Dev_ID], [Developer], [Description], [Logo], [IsHide], [Alias]) VALUES (N'a818bfd3-c724-4ca2-aed8-8b000c314afa', N'Massive Monster Games', N'Awoken by a nuclear blast, this colossal game-making monstrosity flattens entire cities underfoot, bringing gaming armageddon to all!', N'string', N'True', N'massive-monster-game')
INSERT [dbo].[Developer] ([Dev_ID], [Developer], [Description], [Logo], [IsHide], [Alias]) VALUES (N'a99583f6-0b16-4254-abf7-759644601f46', N'Devolver Digital', N'Devolver Digital recommends only the most exquisite video games for the distinguished gamer and their refined taste. Voted ''Best Video Game Label Ever'' 2016, 2017, 2021..', N'string', N'True', N'devolver-digital')
INSERT [dbo].[Developer] ([Dev_ID], [Developer], [Description], [Logo], [IsHide], [Alias]) VALUES (N'e8450ff9-9477-49b9-bead-bc8048876175', N'Team Cherry Games', N'Team Cherry is a small indie games team in Adelaide, South Australia. Our mission is to build crazy and exciting worlds for you to explore and conquer.', N'string', N'True', N'team-cherry-games')
INSERT [dbo].[Developer] ([Dev_ID], [Developer], [Description], [Logo], [IsHide], [Alias]) VALUES (N'f56e5431-4e4f-4003-9488-5432f9cb54d7', N'WayForward', N'Based in Valencia, California, WayForward has been an indie developer and publisher for more than 30 years, and is known for games such as the Shantae series, River City Girls, Mighty Switch Force, and many more.', N'string', N'True', N'wayforward')
INSERT [dbo].[Developer] ([Dev_ID], [Developer], [Description], [Logo], [IsHide], [Alias]) VALUES (N'f67418e8-6845-46a0-8a48-8d4a6079ff12', N'Riot Forge', N'', N'string', N'True', N'riot-forge')
GO
INSERT [dbo].[Game] ([GameID], [GameName], [GameDes], [Price], [Thumbnail], [Video], [DevID], [PublisherID], [ReleaseDate], [View], [isActive], [discount], [startDis], [endDis], [Alias]) VALUES (N'153e431c-0be0-4924-ad5b-af6b213478a4', N'The Mageseeker: A League of Legends Story', N'Từ Digital Sun, người sáng tạo ra Moonlighter, The Mageseeker là một game nhập vai hành động trong vũ trụ Liên Minh Huyền Thoại. Vào vai Sylas, một pháp sư hiện đã được giải thoát sau nhiều năm bị giam cầm. Hãy sử dụng những xiềng xích từng trói buộc bạn và giải phóng Demacia khỏi sự chuyên chế của Người tìm kiếm pháp sư.', 16, N'638378431137039246_TheMageSeeker_thumb.png', N'https://www.youtube.com/embed/-KHMMMHvDdM?si=ULgHqKUyEhbj9dmS', N'3ad8681c-13de-4a79-8891-b8c8f311a1d1', N'f67418e8-6845-46a0-8a48-8d4a6079ff12', NULL, 1, N'true', 10, CAST(N'2023-12-10' AS Date), CAST(N'2024-02-19' AS Date), N'the-mageseeker-a-league-of-legends-story')
INSERT [dbo].[Game] ([GameID], [GameName], [GameDes], [Price], [Thumbnail], [Video], [DevID], [PublisherID], [ReleaseDate], [View], [isActive], [discount], [startDis], [endDis], [Alias]) VALUES (N'2f4557ac-83b3-49e9-8533-fa9ceedc4f39', N'Song of Nunu: A League of Legends Story', N'Hai người bạn thân nhất, một cuộc phiêu lưu hoang dã. Tham gia cùng những người bạn thân nhất Nunu và Willump trong một cuộc phiêu lưu xuyên qua vùng hoang dã băng giá của Freljord. Song of Nunu: A League of Legends Story là một trò chơi phiêu lưu theo cốt truyện một người chơi được phát triển bởi Tequila Works.', 16, N'638378432450580119_nunu_thumb.jpg', N'https://www.youtube.com/embed/zzctrjs4RJ0?si=hyOtUUT5uYFz0twn', N'0a246ba0-bc03-49e8-8f26-f1b0848b12c2', N'f67418e8-6845-46a0-8a48-8d4a6079ff12', NULL, 1, N'true', NULL, NULL, NULL, N'song-of-nunu-a-league-of-legends-story')
INSERT [dbo].[Game] ([GameID], [GameName], [GameDes], [Price], [Thumbnail], [Video], [DevID], [PublisherID], [ReleaseDate], [View], [isActive], [discount], [startDis], [endDis], [Alias]) VALUES (N'36df6b69-7c5d-497a-b902-6c7bf6d9e8a1', N'Little Nightmares', N'Đắm chìm trong Little Nightmares, một câu chuyện đen tối kỳ quái sẽ khiến bạn phải đương đầu với những nỗi sợ hãi thời thơ ấu! Giúp Six thoát khỏi The Maw - một con tàu rộng lớn, bí ẩn là nơi sinh sống của những linh hồn hư hỏng đang tìm kiếm bữa ăn tiếp theo.', 12.4, N'638378437222379443_little-nightmares_1_thumb.jpg', N'https://www.youtube.com/embed/aOadxZBsPiA?si=asjv-E2ewXXt3RjE', N'a3453e0e-c108-48bd-ae89-906a94ef9daf', N'a3453e0e-c108-48bd-ae89-906a94ef9daf', NULL, 1, N'true', NULL, NULL, NULL, N'little-night-mares')
INSERT [dbo].[Game] ([GameID], [GameName], [GameDes], [Price], [Thumbnail], [Video], [DevID], [PublisherID], [ReleaseDate], [View], [isActive], [discount], [startDis], [endDis], [Alias]) VALUES (N'61bb31e0-2c17-4786-9dd9-fce7779f88a8', N'Don''t Starve Together', N'Cùng nhau chiến đấu, trang trại, xây dựng và khám phá trong bản mở rộng nhiều người chơi độc lập cho trò chơi sinh tồn kiên quyết nơi hoang dã, Don''t Starve.', 7.76, N'638378439931927447_dst_thumb.jpg', N'https://www.youtube.com/embed/bVbyn7c1X6E?si=Ii7rwEXFvWnMykUm', N'9411f62a-2fd3-43a6-a30e-c0527331be11', N'9411f62a-2fd3-43a6-a30e-c0527331be11', NULL, 1, N'true', 50, CAST(N'2023-11-11' AS Date), CAST(N'2024-06-11' AS Date), N'dont-starve-together')
INSERT [dbo].[Game] ([GameID], [GameName], [GameDes], [Price], [Thumbnail], [Video], [DevID], [PublisherID], [ReleaseDate], [View], [isActive], [discount], [startDis], [endDis], [Alias]) VALUES (N'7a847284-76d1-44e1-b92c-7bc671bebe42', N'Teenage Mutant Ninja Turtles: Shredder''s Revenge', N'Teenage Mutant Ninja Turtles: Shredder''s Revenge có cơ chế đột phá bắt nguồn từ từ lối chơi rooted in timeless cổ điển vượt thời gian, được thực hiện bởi những chuyện gia làm theo phong cách beat ’em up là Dotemu (Streets of Rage 4) và Tribute Games. Đến với game bạn sẽ được đồng hành cùng với những chú Ninja Rùa huyền thoại trong một môi trường pixel đầy đẹp mắt và đánh bại hàng tá kẻ địch. Mỗi chú rùa đều có những kỹ năng và cách di chuyển riêng biệt, khiến cho mỗi nhân vật đều có sự độc đáo. Hãy chọn lấy một chiến binh, sử dụng các đòn combos một cách triệt để để đánh bại đối địch của bạn và trải nghiệm những trận chiến dữ dội với những pha hành động ngoạn mục và khả năng xuất chúng của các Ninja Rùa.', 13.62, N'638378425007072253_TMNT-Shredders-Revenge_thumb.webp', N'https://www.youtube.com/embed/gHMYwrC7oAo?si=jOqV7LVpd6AbbiTR', N'290f37ec-fe10-4ba7-9eeb-a56645764f44', N'70e23e58-a592-4c37-b6b7-14ffd7ffa997', NULL, 1, N'true', NULL, NULL, NULL, N'teenage-mutant ninja-turtles-shredder-revenge')
INSERT [dbo].[Game] ([GameID], [GameName], [GameDes], [Price], [Thumbnail], [Video], [DevID], [PublisherID], [ReleaseDate], [View], [isActive], [discount], [startDis], [endDis], [Alias]) VALUES (N'9370d875-24f8-47ca-b280-9cec524970ec', N'Nobody Saves the World', N'Biến đổi từ một người không ai thành sên, ma và rồng trong trò chơi nhập vai hành động mới này từ những người sáng tạo ra Guacamelee! Khám phá hơn 15 Hình dạng khác nhau, kết hợp và kết hợp các khả năng của chúng, xóa các ngục tối đang phát triển và... CỨU THẾ GIỚI!?', 15.27, N'638378434187388150_nobody_thumb.jpg', N'https://www.youtube.com/embed/H_E1RhtzDHM?si=VtDaIz5Y-g4K38Yn', N'394b7672-8a3d-46ee-9f8e-d3bc3f36af56', N'394b7672-8a3d-46ee-9f8e-d3bc3f36af56', NULL, 1, N'true', 20, CAST(N'2023-12-10' AS Date), CAST(N'2025-11-11' AS Date), N'nobody-saves-the-world')
INSERT [dbo].[Game] ([GameID], [GameName], [GameDes], [Price], [Thumbnail], [Video], [DevID], [PublisherID], [ReleaseDate], [View], [isActive], [discount], [startDis], [endDis], [Alias]) VALUES (N'99ffbdfa-5f90-44c9-9be0-d04d3fd6a160', N'Cuphead', N'Cuphead là một trò chơi hành động bắn súng cổ điển tập trung chủ yếu vào các trận đấu trùm. Lấy cảm hứng từ phim hoạt hình những năm 1930, hình ảnh và âm thanh được tạo ra một cách tỉ mỉ bằng các kỹ thuật tương tự của thời đại, tức là hoạt hình cel vẽ tay truyền thống, nền màu nước và bản ghi âm nhạc jazz nguyên bản.', 7.76, N'638378438359127263_cuphead_thumb.jpg', N'https://www.youtube.com/embed/NN-9SQXoi50?si=Rxh4_fzdKDyvT2se', N'5fa0130c-1164-4c82-84f6-e27c82105b2b', N'5fa0130c-1164-4c82-84f6-e27c82105b2b', NULL, 1, N'true', 10, CAST(N'2023-11-11' AS Date), CAST(N'2024-11-11' AS Date), N'Cuphead')
INSERT [dbo].[Game] ([GameID], [GameName], [GameDes], [Price], [Thumbnail], [Video], [DevID], [PublisherID], [ReleaseDate], [View], [isActive], [discount], [startDis], [endDis], [Alias]) VALUES (N'a625e297-95ef-4ad6-8825-118f3817f534', N'Hollow knight', N'Hollow Knight là một cuộc phiêu lưu hành động 2D đầy thử thách. Bạn sẽ khám phá những hang động ngoằn ngoèo, chiến đấu với những sinh vật tha hóa và thoát khỏi những cạm bẫy phức tạp, tất cả là để giải quyết những bí ẩn cổ xưa đã bị che giấu từ lâu. - Khám phá thế giới rộng lớn được kết nối với nhau - Gặp gỡ nhóm bạn bè và kẻ địch kỳ lạ', 8.25, N'638378420565208067_hollow_thumb.jpg', N'https://www.youtube.com/embed/UAO2urG23S4?si=GvZ1N0M7yIhWO-sx', N'e8450ff9-9477-49b9-bead-bc8048876175', N'e8450ff9-9477-49b9-bead-bc8048876175', NULL, 1, N'true', NULL, NULL, NULL, N'Hollow-knight')
INSERT [dbo].[Game] ([GameID], [GameName], [GameDes], [Price], [Thumbnail], [Video], [DevID], [PublisherID], [ReleaseDate], [View], [isActive], [discount], [startDis], [endDis], [Alias]) VALUES (N'b29fd893-70fa-4b63-bdad-4abbcd9bee64', N'Street of rage 4', N'Nằm trong số những loạt phim beat''em up hay nhất từng được tạo ra, những nhịp đập của thập niên 90 và những pha chiến đấu trên đường phố đỉnh cao, loạt phim mang tính biểu tượng Streets of Rage trở lại với sự tri ân tuyệt vời và sự hồi sinh của những người hâm mộ hành động cổ điển yêu mến.', 13.62, N'638378426649665052_rage_thumb.webp', N'https://www.youtube.com/embed/j_JtczD-9Ko?si=eb9oeO8tsqkwQdSP', N'70e23e58-a592-4c37-b6b7-14ffd7ffa997', N'70e23e58-a592-4c37-b6b7-14ffd7ffa997', NULL, 1, N'true', NULL, NULL, NULL, N'street-of-rage-4')
INSERT [dbo].[Game] ([GameID], [GameName], [GameDes], [Price], [Thumbnail], [Video], [DevID], [PublisherID], [ReleaseDate], [View], [isActive], [discount], [startDis], [endDis], [Alias]) VALUES (N'ef99ec82-b33d-4bf0-a481-1b043ff96a21', N'Little Nightmares II', N'Little Nightmares II là một trò chơi phiêu lưu hồi hộp, trong đó bạn vào vai Mono, một cậu bé bị mắc kẹt trong một thế giới đã bị bóp méo bởi một đường truyền tà ác. Cùng với người bạn mới Six, anh lên đường khám phá nguồn gốc của Truyền Truyền.', 16.5, N'638378436011999502_little_nightmares_2_thumb.jpg', N'https://www.youtube.com/embed/AI9zBBTyX-E?si=21kuS-QK_Yd0WdnI', N'a3453e0e-c108-48bd-ae89-906a94ef9daf', N'a3453e0e-c108-48bd-ae89-906a94ef9daf', NULL, 1, N'true', 5, CAST(N'2023-11-11' AS Date), CAST(N'2024-11-11' AS Date), N'little-night-mares-ii')
GO
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'153e431c-0be0-4924-ad5b-af6b213478a4', N'4e2f9786-a289-4966-874f-90b2c7d9ea1b', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'153e431c-0be0-4924-ad5b-af6b213478a4', N'5ebf9854-f0d6-4f26-94ba-e276aeac1d0a', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'153e431c-0be0-4924-ad5b-af6b213478a4', N'75526337-0f52-49cd-bd8d-9cf0de500a1c', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'153e431c-0be0-4924-ad5b-af6b213478a4', N'ad86757f-b5a4-41de-be07-655b0aae2c51', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'153e431c-0be0-4924-ad5b-af6b213478a4', N'b8a06cb5-02ae-404d-85a0-a910663d58ba', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'2f4557ac-83b3-49e9-8533-fa9ceedc4f39', N'5ebf9854-f0d6-4f26-94ba-e276aeac1d0a', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'2f4557ac-83b3-49e9-8533-fa9ceedc4f39', N'75526337-0f52-49cd-bd8d-9cf0de500a1c', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'2f4557ac-83b3-49e9-8533-fa9ceedc4f39', N'895e9a7e-c7ab-43b5-87b3-fe65d2fe95e2', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'36df6b69-7c5d-497a-b902-6c7bf6d9e8a1', N'75526337-0f52-49cd-bd8d-9cf0de500a1c', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'61bb31e0-2c17-4786-9dd9-fce7779f88a8', N'75526337-0f52-49cd-bd8d-9cf0de500a1c', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'61bb31e0-2c17-4786-9dd9-fce7779f88a8', N'895e9a7e-c7ab-43b5-87b3-fe65d2fe95e2', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'61bb31e0-2c17-4786-9dd9-fce7779f88a8', N'd66349f8-3646-47bb-8ac6-06a0339c6781', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'61bb31e0-2c17-4786-9dd9-fce7779f88a8', N'f76a8a30-7933-4a23-904a-f6c76dadd8b1', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'7a847284-76d1-44e1-b92c-7bc671bebe42', N'5ebf9854-f0d6-4f26-94ba-e276aeac1d0a', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'7a847284-76d1-44e1-b92c-7bc671bebe42', N'75526337-0f52-49cd-bd8d-9cf0de500a1c', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'7a847284-76d1-44e1-b92c-7bc671bebe42', N'ad86757f-b5a4-41de-be07-655b0aae2c51', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'9370d875-24f8-47ca-b280-9cec524970ec', N'4e2f9786-a289-4966-874f-90b2c7d9ea1b', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'9370d875-24f8-47ca-b280-9cec524970ec', N'5ebf9854-f0d6-4f26-94ba-e276aeac1d0a', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'9370d875-24f8-47ca-b280-9cec524970ec', N'6c03e4ae-daaa-4adf-bc67-2a4c12786531', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'9370d875-24f8-47ca-b280-9cec524970ec', N'75526337-0f52-49cd-bd8d-9cf0de500a1c', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'9370d875-24f8-47ca-b280-9cec524970ec', N'895e9a7e-c7ab-43b5-87b3-fe65d2fe95e2', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'9370d875-24f8-47ca-b280-9cec524970ec', N'ad86757f-b5a4-41de-be07-655b0aae2c51', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'99ffbdfa-5f90-44c9-9be0-d04d3fd6a160', N'6c03e4ae-daaa-4adf-bc67-2a4c12786531', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'99ffbdfa-5f90-44c9-9be0-d04d3fd6a160', N'75526337-0f52-49cd-bd8d-9cf0de500a1c', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'99ffbdfa-5f90-44c9-9be0-d04d3fd6a160', N'895e9a7e-c7ab-43b5-87b3-fe65d2fe95e2', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'99ffbdfa-5f90-44c9-9be0-d04d3fd6a160', N'ad86757f-b5a4-41de-be07-655b0aae2c51', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'99ffbdfa-5f90-44c9-9be0-d04d3fd6a160', N'f76a8a30-7933-4a23-904a-f6c76dadd8b1', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'a625e297-95ef-4ad6-8825-118f3817f534', N'75526337-0f52-49cd-bd8d-9cf0de500a1c', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'a625e297-95ef-4ad6-8825-118f3817f534', N'895e9a7e-c7ab-43b5-87b3-fe65d2fe95e2', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'a625e297-95ef-4ad6-8825-118f3817f534', N'ad86757f-b5a4-41de-be07-655b0aae2c51', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'b29fd893-70fa-4b63-bdad-4abbcd9bee64', N'5ebf9854-f0d6-4f26-94ba-e276aeac1d0a', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'b29fd893-70fa-4b63-bdad-4abbcd9bee64', N'75526337-0f52-49cd-bd8d-9cf0de500a1c', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'b29fd893-70fa-4b63-bdad-4abbcd9bee64', N'ad86757f-b5a4-41de-be07-655b0aae2c51', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'b29fd893-70fa-4b63-bdad-4abbcd9bee64', N'd66349f8-3646-47bb-8ac6-06a0339c6781', NULL)
INSERT [dbo].[Game_Categories] ([GameID], [CateID], [Note]) VALUES (N'ef99ec82-b33d-4bf0-a481-1b043ff96a21', N'75526337-0f52-49cd-bd8d-9cf0de500a1c', NULL)
GO
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'153e431c-0be0-4924-ad5b-af6b213478a4', N'206ba002-7d76-4a5e-99ad-54021f6f3089', N'638378431145825937_theMageSeeker_2.png')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'153e431c-0be0-4924-ad5b-af6b213478a4', N'8d9351bb-e635-4b1f-b0c1-7fd99e8cfa08', N'638378431143479389_theMageSeeker_1.png')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'153e431c-0be0-4924-ad5b-af6b213478a4', N'c87aa90e-56b2-41fb-8b77-65eb8ec79f56', N'638378431171618328_theMageSeeker_3.png')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'153e431c-0be0-4924-ad5b-af6b213478a4', N'd87aa023-ff78-47a6-8c37-d23736063ff4', N'638378431174441272_theMageSeeker_4.png')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'2f4557ac-83b3-49e9-8533-fa9ceedc4f39', N'0fa5a534-76df-4013-93b4-b9e3d599cc78', N'638378432457238929_nunu_2.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'2f4557ac-83b3-49e9-8533-fa9ceedc4f39', N'7f0eb4a6-7838-409d-9f93-be18970a2a32', N'638378432465120457_nunu_4.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'2f4557ac-83b3-49e9-8533-fa9ceedc4f39', N'b6d39a54-0659-4eb3-831b-4fa51a522aba', N'638378432454863254_nunu_1.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'2f4557ac-83b3-49e9-8533-fa9ceedc4f39', N'd1e5e85d-4218-4c36-b0c4-b76cf8e1a489', N'638378432463091081_nunu_3.webp')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'36df6b69-7c5d-497a-b902-6c7bf6d9e8a1', N'5992655f-4297-4a05-a77b-4229cc32f364', N'638378437233177687_little_nigtmare_4.webp')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'36df6b69-7c5d-497a-b902-6c7bf6d9e8a1', N'6669f75f-fe7e-4ddd-a459-5c7c1acea8ff', N'638378437228457925_little_nigtmare_2.webp')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'36df6b69-7c5d-497a-b902-6c7bf6d9e8a1', N'f1c299f7-3fe1-4c25-b17a-fee5e31529ee', N'638378437231454802_little_nigtmare_3.webp')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'36df6b69-7c5d-497a-b902-6c7bf6d9e8a1', N'f7d13131-a485-43e0-a277-42f680859789', N'638378437226572918_little_nigtmare_1.webp')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'61bb31e0-2c17-4786-9dd9-fce7779f88a8', N'248e7553-154f-41bc-9917-e5358d58f254', N'638378439948292028_dst_3.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'61bb31e0-2c17-4786-9dd9-fce7779f88a8', N'2738c29d-54f1-4ead-bb3c-1d0309f22600', N'638378439944089750_dst_2.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'61bb31e0-2c17-4786-9dd9-fce7779f88a8', N'6fc4289c-6609-4170-b80e-ab215b3969bf', N'638378439955782485_dst_4.webp')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'61bb31e0-2c17-4786-9dd9-fce7779f88a8', N'df7ecfda-39ec-4b82-835b-7c3a21865652', N'638378439940573475_dst_1.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'7a847284-76d1-44e1-b92c-7bc671bebe42', N'3c8d2857-f2bc-491f-9926-8a29904c553b', N'638378425037233487_TNMT_3.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'7a847284-76d1-44e1-b92c-7bc671bebe42', N'6eb10207-d487-4214-9e28-bba626402ceb', N'638378425015348233_TNMT_1.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'7a847284-76d1-44e1-b92c-7bc671bebe42', N'89682739-42fc-435a-807a-7909239f3c36', N'638378425057899428_TNMT_4.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'7a847284-76d1-44e1-b92c-7bc671bebe42', N'ad66e9ad-2153-41df-bf21-3a78f314776a', N'638378425025023084_TNMT_2.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'9370d875-24f8-47ca-b280-9cec524970ec', N'cca49b5e-3b43-4f53-81a8-c0faf0845ef4', N'638378434216356855_nobody_3.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'9370d875-24f8-47ca-b280-9cec524970ec', N'd551df45-0baf-4707-8329-4d4f4eb1d7ef', N'638378434218034126_nobody_4.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'9370d875-24f8-47ca-b280-9cec524970ec', N'da2f7ee3-7ee0-45af-937f-6cd943a62112', N'638378434198060156_nobody_1.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'9370d875-24f8-47ca-b280-9cec524970ec', N'fe78ce25-2f8a-4cd4-acd5-be40d5969511', N'638378434207615825_nobody_2.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'99ffbdfa-5f90-44c9-9be0-d04d3fd6a160', N'2f6dc93e-a739-4f78-80bd-cb6a3133e397', N'638378438376511669_cuphead_2.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'99ffbdfa-5f90-44c9-9be0-d04d3fd6a160', N'c7c04801-6c0f-4bd6-bf79-f9899cc98ca8', N'638378438397338125_cuphead_4.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'99ffbdfa-5f90-44c9-9be0-d04d3fd6a160', N'f815f165-8573-423a-9de5-e7b93d1fb8ba', N'638378438390217897_cuphead_3.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'99ffbdfa-5f90-44c9-9be0-d04d3fd6a160', N'fc806812-67ce-4494-aada-bf67cb60ad0e', N'638378438364520823_cuphead_1.webp')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'a625e297-95ef-4ad6-8825-118f3817f534', N'198cda00-a4eb-47e0-b603-060908de2f6a', N'638378420759503725_hollow_2.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'a625e297-95ef-4ad6-8825-118f3817f534', N'2a2daede-1119-4a6a-9194-2b9f51a4f106', N'638378420640625813_hollow_1.webp')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'a625e297-95ef-4ad6-8825-118f3817f534', N'9a00d12c-0da3-430f-a0f3-47260904a250', N'638378420859812983_hollow_4.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'a625e297-95ef-4ad6-8825-118f3817f534', N'e0515b83-6a35-4fae-b9eb-0007684055a7', N'638378420816169429_hollow_3.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'b29fd893-70fa-4b63-bdad-4abbcd9bee64', N'009de4e4-109a-4148-bf9b-6b9faf664cca', N'638378426679846391_rage_4.webp')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'b29fd893-70fa-4b63-bdad-4abbcd9bee64', N'19e0cd05-df52-4401-8fd3-60d98b35ff90', N'638378426665171683_rage_2.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'b29fd893-70fa-4b63-bdad-4abbcd9bee64', N'934c8054-a3cd-4229-a044-8f1d283b5408', N'638378426672592818_rage_3.webp')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'b29fd893-70fa-4b63-bdad-4abbcd9bee64', N'99ac6627-9828-4a2c-b8b2-322432393cef', N'638378426660113264_rage_1.webp')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'ef99ec82-b33d-4bf0-a481-1b043ff96a21', N'4b45c4f7-a1d7-493c-963e-1f2c1614d00d', N'638378436026027304_little_nightmares_2_3.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'ef99ec82-b33d-4bf0-a481-1b043ff96a21', N'9019c87d-b239-43ff-9ec8-7f8c4c93ceba', N'638378436024278958_little_nightmares_2_2.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'ef99ec82-b33d-4bf0-a481-1b043ff96a21', N'ee37714b-0e23-4c20-9987-53633e410fb3', N'638378436019935504_little_nightmares_2_1.jpg')
INSERT [dbo].[Game_Image] ([GameID], [ImageID], [ImageName]) VALUES (N'ef99ec82-b33d-4bf0-a481-1b043ff96a21', N'f650c803-db8b-47f0-8ac1-02829122ad86', N'638378436027718015_little_nightmares_2_4.jpg')
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Developer] FOREIGN KEY([DevID])
REFERENCES [dbo].[Developer] ([Dev_ID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_Developer]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Developer1] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Developer] ([Dev_ID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_Developer1]
GO
ALTER TABLE [dbo].[Game_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Game_Categories_Categories] FOREIGN KEY([CateID])
REFERENCES [dbo].[Categories] ([CateID])
GO
ALTER TABLE [dbo].[Game_Categories] CHECK CONSTRAINT [FK_Game_Categories_Categories]
GO
ALTER TABLE [dbo].[Game_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Game_Categories_Game] FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[Game_Categories] CHECK CONSTRAINT [FK_Game_Categories_Game]
GO
ALTER TABLE [dbo].[Game_Image]  WITH CHECK ADD  CONSTRAINT [FK_Game_Image_Game] FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[Game_Image] CHECK CONSTRAINT [FK_Game_Image_Game]
GO
ALTER TABLE [dbo].[Libraries]  WITH CHECK ADD  CONSTRAINT [FK_Libraries_Client] FOREIGN KEY([UID])
REFERENCES [dbo].[Client] ([UID])
GO
ALTER TABLE [dbo].[Libraries] CHECK CONSTRAINT [FK_Libraries_Client]
GO
ALTER TABLE [dbo].[Libraries]  WITH CHECK ADD  CONSTRAINT [FK_Libraries_Game] FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[Libraries] CHECK CONSTRAINT [FK_Libraries_Game]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([UID])
REFERENCES [dbo].[Client] ([UID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Game] FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Game]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Client] FOREIGN KEY([UID])
REFERENCES [dbo].[Client] ([UID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Client]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Game] FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([GameID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Game]
GO
USE [master]
GO
ALTER DATABASE [nhom_2] SET  READ_WRITE 
GO
