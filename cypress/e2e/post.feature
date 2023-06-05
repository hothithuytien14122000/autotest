Feature: Post

  Rule: Happy paths
    Background:
      Given User go to login page
      When Enter "text" in "Email" with "admin@gmail.com"
      When Enter "text" in "Mật khẩu" with "123123"
      When Click "Đăng nhập" button
      Then User look message "Success" popup
      When Click "QUẢN LÝ DANH MỤC" menu
      When Click "Post" sub menu to "/post"
      When Click "Tạo mới bài viết" button
#     When Click radio "Html" in line "Editor Format"
      When Select file in "Ảnh cover" with "image.jpg"
      When Select file in "Ảnh thumbnail" with "image.jpg"
      When Click select "Chuyên mục" with "Press release"
      When Click radio "Longform" in line "Định dạng bài viết"
      When Enter "color" in "Background Color" with "_RANDOM_"
      When Enter "color" in "Title Fore Color" with "_RANDOM_"
      When Click switch "Show Title" to be activated
      When Click switch "Ghim" to be activated
      When Enter "text" in "Custom Class" with "text-blue-600"
      When Enter "text" in textarea "Custom CSS" with "{color:1px;}"
      When Click "English" tab button
      When Enter "text" in "Tiêu đề" with "_RANDOM_"
      When Enter "text" in "Tác giả" with "_RANDOM_"
      When Enter "words" in "Mô tả ảnh cover" with "_RANDOM_"
      When Enter "words" in textarea "Giới thiệu" with "_RANDOM_"
      When Enter "words" in editor "Nội dung" with "_RANDOM_"
      When Enter "text" in "Tiêu đề SEO" with "_RANDOM_"
      When Enter "text" in "Từ khóa SEO" with "_RANDOM_"
      When Enter "words" in textarea "Mô tả SEO" with "_RANDOM_"
      When Click "Tiếng Việt" tab button
      When Enter "text" in "Tiêu đề" with "_RANDOM_"
      When Enter "text" in "Tác giả" with "_RANDOM_"
      When Enter "words" in "Mô tả ảnh cover" with "_RANDOM_"
      When Enter "words" in textarea "Giới thiệu" with "_RANDOM_"
      When Enter "words" in editor "Nội dung" with "_RANDOM_"
      When Enter "text" in "Tiêu đề SEO" with "_RANDOM_"
      When Enter "text" in "Từ khóa SEO" with "_RANDOM_"
      When Enter "words" in textarea "Mô tả SEO" with "_RANDOM_"
      When Click "Lưu lại" button

    Scenario: DH_01 Verify when Create menu successfully
      Then User look message "Thêm mới bài viết thành công" popup
      When Click on the "Xóa" button in the "Tiêu đề" table line
      Then User look message "Đã xóa thành công" popup

    Scenario: DH_02 Verify that add successfully with enter Title and categories
      Then User look message "Thêm mới bài viết thành công" popup
      When Click on the "Xóa" button in the "Tiêu đề" table line
      Then User look message "Đã xóa thành công" popup
      When Click "Tạo mới bài viết" button
      When Click select "Chuyên mục" with "Press release"
      When Click "English" tab button
      When Enter "text" in "Tiêu đề" with "_RANDOM_"
      When Click "Tiếng Việt" tab button
      When Enter "text" in "Tiêu đề" with "_RANDOM_"
      When Click "Lưu lại" button
      Then User look message "Thêm mới bài viết thành công" popup
      When Click on the "Xóa" button in the "Tiêu đề" table line
      Then User look message "Đã xóa thành công" popup

    Scenario: DH_03 Verify that edit successfully
      Then User look message "Thêm mới bài viết thành công" popup
      When Click on the "Sửa" button in the "Tiêu đề" table line
      When Click "English" tab button
      When Enter "text" in "Tiêu đề" with "_RANDOM_"
      When Enter "text" in "Tác giả" with "_RANDOM_"
      When Enter "words" in "Mô tả ảnh cover" with "_RANDOM_"
      When Enter "words" in textarea "Giới thiệu" with "_RANDOM_"
      When Click "Tiếng Việt" tab button
      When Enter "text" in "Tiêu đề" with "_RANDOM_"
      When Enter "text" in "Tác giả" with "_RANDOM_"
      When Enter "words" in "Mô tả ảnh cover" with "_RANDOM_"
      When Enter "words" in textarea "Giới thiệu" with "_RANDOM_"
      When Click "Lưu lại" button
      Then User look message "Cập nhật bài viết thành công" popup
      When Click on the "Xóa" button in the "Tiêu đề" table line
      Then User look message "Đã xóa thành công" popup

      Scenario: DH_04 Verify that "Public" successfully
        Then User look message "Thêm mới bài viết thành công" popup
        When Click on the "Đăng bài" button in the "Tiêu đề" table line
        Then User look message "Cập nhật thành công" popup
        When Click on the "Hủy đăng" button in the "Tiêu đề" table line
        When Click on the "Xóa" button in the "Tiêu đề" table line
        Then User look message "Đã xóa thành công" popup

      Scenario: DH_05 Verify that "Hide" successfully
        Then User look message "Thêm mới bài viết thành công" popup
        When Click on the "Đăng bài" button in the "Tiêu đề" table line
        When Click on the "Hủy đăng" button in the "Tiêu đề" table line
        Then User look message "Cập nhật thành công" popup
        When Click on the "Xóa" button in the "Tiêu đề" table line
        Then User look message "Đã xóa thành công" popup

      Scenario: DH_06 Verify that "Delete" successfully
        When Click on the "Xóa" button in the "Tiêu đề" table line
        Then User look message "Đã xóa thành công" popup

  Rule: Bad paths
      Background:
        Given User go to login page
        When Enter "text" in "Email" with "admin@gmail.com"
        When Enter "text" in "Mật khẩu" with "123123"
        When Click "Đăng nhập" button
        Then User look message "Success" popup
        When Click "QUẢN LÝ DANH MỤC" menu
        When Click "Post" sub menu to "/post"

      Scenario: DH_12 Verify when Create Post unsuccessfully when leaving title blank in VietNamese format
        When Click "Tạo mới bài viết" button
        When Click select "Chuyên mục" with "Press release"
        When Click "English" tab button
        When Enter "text" in "Tiêu đề" with "_RANDOM_"
        When Click "Lưu lại" button
        When Click "Tiếng Việt" tab button
        Then Required message "Tiêu đề" displayed under "Xin vui lòng nhập tiêu đề" field

      Scenario: DH_13 Verify when Create Post unsuccessfully when leaving title blank in English format
        When Click "Tạo mới bài viết" button
        When Click select "Chuyên mục" with "Press release"
        When Click "Tiếng Việt" tab button
        When Enter "text" in "Tiêu đề" with "_RANDOM_"
        When Click "Lưu lại" button
        When Click "English" tab button
        Then Required message "Tiêu đề" displayed under "Xin vui lòng nhập tiêu đề" field

      Scenario: DH_14 Verify when Create Post unsuccessfully when duplicate multilingual Title
        When Click "Tạo mới bài viết" button
        When Click select "Chuyên mục" with "Press release"
        When Click "English" tab button
        When Enter "text" in "Tiêu đề" with "_RANDOM_"
        When Click "Tiếng Việt" tab button
        When Enter "text" in "Tiêu đề" with "_@Tiêu đề@_"
        When Click "Lưu lại" button
        Then User look message "Tiêu đề bản dịch bị trùng lặp" popup

