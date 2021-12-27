# PTUDW---Final-Project---Online-Auction
PTUDW - Final Project - Online Auction
Xây dựng ứng dụng Sàn Đấu Giá Trực Tuyến, gồm các phân hệ & chức năng sau

1. Phân hệ người dùng nặc danh - guest 
   1. Xem danh sách sản phẩm 
      1. Xem danh sách danh mục category
      2. Top 5 sản phẩm gần kết thúc
      3. Top 5 sản phẩm có nhiều lượt ra giá nhất
      4. Top 5 sản phẩm có giá cao nhất
   2. Tìm kiếm sản phẩm 
      1. Tìm theo tên sản phẩm, tìm theo danh mục
      2. Sắp xếp theo ý người dùng 
   3. Xem chi tiết sản phẩm 
   4. Xem gợi ý 5 sản phẩm khác cùng chuyên mục
2. Đăng ký 
   1. Thông tin: Họ tên, Địa chỉ, Email, Ngày sinh, Tên tài khoản, Mật Khẩu, mã OTP
3. Phân hệ người mua bidder 
   1. Lưu 1 sản phẩm vào danh sách yêu thích Watch List 
      1. Thực hiện tại view Danh sách sản phẩm 
      2. Thực hiện tại view Chi tiết sản phẩm
   2. Ra giá 
      1. Thực hiện tại view Chi tiết sản phẩm
   3. Xem lịch sử đấu giá của sản phẩm 
   4. Quản lý hồ sơ cá nhân 
      1. Đổi thông tin email, họ tên, mật khẩu 
      2. Xem điểm đánh giá và chi tiết các lần được đánh giá & đoạn nhận xét mà người đánh giá gửi 
      3. Xem danh sách sản phẩm yêu thích của mình 
      4. Xem danh sách sản phẩm mà mình đang tham gia đấu giá 
      5. Xem danh sách sản phẩm mà mình đã thắng (giá cao nhất)
      6. Đánh giá người bán: (+1), (-1), gửi kèm một đoạn nhận xét 
   5. Xin được bán trong vòng 7 ngày
4. Phân hệ người bán - seller 
   1. Đăng sản phẩm đấu giá 
   2. Bổ sung thông tin mô tả sản phẩm 
   3. Từ chối lượt ra giá của bidder 
5. Phân hệ quản trị viên - administrator 
   1. Quản lý danh mục category
   2. Quản lý sản phẩm
   3. Quản lý danh sách người dùng 
      1. Các chức năng quản lý cơ bản 
      2. Xem danh sách bidder xin nâng cấp tài khoản 
      3. Duyệt nâng cấp tài khoản bidder ➠ seller 
      4. Hạ cấp seller ➠ bidder
6. Các tính năng chung cho các phân hệ người dùng
   1. Đăng nhập
   2. Cập nhật thông tin cá nhân
   3. Đổi mật khẩu
   4. Quên mật khẩu
7. Hệ thống
   1. Mailing System 
   2. Đấu giá tự động
   Hệ thống hỗ trợ đấu giá tự động, giúp người mua có thể thắng được sản phẩm đấu giá với giá thấp nhất có thể Người mua ra giá-tối-đa mà mình có thể trả cho sản phẩm
Giá hiện tại của sản phẩm sẽ liên tục được cập nhật dựa trên giá-tối-đa và giá-tối-đa-của-người-mua-khác
Nếu 2 bidder ra cùng mức giá, bidder ra giá trước được ghi nhận là người-ra-giá-cao-nhất