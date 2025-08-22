*** Settings ***
Library         SeleniumLibrary
Resource        ../Resource/Quiz.resource
Suite Setup     Login As Lecturer
Suite Teardown  Close All Browsers
Test Teardown   Capture Page Screenshot
Test Timeout    3 minutes
Documentation   Test trang "Quản lý bài kiểm tra" (Tests/Quiz) cho Lecturer.

*** Variables ***
${CLASS_NAME}    Class 1   # đổi theo tên lớp thật

*** Test Cases ***
QZ-01 - Smoke mở trang Assess
    [Documentation]    TC_QZ_01
    [Tags]    SIU TOMY    Interface    Quiz
    Open Tests Page
    Wait For Quiz By URL

QZ-02 - Tabs hiển thị & click tuần tự
    [Documentation]    TC_QZ_02
    [Tags]    SIU TOMY    Interface    Quiz
    Open Tests Page
    Wait For Quiz By URL
    Click Tabs By Image Order

QZ-03 - Điều hướng My Classes → chọn lớp → vào Tests của lớp
    [Documentation]    TC_QZ_03
    [Tags]    SIU TOMY    Interface    Quiz
    Open Tests Page
    Go To My Classes
    Open Class Tests    ${CLASS_NAME}
    Wait For Quiz By URL

QZ-04 - Reload giữ trang Assess
    [Documentation]    TC_QZ_04
    [Tags]    SIU TOMY    Interface    Quiz
    Open Tests Page
    Reload Page
    Wait For Quiz By URL

QZ-05 - Deep link EN/VI hoạt động
    [Documentation]    TC_QZ_05
    [Tags]    SIU TOMY    Interface    Quiz
    Go To    ${QUIZ_URL_EN}
    Wait For Quiz By URL
    Open Tests Page
    Wait For Quiz By URL

QZ-06 - Chuyển tab và xác nhận tab active (nếu có)
    [Documentation]    TC_QZ_06
    [Tags]    SIU TOMY    Interface    Quiz
    Open Tests Page
    Wait For Quiz By URL
    ${_}=    Select Tab By Name    Midterm
    Assert Active Tab If Present     Midterm
    ${_}=    Select Tab By Name    Final
    Assert Active Tab If Present     Final
    ${_}=    Select Tab By Name    Quiz
    Assert Active Tab If Present     Quiz

QZ-07 - Đếm số items trước/sau khi đổi tab (linh hoạt)
    [Documentation]    TC_QZ_07
    [Tags]    SIU TOMY    Interface    Quiz
    Open Tests Page
    Wait For Quiz By URL
    ${_}=           Select Tab By Name    All
    ${n_all}=       Count Test Items
    ${_}=           Select Tab By Name    Assignment
    ${n_assign}=    Count Test Items
    Log    All=${n_all}, Assignment=${n_assign}

QZ-08 - Mở chi tiết 1 bài kiểm tra rồi quay lại
    [Documentation]    TC_QZ_08
    [Tags]    SIU TOMY    Interface    Quiz
    Open Tests Page
    Wait For Quiz By URL
    Open First Test Item Or Skip
    Back

QZ-09 - Phân trang Next/Prev nếu có
    [Documentation]    TC_QZ_09
    [Tags]    SIU TOMY    Interface    Quiz
    Open Tests Page
    Wait For Quiz By URL
    ${c1}=    Count Test Items
    Click Next If Present
    ${c2}=    Count Test Items
    Click Prev If Present
    ${c3}=    Count Test Items
    Log    Counts: first=${c1}, after_next=${c2}, after_prev=${c3}

QZ-10 - Tìm kiếm nếu có ô Search
    [Documentation]    TC_QZ_10
    [Tags]    SIU TOMY    Interface    Quiz
    Open Tests Page
    Wait For Quiz By URL
    Search If Present    Quiz
    ${n}=    Count Test Items
    Log    Search result count: ${n}

QZ-11 - Chuyển tab nhanh: All → Project → Final (nếu có)
    [Documentation]    TC_QZ_11
    [Tags]    SIU TOMY    Interface    Quiz
    Open Tests Page
    Wait For Quiz By URL
    ${_}=    Select Tab By Name    All
    ${_}=    Select Tab By Name    Project
    ${_}=    Select Tab By Name    Final
    Assert Active Tab If Present     Final

QZ-12 - Điều hướng My Classes rồi quay lại Assess
    [Documentation]    TC_QZ_12
    [Tags]    SIU TOMY    Interface    Quiz
    Open Tests Page
    Go To My Classes
    Open Tests Page
    Wait For Quiz By URL
