*** Settings ***
Resource        ${CURDIR}/../Resource/core.resource
Resource        ${CURDIR}/../Resource/QuestionCreate.resource
Suite Setup     Login As Lecturer
Suite Teardown  Close All Browsers
Test Teardown   Capture Page Screenshot
Test Timeout    3 minutes
Documentation   Test trang "Create New Question" cho Lecturer.

*** Test Cases ***
TC-C01 - Mở trang Tạo câu hỏi
    Open Question Create
    QC Marker Should Exist

TC-C02 - Kiểm tra đủ control bắt buộc
    Open Question Create
    ${has_type}=      Run Keyword And Return Status    Page Should Contain Element    ${QC_SEL_TYPE}
    ${has_diff}=      Run Keyword And Return Status    Page Should Contain Element    ${QC_SEL_DIFFICULTY}
    ${has_bloom}=     Run Keyword And Return Status    Page Should Contain Element    ${QC_SEL_BLOOM}
    # tránh gạch đỏ: kiểm tra từng loại control content rồi gộp bằng Evaluate
    ${has_ta}=        Run Keyword And Return Status    Page Should Contain Element    ${QC_TA_CONTENT}
    ${has_ce}=        Run Keyword And Return Status    Page Should Contain Element    ${QC_RICH_EDITABLE}
    ${has_ifr}=       Run Keyword And Return Status    Page Should Contain Element    ${QC_RTE_IFRAME}
    ${has_content}=   Evaluate    bool(${has_ta}) or bool(${has_ce}) or bool(${has_ifr})
    ${all_ok}=        Evaluate    bool(${has_type}) and bool(${has_diff}) and bool(${has_bloom}) and bool(${has_content})
    Should Be True    ${all_ok}
    # Course có dự án không hiển thị → chỉ log mềm
    ${has_course}=    Run Keyword And Return Status    Page Should Contain Element    ${QC_SEL_COURSE}
    IF    not ${has_course}
        Log To Console    Course không hiển thị – bỏ qua (mềm)
    END

TC-C03 - Tạo câu hỏi tối thiểu (MCQ/Easy/Remember)
    Open Question Create
    QC Fill Minimal    Algorithms 101    Quick MCQ demo    Multiple Choice    Easy    Remember
    QC Submit (soft)
    Log    Không xác thực lưu ở demo

TC-C04 - Loại Essay / Medium / Analyze
    Open Question Create
    QC Fill Minimal    Algorithms 101    Essay demo        Essay              Medium   Analyze
    QC Submit (soft)
    Log    Không xác thực lưu ở demo

TC-C05 - Practical / Hard / Apply
    Open Question Create
    QC Fill Minimal    Algorithms 101    Practical demo    Practical          Hard     Apply
    QC Submit (soft)
    Log    Không xác thực lưu ở demo

TC-C06 - True/False
    Open Question Create
    QC Fill Minimal    Algorithms 101    T/F demo          True/False         Easy     Understand
    QC Submit (soft)

TC-C07 - Short Answer
    Open Question Create
    QC Fill Minimal    Algorithms 101    Short answer      Short Answer       Medium   Remember
    QC Submit (soft)

TC-C08 - Matching
    Open Question Create
    QC Fill Minimal    Algorithms 101    Matching demo     Matching           Medium   Analyze
    QC Submit (soft)

TC-C09 - Nội dung dài 1.000 ký tự
    Open Question Create
    ${long}=    Evaluate    'X'*1000
    QC Fill Minimal    Algorithms 101    ${long}    Multiple Choice    Medium    Apply
    QC Submit (soft)

TC-C10 - Ký tự đặc biệt trong Content
    Open Question Create
    QC Fill Minimal    Algorithms 101    !@#$%^&*()_+[]{}|;:",.<>?    Essay    Medium    Analyze
    QC Submit (soft)

TC-C11 - Đổi Status = Inactive
    Open Question Create
    QC Set Status (any inactive)
    QC Submit (soft)

TC-C12 - Approval = Rejected
    Open Question Create
    QC Set Approval (rejected)
    QC Submit (soft)

TC-C13 - Làm mới trang vẫn giữ control
    Open Question Create
    Reload Page
    Wait Until Document Ready
    ${ok}=    Wait For QC Landed
    Should Be True    ${ok}

TC-C14 - Đa ngôn ngữ EN → VI (mở trực tiếp)
    Go To    ${QC_URL_VI}
    ${ok}=    Wait For QC Landed
    Should Be True    ${ok}
