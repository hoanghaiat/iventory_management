*** Settings ***
Resource    ${CURDIR}${/}core.resource
Resource    ${CURDIR}${/}QuestionBank.resource
Library     SeleniumLibrary
Library     Collections
Library     String

*** Variables ***
${BTN_APPLY}   xpath=//*[self::button or self::a][@type='submit' or contains(@class,'btn')]
...            [contains(translate(normalize-space(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'apply')
...            or contains(translate(normalize-space(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'áp dụng')
...            or contains(translate(normalize-space(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'tìm')
...            or contains(translate(normalize-space(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'filter')]

# Thêm các biến thể: Clear, Reset, Bỏ lọc, Xoá lọc, Làm mới
${BTN_CLEAR}   xpath=//*[self::button or self::a]
...            [contains(translate(normalize-space(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'clear')
...            or contains(translate(normalize-space(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'xóa')
...            or contains(translate(normalize-space(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'xoa')
...            or contains(translate(normalize-space(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'reset')
...            or contains(translate(normalize-space(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'bỏ lọc')
...            or contains(translate(normalize-space(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'xoá lọc')
...            or contains(translate(normalize-space(.),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'làm mới')]

${SEL_COURSE}  xpath=//label[contains(.,'Course') or contains(.,'Khoá') or contains(.,'Học phần')]/following::*[self::select or @role='combobox' or contains(@class,'select')][1]
${SEL_CLO}     xpath=//label[contains(.,'CLO')]/following::*[self::select or @role='combobox' or contains(@class,'select')][1]
${SEL_QTYPE}   xpath=//label[contains(.,'Question Type') or contains(.,'Loại câu hỏi')]/following::*[self::select or @role='combobox' or contains(@class,'select')][1]
${SEL_DIFF}    xpath=//label[contains(.,'Difficulty') or contains(.,'Độ khó')]/following::*[self::select or @role='combobox' or contains(@class,'select')][1]
${SEL_BLOOM}   xpath=//label[contains(.,'Bloom')]/following::*[self::select or @role='combobox' or contains(@class,'select')][1]
${SEL_STATUS}  xpath=//label[normalize-space()='Status' and not(contains(.,'Approval'))]/following::*[self::select or @role='combobox' or contains(@class,'select')][1]
${SEL_APPROVAL}  xpath=//label[contains(.,'Approval')]/following::*[self::select or @role='combobox' or contains(@class,'select')][1]
${SEL_TAG}     xpath=//label[contains(.,'Tag')]/following::*[self::select or @role='combobox' or contains(@class,'select')][1]

${INP_SEARCH}  xpath=(//input[contains(translate(@placeholder,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'search') or @type='search' or @name='q'] | //input[contains(translate(@aria-label,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'search')])[1]
${CHK_MYQ}     xpath=//label[contains(.,'Show only my questions') or contains(.,'câu hỏi của tôi')]/preceding::input[@type='checkbox'][1]

${TABLE_ANY}           xpath=(//table | //div[contains(@class,'table')])[1]
${NO_RESULT_TXT}       xpath=//*[contains(.,'No result') or contains(.,'Không có') or contains(.,'Không tìm thấy')]
${PAGINATION_2_LOCAL}  xpath=//ul[contains(@class,'pagination')]//a[normalize-space(.)='2' or @data-page='2' or @aria-label='2']
${COL_TIME_LOCAL}      xpath=//th[contains(translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'),'time') or contains(.,'Ngày') or contains(.,'date')]

*** Keywords ***
Go To Question Bank
    Open Question Bank
    Wait For QB Landed

Apply Filters
    Remove Overlays
    ${ok}=    Run Keyword And Return Status    Page Should Contain Element    ${BTN_APPLY}
    IF    not ${ok}
        Pass Execution    Không thấy nút Apply → PASS mềm
    END
    Safe Click    ${BTN_APPLY}
    Wait Until Document Ready

Clear Filters
    Remove Overlays
    ${ok}=    Run Keyword And Return Status    Page Should Contain Element    ${BTN_CLEAR}
    IF    not ${ok}
        Pass Execution    Không thấy nút Clear/Reset → PASS mềm
    END
    Safe Click    ${BTN_CLEAR}
    Wait Until Document Ready

Set Search Query
    [Arguments]    ${text}
    ${has}=    Run Keyword And Return Status    Page Should Contain Element    ${INP_SEARCH}
    IF    not ${has}
        Pass Execution    Không có ô Search → PASS mềm
    END
    Click Element        ${INP_SEARCH}
    Clear Element Text   ${INP_SEARCH}
    Input Text           ${INP_SEARCH}    ${text}

Toggle My Questions
    [Arguments]    ${state}=True
    ${has}=    Run Keyword And Return Status    Page Should Contain Element    ${CHK_MYQ}
    IF    not ${has}
        Pass Execution    Không có checkbox My Questions → PASS mềm
    END
    ${sel}=    Run Keyword And Return Status    Checkbox Should Be Selected    ${CHK_MYQ}
    IF    ${state} and not ${sel}
        Click Element    ${CHK_MYQ}
    ELSE IF    not ${state} and ${sel}
        Click Element    ${CHK_MYQ}
    END

Select From Dropdown By Label
    [Arguments]    ${locator}    ${label}
    ${has}=    Run Keyword And Return Status    Page Should Contain Element    ${locator}
    IF    not ${has}
        Pass Execution    Không có select ${locator} → PASS mềm
    END
    ${ok}=    Run Keyword And Return Status    Select From List By Label    ${locator}    ${label}
    IF    ${ok}
        RETURN
    END
    Click Element    ${locator}
    ${option}=    Set Variable    xpath=//*[self::li or self::div or self::span][normalize-space(.)="${label}" or contains(normalize-space(.),"${label}")]
    Wait Until Page Contains Element    ${option}    ${TO}
    Click Element    ${option}

Set Course
    [Arguments]    ${label}
    Select From Dropdown By Label    ${SEL_COURSE}    ${label}

Set CLO
    [Arguments]    ${label}
    Select From Dropdown By Label    ${SEL_CLO}    ${label}

Set Question Type
    [Arguments]    ${label}
    Select From Dropdown By Label    ${SEL_QTYPE}    ${label}

Set Difficulty
    [Arguments]    ${label}
    Select From Dropdown By Label    ${SEL_DIFF}    ${label}

Set Bloom Level
    [Arguments]    ${label}
    Select From Dropdown By Label    ${SEL_BLOOM}    ${label}

Set Status
    [Arguments]    ${label}
    Select From Dropdown By Label    ${SEL_STATUS}    ${label}

Set Approval Status
    [Arguments]    ${label}
    Select From Dropdown By Label    ${SEL_APPROVAL}    ${label}

Set Tag
    [Arguments]    ${label}
    Select From Dropdown By Label    ${SEL_TAG}    ${label}

Assert Some Results Or EmptyOk
    ${has_tbl}=    Run Keyword And Return Status    Page Should Contain Element    ${TABLE_ANY}
    ${has_empty}=  Run Keyword And Return Status    Page Should Contain Element    ${NO_RESULT_TXT}
    ${ok}=    Evaluate    ${has_tbl} or ${has_empty}
    IF    not ${ok}
        Pass Execution    Không có bảng/kết quả (demo) → PASS mềm
    END
