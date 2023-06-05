Feature: Code types

  Rule: Happy paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "QUẢN LÝ DANH MỤC" menu
      When Click "Danh mục" sub menu to "/code-types"
      When Click "Thêm mới" button
      When Enter "text" in "Tiêu đề" with "_RANDOM_"
      When Enter "number" in "Thứ tự" with "_RANDOM_"
      When Enter "text" in "Mã" with "_RANDOM_"
      When Enter "words" in textarea "Mô tả" with "_RANDOM_"
      When Click "Lưu lại" button

    Scenario: MD_01 Verify when create Medical Degree successful
      Then User look message "Success" popup
      Then Click on the "Xóa" button in the "Tiêu đề" table line

    Scenario: MD_02 Verify when edit Medical Degree successful
      Then User look message "Success" popup
      Then Click on the "Sửa" button in the "Tiêu đề" table line
      When Enter "text" in "Tiêu đề" with "_RANDOM_"
      When Enter "number" in "Thứ tự" with "_RANDOM_"
      When Enter "words" in textarea "Mô tả" with "_RANDOM_"
      When Click "Lưu lại" button
      Then Click on the "Xóa" button in the "Tiêu đề" table line

    Scenario: MD_03 Verify when create Medical Degree successful
      Then User look message "Success" popup
      Then Click on the "Xóa" button in the "Tiêu đề" table line
      Then User look message "Đã xóa thành công" popup

  Rule: Bad paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "QUẢN LÝ DANH MỤC" menu
      When Click "Danh mục" sub menu to "/code-types"
      When Click "Thêm mới" button

    Scenario: MD_04 Verify when create Medical Degree unsuccessful beacause leaving Title field
      When Enter "number" in "Thứ tự" with "_RANDOM_"
      When Enter "text" in "Mã" with "_RANDOM_"
      When Enter "words" in textarea "Mô tả" with "_RANDOM_"
      When Click "Lưu lại" button
      Then Required message "Tiêu đề" displayed under "Xin vui lòng nhập tiêu đề" field

    Scenario: MD_05 Verify when create Medical Degree unsuccessful beacause leaving Code field
      When Enter "text" in "Tiêu đề" with "_RANDOM_"
      When Enter "number" in "Thứ tự" with "_RANDOM_"
      When Enter "words" in textarea "Mô tả" with "_RANDOM_"
      When Click "Lưu lại" button
      Then Required message "Mã" displayed under "Xin vui lòng nhập mã" field

    Scenario: MD_06 Verify when create Medical Degree unsuccessful beacause leaving All field
      When Click "Lưu lại" button
      Then Required message "Tiêu đề" displayed under "Xin vui lòng nhập tiêu đề" field
      Then Required message "Mã" displayed under "Xin vui lòng nhập mã" field

    Scenario: MD_06 Verify when edit Medical Degree unsuccessful beacause leaving All field

      When Click "Lưu lại" button
      Then Required message "Mã" displayed under "Xin vui lòng nhập mã" field

  Rule: Bad Edit paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "QUẢN LÝ DANH MỤC" menu
      When Click "Danh mục" sub menu to "/code-types"
      When Click "Thêm mới" button
  