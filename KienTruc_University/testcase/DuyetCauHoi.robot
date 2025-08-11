*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/DuyetCauHoi.resource
Suite Setup    Open Browser To LocCauHoi
Suite Teardown    Close Browser
*** Variables ***

*** Test Cases ***

TC_QB_01 : Lọc câu hỏi ở trạng thái mặc định
    [Documentation]    Kiểm tra lọc câu hỏi ở trạng thái mặc định của hệ thống, không click tùy chọn lọc
    Filter in the default state
TC_QB_02 : Lọc câu hỏi thành công
    [Documentation]    Kiểm tra lọc câu hỏi thành công với các tùy chọn lọc
    Filter the question successfully
TC_QB_03 : Lọc câu hỏi theo học phần
    [Documentation]    Kiểm tra lọc câu hỏi theo học phần
    Filter the question of the Course
TC_QB_04 : Lọc câu hỏi theo CLO
    [Documentation]    Kiểm tra lọc câu hỏi theo CLO
    Filter the question of the CLO
TC_QB_05 : Lọc câu hỏi theo Loại câu hỏi
    [Documentation]    Kiểm tra lọc câu hỏi theo Loại câu hỏi
    Filter the question of the Question Type
TC_QB_06 : Lọc câu hỏi theo độ khó
    [Documentation]    Kiểm tra lọc câu hỏi theo độ khó
    Filter the question of the Difficulty
TC_QB_07 : Lọc câu hỏi theo cấp độ Bloom
    [Documentation]    Kiểm tra lọc câu hỏi theo cấp độ Bloom
    Filter the question of the Bloom Level
TC_QB_08 : Lọc câu hỏi theo trạng thái
    [Documentation]    Kiểm tra lọc câu hỏi theo trạng thái
    Filter the question of the Status
TC_QB_09 : Lọc câu hỏi theo trạng thái phê duyệt
    [Documentation]    Kiểm tra lọc câu hỏi theo trạng thái phê duyệt
    Filter the question of the Approval Status
TC_QB_10 : Lọc câu hỏi theo thẻ
    [Documentation]    Kiểm tra lọc câu hỏi theo thẻ
    Filter the question of the Tag
TC_QB_11 : Xóa bộ lọc thành công
    [Documentation]    Kiểm tra nút xóa bộ lọc thành công
    Check the filter delete button
TC_QB_12 : Xem chi tiết câu hỏi
    [Documentation]    Kiểm tra xem chi tiết câu hỏi
    See questions
TC_QB_13 : Kiểm tra nút quay trở lại
    [Documentation]    Kiểm tra nút "Back to Question Bank" khi xem câu hỏi
    Back to Question Bank
TC_QB_14 : Kiểm tra nút Add Tag
    [Documentation]    Kiểm tra nút Add Tag
    Add New Tag
TC_QB_15 : Thêm mới Thẻ
    [Documentation]    Thao tác thêm mới thẻ
    Add Tag
TC_QB_16 : Hủy Thêm mới Thẻ
    [Documentation]    Thao tác hủy thêm mới thẻ
    Cancel Tag
TC_QB_17 : Gỡ thẻ
    [Documentation]    Thao tác gỡ thẻ
    Tag Remove
TC_QB_18 : Chỉnh sửa câu hỏi
    [Documentation]    Thao tác chỉnh sửa câu hỏi
    Edit Question
TC_QB_19 : Câu hỏi được phê duyệt thành công
    [Documentation]    Kiểm tra trạng thái phê duyệt thành công
    Approve Question
TC_QB_20 : Câu hỏi bị từ chối thành công
    [Documentation]    Kiểm tra trạng thái từ chối thành công
    Reject Question
TC_QB_21 : Kiểm tra liên kết trong Related Questions
    [Documentation]    Kiểm tra liên kết trong Related Questions
    Related Question Link
TC_QB_22 : Kiểm tra liên kết Course
    [Documentation]    Kiểm tra liên kết Course
    Course Link
TC_QB_23 : Kiểm tra liên kết trong CLO
    [Documentation]    Kiểm tra liên kết trong CLO
    CLO Link
TC_QB_24 : Kiểm tra thêm câu hỏi thành công
    [Documentation]    Thao tác thêm mới câu hỏi thành công
    Add New Question
TC_QB_25 : Tìm kiếm với từ khóa hợp lệ
    [Documentation]    Tìm kiếm với từ khóa nội dung câu hỏi hợp lệ
    Search with keyword valid question
TC_QB_26 : Tìm kiếm với từ khóa trống
    [Documentation]    Tìm kiếm với từ khóa nội dung câu hỏi trống
    Search with empty keywords
TC_QB_27 : Tìm kiếm với từ khóa không hợp lệ
    [Documentation]    Tìm kiếm với từ khóa không thuộc nội dung câu hỏi 
    Search with keywords not in the question