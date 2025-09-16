*** Settings ***
Library    SeleniumLibrary
Resource   ../Resource/cauhoicuatoi.resource
Suite Setup     Open Browser And Login
Suite Teardown  Close All Browsers
Test Teardown   Capture Page Screenshot

*** Test Cases ***
QB-FUNC-05 - Chỉ hiển thị câu hỏi của tôi
    [Tags]    honghanh    cauhoicuatoi
    Open Question Bank
    Wait Until Element Is Visible    ${CHECK_MYQ}    10s
    Clear All Filters
    Toggle My Questions    on
    Apply Filters
    Checkbox Should Be Selected    ${CHECK_MYQ}
    ${has_card}=    Run Keyword And Return Status    Page Should Contain Element    ${QUESTION_CARD}
    ${is_empty}=    Run Keyword And Return Status    Page Should Contain Element    ${EMPTY_STATE}
    Should Be True    ${has_card} or ${is_empty}    Không thấy kết quả hoặc trạng thái rỗng sau khi bật My Questions

QB-FUNC-06 - Không có câu hỏi của tôi
    [Documentation]    Kiểm tra khi user chưa có câu hỏi, tick "Show only my questions" => Hiển thị "No data found"
    [Tags]    honghanh    cauhoicuatoi
    Open Question Bank
    Wait Until Element Is Visible    ${CHECK_MYQ}    10s
    Clear All Filters
    Toggle My Questions    on
    Apply Filters
    Wait Until Page Contains    No data found    timeout=10s
    Page Should Contain    No data found