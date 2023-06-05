Feature: Customer Account

  Rule: Happy paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "QUẢN LÝ TÀI KHOẢN" menu
      When Click "Tài khoản Khách hàng" sub menu to "/customer-account"
      When Click "Tạo mới" button
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "Farmer Side"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Enter "text" in "Mật khẩu" with "_RANDOM_"
      When Enter "text" in "Xác nhận mật khẩu" with "_@Mật khẩu@_"
      When Click "Lưu lại" button

    Scenario: CA_01 Verify when create Customer Account successful
      Then User look message "Tạo tài khoản thành công" popup
      Then Click on the "Xóa" button in the "Họ và tên" table line

    Scenario: CA_02 Verify when edit Customer Account successful
      Then User look message "Tạo tài khoản thành công" popup
      When Click on the "Sửa" button in the "Họ và tên" table line
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Click select "Giới tính" with "Nam"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Click "Lưu lại" button
      Then User look message "Chỉnh sửa tài khoản thành công" popup
      Then Click on the "Xóa" button in the "Họ và tên" table line

    Scenario: CA_03 Verify when edit password Customer Account successful
      Then User look message "Tạo tài khoản thành công" popup
      When Click on the "Đổi mật khẩu" button in the "Họ và tên" table line
      When Enter "text" in "Mật khẩu" with "_RANDOM_"
      When Enter "text" in "Xác nhận mật khẩu" with "_@Mật khẩu@_"
      When Click "Lưu lại" button
      Then User look message "Đổi mật khẩu thành công" popup
      Then Click on the "Xóa" button in the "Họ và tên" table line

    Scenario: CA_04 Verify when delete Customer Account successful
      Then User look message "Tạo tài khoản thành công" popup
      When Click on the "Xóa" button in the "Họ và tên" table line

    Scenario: CA_05 Verify when lock Customer Account successful
      Then User look message "Tạo tài khoản thành công" popup
      When Click on the "Chi tiết" button in the "Họ và tên" table line
      When Click "Mở Khóa" button
      Then User look message "Khóa tài khoản người dùng thành công !" popup
      When Click "Trở lại" icon button
      Then Click on the "Xóa" button in the "Họ và tên" table line

    Scenario: CA_06 Verify when unlock Customer Account successful
      Then User look message "Tạo tài khoản thành công" popup
      When Click on the "Chi tiết" button in the "Họ và tên" table line
      When Click "Mở Khóa" button
      Then User look message "Khóa tài khoản người dùng thành công !" popup
      When Click "Khóa" button
      Then User look message "Mở khóa tài khoản người dùng thành công." popup
      When Click "Trở lại" icon button
      Then Click on the "Xóa" button in the "Họ và tên" table line

  Rule: Bad paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "QUẢN LÝ TÀI KHOẢN" menu
      When Click "Tài khoản Khách hàng" sub menu to "/customer-account"
      When Click "Tạo mới" button

    Scenario: CA_07 Verify when create Customer Account unsuccessful because leaving Customer name field
      When Enter "email" in "Email" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "Farmer Side"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Enter "text" in "Mật khẩu" with "_RANDOM_"
      When Enter "text" in "Xác nhận mật khẩu" with "_@Mật khẩu@_"
      When Click "Lưu lại" button
      Then Required message "Họ và tên" displayed under "Xin vui lòng nhập họ và tên" field

    Scenario: CA_08 Verify when create Customer Account unsuccessful because leaving Email field
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "Farmer Side"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Enter "text" in "Mật khẩu" with "_RANDOM_"
      When Enter "text" in "Xác nhận mật khẩu" with "_@Mật khẩu@_"
      When Click "Lưu lại" button
      Then Required message "Email" displayed under "Xin vui lòng nhập email" field

    Scenario: CA_09 Verify when create Customer Account unsuccessful because no select Gender
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Click select "Loại tài khoản" with "Farmer Side"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Enter "text" in "Mật khẩu" with "_RANDOM_"
      When Enter "text" in "Xác nhận mật khẩu" with "_@Mật khẩu@_"
      When Click "Lưu lại" button
      Then Required message "Giới tính" displayed under "Xin vui lòng chọn giới tính" field

    Scenario: CA_10 Verify when create Customer Account unsuccessful because no select Role
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Enter "text" in "Mật khẩu" with "_RANDOM_"
      When Enter "text" in "Xác nhận mật khẩu" with "_@Mật khẩu@_"
      When Click "Lưu lại" button
      Then Required message "Loại tài khoản" displayed under "Xin vui lòng chọn loại tài khoản" field

    Scenario: CA_11 Verify when create Customer Account unsuccessful because leaving Phone Number field
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "Farmer Side"
      When Enter "text" in "Mật khẩu" with "_RANDOM_"
      When Enter "text" in "Xác nhận mật khẩu" with "_@Mật khẩu@_"
      When Click "Lưu lại" button
      Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại" field

    Scenario: CA_12 Verify when create Customer Account unsuccessful because leaving Password field
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Click select "Loại tài khoản" with "Farmer Side"
      When Enter "text" in "Xác nhận mật khẩu" with "_RANDOM_"
      When Click "Lưu lại" button
      Then Required message "Mật khẩu" displayed under "Xin vui lòng nhập mật khẩu" field

    Scenario: CA_13 Verify when create Customer Account unsuccessful because leaving Confirm Password field
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Click select "Loại tài khoản" with "Farmer Side"
      When Enter "text" in "Mật khẩu" with "_RANDOM_"
      When Click "Lưu lại" button
      Then Required message "Xác nhận mật khẩu" displayed under "Mật khẩu và mật khẩu xác nhận không khớp" field

    Scenario: CA_14 Verify when create Customer Account unsuccessful because leaving all field
      When Click "Lưu lại" button
      Then Required message "Họ và tên" displayed under "Xin vui lòng nhập họ và tên" field
      Then Required message "Email" displayed under "Xin vui lòng nhập email" field
      Then Required message "Giới tính" displayed under "Xin vui lòng chọn giới tính" field
      Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại" field
      Then Required message "Loại tài khoản" displayed under "Xin vui lòng chọn loại tài khoản" field
      Then Required message "Mật khẩu" displayed under "Xin vui lòng nhập mật khẩu" field

    Scenario: CA_15 Verify when create Customer Account unsuccessful because entered invalid email in Email field
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "text" in "Email" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Click select "Loại tài khoản" with "Farmer Side"
      When Enter "text" in "Mật khẩu" with "_RANDOM_"
      When Enter "text" in "Xác nhận mật khẩu" with "_@Mật khẩu@_"
      When Click "Lưu lại" button
      Then Required message "Email" displayed under "Vui lòng nhập địa chỉ email hợp lệ!" field

    Scenario: CA_16 Verify when create Medical procedure unsuccessful because enter password and confirmation password do not match
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Click select "Loại tài khoản" with "Farmer Side"
      When Enter "text" in "Mật khẩu" with "_RANDOM_"
      When Enter "text" in "Mật khẩu" with "_RANDOM_"
      When Click "Lưu lại" button
      Then Required message "Xác nhận mật khẩu" displayed under "Mật khẩu và mật khẩu xác nhận không khớp" field


  Rule: Bad change password paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "QUẢN LÝ TÀI KHOẢN" menu
      When Click "Tài khoản Khách hàng" sub menu to "/customer-account"
      When Click "Tạo mới" button
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "Farmer Side"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Enter "text" in "Mật khẩu" with "_RANDOM_"
      When Enter "text" in "Xác nhận mật khẩu" with "_@Mật khẩu@_"
      When Click "Lưu lại" button
      When Click on the "Đổi mật khẩu" button in the "Họ và tên" table line

    Scenario: CA_17 Verify when change password Customer Account unsuccessful because leaving Password field
      When Enter "text" in "Xác nhận mật khẩu" with "_RANDOM_"
      When Click "Lưu lại" button
      Then Required message "Mật khẩu" displayed under "Xin vui lòng nhập mật khẩu" field
      Then Required message "Xác nhận mật khẩu" displayed under "Mật khẩu và mật khẩu xác nhận không khớp" field
      When Click "Đóng lại" button
      Then Click on the "Xóa" button in the "Họ và tên" table line

    Scenario: CA_18 Verify when change password Customer Account unsuccessful because leaving Confirm password field
      When Enter "text" in "Mật khẩu" with "_RANDOM_"
      When Click "Lưu lại" button
      Then Required message "Xác nhận mật khẩu" displayed under "Xin vui lòng nhập xác nhận mật khẩu" field
      When Click "Đóng lại" button
      Then Click on the "Xóa" button in the "Họ và tên" table line

    Scenario: CA_19 Verify when change password Customer Account unsuccessful because leaving All field
      When Click "Lưu lại" button
      Then Required message "Mật khẩu" displayed under "Xin vui lòng nhập mật khẩu" field
      Then Required message "Xác nhận mật khẩu" displayed under "Xin vui lòng nhập xác nhận mật khẩu" field
      When Click "Đóng lại" button
      Then Click on the "Xóa" button in the "Họ và tên" table line

  Rule: Bad edit Customer Account paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "QUẢN LÝ TÀI KHOẢN" menu
      When Click "Tài khoản Khách hàng" sub menu to "/customer-account"
      When Click "Tạo mới" button
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "Farmer Side"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Enter "text" in "Mật khẩu" with "_RANDOM_"
      When Enter "text" in "Xác nhận mật khẩu" with "_@Mật khẩu@_"
      When Click "Lưu lại" button
      Then User look message "Tạo tài khoản thành công" popup
      When Click on the "Sửa" button in the "Họ và tên" table line

    Scenario: CA_20 Verify when change password Customer Account unsuccessful because clear Customer name field
      When Enter "text" in "Họ và tên" with ""
      When Click "Lưu lại" button
      Then Required message "Họ và tên" displayed under "Xin vui lòng nhập họ và tên" field
      When Click "Đóng lại" button
      Then Click on the "Xóa" button in the "Họ và tên" table line

    Scenario: CA_21 Verify when change password Customer Account unsuccessful because clear Phone number field
      When Enter "text" in "Số điện thoại" with ""
      When Click "Lưu lại" button
      Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại" field
      When Click "Đóng lại" button
      Then Click on the "Xóa" button in the "Họ và tên" table line

  Rule: Compare paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "QUẢN LÝ TÀI KHOẢN" menu
      When Click "Tài khoản Khách hàng" sub menu to "/customer-account"
      When Click "Tạo mới" button
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "Farmer Side"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Enter "text" in "Mật khẩu" with "_RANDOM_"
      When Enter "text" in "Xác nhận mật khẩu" with "_@Mật khẩu@_"
      When Click "Lưu lại" button
      Then User look message "Tạo tài khoản thành công" popup

    Scenario: CA_22 Verify when create Customer Account unsuccessful because same Email
      When Click "Tạo mới" button
      When Enter "text" in "Họ và tên" with "_@Họ và tên@_"
      When Enter "email" in "Email" with "_@Email@_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "Farmer Side"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Enter "text" in "Mật khẩu" with "_RANDOM_"
      When Enter "text" in "Xác nhận mật khẩu" with "_@Mật khẩu@_"
      When Click "Lưu lại" button
      Then User look message "Tên người dùng/Email đã được sử dụng." popup
      When Click "Đóng lại" button
      Then Click on the "Xóa" button in the "Họ và tên" table line

    Scenario: CA_23 Verify when create Customer Account unsuccessful because same Phone Number
      When Click "Tạo mới" button
      When Enter "text" in "Họ và tên" with "_@Họ và tên@_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "Farmer Side"
      When Enter "phone" in "Số điện thoại" with "_@Số điện thoại@_"
      When Enter "text" in "Mật khẩu" with "_RANDOM_"
      When Enter "text" in "Xác nhận mật khẩu" with "_@Mật khẩu@_"
      When Click "Lưu lại" button
      Then User look message "Số điện thoại đã được sử dụng." popup
      When Click "Đóng lại" button
      Then Click on the "Xóa" button in the "Họ và tên" table line
