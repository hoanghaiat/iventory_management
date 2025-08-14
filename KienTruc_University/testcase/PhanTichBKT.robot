*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/PhanTichBKT.resource
Suite Setup    Open Browser To PhanTichBKT
Suite Teardown    Close Web
*** Variables ***

*** Test Cases ***
TC_TA_01 : Điều hướng trang My Classes
    [Documentation]    TC_TA_01 
    [Tags]    AnhTuyet    PhanTichBaiKiemTra
    Navigate My Classes page
TC_TA_02 : Tìm kiếm báo cáo với từ khóa tìm kiếm trống
    [Documentation]    TC_TA_02 
    [Tags]    AnhTuyet    PhanTichBaiKiemTra
    Search for testanalys with empty keywords
TC_TA_03 : Tìm kiếm báo cáo với từ khóa tìm kiếm hợp lệ theo Course
    [Documentation]    TC_TA_03 
    [Tags]    AnhTuyet    PhanTichBaiKiemTra
    Search for testanalys with valid keywords    SE301
TC_TA_04 : Tìm kiếm báo cáo với từ khóa tìm kiếm hợp lệ theo Class
    [Documentation]    TC_TA_04 
    [Tags]    AnhTuyet    PhanTichBaiKiemTra
    Search for testanalys with valid keywords     Summer 2025
TC_TA_05 : Tìm kiếm báo cáo với từ khóa tìm kiếm hợp lệ theo Generated On
    [Documentation]    TC_TA_05 
    [Tags]    AnhTuyet    PhanTichBaiKiemTra
    Search for testanalys with valid keywords    May 9, 2025, 3:48 p.m.
TC_TA_06 : Tìm kiếm báo cáo với từ khóa tìm kiếm không hợp lệ 
    [Documentation]    TC_TA_06 
    [Tags]    AnhTuyet    PhanTichBaiKiemTra
    Search for testanalys with invalid keywords    Cuns@a%
TC_TA_07 : Kiểm tra hiển thị nút xem chi tiết phân tích bài kiểm tra
    [Documentation]    TC_TA_07 
    [Tags]    AnhTuyet    PhanTichBaiKiemTra
    Check the testanalys button
TC_TA_08 : Kiểm tra nút “Back to Analyses”
    [Documentation]    TC_TA_08 
    [Tags]    AnhTuyet    PhanTichBaiKiemTra
    Back to Analyses
TC_TA_09 : Kiểm tra nút "Print Report" trong phần chi tiết phân tích bài kiểm tra
    [Documentation]    TC_TA_09 
    [Tags]    AnhTuyet    PhanTichBaiKiemTra
    Verify Print Report in test analysis detail view 
TC_TA_10 : Kiểm tra popup in phân tích bài kiểm tra hiển thị đúng
    [Documentation]    TC_TA_10 
    [Tags]    AnhTuyet    PhanTichBaiKiemTra
    Check popup display in test analysis