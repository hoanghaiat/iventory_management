*** Settings ***
Resource        ../Resource/core.resource
Resource        ../Resource/taxonomy.resource
Library         SeleniumLibrary
Library         String

Suite Setup     Login As Lecturer
Suite Teardown  Close All Browsers
Test Teardown   Capture Page Screenshot
Test Timeout    3 minutes
Documentation   Test “chuẩn” cho trang Thẻ phân loại (kỳ vọng hoạt động bình thường; gặp lỗi phải FAIL).

*** Test Cases ***
TX-OK01 - Mở trang qua menu
    Open Taxonomy Page (menu first)

TX-OK02 - Mở trực tiếp URL
    Open Taxonomy Page (direct)

TX-OK03 - Tạo thẻ mới (Active)
    Open Taxonomy Page (direct)
    ${name}=    Generate Random String    8    [LOWER]
    ${name}=    Set Variable    TAG-${name}
    Create Tag (name, status)    ${name}    Active
    [Teardown]    Delete Tag (soft)    ${name}

TX-OK04 - Tìm kiếm theo tên
    Open Taxonomy Page (direct)
    ${name}=    Generate Random String    6    [LOWER]
    ${name}=    Set Variable    TAG-${name}
    Create Tag (name, status)    ${name}    Active
    Search Tag By Name           ${name}
    Row By Name Should Exist     ${name}
    [Teardown]    Delete Tag (soft)    ${name}

TX-OK05 - Đổi trạng thái sang Inactive
    Open Taxonomy Page (direct)
    ${name}=    Generate Random String    6    [LOWER]
    ${name}=    Set Variable    TAG-${name}
    Create Tag (name, status)    ${name}    Active
    Edit Tag Status To           ${name}    Inactive
    Search Tag By Name           ${name}
    Row By Name Should Exist     ${name}
    [Teardown]    Delete Tag (soft)    ${name}

TX-OK06 - UI phải không chứa lỗi template
    Open Taxonomy Page (direct)
    Page Should Not Contain    TemplateDoesNotExist
    Page Should Not Contain    questionbank/tag_list.html
    Page Should Not Contain    questionbank/questiontag_list.html
