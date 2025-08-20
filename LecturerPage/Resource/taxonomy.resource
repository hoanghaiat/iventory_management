*** Settings ***
Resource        core.resource
Library         SeleniumLibrary
Library         String

*** Variables ***
${URL_TX}                ${BASE_URL}/en/questionbank/tags/
${HDR_TX}                xpath=//h1|//h2|//div[contains(@class,'page-title')][contains(.,'Thẻ phân loại') or contains(.,'Taxonomy')]
${BTN_ADD}               xpath=//*[self::a or self::button][contains(.,'Thêm') or contains(.,'Add')][contains(.,'thẻ') or contains(.,'tag') or contains(.,'Tag') or contains(.,'Thẻ') or not(normalize-space())]
${INPUT_NAME}            xpath=//label[contains(.,'Tên') or contains(.,'Name')]/following::*[self::input or self::textarea][1]
${SEL_STATUS}            xpath=(//label[contains(.,'Trạng thái') or contains(.,'Status')]/following::*[self::select or @role='combobox'])[1]
${BTN_SAVE}              xpath=//*[self::button or self::a][contains(.,'Lưu') or contains(.,'Save') or contains(.,'Tạo') or contains(.,'Create')][1]
${TABLE_ROWS}            xpath=//table//tr[.//td]
${SEARCH_BOX}            xpath=//*[@type='search' or contains(@placeholder,'Tìm') or contains(@placeholder,'Search')]
${LOC_MENU_TX}           xpath=//aside//*[self::a or self::div or self::button or self::span][contains(normalize-space(.),'Thẻ phân loại') or contains(normalize-space(.),'Taxonomy')]

# thao tác hàng trong bảng theo tên tag
${ROW_BY_NAME_TMPL}      xpath=//table//tr[.//td[normalize-space()="$"]]
${A_EDIT_IN_ROW}         xpath=.//*[self::a or self::button][contains(.,'Sửa') or contains(.,'Edit')]
${A_DELETE_IN_ROW}       xpath=.//*[self::a or self::button][contains(.,'Xoá') or contains(.,'Delete')]

*** Keywords ***
Open Taxonomy Page (menu first)
    ${ok}=    Run Keyword And Return Status    Page Should Contain Element    ${LOC_MENU_TX}    3s
    IF    ${ok}
        Scroll Element Into View    ${LOC_MENU_TX}
        Click Element    ${LOC_MENU_TX}
        Wait Until Document Ready
    ELSE
        Go To    ${URL_TX}
        Wait Until Document Ready
    END
    Taxonomy Page Should Load

Open Taxonomy Page (direct)
    Go To    ${URL_TX}
    Wait Until Document Ready
    Taxonomy Page Should Load

Taxonomy Page Should Load
    Page Should Not Contain    TemplateDoesNotExist
    Page Should Contain Element    ${HDR_TX}
    Page Should Contain Element    ${BTN_ADD}
    Page Should Contain Element    ${TABLE_ROWS}

Create Tag (name, status)
    [Arguments]    ${name}    ${status}=Active
    Click Element                 ${BTN_ADD}
    Wait Until Page Contains Element    ${INPUT_NAME}    5s
    Clear Element Text            ${INPUT_NAME}
    Input Text                    ${INPUT_NAME}    ${name}
    Run Keyword    Select From Any Dropdown By Label    ${SEL_STATUS}    ${status}
    Click Element                 ${BTN_SAVE}
    Wait Until Document Ready
    Search Tag By Name           ${name}
    Row By Name Should Exist     ${name}

Search Tag By Name
    [Arguments]    ${name}
    ${has}=    Run Keyword And Return Status    Page Should Contain Element    ${SEARCH_BOX}    2s
    IF    ${has}
        Clear Element Text    ${SEARCH_BOX}
        Input Text            ${SEARCH_BOX}    ${name}
        Press Keys            ${SEARCH_BOX}    ENTER
        Sleep    0.7s
    ELSE
        # fallback: dùng Ctrl+F của trình duyệt để cuộn tới
        Press Keys    NONE    CTRL+F
        Press Keys    NONE    ${name}
        Sleep    0.3s
    END

Row By Name Should Exist
    [Arguments]    ${name}
    ${row}=    Set Variable    ${ROW_BY_NAME_TMPL.replace('${NAME}', ${name})}
    Page Should Contain Element    ${row}

Edit Tag Status To
    [Arguments]    ${name}    ${new_status}
    ${row}=    Set Variable    ${ROW_BY_NAME_TMPL.replace('${NAME}', ${name})}
    ${edit}=   Set Variable    xpath=(${row})/${A_EDIT_IN_ROW}
    Click Element    ${edit}
    Wait Until Page Contains Element    ${SEL_STATUS}    5s
    Select From Any Dropdown By Label    ${SEL_STATUS}    ${new_status}
    Click Element    ${BTN_SAVE}
    Wait Until Document Ready
    Search Tag By Name           ${name}
    Row By Name Should Exist     ${name}

Delete Tag (soft)
    [Arguments]    ${name}
    ${row}=    Set Variable    ${ROW_BY_NAME_TMPL.replace('${NAME}', ${name})}
    ${del}=    Set Variable    xpath=(${row})/${A_DELETE_IN_ROW}
    ${can}=    Run Keyword And Return Status    Page Should Contain Element    ${del}    2s
    IF    ${can}
        Click Element    ${del}
        Run Keyword And Ignore Error    Click Button    OK
        Wait Until Document Ready
    END

Select From Any Dropdown By Label
    [Arguments]    ${locator}    ${label}
    ${st}    ${msg}=    Run Keyword And Ignore Error    Select From List By Label    ${locator}    ${label}
    IF    '${st}' == 'PASS'    RETURN
    Run Keyword And Ignore Error    Click Element    ${locator}
    ${opt}=    Set Variable    xpath=((//*[@role='listbox' or contains(@class,'menu') or contains(@class,'dropdown')]|//div[contains(@class,'dropdown-menu')])[last()]//*[self::div or self::span or self::li or self::a or self::button][normalize-space()='${label}' or contains(normalize-space(.),'${label}')])[1] | //option[normalize-space()='${label}' or contains(normalize-space(.),'${label}')]
    Wait Until Page Contains Element    ${opt}    5s
    Click Element    ${opt}
