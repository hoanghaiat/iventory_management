*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/Search_Report.resource
Resource    ../Resource/HomePage.resource
Test Setup    Login To System
Test Teardown    Close Browser

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
    Search Gia    Chi nhánh TP.HCM    Phông Hồ sơ Nhân sự    Kho A - Tài liệu chính    Giá 1 - Kho A - Tài liệu chính

TC049 - Kiểm tra khi tìm kiếm theo từ khoá và đơn vị
    [Documentation]    TC049
    [Tags]    TuAnh    Search_Report
    Click Search
    Search key and Unit    tài liệu    Chi nhánh TP.HCM

TC050 - Kiểm tra khi tìm kiếm theo từ khoá và phông
    [Documentation]    TC050
    [Tags]    TuAnh    Search_Report
    Click Search
    Search key and Unit and Phong    tài liệu    Chi nhánh TP.HCM    Phông Hồ sơ Nhân sự

TC051 - Kiểm tra khi tìm kiếm theo từ khoá và kho
    [Documentation]    TC051
    [Tags]    TuAnh    Search_Report
    Click Search
    Search key and Kho    tài liệu    Kho A - Tài liệu chính

TC052 - Kiểm tra khi tìm kiếm theo từ khoá và giá
    [Documentation]    TC050
    [Tags]    TuAnh    Search_Report
    Click Search
    Search key and Gia    tài liệu    Kho A - Tài liệu chính    Giá 1 - Kho A - Tài liệu chính

TC053 - Kiểm tra khi tìm kiếm theo từ khoá, đơn vị, phông, kho, giá
    [Documentation]    TC053
    [Tags]    TuAnh    Search_Report
    Click Search
    Search All    tài liệu    Chi nhánh TP.HCM    Phông Hồ sơ Nhân sự    Kho A - Tài liệu chính    Giá 1 - Kho A - Tài liệu chính
TC054 - Kiểm tra bottun "Xoá bộ lọc" sau khi tìm kiếm kết quả
    [Documentation]    TC054
    [Tags]    TuAnh    Search_Report
    Click Search
    Do Search    Tài liệu
    Clear Filter