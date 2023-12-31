USE [QuanLyBanThit]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 27/11/2023 2:31:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[TaiKhoan] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 27/11/2023 2:31:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDonHang] [int] NOT NULL,
	[MaSach] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 27/11/2023 2:31:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaChuDe] [int] IDENTITY(1,1) NOT NULL,
	[TenChuDe] [nvarchar](50) NULL,
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(
	[MaChuDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 27/11/2023 2:31:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[DaThanhToan] [int] NULL,
	[TinhTrangGiaoHang] [int] NULL,
	[NgayDat] [date] NULL,
	[NgayGiao] [date] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 27/11/2023 2:31:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[NhapLaiMatKhau] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [varchar](50) NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[NgaySinh] [date] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 27/11/2023 2:31:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LienHe](
	[HoTen] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[TinNhan] [nvarchar](max) NULL,
 CONSTRAINT [PK_LienHe] PRIMARY KEY CLUSTERED 
(
	[HoTen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 27/11/2023 2:31:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 27/11/2023 2:31:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [int] IDENTITY(1,1) NOT NULL,
	[TenGiay] [nvarchar](250) NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[MoTa] [nvarchar](max) NULL,
	[AnhBia] [nvarchar](50) NULL,
	[NgayCapNhat] [date] NULL,
	[SoLuongTon] [int] NULL,
	[MaNCC] [int] NULL,
	[MaChuDe] [int] NULL,
	[Moi] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([TaiKhoan], [MatKhau]) VALUES (N'1', N'123123')
INSERT [dbo].[Admin] ([TaiKhoan], [MatKhau]) VALUES (N'2', N'123123')
INSERT [dbo].[Admin] ([TaiKhoan], [MatKhau]) VALUES (N'3', N'123123')
INSERT [dbo].[Admin] ([TaiKhoan], [MatKhau]) VALUES (N'ad', N'321321')
INSERT [dbo].[Admin] ([TaiKhoan], [MatKhau]) VALUES (N'ThuyLinh', N'123123')
GO
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (1, 3, 2, CAST(1430000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (2, 1, 2, CAST(1330000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (5, 15, 2, CAST(3500000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (5, 17, 2, CAST(2200000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (6, 1, 1, CAST(1330000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (7, 1, 2, CAST(1330000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (8, 1, 0, CAST(1330000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (9, 15, 2, CAST(3500000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (10, 13, 4, CAST(1990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSach], [SoLuong], [DonGia]) VALUES (11, 1, 4, CAST(1330000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[ChuDe] ON 

INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (1, N'Converse')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (2, N'Vans')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (3, N'Palladium')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (4, N'Nike')
SET IDENTITY_INSERT [dbo].[ChuDe] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (1, 0, NULL, CAST(N'2023-11-14' AS Date), NULL, 1)
INSERT [dbo].[DonHang] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (2, NULL, NULL, CAST(N'2023-11-14' AS Date), NULL, 1)
INSERT [dbo].[DonHang] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (5, 1, 1, CAST(N'2023-11-17' AS Date), CAST(N'2023-11-28' AS Date), 1)
INSERT [dbo].[DonHang] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (6, NULL, NULL, CAST(N'2023-11-17' AS Date), NULL, 1)
INSERT [dbo].[DonHang] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (7, NULL, NULL, CAST(N'2023-11-17' AS Date), NULL, 1)
INSERT [dbo].[DonHang] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (8, NULL, NULL, CAST(N'2023-11-18' AS Date), NULL, 1)
INSERT [dbo].[DonHang] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (9, NULL, NULL, CAST(N'2023-11-21' AS Date), NULL, 3)
INSERT [dbo].[DonHang] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (10, NULL, NULL, CAST(N'2023-11-23' AS Date), NULL, 3)
INSERT [dbo].[DonHang] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (11, NULL, NULL, CAST(N'2023-11-24' AS Date), CAST(N'2023-12-12' AS Date), 3)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NhapLaiMatKhau], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (1, N'HoangBao', N'admin', N'123123', N'123123', N'hoangbao@gmail.com', N'binhduong', N'123', N'Nam', CAST(N'2003-12-05' AS Date))
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NhapLaiMatKhau], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (3, N'thuy linh', N'thuylinh', N'123123', N'123123', N'linh123@gmail.com', N'Bình Dương', N'1234567', N'nu', CAST(N'2023-11-14' AS Date))
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [NhapLaiMatKhau], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (4, N'thúy', N'linh', N'1234', N'1234', N'1gfgr@gmail.com', N'Bình Dương', N'0966933624', N'nữ', CAST(N'2003-01-07' AS Date))
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[LienHe] ([HoTen], [Email], [TinNhan]) VALUES (N'vy', N'drfhvhr@gmail.com', N'sản phẩm tốt')
GO
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([MaSach], [TenGiay], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaChuDe], [Moi]) VALUES (1, N'Giày Converse Chuck Taylor All Star 1970s Low Top', CAST(1330000 AS Decimal(18, 0)), N'Giày Converse Chuck Taylor All Star 1970s Low Top Black được thiết kế từ chất liệu vải canvas nhẹ, dày dặn, cứng form hơn. Là dòng giày tiêu biểu và đặc trưng cho phong cách cổ điển của Converse. Lớp lót dày tạo cảm giác êm ái khi vận động, vải dày dặn, cứng form hơn. Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn. Dây giày dày hơn, cùng màu với phần đế, tem gót đen 1st-tring - đặc trưng riêng của dòng 1970s. Giày Converse Chuck 1970s là biểu tượng của văn hóa thể thao và các loại hình nghệ thuật đường phố kiểu Mỹ, truyền cảm hứng và sức sáng tạo mạnh mẽ đến giới trẻ trên toàn thế giới. Với đôi giày này bạn có thể chọn quần jeans với áo pull đơn giản. Bạn mix theo kiểu tone xuyệt tone để mang tới sự hài hòa trong phong cách.', N'1_751911_FS_ALT1C.jpg', CAST(N'2023-11-09' AS Date), 100, NULL, 1, 1)
INSERT [dbo].[Sach] ([MaSach], [TenGiay], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaChuDe], [Moi]) VALUES (2, N'Giày Converse Chuck Taylor All Star 1970s Low Top', CAST(1330000 AS Decimal(18, 0)), N'Giày Converse Chuck Taylor All Star 1970s Low Top Black được thiết kế từ chất liệu vải canvas nhẹ, dày dặn, cứng form hơn. Là dòng giày tiêu biểu và đặc trưng cho phong cách cổ điển của Converse. Lớp lót dày tạo cảm giác êm ái khi vận động, vải dày dặn, cứng form hơn. Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn. Dây giày dày hơn, cùng màu với phần đế, tem gót đen 1st-tring - đặc trưng riêng của dòng 1970s. Giày Converse Chuck 1970s là biểu tượng của văn hóa thể thao và các loại hình nghệ thuật đường phố kiểu Mỹ, truyền cảm hứng và sức sáng tạo mạnh mẽ đến giới trẻ trên toàn thế giới. Với đôi giày này bạn có thể chọn quần jeans với áo pull đơn giản. Bạn mix theo kiểu tone xuyệt tone để mang tới sự hài hòa trong phong cách.', N'il_570xN.4084286711_a7sq.jpg', CAST(N'2023-11-10' AS Date), 100, NULL, 1, 1)
INSERT [dbo].[Sach] ([MaSach], [TenGiay], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaChuDe], [Moi]) VALUES (3, N'Giày Converse Chuck Taylor All Star 1970s High Top', CAST(1430000 AS Decimal(18, 0)), N'Giày Converse Chuck Taylor All Star 1970s Low Top Black được thiết kế từ chất liệu vải canvas nhẹ, dày dặn, cứng form hơn. Là dòng giày tiêu biểu và đặc trưng cho phong cách cổ điển của Converse. Lớp lót dày tạo cảm giác êm ái khi vận động, vải dày dặn, cứng form hơn. Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn. Dây giày dày hơn, cùng màu với phần đế, tem gót đen 1st-tring - đặc trưng riêng của dòng 1970s. Giày Converse Chuck 1970s là biểu tượng của văn hóa thể thao và các loại hình nghệ thuật đường phố kiểu Mỹ, truyền cảm hứng và sức sáng tạo mạnh mẽ đến giới trẻ trên toàn thế giới. Với đôi giày này bạn có thể chọn quần jeans với áo pull đơn giản. Bạn mix theo kiểu tone xuyệt tone để mang tới sự hài hòa trong phong cách.', N'il_1080xN.4732960380_m98l.jpg', CAST(N'2023-11-10' AS Date), 100, NULL, 1, 1)
INSERT [dbo].[Sach] ([MaSach], [TenGiay], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaChuDe], [Moi]) VALUES (4, N'Giày Converse Chuck Taylor All Star 1970s High Top', CAST(1430000 AS Decimal(18, 0)), N'Giày Converse Chuck Taylor All Star 1970s Low Top Black được thiết kế từ chất liệu vải canvas nhẹ, dày dặn, cứng form hơn. Là dòng giày tiêu biểu và đặc trưng cho phong cách cổ điển của Converse. Lớp lót dày tạo cảm giác êm ái khi vận động, vải dày dặn, cứng form hơn. Phần đế màu trắng ngà vintage được phủ 1 lớp bóng bên ngoài là điểm nhấn riêng cho dòng 1970s, dễ vệ sinh hơn. Dây giày dày hơn, cùng màu với phần đế, tem gót đen 1st-tring - đặc trưng riêng của dòng 1970s. Giày Converse Chuck 1970s là biểu tượng của văn hóa thể thao và các loại hình nghệ thuật đường phố kiểu Mỹ, truyền cảm hứng và sức sáng tạo mạnh mẽ đến giới trẻ trên toàn thế giới. Với đôi giày này bạn có thể chọn quần jeans với áo pull đơn giản. Bạn mix theo kiểu tone xuyệt tone để mang tới sự hài hòa trong phong cách.', N'images.jfif', CAST(N'2023-11-10' AS Date), 100, NULL, 1, 1)
INSERT [dbo].[Sach] ([MaSach], [TenGiay], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaChuDe], [Moi]) VALUES (6, N'Giày Palladium cổ cao', CAST(1500000 AS Decimal(18, 0)), N'Giày cổ cao đậm chất cá tính luôn được các sneaker-head chờ đợi và săn đón. Bằng những đặc tính về thiết kế cũng như chất liệu, Palladium cổ cao đã tạo cho người mang một phong cách vô cùng bụi bặm, phóng khoáng.', N'palladium co cao.PNG', CAST(N'2023-10-19' AS Date), 100, NULL, 1, 1)
INSERT [dbo].[Sach] ([MaSach], [TenGiay], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaChuDe], [Moi]) VALUES (7, N'Giày Palladium Pampa Hi Dare', CAST(1600000 AS Decimal(18, 0)), N'Giày cổ cao đậm chất cá tính luôn được các sneaker-head chờ đợi và săn đón. Bằng những đặc tính về thiết kế cũng như chất liệu, Palladium cổ cao đã tạo cho người mang một phong cách vô cùng bụi bặm, phóng khoáng.', N'palladium.PNG', CAST(N'2023-11-09' AS Date), 12, NULL, 1, 1)
INSERT [dbo].[Sach] ([MaSach], [TenGiay], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaChuDe], [Moi]) VALUES (8, N'Giày Palladium Lite CuffWaterproof', CAST(2000000 AS Decimal(18, 0)), N'Do Palladium hướng đến việc sản xuất một item đa năng có thể sử dụng bất chấp mọi địa hình, thời tiết nên việc cho ra mắt dòng giày Waterproof – chống nước sẽ không có gì quá khó hiểu. Thế nhưng, để tối ưu cho khách hàng, Palladium lại kết hợp thêm chất liệu siêu nhẹ để sản xuất ra đế giày – vốn được xem là phần khá thô, nặng.', N'Palladium Lite CuffWaterproof.PNG', CAST(N'2023-11-07' AS Date), 100, NULL, 1, 1)
INSERT [dbo].[Sach] ([MaSach], [TenGiay], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaChuDe], [Moi]) VALUES (9, N'Giày Palladium Pampalicious', CAST(1450000 AS Decimal(18, 0)), N'Một phiên bản “chất chơi” hơn của dòng Palladium cổ cao chính là bộ sưu tập Pampalicious với 3 tone màu cực kỳ ngọt ngào và nổi bật Xanh – Vàng – Hồng.', N'Capture.PNG', CAST(N'2023-11-01' AS Date), 50, NULL, 1, 1)
INSERT [dbo].[Sach] ([MaSach], [TenGiay], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaChuDe], [Moi]) VALUES (10, N'Giày Pampa Hi Originale', CAST(1550000 AS Decimal(18, 0)), N'Với những đường nét đậm chất phong trần và phong cách đường phố, giày Palladium Pampa Hi Originale kế thừa những đặc điểm điển hình của một đôi giày Pampa ngày trước. Form dáng ôm lấy bàn chân thật vừa vặn sẽ cho bạn những trải nghiệm tốt nhất. Đế giày bằng cao su đúc cho độ bền chắc tuyệt đối. Giày Pampa Hi Originale có nhiều phiên bản màu sắc khác nhau cho bạn thoải mái lựa chọn.', N'....PNG', CAST(N'2023-11-16' AS Date), 100, NULL, 3, 1)
INSERT [dbo].[Sach] ([MaSach], [TenGiay], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaChuDe], [Moi]) VALUES (11, N'Giày Palladium Pampa Strapped', CAST(2100000 AS Decimal(18, 0)), N'Sự ra đời của bộ sưu tập giày Pampa Strapped tựa như một sự khởi động lại dòng Palladium nguyên bản dành cho quân đội và mang tính biểu tượng. Thiết kế bao gồm 3 phiên bản cổ cao cá tính cùng phối màu Olive Night, Aluminum, Titatinum bụi bặm, nam tính ắt hẳn sẽ là một trải nghiệm tuyệt vời dành cho những “hiker” yêu thích sự phiêu lưu mạo hiểm trên những cung đường bất tận.', N'th.PNG', CAST(N'2023-11-16' AS Date), 12, NULL, 3, 1)
INSERT [dbo].[Sach] ([MaSach], [TenGiay], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaChuDe], [Moi]) VALUES (12, N'Giày Palladium Pampa Sport Cuff WPN', CAST(2500000 AS Decimal(18, 0)), N'Đôi giày được hướng đến sự bụi bặm, chất chơi của phong cách thời trang street style (đường phố) với kiểu dáng cổ cao dày dặn ôm chân nhưng không làm cho người mang có cảm giác khó chịu nên việc kết hợp items này với một chiếc quần jeans có form slim-fit sẽ khiến các tín đồ thời trang có được những outfit thời thượng nhất.', N'hff.PNG', CAST(N'2023-11-16' AS Date), 100, NULL, 3, 1)
INSERT [dbo].[Sach] ([MaSach], [TenGiay], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaChuDe], [Moi]) VALUES (13, N'Giày Sneakers Vans Old Skool Bee Check VN0A3WKT9EH', CAST(1990000 AS Decimal(18, 0)), N'Giày Vans Old Skool Bee Check VN0A3WKT9EH mang đậm tính thể thao đường phố với thiết kế đặc trưng lượn sóng 2, phối màu trung tính rất dễ phối đồ, phù hợp với mọi phong cách thời trang luôn cuốn giới trẻ hiện nay', N'vans1.PNG', CAST(N'2023-11-16' AS Date), 110, NULL, 2, 1)
INSERT [dbo].[Sach] ([MaSach], [TenGiay], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaChuDe], [Moi]) VALUES (14, N'Giày Slip On Vans Classic Checkerboard VN0A33TB42X Phối Màu', CAST(1700000 AS Decimal(18, 0)), N'Với thiết kế kiểu dáng slip-on độc đáo giúp việc mang tháo trở nên dễ dàng hơn. Đồng thời chất vải canvas mỏng nhẹ bền chắc luôn mang đến cho đôi chân sự thoải mái trong di chuyển', N'gay.PNG', CAST(N'2023-11-16' AS Date), 120, NULL, 2, 1)
INSERT [dbo].[Sach] ([MaSach], [TenGiay], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaChuDe], [Moi]) VALUES (15, N'Giày Slip On Nam Vans Knu Skool VN0009QC6BT Màu Trắng Đen', CAST(3500000 AS Decimal(18, 0)), N'Giày được thiết kế với cổ thấp, lưỡi gà phồng lớn, tạo cho nó vẻ ngoài phóng đại giống Old Skool nguyên bản.', N'thtuyg.PNG', CAST(N'2023-11-16' AS Date), 100, NULL, 2, 1)
INSERT [dbo].[Sach] ([MaSach], [TenGiay], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaChuDe], [Moi]) VALUES (16, N'Giày Sneaker Vans Ua Old Skool Crystal Sidestripe - VN0A5KRSP53 Màu Đen Xám', CAST(1950000 AS Decimal(18, 0)), N'Là một trong những đôi giày thời trang đến từ thương hiệu Vans nổi tiếng của Mỹ. Mẫu giày với thiết kế đẹp mắt cùng form dáng đi lên chân vô cùng sành điệu', N'gbhfh.PNG', CAST(N'2023-11-16' AS Date), 21, NULL, 2, 1)
INSERT [dbo].[Sach] ([MaSach], [TenGiay], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaChuDe], [Moi]) VALUES (17, N'Giày Sneaker Vans Old Skool Style 136 Decon VR3 SF - VN0A4BX9KIG Màu Trắng', CAST(2200000 AS Decimal(18, 0)), N'Đôi giày với gam màu trang nhã dễ mix đồ cho bạn một set đồ thời trang hơn', N'hgjjf.PNG', CAST(N'2023-11-16' AS Date), 100, NULL, 2, 1)
SET IDENTITY_INSERT [dbo].[Sach] OFF
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_SanPham] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_SanPham]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_HangHoa] FOREIGN KEY([MaChuDe])
REFERENCES [dbo].[ChuDe] ([MaChuDe])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_SanPham_HangHoa]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaXuatBan] ([MaNCC])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]
GO
