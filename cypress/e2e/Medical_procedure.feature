Feature: Medical_procedure

  Rule: Happy paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "QUẢN LÝ DANH MỤC" menu
      When Click "Loại thủ thuật" sub menu to "/medical-procedure"
      When Click "Tạo mới" button
      When Enter "text" in "Tên thủ thuật" with "_RANDOM_"
      When Enter "text" in "Mã thủ thuật" with "_RANDOM_"
      When Click select "Nhóm thủ thuật" with "Implant"
      When Enter "percentage" in "Tỉ lệ cọc (%)" with "_RANDOM_"
      When Enter "number" in "Giá cơ sở (đ)" with "_RANDOM_"
      When Click switch "Thủ thuật làm 1 lần" to be activated
      When Click "Lưu lại" button

    Scenario: MP_01 Verify when create Medical procedure successfully
      Then User look message "Success" popup
      Then Click on the "Xóa" button in the "Tên thủ thuật" table line

    Scenario: MP_02 Verify when edit Medical procedure successfully
      When Click on the "Sửa" button in the "Tên thủ thuật" table line
      When Enter "text" in "Tên thủ thuật" with "_RANDOM_"
      When Enter "text" in "Mã thủ thuật" with "_RANDOM_"
      When Click select "Nhóm thủ thuật" with "Chỉnh Nha"
      When Enter "number" in "Giá cơ sở (đ)" with "_RANDOM_"
      When Click switch "Thủ thuật làm 1 lần" to be activated
      When Click "Lưu lại" button
      Then User look message "Success" popup
      Then Click on the "Xóa" button in the "Tên thủ thuật" table line

    Scenario: MP_03 Verify when delete Medical procedure successfully
      When Click on the "Xóa" button in the "Tên thủ thuật" table line
      Then User look message "Xóa thành công" popup

#  Rule: Commission percentage Happy paths
#    Background
#      Given User go to login page
#      When Enter "text" in "Email" with "admin@gmail.com"
#      When Enter "text" in "Mật khẩu" with "123123"
#      When Click "Đăng nhập" button
#      Then User look message "Success" popup
#      When Click "QUẢN LÝ DANH MỤC" menu
#      When Click "Loại thủ thuật" sub menu to "/medical-procedure"
#
#    Scenario: MP_04 Verify when edit Commission rate configuration successfully
#      When Click "Commission percentage" button
#      When Enter "number" in "Hòa Bình" with "40"
#      Then User look message "Success" popup

  Rule: Bad paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "QUẢN LÝ DANH MỤC" menu
      When Click "Loại thủ thuật" sub menu to "/medical-procedure"
      When Click "Tạo mới" button

    Scenario: MP_05 Verify when create Medical procedure unsuccessfully because leaving Medical procedure field
      When Enter "text" in "Mã thủ thuật" with "_RANDOM_"
      When Click select "Nhóm thủ thuật" with "Implant"
      When Enter "number" in "Tỉ lệ cọc (%)" with "10"
      When Enter "number" in "Giá cơ sở (đ)" with "_RANDOM_"
      When Click switch "Thủ thuật làm 1 lần" to be activated
      When Click "Lưu lại" button
      Then Required message "Tên thủ thuật" displayed under "Xin vui lòng nhập tên thủ thuật" field

    Scenario: MP_06 Verify when create Medical procedure unsuccessfully because leaving Procedure Code field
      When Enter "text" in "Tên thủ thuật" with "_RANDOM_"
      When Click select "Nhóm thủ thuật" with "Implant"
      When Enter "number" in "Tỉ lệ cọc (%)" with "10"
      When Enter "number" in "Giá cơ sở (đ)" with "_RANDOM_"
      When Click switch "Thủ thuật làm 1 lần" to be activated
      When Click "Lưu lại" button
      Then Required message "Mã thủ thuật" displayed under "Xin vui lòng nhập mã thủ thuật" field

    Scenario: MP_07 Verify when create Medical procedure unsuccessfully because leaving Deposit Percentage field
      When Enter "text" in "Tên thủ thuật" with "_RANDOM_"
      When Enter "text" in "Mã thủ thuật" with "_RANDOM_"
      When Click select "Nhóm thủ thuật" with "Implant"
      When Enter "number" in "Giá cơ sở (đ)" with "_RANDOM_"
      When Click switch "Thủ thuật làm 1 lần" to be activated
      When Click "Lưu lại" button
      Then Required message "Tỉ lệ cọc (%)" displayed under "Xin vui lòng nhập tỉ lệ cọc (%)" field

    Scenario: MP_08 Verify when create Medical procedure unsuccessfully because leaving Commission Amount field
      When Enter "text" in "Tên thủ thuật" with "_RANDOM_"
      When Enter "text" in "Mã thủ thuật" with "_RANDOM_"
      When Click select "Nhóm thủ thuật" with "Implant"
      When Enter "number" in "Tỉ lệ cọc (%)" with "10"
      When Click switch "Thủ thuật làm 1 lần" to be activated
      When Click "Lưu lại" button
      Then Required message "Giá cơ sở (đ)" displayed under "Xin vui lòng nhập giá cơ sở (đ)" field

    Scenario: MP_09 Verify when create Medical procedure unsuccessfully because no select Procedure Group
      When Enter "text" in "Tên thủ thuật" with "_RANDOM_"
      When Enter "text" in "Mã thủ thuật" with "_RANDOM_"
      When Enter "number" in "Tỉ lệ cọc (%)" with "10"
      When Enter "number" in "Giá cơ sở (đ)" with "_RANDOM_"
      When Click switch "Thủ thuật làm 1 lần" to be activated
      When Click "Lưu lại" button
      Then Required message "Nhóm thủ thuật" displayed under "Xin vui lòng chọn nhóm thủ thuật" field

    Scenario: MP_10 Verify when create Medical procedure unsuccessfully because leaving all field
      When Click "Lưu lại" button
      Then Required message "Tên thủ thuật" displayed under "Xin vui lòng nhập tên thủ thuật" field
      Then Required message "Mã thủ thuật" displayed under "Xin vui lòng nhập mã thủ thuật" field
      Then Required message "Tỉ lệ cọc (%)" displayed under "Xin vui lòng nhập tỉ lệ cọc (%)" field
      Then Required message "Giá cơ sở (đ)" displayed under "Xin vui lòng nhập giá cơ sở (đ)" field
      Then Required message "Nhóm thủ thuật" displayed under "Xin vui lòng chọn nhóm thủ thuật" field

    Scenario: MP_11 Verify when create Medical procedure unsuccessfully because enter negative number in Deposit Percentage field
      When Enter "text" in "Tên thủ thuật" with "_RANDOM_"
      When Enter "text" in "Mã thủ thuật" with "_RANDOM_"
      When Click select "Nhóm thủ thuật" with "Implant"
      When Enter "number" in "Tỉ lệ cọc (%)" with "-10"
      When Enter "number" in "Giá cơ sở (đ)" with "_RANDOM_"
      When Click switch "Thủ thuật làm 1 lần" to be activated
      When Click "Lưu lại" button
      Then Required message "Tỉ lệ cọc (%)" displayed under "Tối thiểu là 1" field

    Scenario: MP_12 Verify when create Medical procedure unsuccessfully because enter Deposit Percentage greater than 100
      When Enter "text" in "Tên thủ thuật" with "_RANDOM_"
      When Enter "text" in "Mã thủ thuật" with "_RANDOM_"
      When Click select "Nhóm thủ thuật" with "Implant"
      When Enter "number" in "Tỉ lệ cọc (%)" with "110"
      When Enter "number" in "Giá cơ sở (đ)" with "_RANDOM_"
      When Click switch "Thủ thuật làm 1 lần" to be activated
      When Click "Lưu lại" button
      Then Required message "Tỉ lệ cọc (%)" displayed under "Tối đa là 100" field
