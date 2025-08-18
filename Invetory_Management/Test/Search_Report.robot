*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/Search_Report.resource
Resource    ../Resource/HomePage.resource
Test Setup    Login To System
Test Teardown    Close Browser
*** Variables ***


*** Test Cases ***
TC042 - Kiểm tra tìm kiếm theo từ khoá hợp lệ
    [Documentation]    TC042
    [Tags]    TuAnh    Search_Report
    Click Search
    Do Search    Tài liệu
    Duyet Tung Dong Bang Chua Tu Khoa    Tài liệu

TC043 - Kiểm tra tìm kiếm với từ khoá không tồn tại
    [Documentation]    TC043
    [Tags]    TuAnh    Search_Report
    Click Search
    Do Search    abc123
    # Duyet Tung Dong Bang Chua Tu Khoa    abc123
    Verify Search Error

TC044 - Kiểm tra tìm kiếm từ khoá khi để trống
    [Documentation]    TC044
    [Tags]    TuAnh    Search_Report
    Click Search
    Search Textbox Blank

TC045 - Kiểm tra tìm kiếm theo đơn vị
    [Documentation]    TC045
    [Tags]    TuAnh    Search_Report
    Click Search
    Search DonVi    Ban kiểm soát

TC046 - Kiểm tra tìm kiếm theo phông
    [Documentation]    TC046
    [Tags]    TuAnh    Search_Report
    Click Search
    Search DonVi and Phong    Chi nhánh Hà Nội    Phông Tài liệu Kế toán

TC047 - Kiểm tra tìm kiếm theo kho
    [Documentation]    TC047
    [Tags]    TuAnh    Search_Report
    Click Search
    Search Kho    Kho A - Tài liệu chính

TC048 - Kiểm tra tìm kiếm theo giá
    [Documentation]    TC048
    [Tags]    TuAnh    Search_Report
    Click Search
    Search Kho    Kho A - Tài liệu chính
TC054 - Kiểm tra bottun "Xoá bộ lọc" sau khi tìm kiếm kết quả
    [Documentation]    TC054
    [Tags]    TuAnh    Search_Report
    Click Search
    Do Search    Tài liệu
    Clear Filter

