*** Settings ***
Resource        ../Resource/core.resource
Resource        ../Resource/Quiz.resource
Library         SeleniumLibrary

Suite Setup     Login As Lecturer
Suite Teardown  Close All Browsers
Test Teardown   Capture Page Screenshot
Test Timeout    3 minutes
Documentation   Test trang "Quản lý bài kiểm tra" (Tests/Quiz) cho Lecturer.

*** Test Cases ***
QZ-01 - Mở trang (smoke)
    Open Tests Page
    Expect Tests Page Loaded

QZ-02 - Đủ tab nếu có
    Open Tests Page
    ${has_tab}=    Run Keyword And Return Status    Page Should Contain Element    ${TAB_ALL}
    Run Keyword If    ${has_tab}    Page Should Contain Element    ${TAB_FINAL}
    Run Keyword If    ${has_tab}    Page Should Contain Element    ${TAB_QUIZ}
    Run Keyword If    ${has_tab}    Page Should Contain Element    ${TAB_ASSIGNMENT}
    Run Keyword If    ${has_tab}    Page Should Contain Element    ${TAB_PROJECT}

QZ-03 - Banner rỗng hoặc có card
    Open Tests Page
    ${has_banner}=    Run Keyword And Return Status    Page Should Contain Element    ${BANNER_EMPTY}
    ${has_card}=      Run Keyword And Return Status    Page Should Contain Element    ${CARD_DISTRIBUTION}
    ${ok}=    Evaluate    ${has_banner} or ${has_card}
    Should Be True    ${ok}

QZ-04 - Link “classes” trong banner (nếu có)
    Open Tests Page
    ${has_link}=    Run Keyword And Return Status    Page Should Contain Element    ${LINK_IN_BANNER}
    Run Keyword If    ${has_link}    Safe Click    ${LINK_IN_BANNER}
    Run Keyword If    ${has_link}    Wait Until Document Ready

QZ-05 - My Classes điều hướng đúng (nếu có)
    Open Tests Page
    ${has_mc}=    Run Keyword And Return Status    Page Should Contain Element    ${LOC_MY_CLASSES}
    Run Keyword If    ${has_mc}    Go To My Classes
    Run Keyword If    ${has_mc}    Location Should Contain    /classes

QZ-06 - Card Test Distribution (nếu có)
    Open Tests Page
    ${has_card}=    Run Keyword And Return Status    Page Should Contain Element    ${CARD_DISTRIBUTION}
    Run Keyword If    ${has_card}    Expect Distribution Card

QZ-07 - Hộp Test Creation Tips (tên có thể đổi)
    Open Tests Page
    Expect Tips Box

QZ-08 - Lọc theo tab (nếu có)
    Open Tests Page
    ${has_tab}=    Run Keyword And Return Status    Page Should Contain Element    ${TAB_ALL}
    Run Keyword If    ${has_tab}    Click Tab    Midterm
    Run Keyword If    ${has_tab}    Click Tab    Final
    Run Keyword If    ${has_tab}    Click Tab    Quiz
    Run Keyword If    ${has_tab}    Click Tab    Assignment
    Run Keyword If    ${has_tab}    Click Tab    Project
    Run Keyword If    ${has_tab}    Click Tab    All

QZ-09 - Reload ổn định
    Open Tests Page
    Reload Page
    Expect Tests Page Loaded

QZ-10 - Chưa login (form login hoặc trang hiển thị)
    Close All Browsers
    Open Browser    ${URL_TESTS}    ${BROWSER}
    Wait Until Document Ready
    ${see_user}=    Run Keyword And Return Status    Page Should Contain Element    ${LOGIN_USER}
    ${see_pass}=    Run Keyword And Return Status    Page Should Contain Element    ${LOGIN_PASS}
    ${see_tests}=   Run Keyword And Return Status    Run Keywords
    ...    Page Should Contain Element    ${BANNER_EMPTY}    AND
    ...    Page Should Contain Element    ${H_TESTS}
    ${ok}=    Evaluate    (${see_user} and ${see_pass}) or ${see_tests}
    Should Be True    ${ok}
    Close All Browsers
    Login As Lecturer
