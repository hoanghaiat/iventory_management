*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/DuyetCauHoi.resource
Suite Setup    Open Browser To DuyetCauHoi
Suite Teardown    Close Web
*** Variables ***

*** Test Cases ***
TC_BQ_01 : Lọc câu hỏi ở trạng thái mặc định
    [Documentation]    TC_BQ_01
    [Tags]    AnhTuyet    DuyetCauHoi
    Filter in the default state

TC_BQ_02 : Lọc câu hỏi thành công
    [Documentation]    TC_BQ_02
    [Tags]    AnhTuyet    DuyetCauHoi
    Filter the question successfully

TC_BQ_03 : Lọc câu hỏi theo học phần
    [Documentation]    TC_BQ_03
    [Tags]    AnhTuyet    DuyetCauHoi
    Filter the question of the Course

TC_BQ_04 : Lọc câu hỏi theo CLO
    [Documentation]    TC_BQ_04
    [Tags]    AnhTuyet    DuyetCauHoi
    Filter the question of the CLO

TC_BQ_05 : Lọc câu hỏi theo Loại câu hỏi
    [Documentation]    TC_BQ_05
    [Tags]    AnhTuyet    DuyetCauHoi
    Filter the question of the Question Type

TC_BQ_06 : Lọc câu hỏi theo độ khó
    [Documentation]    TC_BQ_06
    [Tags]    AnhTuyet    DuyetCauHoi
    Filter the question of the Difficulty

TC_BQ_07 : Lọc câu hỏi theo cấp độ Bloom
    [Documentation]    TC_BQ_07
    [Tags]    AnhTuyet    DuyetCauHoi
    Filter the question of the Bloom Level

TC_BQ_08 : Lọc câu hỏi theo trạng thái
    [Documentation]    TC_BQ_08
    [Tags]    AnhTuyet    DuyetCauHoi
    Filter the question of the Status

TC_BQ_09 : Lọc câu hỏi theo trạng thái phê duyệt
    [Documentation]    TC_BQ_09
    [Tags]    AnhTuyet    DuyetCauHoi
    Filter the question of the Approval Status

TC_BQ_10 : Lọc câu hỏi theo thẻ
    [Documentation]    TC_BQ_10
    [Tags]    AnhTuyet    DuyetCauHoi
    Filter the question of the Tag

TC_BQ_11 : Xóa bộ lọc thành công
    [Documentation]    TC_BQ_11
    [Tags]    AnhTuyet    DuyetCauHoi
    Check the filter delete button

TC_BQ_12 : Xem chi tiết câu hỏi
    [Documentation]    TC_BQ_12
    [Tags]    AnhTuyet    DuyetCauHoi
    See questions

TC_BQ_13 : Kiểm tra nút "Back to Question Bank" khi xem câu hỏi
    [Documentation]    TC_BQ_13
    [Tags]    AnhTuyet    DuyetCauHoi
    Back to Question Bank

TC_BQ_14 : Kiểm tra nút Add Tag
    [Documentation]    TC_BQ_14
    [Tags]    AnhTuyet    DuyetCauHoi
    Add New Tag

TC_BQ_15 : Thêm mới Thẻ Add Tag
    [Documentation]    TC_BQ_15
    [Tags]    AnhTuyet    DuyetCauHoi
    Add Tag

TC_BQ_16 : Hủy Thêm mới Thẻ
    [Documentation]    TC_BQ_16
    [Tags]    AnhTuyet    DuyetCauHoi
    Cancel Tag

TC_BQ_17 : Gỡ thẻ Tag
    [Documentation]    TC_BQ_17
    [Tags]    AnhTuyet    DuyetCauHoi
    Tag Remove

TC_BQ_18 : Chỉnh sửa câu hỏi trong trang chi tiết câu hỏi
    [Documentation]    TC_BQ_18
    [Tags]    AnhTuyet    DuyetCauHoi
    Edit questions in the detailed view    6    Phương pháp tiếp cận định hướng tiến trình có hạn chế gì?    practical    medium

TC_BQ_19 : Câu hỏi được phê duyệt thành công trong trang chi tiết câu hỏi
    [Documentation]    TC_BQ_19
    [Tags]    AnhTuyet    DuyetCauHoi
    Approve Question Successfully in Detail View

TC_BQ_20 : Câu hỏi bị từ chối thành công trong trang chi tiết câu hỏi
    [Documentation]    TC_BQ_20
    [Tags]    AnhTuyet    DuyetCauHoi
    Reject Question Successfully in Detail View

TC_BQ_21 : Kiểm tra liên kết trong Related Questions
    [Documentation]    TC_BQ_21
    [Tags]    AnhTuyet    DuyetCauHoi
    Related Question Link

TC_BQ_22 : Kiểm tra liên kết Course
    [Documentation]    TC_BQ_22
    [Tags]    AnhTuyet    DuyetCauHoi
    Course Link

TC_BQ_23 : Kiểm tra liên kết trong CLO
    [Documentation]    TC_BQ_23
    [Tags]    AnhTuyet    DuyetCauHoi
    CLO Link
TC_BQ_24: Chỉnh sửa câu hỏi
    [Documentation]    TC_BQ_24
    [Tags]    AnhTuyet    DuyetCauHoi
    Edit Question
TC_BQ_25: Kiểm tra nút "Back to Question Bank" khi Chỉnh sửa câu hỏi trong phần xem chi tiết
    [Documentation]    TC_BQ_25
    [Tags]    AnhTuyet    DuyetCauHoi
    Check back button in edit view
TC_BQ_26 : Câu hỏi được phê duyệt thành công
    [Documentation]    TC_BQ_26
    [Tags]    AnhTuyet    DuyetCauHoi
    Approve Question

TC_BQ_27 : Câu hỏi bị từ chối thành công 
    [Documentation]    TC_BQ_27
    [Tags]    AnhTuyet    DuyetCauHoi
    Reject Question

TC_BQ_28 : Kiểm tra nút "Thêm câu hỏi" điều hướng đúng trang
    [Documentation]    TC_BQ_28
    [Tags]    AnhTuyet    DuyetCauHoi
    Nav Add New Question

TC_BQ_29 : Kiểm tra nút "Back to Question Bank" khi thêm câu hỏi
    [Documentation]    TC_BQ_29
    [Tags]    AnhTuyet    DuyetCauHoi
    Back to Question
TC_BQ_30 : Kiểm tra nút Import Question
    [Documentation]    TC_BQ_30
    [Tags]    AnhTuyet    DuyetCauHoi
    Import Question

TC_BQ_31 : Kiểm tra nút Manage Tag
    [Documentation]    TC_BQ_31
    [Tags]    AnhTuyet    DuyetCauHoi
    Manage Tag

TC_BQ_32 : Tìm kiếm với từ khóa hợp lệ
    [Documentation]    TC_BQ_32
    [Tags]    AnhTuyet    DuyetCauHoi
    Search with keyword valid question

TC_BQ_33 : Tìm kiếm với từ khóa không hợp lệ
    [Documentation]    TC_BQ_33
    [Tags]    AnhTuyet    DuyetCauHoi
    Search with keywords not in the question

TC_BQ_34 : Tìm kiếm với từ khóa trống
    [Documentation]    TC_BQ_34
    [Tags]    AnhTuyet    DuyetCauHoi
    Search with empty keywords


