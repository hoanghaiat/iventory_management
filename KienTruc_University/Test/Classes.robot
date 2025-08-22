*** Settings ***
Library    SeleniumLibrary
Resource   ../Resource/Classes.resource
Suite Setup     
Suite Teardown  Close All Browsers
Test Teardown   Capture Page Screenshot
Test Timeout    4 minutes
Documentation   Login -> Lớp học -> thao tác bộ lọc Semester/AY/Status + Search.

*** Keywords ***
    

*** Test Cases ***
Login
    [Documentation]    Đăng nhập vào hệ thống
    Login To System    student1    demostudent
CLF-DEFAULTS-01 - Kiểm tra giá trị mặc định và có thể mở trang Lớp học
    Go To Classes Page
    Assert Default Filters
    Wait Table Has Rows

CLF-COMB-SEARCH-01 - Lọc theo Semester + AY + Status + Search và bấm Tìm
    Go To Classes Page
    Select Semester         Summer

    # Academic Year: nếu có nhiều hơn "All Years" thì chọn phần tử cuối,
    # còn chỉ có "All Years" thì bỏ qua assert theo Year.
    ${years}=    Get List Items    ${FILTER_AY}
    ${len}=      Get Length        ${years}
    IF    ${len} > 1
        Select Academic Year    ${years}[-1]
        ${yr_for_assert}=    Set Variable    ${years}[-1]
    ELSE
        ${yr_for_assert}=    Set Variable    ${EMPTY}
    END

    Select Status           Ongoing

    # Submit bằng ENTER để né overlay che nút Tìm
    Scroll Element Into View    ${INPUT_Q}
    Run Keyword And Ignore Error    Click Element    xpath=//body    # nếu panel đang nổi, click ra ngoài để đóng
    Clear Element Text      ${INPUT_Q}
    Input Text              ${INPUT_Q}    Nhập môn lập trình
    Press Keys              ${INPUT_Q}    ENTER

    Wait Table Has Rows     10s

    # Nếu không có year cụ thể (chỉ All Years) thì bỏ qua assert Year
   Run Keyword If    '${yr_for_assert}'==''
...    Table Rows Should Match    Summer    ${EMPTY}    Ongoing    Nhập môn lập trình
...    ELSE    Table Rows Should Match    Summer    ${yr_for_assert}    Ongoing    Nhập môn lập trình

