Feature: Account Internal

  Rule: Happy paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "QUẢN LÝ TÀI KHOẢN" menu
      When Click "Tài khoản Nội bộ" sub menu to "/internal-account"
      When Click "Tạo mới" button
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "CSKH"
      When Enter "text" in "Mật khẩu" with "123456"
      When Enter "text" in "Xác nhận mật khẩu" with "123456"
      When Click "Lưu lại" button

    Scenario: Verify when Create menu successfully
      Then User look message "Tạo tài khoản thành công" popup
      When Click on the "Xóa" button in the "Họ và tên" table line

    Scenario: Verify when Edit menu successfully
      Then User look message "Tạo tài khoản thành công" popup
      When Click on the "Sửa" button in the "Họ và tên" table line
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Click select "Giới tính" with "Nam"
      When Click "Lưu lại" button
      Then User look message "Chỉnh sửa tài khoản thành công" popup
      When Click on the "Xóa" button in the "Họ và tên" table line

    Scenario: Verify success when Change password
      Then User look message "Tạo tài khoản thành công" popup
      When Click on the "Đổi mật khẩu" button in the "Họ và tên" table line
      When Enter "text" in "Mật khẩu" with "12345"
      When Enter "text" in "Xác nhận mật khẩu" with "12345"
      When Click "Lưu lại" button
      Then User look message "Đổi mật khẩu thành công" popup
      When Click on the "Xóa" button in the "Họ và tên" table line

  Rule: Bad paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "QUẢN LÝ TÀI KHOẢN" menu
      When Click "Tài khoản Nội bộ" sub menu to "/internal-account"
      When Click "Tạo mới" button

    Scenario: Verify when Create Code type unsuccessfully when leaving all fields blank
      When Click "Lưu lại" button
      Then Required message "Họ và tên" displayed under "Xin vui lòng nhập họ và tên" field
      Then Required message "Email" displayed under "Xin vui lòng nhập email" field
      Then Required message "Giới tính" displayed under "Xin vui lòng chọn giới tính" field
      Then Required message "Loại tài khoản" displayed under "Xin vui lòng chọn loại tài khoản" field
      Then Required message "Mật khẩu" displayed under "Xin vui lòng nhập mật khẩu" field

    Scenario: Verify when Create menu unsuccessfully when leaving Họ và tên fields blank
      When Click "Lưu lại" button
      Then Required message "Họ và tên" displayed under "Xin vui lòng nhập họ và tên" field

    Scenario: Verify when Create menu unsuccessfully when leaving Email fields blank
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "CSKH"
      When Enter "text" in "Mật khẩu" with "123456"
      When Enter "text" in "Xác nhận mật khẩu" with "123456"
      When Click "Lưu lại" button
      Then Required message "Email" displayed under "Xin vui lòng nhập email" field

    Scenario: Verify when Create menu unsuccessfully when leaving Số điện thoại fields blank
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "CSKH"
      When Enter "text" in "Mật khẩu" with "123456"
      When Enter "text" in "Xác nhận mật khẩu" with "123456"
      When Click "Lưu lại" button
      Then Required message "Số điện thoại" displayed under "Xin vui lòng nhập số điện thoại" field

    Scenario: Verify when Create menu unsuccessfully when leaving Giới tính fields blank
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Click select "Loại tài khoản" with "CSKH"
      When Enter "text" in "Mật khẩu" with "123456"
      When Enter "text" in "Xác nhận mật khẩu" with "123456"
      When Click "Lưu lại" button
      Then Required message "Giới tính" displayed under "Xin vui lòng chọn giới tính" field

    Scenario: Verify when Create menu unsuccessfully when leaving Loại tài khoản fields blank
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Enter "text" in "Mật khẩu" with "123456"
      When Enter "text" in "Xác nhận mật khẩu" with "123456"
      When Click "Lưu lại" button
      Then Required message "Loại tài khoản" displayed under "Xin vui lòng chọn loại tài khoản" field

    Scenario: Verify when Create menu unsuccessfully when leaving Password fields blank
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "CSKH"
      When Enter "text" in "Xác nhận mật khẩu" with "123456"
      When Click "Lưu lại" button
      Then Required message "Mật khẩu" displayed under "Xin vui lòng nhập mật khẩu" field

    Scenario: Verify when Create menu unsuccessfully when leaving Xác nhận mật khẩu fields blank
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "CSKH"
      When Enter "text" in "Mật khẩu" with "123456"
      When Click "Lưu lại" button
      Then Required message "Xác nhận mật khẩu" displayed under "Mật khẩu và mật khẩu xác nhận không khớp" field

    Scenario: Verification failed when entering data Confirm Password does not match Password
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "CSKH"
      When Enter "text" in "Mật khẩu" with "123456"
      When Enter "text" in "Xác nhận mật khẩu" with "1234"
      When Click "Lưu lại" button
      Then Required message "Xác nhận mật khẩu" displayed under "Mật khẩu và mật khẩu xác nhận không khớp" field

    Scenario: Verification Change password fails when all Change Password fields were blank
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "CSKH"
      When Enter "text" in "Mật khẩu" with "123456"
      When Enter "text" in "Xác nhận mật khẩu" with "123456"
      When Click "Lưu" button
      Then User look message "Tạo tài khoản thành công" popup
      When Click on the "Đổi mật khẩu" button in the "Họ và tên" table line
      When Click "Lưu lại" button
      Then Required message "Mật khẩu" displayed under "Xin vui lòng nhập mật khẩu" field
      When Click "Đóng lại" button
      When Click on the "Xóa" button in the "Họ và tên" table line

    Scenario: Verification Change password failed when Password field was blank
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "CSKH"
      When Enter "text" in "Mật khẩu" with "123456"
      When Enter "text" in "Xác nhận mật khẩu" with "123456"
      When Click "Lưu lại" button
      Then User look message "Tạo tài khoản thành công" popup
      When Click on the "Đổi mật khẩu" button in the "Họ và tên" table line
      When Enter "text" in "Xác nhận mật khẩu" with "123456"
      When Click "Lưu lại" button
      Then Required message "Mật khẩu" displayed under "Xin vui lòng nhập mật khẩu" field
      When Click "Đóng lại" button
      When Click on the "Xóa" button in the "Họ và tên" table line

    Scenario: Verification Change password failed when Confirm Password field was blank
      When Enter "text" in "Họ và tên" with "_RANDOM_"
      When Enter "email" in "Email" with "_RANDOM_"
      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
      When Click select "Giới tính" with "Nữ"
      When Click select "Loại tài khoản" with "CSKH"
      When Enter "text" in "Mật khẩu" with "123456"
      When Enter "text" in "Xác nhận mật khẩu" with "123456"
      When Click "Lưu lại" button
      Then User look message "Tạo tài khoản thành công" popup
      When Click on the "Đổi mật khẩu" button in the "Họ và tên" table line
      When Enter "text" in "Mật khẩu" with "123456"
      When Enter "text" in "Xác nhận mật khẩu" with "12345"
      When Click "Lưu lại" button
      Then Required message "Xác nhận mật khẩu" displayed under "Mật khẩu và mật khẩu xác nhận không khớp" field
      When Click "Đóng lại" button
      When Click on the "Xóa" button in the "Họ và tên" table line

  Rule: Compare paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "QUẢN LÝ TÀI KHOẢN" menu
      When Click "Tài khoản Nội bộ" sub menu to "/internal-account"

    Scenario: Verify search successfully when inputting valid data into the search box field
      When Enter "text" in "Tìm kiếm" with "Minh"

    Scenario: Verify successful search when selecting data in the "Account Type" field
      When Click select "Loại tài khoản" with "CSKH"

    Scenario: Verify successful search when selecting data in the "Activated" field
      When Click select "Kích hoạt" with "Mở Khóa"

#    Scenario: Verification is successful when successfully Locking Internal Account information
#      When Click "Tạo mới" button
#      When Enter "text" in "Họ và tên" with "_RANDOM_"
#      When Enter "email" in "Email" with "_RANDOM_"
#      When Enter "phone" in "Số điện thoại" with "_RANDOM_"
#      When Click select "Giới tính" with "Nữ"
#      When Click select "Loại tài khoản" with "CSKH"
#      When Enter "text" in "Mật khẩu" with "123456"
#      When Enter "text" in "Xác nhận mật khẩu" with "123456"
#      When Click "Lưu lại" button
#      When Click on the "Xóa" button in the "Họ và tên" table line
