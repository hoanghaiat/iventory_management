*** Settings ***
Library    SeleniumLibrary
Resource   ../Resource/cauhoicuatoi.resource
Suite Setup     Open Browser And Login
Suite Teardown  Close All Browsers
Test Teardown   Capture Page Screenshot

*** Test Cases ***
QB-FUNC-05 - Chi hien thi cau hoi cua toi
    Open Question Bank
    Wait Until Element Is Visible    ${CHECK_MYQ}    10s
    Clear All Filters
    Toggle My Questions    on
    Apply Filters
    Checkbox Should Be Selected    ${CHECK_MYQ}
    ${has_card}=    Run Keyword And Return Status    Page Should Contain Element    ${QUESTION_CARD}
    ${is_empty}=    Run Keyword And Return Status    Page Should Contain Element    ${EMPTY_STATE}
    Should Be True    ${has_card} or ${is_empty}    Khong thay ket qua hay trang thai rong sau khi bat My Questions

QB-FUNC-06 - Khong co cau hoi cua toi
    [Documentation]    Kiểm tra khi user chưa có câu hỏi, tick "Show only my questions" => Hiển thị "No data found"
    Wait Until Page Contains Element    xpath=//input[@id="showOnlyMyQuestions"]    timeout=5s
    Run Keyword If    Element Should Be Visible   
    ...    Click Element    xpath=//input[@id="showOnlyMyQuestions"]
    Click Element    xpath=//button[contains(text(),"Apply Filters")]
    Wait Until Page Contains    No data found    timeout=5s
    Apply Filters
        Sleep    1s
        Wait Until Page Contains Element    xpath=//input[@id="showOnlyMyQuestions"]    timeout=10s
    ${n}=    Get Element Count    ${QUESTION_CARD}
    ${is_empty}=    Run Keyword And Return Status    Page Should Contain Element    ${EMPTY_STATE}
    Page Should Contain    No data found