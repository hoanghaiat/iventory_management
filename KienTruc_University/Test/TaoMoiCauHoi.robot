*** Settings ***
Library         SeleniumLibrary
Resource        ../Resource/TaoMoiCauHoi.resource
Suite Setup     Open Browser To TaoMoiCauHoi
#Suite Teardown  Close Web
Test Teardown   Capture Page Screenshot


*** Settings ***
Library    SeleniumLibrary
Variables  ../variables/locator.py

*** Variables ***
${BROWSER}    chrome
# Nếu URL chưa có trong locator.py thì mở dòng dưới:
${URL}        https://demo-clo.minds.vn

*** Keywords ***
login To System
    [Arguments]    ${username}    ${password}
    # Mở trực tiếp trang login EN
    Open Browser    ${URL}/en/accounts/login/?next=/en/    chrome
    Maximize Browser Window

    # Chờ input username xuất hiện
    Wait Until Element Is Visible    ${USERNAME_INPUT}    30s
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button   ${LOGIN_BUTTON}

    # Chờ login thành công bằng nhiều dấu hiệu (aside/nav/sidebar/link Question Bank)
    Wait Until Page Contains Element
    ...    xpath=//aside | //nav | //a[contains(@href, '/questionbank/')] | //*[contains(@class,'sidebar')]


    

*** Test Cases ***
Login
    Login To System    admin    demoadmin
TC_CB_01 - truy cập vào menu duyệt câu hỏi
    [Documentation]    Truy cập vào menu Duyệt Câu hỏi
    [Tags]    honghanh    duyệt câu hỏi
    Go to Question Bank    ${Menu_QUEST}

TC_CB_01 - Thêm câu hỏi bỏ trống các trường dữ liệu
    [Documentation]    Kiểm tra không nhập dữ liệu nhưng tạo mới
    [Tags]    honghanh    TaoMoiCauHoi
    Add a new question to the data field

TC_CB_02 - Thêm câu hỏi thành công
    [Documentation]    Điền đầy đủ thông tin và tạo mới thành công
    [Tags]    honghanh    TaoMoiCauHoi
    Add new question

TC_CB_03 - Kiểm tra trường Course
    [Documentation]    Chỉ chọn Course rồi lưu
    [Tags]    honghanh    TaoMoiCauHoi
    Check the Course field

TC_CB_04 - Kiểm tra trường Content
    [Documentation]    Chỉ nhập Content rồi lưu
    [Tags]    honghanh    TaoMoiCauHoi
    Check the Content field

TC_CB_05 - Kiểm tra trường Type
    [Documentation]    Chỉ chọn Type rồi lưu
    [Tags]    honghanh    TaoMoiCauHoi
    Check the Type field

TC_CB_06 - Kiểm tra trường Difficulty
    [Documentation]    Chỉ chọn Difficulty rồi lưu
    [Tags]    honghanh    TaoMoiCauHoi
    Check the Difficulty field

TC_CB_07 - Kiểm tra trường Bloom
    [Documentation]    Chỉ chọn Bloom rồi lưu
    [Tags]    honghanh    TaoMoiCauHoi
    Check the Bloom field

TC_CB_08 - Kiểm tra trường Status
    [Documentation]    Chỉ chọn Status rồi lưu
    [Tags]    honghanh    TaoMoiCauHoi
    Check the Status field

TC_CB_09 - Kiểm tra trường Approval Status
    [Documentation]    Chỉ chọn Approval Status rồi lưu
    [Tags]    honghanh    TaoMoiCauHoi
    Check the Approval Status field

TC_CB_10 - Quay lại Question Bank
    [Documentation]    Nhấn Back để quay về danh sách
    [Tags]    honghanh    TaoMoiCauHoi
    Back to Question Bank

TC_CB_11 - Điều hướng Manage Tags
    [Documentation]    Mở trang Manage Tags từ Question Bank
    [Tags]    honghanh    TaoMoiCauHoi
    Manage Tags navigation

TC_CB_12 - Điều hướng Import Questions
    [Documentation]    Mở trang Import Questions từ Question Bank
    [Tags]    honghanh    TaoMoiCauHoi
    Import Questions navigation
    

    close All Browsers

