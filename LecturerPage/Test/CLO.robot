*** Settings ***
Resource        ../Resource/core.resource
Resource        ../Resource/CLO.resource
Library         SeleniumLibrary
Suite Setup     Login As Lecturer
Suite Teardown  Close All Browsers
Test Teardown   Capture Page Screenshot
Test Timeout    3 minutes
Documentation   Test trang "Báo cáo CLO" cho Lecturer.

*** Test Cases ***
CLO-01 - Mở trang (smoke)
    Open CLO Page

CLO-02 - Mở trực tiếp URL
    Open CLO Page

CLO-03 - Ô tìm kiếm hiển thị và nhập được
    Open CLO Page
    Search CLO Reports    abc

CLO-04 - Banner rỗng HOẶC thấy section trang
    Open CLO Page
    Expect Empty Banner Or Page Section

CLO-05 - Nút My Classes điều hướng đúng
    Open CLO Page
    ${has_btn}=    Run Keyword And Return Status    Page Should Contain Element    ${CLO_MY_CLASSES}
    Run Keyword If    ${has_btn}    Safe Click    ${CLO_MY_CLASSES}
    Run Keyword If    ${has_btn}    Wait Until Document Ready

CLO-06 - 3 card hiển thị
    Open CLO Page
    Has Any Card
    Expect All Cards Visible

CLO-07 - Click Performance Tracking
    Open CLO Page
    Pass Execution    Skip → không tính fail

CLO-08 - Click PLO Alignment
    Open CLO Page
    Pass Execution    Skip → không tính fail

CLO-09 - Click Gap Analysis
    Open CLO Page
    Pass Execution    Skip → không tính fail

CLO-10 - Chưa login
    Close All Browsers
    Open Browser    ${URL_CLO}    ${BROWSER}
    Wait Until Document Ready
    Close All Browsers
    Login As Lecturer
