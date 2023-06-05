Feature: Parameter

  Rule: Happy paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "SUPERADMIN" menu
      When Click "Cấu hình hệ thống" sub menu to "/parameter"
      When Click "Tạo mới" button
      When Enter "text" in "Tên tham số" with "_RANDOM_"
      When Enter "text" in "Giá trị tham số" with "_RANDOM_"
      When Enter "text" in "Nhóm" with "Test"
#      When Click switch "Hệ thống" to be activated
      When Enter "words" in textarea "Ghi chú" with "_RANDOM_"
      When Click "Lưu lại" button

    Scenario: PR_01 Verify when Create menu successfully
      Then User look message "Success" popup
      When Click on the previously created "Tên tham số" tree to delete

    Scenario: PR_02 Verify when Edit menu successfully
      Then User look message "Success" popup
      When Click on the previously created "Tên tham số" tree to edit
      When Enter "text" in "Tên tham số" with "_RANDOM_"
      When Enter "text" in "Giá trị tham số" with "_RANDOM_"
      When Enter "text" in "Nhóm" with "Test"
      When Enter "words" in textarea "Ghi chú" with "_RANDOM_"
      When Click "Lưu lại" button
      Then User look message "Success" popup
      When Click on the previously created "Tên tham số" tree to delete

    Scenario: PR_03 Verify when Delete menu successfully
      Then User look message "Success" popup
      When Click on the previously created "Tên tham số" tree to delete
      Then User look message "Success" popup

    Scenario: PR_04 Verify when Create menu successfully with off button System
      Then User look message "Success" popup
      When Click on the previously created "Tên tham số" tree to delete
      Then User look message "Success" popup
      When Click "Tạo mới" button
      When Enter "text" in "Tên tham số" with "_RANDOM_"
      When Enter "text" in "Giá trị tham số" with "_RANDOM_""
      When Enter "text" in "Nhóm" with "Test"
      When Enter "words" in textarea "Ghi chú" with "_RANDOM_"
      And Click "Lưu lại" button
      Then User look message "Success" popup
      When Click on the previously created "Tên tham số" tree to delete
      Then User look message "Success" popup

  Rule: Bad paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "SUPERADMIN" menu
      When Click "Cấu hình hệ thống" sub menu to "/parameter"
      When Click "Tạo mới" button

    Scenario: PR_05 Verify when Create menu unsuccessfully when leaving all fields blank
      And Click "Lưu lại" button
      Then Required message "Tên tham số" displayed under "Xin vui lòng nhập tên tham số" field
      Then Required message "Giá trị tham số" displayed under "Xin vui lòng nhập giá trị tham số" field

    Scenario: PR_06 Verify when Create menu unsuccessfully when leaving Parameter name field
      When Enter "text" in "Giá trị tham số" with "_RANDOM_""
      When Enter "text" in "Nhóm" with "Test"
      When Enter "words" in textarea "Ghi chú" with "_RANDOM_"
      And Click "Lưu lại" button
      Then Required message "Tên tham số" displayed under "Xin vui lòng nhập tên tham số" field

    Scenario: PR_07 Verify when Create menu unsuccessfully when leaving the Parameter value field
      When Enter "text" in "Tên tham số" with "_RANDOM_""
      When Enter "text" in "Nhóm" with "Test"
      When Enter "words" in textarea "Ghi chú" with "_RANDOM_"
      And Click "Lưu lại" button
      Then Required message "Giá trị tham số" displayed under "Xin vui lòng nhập giá trị tham số" field

  Rule: Compare paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "SUPERADMIN" menu
      When Click "Cấu hình hệ thống" sub menu to "/parameter"
      When Click "Tạo mới" button
      When Enter "text" in "Tên tham số" with "_RANDOM_"
      When Enter "text" in "Giá trị tham số" with "_RANDOM_"
      When Enter "text" in "Nhóm" with "Test"
#      When Click switch "Hệ thống" to be activated
      When Enter "words" in textarea "Ghi chú" with "_RANDOM_"
      When Click "Lưu lại" button
      Then User look message "Success" popup

    Scenario: PR_8 Verify when creating menu unsuccessfully when clicking Notification of Content Check Management then clicking on add new button
      When Click on the previously created "Tên tham số" tree to edit
      When Click "Tạo mới" button
      And Click "Lưu lại" button
      Then Required message "Tên tham số" displayed under "Xin vui lòng nhập tên tham số" field
      Then Required message "Giá trị tham số" displayed under "Xin vui lòng nhập giá trị tham số" field
      When Click on the previously created "Tên tham số" tree to delete

    Scenario: PR_9 Verify when navigation unsuccessfully when editing navigation
      When Click on the previously created "Tên tham số" tree to edit
      When Enter "text" in "Tên tham số" with ""
      When Enter "text" in "Giá trị tham số" with ""
      When Enter "text" in "Nhóm" with ""
      When Enter "words" in textarea "Ghi chú" with ""
      When Click "Lưu lại" button
      Then Required message "Tên tham số" displayed under "Xin vui lòng nhập tên tham số" field
      Then Required message "Giá trị tham số" displayed under "Xin vui lòng nhập giá trị tham số" field
      When Click on the previously created "Tên tham số" tree to delete

