Feature: Navigation

  Rule: Happy paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "SUPERADMIN" menu
      When Click "Phân quyền điều hướng" sub menu to "/navigation"
      When Click "Tạo mới" button
      When Enter "text" in "Tên điều hướng" with "_RANDOM_"
      When Enter "text" in "Mã điều hướng" with "_@Tên điều hướng@_"
      When Enter "text" in "Link" with "/_RANDOM_"
      When Enter "number" in "Số thứ tự" with "_RANDOM_"
      When Click switch "Kích hoạt" to be activated
      When Enter "text" in "Biểu tượng" with "las la-folder-minus"
      When Click tree select "Điều hướng cha" with "SUPERADMIN"
      When Click assign list "Order Side, Farmer Side"
      When Click "Lưu lại" button

    Scenario: DH_01 Verify when Create menu successfully
      Then User look message "Success" popup
      When Click on the previously created "Tên điều hướng" tree to delete

    Scenario: DH_02 Verify when Edit menu successfully
      Then User look message "Success" popup
      When Click on the previously created "Tên điều hướng" tree to edit
      When Enter "text" in "Tên điều hướng" with "_RANDOM_"
      When Enter "text" in "Mã điều hướng" with "_@Tên điều hướng@_"
      When Enter "text" in "Link" with "/_RANDOM_"
      When Enter "number" in "Số thứ tự" with "_RANDOM_"
      When Click "Lưu lại" button
      Then User look message "Success" popup
      When Click on the previously created "Tên điều hướng" tree to delete

    Scenario: DH_03 Verify when Delete menu successfully
      Then User look message "Success" popup
      When Click on the previously created "Tên điều hướng" tree to delete
      Then User look message "Success" popup

    Scenario: DH_04 Verify when Create menu successfully with off button activated
      Then User look message "Success" popup
      When Click on the previously created "Tên điều hướng" tree to delete
      Then User look message "Success" popup
      When Click "Tạo mới" button
      When Enter "text" in "Tên điều hướng" with "_RANDOM_"
      When Enter "text" in "Mã điều hướng" with "_@Tên điều hướng@_"
      When Enter "text" in "Link" with "/_RANDOM_"
      When Enter "number" in "Số thứ tự" with "_RANDOM_"
      When Enter "text" in "Biểu tượng" with "las la-folder-minus"
      When Click tree select "Điều hướng cha" with "SUPERADMIN"
      When Click assign list "Order Side, Farmer Side"
      And Click "Lưu lại" button
      Then User look message "Success" popup
      When Click on the previously created "Tên điều hướng" tree to delete

  Rule: Bad paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "SUPERADMIN" menu
      When Click "Phân quyền điều hướng" sub menu to "/navigation"
      When Click "Tạo mới" button

    Scenario: DH_05 Verify when Create menu unsuccessfully when leaving all fields blank
      And Click "Lưu lại" button
      Then Required message "Tên điều hướng" displayed under "Xin vui lòng nhập tên điều hướng" field
      Then Required message "Mã điều hướng" displayed under "Xin vui lòng nhập mã điều hướng" field
      Then Required message "Link" displayed under "Xin vui lòng nhập link" field
      Then Required message "Số thứ tự" displayed under "Xin vui lòng nhập số thứ tự" field

    Scenario: DH_06 Verify when Create menu unsuccessfully when leaving Tên điều hướng field
      When Enter "text" in "Mã điều hướng" with "_RANDOM_"
      When Enter "text" in "Link" with "/_RANDOM_"
      When Enter "number" in "Số thứ tự" with "_RANDOM_"
      When Click switch "Kích hoạt" to be activated
      When Enter "text" in "Biểu tượng" with "las la-folder-minus"
      When Click tree select "Điều hướng cha" with "SUPERADMIN"
      When Click assign list "Order Side, Farmer Side"
      And Click "Lưu lại" button
      Then Required message "Tên điều hướng" displayed under "Xin vui lòng nhập tên điều hướng" field

    Scenario: DH_07 Verify when Create menu unsuccessfully when leaving the Số thứ tự field
      When Enter "text" in "Tên điều hướng" with "_RANDOM_"
      When Enter "text" in "Mã điều hướng" with "_@Tên điều hướng@_"
      When Enter "text" in "Link" with "/_RANDOM_"
      When Click switch "Kích hoạt" to be activated
      When Enter "text" in "Biểu tượng" with "las la-folder-minus"
      When Click tree select "Điều hướng cha" with "SUPERADMIN"
      When Click assign list "Order Side, Farmer Side"
      And Click "Lưu lại" button
      Then Required message "Số thứ tự" displayed under "Xin vui lòng nhập số thứ tự" field

    Scenario: DH_08 Verify when creating menu unsuccessfully when inputting alphabetic characters into the Số thứ tự field
      When Enter "text" in "Tên điều hướng" with "_RANDOM_"
      When Enter "text" in "Mã điều hướng" with "_@Tên điều hướng@_"
      When Enter "text" in "Link" with "/_RANDOM_"
      When Enter "text" in "Số thứ tự" with "_RANDOM_"
      When Click switch "Kích hoạt" to be activated
      When Enter "text" in "Biểu tượng" with "las la-folder-minus"
      When Click tree select "Điều hướng cha" with "SUPERADMIN"
      When Click assign list "Order Side, Farmer Side"
      When Click "Lưu lại" button
      Then Required message "Số thứ tự" displayed under "Xin vui lòng nhập số thứ tự" field

    Scenario: DH_10 Verify when create menu unsuccessfully when leaving Mã điều hướng field
      When Enter "text" in "Tên điều hướng" with "_RANDOM_"
      When Enter "text" in "Link" with "/_RANDOM_"
      When Enter "number" in "Số thứ tự" with "_RANDOM_"
      When Click switch "Kích hoạt" to be activated
      When Enter "text" in "Biểu tượng" with "las la-folder-minus"
      When Click tree select "Điều hướng cha" with "SUPERADMIN"
      When Click assign list "Order Side, Farmer Side"
      And Click "Lưu lại" button
      Then Required message "Mã điều hướng" displayed under "Xin vui lòng nhập mã điều hướng" field

  Rule: Compare paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "SUPERADMIN" menu
      When Click "Phân quyền điều hướng" sub menu to "/navigation"
      When Click "Tạo mới" button
      When Enter "text" in "Tên điều hướng" with "_RANDOM_"
      When Enter "text" in "Mã điều hướng" with "_@Tên điều hướng@_"
      When Enter "text" in "Link" with "/_RANDOM_"
      When Enter "number" in "Số thứ tự" with "_RANDOM_"
      When Click switch "Kích hoạt" to be activated
      When Enter "text" in "Biểu tượng" with "las la-folder-minus"
      When Click tree select "Điều hướng cha" with "SUPERADMIN"
      When Click assign list "Order Side, Farmer Side"
      When Click "Lưu lại" button
      Then User look message "Success" popup

    Scenario: DH_11 Verify when creating menu unsuccessfully when inputting existing data into Mã điều hướng field
      When Click "Tạo mới" button
      When Enter "text" in "Tên điều hướng" with "_@Tên điều hướng@_"
      When Enter "text" in "Mã điều hướng" with "_@Mã điều hướng@_"
      When Enter "text" in "Link" with "/_RANDOM_"
      When Enter "number" in "Số thứ tự" with "_RANDOM_"
      When Click switch "Kích hoạt" to be activated
      When Enter "text" in "Biểu tượng" with "las la-folder-minus"
      When Click tree select "Điều hướng cha" with "SUPERADMIN"
      When Click assign list "Order Side, Farmer Side"
      When Click "Lưu lại" button
      Then User look message "Mã: _@Mã điều hướng@_ đã tồn tại" popup
      When Click on the previously created "Tên điều hướng" tree to delete

    Scenario: DH_12 Verify when creating menu unsuccessfully when clicking Notification of Content Check Management then clicking on add new button
      When Click on the previously created "Tên điều hướng" tree to edit
      When Click "Tạo mới" button
      And Click "Lưu lại" button
      Then Required message "Tên điều hướng" displayed under "Xin vui lòng nhập tên điều hướng" field
      Then Required message "Mã điều hướng" displayed under "Xin vui lòng nhập mã điều hướng" field
      Then Required message "Link" displayed under "Xin vui lòng nhập link" field
      Then Required message "Số thứ tự" displayed under "Xin vui lòng nhập số thứ tự" field
      When Click on the previously created "Tên điều hướng" tree to delete

    Scenario: DH_13 Verify when editing unsuccessfully when selecting Điều hướng cha same name as Tên điều hướng field
      When Click on the previously created "Tên điều hướng" tree to edit
      When Enter "text" in "Mã điều hướng" with "_@Tên điều hướng@_"
      When Click tree select "Điều hướng cha" with "_@Tên điều hướng@_"
      And Click "Lưu lại" button
      Then User look message "Không được chọn điều hướng cha là điều hướng con của điều hướng hiện tại" popup
      When Click on the previously created "Tên điều hướng" tree to delete

    Scenario: DH_14 Verify when navigation unsuccessfully when editing navigation
      When Click on the previously created "Tên điều hướng" tree to edit
      When Enter "text" in "Tên điều hướng" with ""
      When Enter "text" in "Mã điều hướng" with ""
      When Enter "text" in "Link" with ""
      When Enter "number" in "Số thứ tự" with ""
#      When Enter "text" in "Biểu tượng" with ""
#      When Click tree select "Điều hướng cha" with ""
#      When Click assign list ""
      When Click "Lưu lại" button
      Then Required message "Tên điều hướng" displayed under "Xin vui lòng nhập tên điều hướng" field
      Then Required message "Mã điều hướng" displayed under "Xin vui lòng nhập mã điều hướng" field
      Then Required message "Link" displayed under "Xin vui lòng nhập link" field
      Then Required message "Số thứ tự" displayed under "Xin vui lòng nhập số thứ tự" field
      When Click on the previously created "Tên điều hướng" tree to delete
