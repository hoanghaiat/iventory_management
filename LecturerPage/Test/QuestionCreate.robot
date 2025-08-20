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
    Open Question Create (direct)
    QC Marker Should Exist

TC-C02 - Kiểm tra đủ control bắt buộc
    Open Question Create (direct)
    ${has_type}=      Run Keyword And Return Status    Page Should Contain Element    ${QC_SEL_TYPE}
    ${has_diff}=      Run Keyword And Return Status    Page Should Contain Element    ${QC_SEL_DIFFICULTY}
    ${has_bloom}=     Run Keyword And Return Status    Page Should Contain Element    ${QC_SEL_BLOOM}
    ${has_ta}=        Run Keyword And Return Status    Page Should Contain Element    ${QC_TA_CONTENT}
    ${has_ce}=        Run Keyword And Return Status    Page Should Contain Element    ${QC_RICH_EDITABLE}
    ${has_ifr}=       Run Keyword And Return Status    Page Should Contain Element    ${QC_RTE_IFRAME}
    ${has_content}=   Evaluate    bool(${has_ta}) or bool(${has_ce}) or bool(${has_ifr})
    ${all_ok}=        Evaluate    bool(${has_type}) and bool(${has_diff}) and bool(${has_bloom}) and bool(${has_content})
    Should Be True    ${all_ok}

TC-C03 - Tạo câu hỏi tối thiểu (MCQ/Easy/Remember)
    Open Question Create (direct)
    QC Set Course First
    QC Set Type         Multiple Choice
    QC Set Difficulty   Easy
    QC Set Bloom        Remember
    QC Set Content      Quick MCQ demo
    QC Submit (soft)

TC-C04 - Loại Essay / Medium / Analyze
    Open Question Create (direct)
    QC Set Course First
    QC Set Type         Essay
    QC Set Difficulty   Medium
    QC Set Bloom        Analyze
    QC Set Content      Essay demo
    QC Submit (soft)

TC-C05 - Practical / Hard / Apply
    Open Question Create (direct)
    QC Set Course First
    QC Set Type         Practical
    QC Set Difficulty   Hard
    QC Set Bloom        Apply
    QC Set Content      Practical demo
    QC Submit (soft)

TC-C06 - True/False
    Open Question Create (direct)
    QC Set Course First
    QC Set Type         True/False
    QC Set Difficulty   Easy
    QC Set Bloom        Understand
    QC Set Content      T/F demo
    QC Submit (soft)

TC-C07 - Short Answer
    Open Question Create (direct)
    QC Set Course First
    QC Set Type         Short Answer
    QC Set Difficulty   Medium
    QC Set Bloom        Remember
    QC Set Content      Short answer
    QC Submit (soft)

TC-C08 - Matching
    Open Question Create (direct)
    QC Set Course First
    QC Set Type         Matching
    QC Set Difficulty   Medium
    QC Set Bloom        Analyze
    QC Set Content      Matching demo
    QC Submit (soft)

TC-C09 - Nội dung dài 1.000 ký tự
    Open Question Create (direct)
    QC Set Course First
    QC Set Type         Multiple Choice
    QC Set Difficulty   Medium
    QC Set Bloom        Apply
    ${long}=    Evaluate    'X'*1000
    QC Set Content      ${long}
    QC Submit (soft)

TC-C10 - Ký tự đặc biệt trong Content
    Open Question Create (direct)
    QC Set Course First
    QC Set Type         Essay
    QC Set Difficulty   Medium
    QC Set Bloom        Analyze
    QC Set Content      !@#$%^&*()_+[]{}|;:",.<>?
    QC Submit (soft)

TC-C11 - Đổi Status = Inactive
    Open Question Create (direct)
    QC Set Status (any inactive)
    QC Submit (soft)

TC-C12 - Approval = Rejected
    Open Question Create (direct)
    QC Set Approval (rejected)
    QC Submit (soft)

TC-C13 - Làm mới trang vẫn giữ control
    Open Question Create (direct)
    Reload Page
    core.Wait Until Document Ready
    ${ok}=    Wait For QC Landed
    Should Be True    ${ok}

TC-C14 - Đa ngôn ngữ EN → VI (mở trực tiếp)
    Go To    ${QC_URL_VI}
    ${ok}=    Wait For QC Landed
    Should Be True    ${ok}
