*** Settings ***
Resource        ${CURDIR}/../Resource/core.resource
Resource        ${CURDIR}/../Resource/QuestionCreate.resource
Suite Setup     Login As Lecturer
Suite Teardown  Close All Browsers
Test Teardown   Capture Page Screenshot
Test Timeout    3 minutes
Documentation   Test trang "Create New Question" cho Lecturer.

*** Variables ***
${OWNER}    SIU TOMY
${MODULE}   Interface

*** Test Cases ***
TC-C01 - Mở trang Tạo câu hỏi
    [Documentation]    TC_QC_01
    [Tags]    ${MODULE}    ${OWNER}    SIU TOMY
    Open Question Create (direct)
    Wait For QC Landed

TC-C02 - Kiểm tra đủ control bắt buộc
    [Documentation]    TC_QC_02
    [Tags]    ${MODULE}    ${OWNER}    SIU TOMY
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
    [Documentation]    TC_QC_03
    [Tags]    ${MODULE}    ${OWNER}    SIU TOMY
    Open Question Create (direct)
    Wait For QC Landed
    QC Set Course First
    QC Set Type         Multiple Choice
    QC Set Difficulty   Easy
    QC Set Bloom        Remember
    QC Set Content      Quick MCQ demo
    QC Submit (soft)

TC-C04 - Loại Essay / Medium / Analyze
    [Documentation]    TC_QC_04
    [Tags]    ${MODULE}    ${OWNER}    SIU TOMY
    Open Question Create (direct)
    Wait For QC Landed
    QC Set Course First
    QC Set Type         Essay
    QC Set Difficulty   Medium
    QC Set Bloom        Analyze
    QC Set Content      Essay demo
    QC Submit (soft)

TC-C05 - Practical / Hard / Apply
    [Documentation]    TC_QC_05
    [Tags]    ${MODULE}    ${OWNER}    SIU TOMY
    Open Question Create (direct)
    Wait For QC Landed
    QC Set Course First
    QC Set Type         Practical
    QC Set Difficulty   Hard
    QC Set Bloom        Apply
    QC Set Content      Practical demo
    QC Submit (soft)

TC-C06 - True/False
    [Documentation]    TC_QC_06
    [Tags]    ${MODULE}    ${OWNER}    SIU TOMY
    Open Question Create (direct)
    Wait For QC Landed
    QC Set Course First
    QC Set Type         True/False
    QC Set Difficulty   Easy
    QC Set Bloom        Understand
    QC Set Content      T/F demo
    QC Submit (soft)

TC-C07 - Short Answer
    [Documentation]    TC_QC_07
    [Tags]    ${MODULE}    ${OWNER}    SIU TOMY
    Open Question Create (direct)
    Wait For QC Landed
    QC Set Course First
    QC Set Type         Short Answer
    QC Set Difficulty   Medium
    QC Set Bloom        Remember
    QC Set Content      Short answer
    QC Submit (soft)

TC-C08 - Matching
    [Documentation]    TC_QC_08
    [Tags]    ${MODULE}    ${OWNER}    SIU TOMY
    Open Question Create (direct)
    Wait For QC Landed
    QC Set Course First
    QC Set Type         Matching
    QC Set Difficulty   Medium
    QC Set Bloom        Analyze
    QC Set Content      Matching demo
    QC Submit (soft)

TC-C09 - Nội dung dài 1.000 ký tự
    [Documentation]    TC_QC_09
    [Tags]    ${MODULE}    ${OWNER}    SIU TOMY
    Open Question Create (direct)
    Wait For QC Landed
    QC Set Course First
    QC Set Type         Multiple Choice
    QC Set Difficulty   Medium
    QC Set Bloom        Apply
    ${long}=    Evaluate    'X'*1000
    QC Set Content      ${long}
    QC Submit (soft)

TC-C10 - Ký tự đặc biệt trong Content
    [Documentation]    TC_QC_10
    [Tags]    ${MODULE}    ${OWNER}    SIU TOMY
    Open Question Create (direct)
    Wait For QC Landed
    QC Set Course First
    QC Set Type         Essay
    QC Set Difficulty   Medium
    QC Set Bloom        Analyze
    QC Set Content      !@#$%^&*()_+[]{}|;:",.<>?
    QC Submit (soft)

TC-C11 - Đổi Status = Inactive
    [Documentation]    TC_QC_11
    [Tags]    ${MODULE}    ${OWNER}    SIU TOMY
    Open Question Create (direct)
    Wait For QC Landed
    QC Set Status (any inactive)
    QC Submit (soft)

TC-C12 - Approval = Rejected
    [Documentation]    TC_QC_12
    [Tags]    ${MODULE}    ${OWNER}    SIU TOMY
    Open Question Create (direct)
    Wait For QC Landed
    QC Set Approval (rejected)
    QC Submit (soft)

TC-C13 - Làm mới trang vẫn giữ control
    [Documentation]    TC_QC_13
    [Tags]    ${MODULE}    ${OWNER}    SIU TOMY
    Open Question Create (direct)
    Reload Page
    core.Wait Until Document Ready
    Wait For QC Landed

TC-C14 - Đa ngôn ngữ EN → VI (mở trực tiếp)
    [Documentation]    TC_QC_14
    [Tags]    ${MODULE}    ${OWNER}    SIU TOMY
    Go To    ${QC_URL_VI}
    Wait For QC Landed
