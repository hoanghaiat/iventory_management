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
    Search Textbox
    Capture Page Screenshot

TC043 - Kiểm tra tìm kiếm với từ khoá không tồn tại
    [Documentation]    TC043
    [Tags]    TuAnh    Search_Report
    Click Search
    Search Wrong Keyword

TC044 - Kiểm tra tìm kiếm từ khoá khi để trống
    [Documentation]    TC044
    [Tags]    TuAnh    Search_Report
    Click Search
    Search Textbox Blank



TC054 - Kiểm tra bottun "Xoá bộ lọc" sau khi tìm kiếm kết quả
    [Documentation]    TC054
    [Tags]    TuAnh    Search_Report
    Click Search
    Search Textbox
    Clear Filter

