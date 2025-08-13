*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/BaoCaoCLO.resource
Suite Setup    Open Browser To BaoCaoCLO
Suite Teardown    Close Web
*** Variables ***

*** Test Cases ***
TC_RP_01 : Tìm kiếm báo cáo từ khóa trống
    [Documentation]    TC_RP_01
    [Tags]    AnhTuyet    BaoCaoCLO
    Search for reports with empty keywords     

TC_RP_02 : Tìm kiếm báo cáo từ khóa hợp lệ
    [Documentation]    TC_RP_02
    [Tags]    AnhTuyet    BaoCaoCLO
    Search for reports with valid keywords     1234 - Abc

TC_RP_03 : Tìm kiếm báo cáo từ khóa không hợp lệ
    [Documentation]    TC_RP_03
    [Tags]    AnhTuyet    BaoCaoCLO
    Search for reports with valid keywords      hsi@a%

TC_RP_04 : Điều hướng trang My Classes
    [Documentation]    TC_RP_04
    [Tags]    AnhTuyet    BaoCaoCLO
    Navigate My Classes page
TC_RP_05 : Kiểm tra nút xem báo cáo
    [Documentation]    TC_RP_05
    [Tags]    AnhTuyet    BaoCaoCLO
    Check the report button

TC_RP_06 : Kiểm tra nút in báo cáo
    [Documentation]    TC_RP_06
    [Tags]    AnhTuyet    BaoCaoCLO
    check print report button
TC_RP_07 : Kiểm tra hiển thị chi tiết báo cáo CLO
    [Documentation]    TC_RP_07
    [Tags]    AnhTuyet    BaoCaoCLO
    Check the CLO detailed report screen
TC_RP_08 : Kiểm tra nút Quay lại ở trang xem báo cáo
    [Documentation]    TC_RP_08
    [Tags]    AnhTuyet    BaoCaoCLO
    Back to Reports
TC_RP_09 : Kiểm tra nút "Print Report" trong chi tiết báo cáo   
    [Documentation]    TC_RP_09
    [Tags]    AnhTuyet    BaoCaoCLO
    Check print report button in the CLO details
    # => chưa đc ,chưa xử lý phần tắt in 
TC_RP_10 : Kiểm tra tìm kiếm theo tên sinh viên hợp lệ
    [Documentation]    TC_RP_10
    [Tags]    AnhTuyet    BaoCaoCLO
    Check valid search of student name    Sinh viên T 2
TC_RP_11 : Kiểm tra tìm kiếm theo tên sinh viên không hợp lệ
    [Documentation]    TC_RP_11
    [Tags]    AnhTuyet    BaoCaoCLO
    Check invalid search of student name    anhtuyet
TC_RP_12 : Kiểm tra tìm kiếm theo mã sinh viên hợp lệ
    [Documentation]    TC_RP_12
    [Tags]    AnhTuyet    BaoCaoCLO
    Check search by valid student code    4
TC_RP_13 : Kiểm tra tìm kiếm theo mã sinh viên không hợp lệ
    [Documentation]    TC_RP_13
    [Tags]    AnhTuyet    BaoCaoCLO
    Check search by invalid student code    999
TC_RP_14 : Kiểm tra tìm kiếm theo mã sinh viên không hợp lệ
    [Documentation]    TC_RP_14
    [Tags]    AnhTuyet    BaoCaoCLO
    Check search by score     94,9%
TC_RP_15 : Kiểm tra tìm kiếm theo mã sinh viên không hợp lệ
    [Documentation]    TC_RP_15
    [Tags]    AnhTuyet    BaoCaoCLO
    Check Search test by status      Not Achieved  
TC_RP_16 : Kiểm tra tìm kiếm theo mã sinh viên không hợp lệ
    [Documentation]    TC_RP_16
    [Tags]    AnhTuyet    BaoCaoCLO
    Check search the keyword is empty    ${EMPTY}
# đang lỗi TC_RP_17
TC_RP_17 - Print CLO Report Successfully 
    [Documentation]    Verify CLO report can be printed to PDF successfully
    [Tags]    AnhTuyet    BaoCaoCLO
    Print Report Successfully In Test Detail View
    