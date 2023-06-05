Feature: Clinic

  Rule: Happy paths
  
    Background: 
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "QUẢN LÝ DANH MỤC" menu
      When Click "Phòng khám" sub menu to "/clinics"
      
    Scenario: CL_01 Verify when create Medical procedure successfully
      

    Scenario: CL_02 Verify search successfully when inputting valid data into the search box field
      When Enter "text" in "Tìm kiếm" with "_RANDOM_"
    
    Scenario: CL_03 Verify select Status successfully when selecting Wait for Approval
      When Click tree select "Trạng thái duyệt" with "Chờ duyệt"
    
    Scenario: CL_04 Verify select Status successfully when selecting Approved
      When Click tree select "Trạng thái duyệt" with "Đã duyệt"

    Scenario: CL_05 Verify select Province successfully when selecting Province
      When Click tree select "Province" with "Hà Nội"

    Scenario: CL_06 Verify the list of clinics successfully when inputting valid data into the Search field, selecting Status, and selecting Province 
      When Enter "text" in "Tìm kiếm" with "_RANDOM_"
      When Click tree select "Trạng thái duyệt" with "Chờ duyệt"
      When Click tree select "Chọn tỉnh" with "Hà Nội"

    Scenario: 9 Verify the popup successfully when clicking status "Wait for Approval" of item clinic 
      When Click tree select "Tên phòng khám" with "_RANDOM_"
      When Click "Chờ duyệt" button
      Then User look message "Bạn có chắc là phê duyệt không?" popup

   