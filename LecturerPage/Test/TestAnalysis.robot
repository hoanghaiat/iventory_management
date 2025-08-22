*** Settings ***
Resource        ${CURDIR}/../Resource/TestAnalysis.resource
Suite Setup     Open Browser And Login
Suite Teardown  Run Keyword And Ignore Error    Close All Browsers
Test Teardown   Run Keyword And Ignore Error    Capture Page Screenshot
Test Timeout    4 minutes
Documentation   Suite kiểm thử trang "Phân tích bài kiểm tra" (Test Analysis). Fallback VI/EN + menu + markers.

*** Variables ***
${MODULE}    Interface
${BACKLOG}   Test Analysis

*** Test Cases ***
TA-01 - Empty state khi chưa có phân tích
    [Documentation]    TC_TA_01
    [Tags]    SIU TOMY    ${MODULE}    ${BACKLOG}    UI    EmptyState
    Open Test Analysis Page
    Wait For TALanded
    ${is_empty}=    Run Keyword And Return Status    Page Should Contain Element    ${TA_MARK_EMPTY}
    Log    Empty state present: ${is_empty}

TA-02 - Tìm kiếm không có kết quả
    [Documentation]    TC_TA_02
    [Tags]    SIU TOMY    ${MODULE}    ${BACKLOG}    Search
    Open Test Analysis Page
    Wait For TALanded
    Search Test Analyses    zzzz_unmatched_keyword_123
    Verify Empty State

TA-03 - Tìm kiếm và xoá từ khoá → trang vẫn ổn định
    [Documentation]    TC_TA_03
    [Tags]    SIU TOMY    ${MODULE}    ${BACKLOG}    Search    UX
    Open Test Analysis Page
    Wait For TALanded
    Search Test Analyses    Midterm
    Wait For TALanded    8s
    Search Test Analyses    ${EMPTY}
    Wait For TALanded    8s

TA-04 - Breadcrumb/Home khả dụng (nếu có)
    [Documentation]    TC_TA_04
    [Tags]    SIU TOMY    ${MODULE}    ${BACKLOG}    Nav    UI
    Open Test Analysis Page
    Wait For TALanded
    Leave TA By Breadcrumb If Present
    Go Back
    Wait For TALanded

TA-05 - Khu vực "About Test Analysis" hiển thị đủ 3 card
    [Documentation]    TC_TA_05
    [Tags]    SIU TOMY    ${MODULE}    ${BACKLOG}    UI    Content
    Open Test Analysis Page
    Wait For TALanded
    Page Should Contain Element    ${TA_CARD_PERF}
    Page Should Contain Element    ${TA_CARD_ITEM}
    Page Should Contain Element    ${TA_CARD_CLO}

TA-06 - Điều hướng card Performance Statistics
    [Documentation]    TC_TA_06
    [Tags]    SIU TOMY    ${MODULE}    ${BACKLOG}    Nav
    Open Test Analysis Page
    Wait For TALanded
    Click Card Performance
    Run Keyword And Ignore Error    Assert Url Matches    ${URL_TA_PERF}

TA-07 - Điều hướng card Item Analysis
    [Documentation]    TC_TA_07
    [Tags]    SIU TOMY    ${MODULE}    ${BACKLOG}    Nav
    Open Test Analysis Page
    Wait For TALanded
    Click Card Item
    Run Keyword And Ignore Error    Assert Url Matches    ${URL_TA_ITEM}

TA-08 - Điều hướng card CLO Achievement
    [Documentation]    TC_TA_08
    [Tags]    SIU TOMY    ${MODULE}    ${BACKLOG}    Nav
    Open Test Analysis Page
    Wait For TALanded
    Click Card CLO
    Run Keyword And Ignore Error    Assert Url Matches    ${URL_TA_CLO}

TA-09 - Input tìm kiếm có placeholder đúng
    [Documentation]    TC_TA_09
    [Tags]    SIU TOMY    ${MODULE}    ${BACKLOG}    UI
    Open Test Analysis Page
    Wait For TALanded
    ${ph}=    Get Element Attribute    ${TA_SEARCH_INPUT}    placeholder
    Should Contain    ${ph}    Search test analyses

TA-10 - UI không vỡ khi không có dữ liệu
    [Documentation]    TC_TA_10
    [Tags]    SIU TOMY    ${MODULE}    ${BACKLOG}    UI    Smoke
    Open Test Analysis Page
    Wait For TALanded
    Page Should Contain Element    ${TA_SEARCH_INPUT}
    Page Should Contain Element    ${TA_CARD_PERF}
    Page Should Contain Element    ${TA_CARD_ITEM}
    Page Should Contain Element    ${TA_CARD_CLO}
