*** Settings ***
Resource        ../Resource/core.resource
Resource        ../Resource/taxonomy.resource
Library         SeleniumLibrary
Library         RequestsLibrary

Suite Setup     Login As Lecturer
Suite Teardown  Close All Browsers
Test Teardown   Capture Page Screenshot
Test Timeout    2 minutes
Documentation   Test trang "Taxonomy (Thẻ phân loại)" cho Lecturer.

*** Test Cases ***
TX-SM01 - Mở trang qua menu
    Open Taxonomy By Menu
    Expect Template Error

TX-SM02 - Mở trực tiếp URL
    Open Taxonomy By URL
    Expect Template Error

TX-SM03 - Kiểm tra HTTP status
    Create Session    clo    ${BASE_URL}
    ${resp}=    Get Request    clo    /en/questionbank/tags/
    Should Be Equal As Integers    ${resp.status_code}    500

TX-ERR01 - Nội dung lỗi template
    Open Taxonomy By URL
    Page Should Contain    ${ERR_FILENAME}

TX-AUTH01 - Chặn truy cập khi chưa login
    Close All Browsers
    Open Browser    ${URL_TAXONOMY}    ${BROWSER}
    Location Should Contain    login
    Close All Browsers
    Login As Lecturer

TX-NAV01 - Menu có mục Thẻ phân loại
    Page Should Contain Element    ${LOC_TAGS_MENU}

TX-I18N01 - Kiểm tra route đa ngôn ngữ
    Go To    ${BASE_URL}/vi/questionbank/tags/
    Expect Template Error
    Go To    ${BASE_URL}/en/questionbank/tags/
    Expect Template Error

TX-REPRO01 - Refresh vẫn lỗi
    Open Taxonomy By URL
    Reload Page
    Expect Template Error

TX-LOG01 - Capture bằng chứng lỗi
    Open Taxonomy By URL
    Capture Page Screenshot
