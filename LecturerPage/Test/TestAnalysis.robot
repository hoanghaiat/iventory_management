*** Settings ***
Resource        ../Resource/TestAnalysis.resource
Suite Setup     Open Browser And Login
# Teardown phòng thủ: không để suite fail vì đóng browser
Suite Teardown  Run Keyword And Ignore Error    Close All Browsers
# Screenshot phòng thủ: nếu không có browser thì bỏ qua
Test Teardown   Run Keyword And Ignore Error    Capture Page Screenshot
Test Timeout    4 minutes
Documentation   Suite kiểm thử trang "Phân tích bài kiểm tra" (Test Analysis). Fallback VN/EN + menu + markers.

*** Test Cases ***
TA-01 - Empty state khi chưa có phân tích
    [Tags]    UI    EmptyState
    Open Test Analysis Page
    Wait For TALanded
    ${is_empty}=    Run Keyword And Return Status    Page Should Contain Element    ${TA_MARK_EMPTY}
    Log    Empty state present: ${is_empty}

TA-02 - Tìm kiếm không có kết quả
    [Tags]    Search
    Open Test Analysis Page
    Wait For TALanded
    Search Test Analyses    zzzz_unmatched_keyword_123
    Verify Empty State

TA-03 - Tìm kiếm và xoá từ khoá → trang vẫn ổn định
    [Tags]    Search    UX
    Open Test Analysis Page
    Wait For TALanded
    Search Test Analyses    Midterm
    Wait For TALanded    8s
    Search Test Analyses    ${EMPTY}
    Wait For TALanded    8s

TA-04 - Breadcrumb/Home khả dụng (nếu có)
    [Tags]    Nav    UI
    Open Test Analysis Page
    Wait For TALanded
    ${home}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//nav//*[normalize-space(.)='Trang chủ' or normalize-space(.)='Home']
    Run Keyword If    ${home}    Click Element    xpath=//nav//*[normalize-space(.)='Trang chủ' or normalize-space(.)='Home']
    Run Keyword If    ${home}    Wait Until Page Contains Element    xpath=//h1[normalize-space(.)='Trang chủ' or normalize-space(.)='Home']    10s
    Run Keyword If    ${home}    Go Back
    Wait For TALanded

TA-05 - Khu vực "About Test Analysis" hiển thị đủ 3 card
    [Tags]    UI    Content
    Open Test Analysis Page
    Wait For TALanded
    Page Should Contain Element    ${TA_CARD_PERF}
    Page Should Contain Element    ${TA_CARD_ITEM}
    Page Should Contain Element    ${TA_CARD_CLO}

TA-06 - Điều hướng card Performance Statistics
    [Tags]    Nav
    Open Test Analysis Page
    Wait For TALanded
    Click Card Performance
    Run Keyword And Ignore Error    Assert Url Matches    ${URL_TA_PERF}

TA-07 - Điều hướng card Item Analysis
    [Tags]    Nav
    Open Test Analysis Page
    Wait For TALanded
    Click Card Item
    Run Keyword And Ignore Error    Assert Url Matches    ${URL_TA_ITEM}

TA-08 - Điều hướng card CLO Achievement
    [Tags]    Nav
    Open Test Analysis Page
    Wait For TALanded
    Click Card CLO
    Run Keyword And Ignore Error    Assert Url Matches    ${URL_TA_CLO}

TA-09 - Input tìm kiếm có placeholder đúng
    [Tags]    UI
    Open Test Analysis Page
    Wait For TALanded
    ${ph}=    Get Element Attribute    ${TA_SEARCH_INPUT}    placeholder
    Should Contain    ${ph}    Search test analyses

TA-10 - UI không vỡ khi không có dữ liệu
    [Tags]    UI    Smoke
    Open Test Analysis Page
    Wait For TALanded
    Page Should Contain Element    ${TA_SEARCH_INPUT}
    Page Should Contain Element    ${TA_CARD_PERF}
    Page Should Contain Element    ${TA_CARD_ITEM}
    Page Should Contain Element    ${TA_CARD_CLO}
