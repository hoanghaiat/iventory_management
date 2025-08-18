*** Settings ***
Resource        ../Resource/core.resource
Resource        ../Resource/Import.resource
Library         SeleniumLibrary
Library         RequestsLibrary

Suite Setup     Login As Lecturer
Suite Teardown  Close All Browsers
Test Teardown   Capture Page Screenshot
Test Timeout    3 minutes
Documentation   Test trang "Import Questions" cho Lecturer.

*** Test Cases ***
IMP-01 - Mở trang qua menu
    Open Import By Menu
    Expect Template Error

IMP-02 - Mở trực tiếp URL
    Open Import By URL
    Expect Template Error

IMP-03 - HTTP khi chưa login (expect redirect)
    Close All Browsers
    Create Session    anon    ${BASE_URL}
    ${r}=    Get Request    anon    /en/questionbank/questions/import/
    Should Be True    ${r.status_code} in [301,302,303]
    Login As Lecturer

IMP-04 - HTTP sau khi login (expect 500 do server)
    Create Session    clo    ${BASE_URL}
    ${r}=    Get Request    clo    /en/questionbank/questions/import/
    Should Be Equal As Integers    ${r.status_code}    500

IMP-05 - Menu có mục Import Questions
    Verify Import Menu Visible

IMP-06 - Kiểm tra input file tồn tại (blocked cho đến khi server fix)
    Open Import By URL
    Page Should Contain Element    ${IMP_INPUT_FILE}
    [Tags]    blocked

IMP-07 - Kiểm tra đa ngôn ngữ (i18n)
    Go To    ${BASE_URL}/vi/questionbank/questions/import/
    Expect Template Error
    Go To    ${BASE_URL}/en/questionbank/questions/import/
    Expect Template Error

IMP-08 - Refresh vẫn lỗi
    Open Import By URL
    Reload Page
    Expect Template Error

IMP-09 - Capture bằng chứng lỗi
    Open Import By URL
    Expect Template Error
    Capture Page Screenshot
