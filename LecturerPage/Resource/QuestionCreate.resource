*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/core.resource

*** Variables ***
${QC_URL_EN}      ${BASE_URL}/en/questionbank/questions/create/
${QC_URL_VI}      ${BASE_URL}/vi/questionbank/questions/create/

# Header / marker
${QC_HEADER}      xpath=//*[self::h1 or self::h2 or self::div or self::span][contains(translate(normalize-space(.),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ'),'CREATE NEW QUESTION') or contains(normalize-space(.),'Tạo câu hỏi')]

# Controls (ưu tiên <select>, fallback combobox tuỳ biến)
${QC_SEL_COURSE}      xpath=(//label[contains(.,'Course') or contains(.,'Môn')]//following::*[self::select or @role='combobox'])[1]
${QC_SEL_TYPE}        xpath=(//label[contains(.,'Type') or contains(.,'Loại')]//following::*[self::select or @role='combobox'])[1]
${QC_SEL_DIFFICULTY}  xpath=(//label[contains(.,'Difficulty') or contains(.,'Độ khó')]//following::*[self::select or @role='combobox'])[1]
${QC_SEL_BLOOM}       xpath=(//label[contains(.,'Bloom') or contains(.,'Mức Bloom')]//following::*[self::select or @role='combobox'])[1]
${QC_SEL_STATUS}      xpath=(//label[contains(.,'Status') and not(contains(.,'Approval'))]//following::*[self::select or @role='combobox'])[1]
${QC_SEL_APPROVAL}    xpath=(//label[contains(.,'Approval') or contains(.,'Duyệt')]//following::*[self::select or @role='combobox'])[1]

# Content (nhiều biến thể: textarea, contenteditable, TinyMCE/Quill)
${QC_TA_CONTENT}      xpath=(//label[contains(.,'Content') or contains(.,'Nội dung')]//following::textarea)[1]
${QC_RICH_EDITABLE}   xpath=//*[(@contenteditable='true') or contains(@class,'ql-editor')]
${QC_RTE_IFRAME}      xpath=//iframe[contains(@id,'mce') or contains(@title,'Rich Text')]

${QC_BTN_SUBMIT}      xpath=//button[@type='submit' or contains(.,'Create Question') or contains(.,'Tạo câu hỏi')]

# Nút từ trang Question Bank để mở form tạo
${QB_BTN_ADD}         xpath=//*[self::a or self::button][contains(.,'Add Question') or contains(.,'Tạo câu hỏi')]

*** Keywords ***
Go To Question Bank
    ${en}=    Set Variable    ${BASE_URL}/en/questionbank/
    Go To    ${en}
    Wait Until Document Ready
    ${ok}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${QB_BTN_ADD}    3s
    IF    not ${ok}
        ${vi}=    Set Variable    ${BASE_URL}/vi/questionbank/
        Go To    ${vi}
        Wait Until Document Ready
    END

Open Question Create
    ${has_qb}=    Run Keyword And Return Status    Go To Question Bank
    IF    ${has_qb}
        Run Keyword And Ignore Error    Scroll And JS Click    ${QB_BTN_ADD}
    END
    ${ok}=    Run Keyword And Return Status    Wait For QC Landed
    IF    not ${ok}
        Go To    ${QC_URL_EN}
        ${ok}=    Run Keyword And Return Status    Wait For QC Landed
        IF    not ${ok}
            Go To    ${QC_URL_VI}
            Wait For QC Landed
        END
    END

Wait For QC Landed
    Wait Until Keyword Succeeds    10x    0.7s    QC _landed_once

QC _landed_once
    Wait Until Document Ready
    ${u}=    Run Keyword And Return Status    Location Should Contain    /questions/create
    ${s}=    Run Keyword And Return Status    Page Should Contain Element    ${QC_BTN_SUBMIT}
    ${t}=    Run Keyword And Return Status    Page Should Contain Element    ${QC_SEL_TYPE}
    ${c}=    Run Keyword And Return Status    Page Should Contain Element    ${QC_SEL_COURSE}
    RETURN    ${u} or ${s} or ${t} or ${c}

QC Marker Should Exist
    ${ok}=    Wait For QC Landed
    Should Be True    ${ok}

# ---------- helpers ----------
Scroll And JS Click
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}    10s
    Scroll Element Into View            ${locator}
    Run Keyword And Ignore Error        Click Element    ${locator}
    Execute Javascript                  arguments[0].click();    ${locator}

Select From Any Dropdown By Label
    [Arguments]    ${locator}    ${label}    ${timeout}=15s
    # 1) nếu là <select>
    ${st}    ${msg}=    Run Keyword And Ignore Error    Select From List By Label    ${locator}    ${label}
    IF    '${st}' == 'PASS'
        RETURN
    END
    # 2) mở combobox tuỳ biến và chọn option
    Run Keyword And Ignore Error    Scroll Element Into View    ${locator}
    Run Keyword And Ignore Error    Click Element               ${locator}
    Run Keyword And Ignore Error    Execute Javascript          arguments[0].click();    ${locator}
    ${opt}=    Set Variable    xpath=((//*[@role='listbox' or contains(@class,'menu') or contains(@class,'dropdown')]|//div[contains(@class,'dropdown-menu')])[last()]//*[self::div or self::span or self::li or self::a or self::button][normalize-space()='${label}' or contains(normalize-space(.),'${label}')])[1] | //option[normalize-space()='${label}' or contains(normalize-space(.),'${label}')]
    Wait Until Page Contains Element    ${opt}    ${timeout}
    Scroll And JS Click                 ${opt}

# ---------- setters ----------
QC Set Course
    [Arguments]    ${course_label}
    Select From Any Dropdown By Label    ${QC_SEL_COURSE}    ${course_label}

QC Set Type
    [Arguments]    ${type_label}
    Select From Any Dropdown By Label    ${QC_SEL_TYPE}    ${type_label}

QC Set Difficulty
    [Arguments]    ${diff_label}
    Select From Any Dropdown By Label    ${QC_SEL_DIFFICULTY}    ${diff_label}

QC Set Bloom
    [Arguments]    ${bloom_label}
    Select From Any Dropdown By Label    ${QC_SEL_BLOOM}    ${bloom_label}

QC Set Status (any inactive)
    ${labels}=    Create List    Inactive    Disabled    Deactivated    Không hoạt động    Ngừng hoạt động
    FOR    ${lb}    IN    @{labels}
        ${res}    ${msg}=    Run Keyword And Ignore Error    Select From Any Dropdown By Label    ${QC_SEL_STATUS}    ${lb}    15s
        IF    '${res}' == 'PASS'
            RETURN
        END
    END
    Fail    Không chọn được trạng thái Inactive/Disabled (EN/VI)

QC Set Approval (rejected)
    ${labels}=    Create List    Rejected    Bị từ chối    Từ chối    Không duyệt
    FOR    ${lb}    IN    @{labels}
        ${res}    ${msg}=    Run Keyword And Ignore Error    Select From Any Dropdown By Label    ${QC_SEL_APPROVAL}    ${lb}    15s
        IF    '${res}' == 'PASS'
            RETURN
        END
    END
    Fail    Không chọn được Approval = Rejected (EN/VI)

QC Set Content
    [Arguments]    ${text}
    # 1) textarea
    ${has_ta}=    Run Keyword And Return Status    Page Should Contain Element    ${QC_TA_CONTENT}
    IF    ${has_ta}
        Run Keyword And Ignore Error    Scroll Element Into View    ${QC_TA_CONTENT}
        Run Keyword And Ignore Error    Clear Element Text          ${QC_TA_CONTENT}
        Run Keyword And Ignore Error    Input Text                  ${QC_TA_CONTENT}    ${text}
        ${ok}=    Run Keyword And Return Status    Element Text Should Be    ${QC_TA_CONTENT}    ${text}
        IF    ${ok}
            RETURN
        END
    END
    # 2) contenteditable / Quill
    ${has_ce}=    Run Keyword And Return Status    Page Should Contain Element    ${QC_RICH_EDITABLE}
    IF    ${has_ce}
        Scroll And JS Click      ${QC_RICH_EDITABLE}
        Run Keyword And Ignore Error    Press Keys    ${QC_RICH_EDITABLE}    CTRL+A+BACKSPACE
        Input Text               ${QC_RICH_EDITABLE}    ${text}
        RETURN
    END
    # 3) TinyMCE (iframe)
    ${has_ifr}=    Run Keyword And Return Status    Page Should Contain Element    ${QC_RTE_IFRAME}
    IF    ${has_ifr}
        Select Frame    ${QC_RTE_IFRAME}
        Click Element   css=body
        Run Keyword And Ignore Error    Press Keys    css=body    CTRL+A+BACKSPACE
        Input Text      css=body    ${text}
        Unselect Frame
        RETURN
    END
    # 4) cuối cùng: JS bắn thẳng
    Execute Javascript    (function(t){var el=document.querySelector('textarea,[contenteditable=\"true\"],.ql-editor'); if(!el)return; if(el.tagName==='TEXTAREA'){el.value=t; el.dispatchEvent(new Event('input',{bubbles:true}))} else {el.innerHTML=t; el.dispatchEvent(new Event('input',{bubbles:true}))}})(arguments[0]);    ${text}

QC Submit (soft)
    Run Keyword And Ignore Error    Scroll And JS Click    ${QC_BTN_SUBMIT}
    Wait Until Document Ready

QC Fill Minimal
    [Arguments]    ${course}    ${content}    ${qtype}    ${difficulty}    ${bloom}
    Run Keyword And Ignore Error    QC Set Course       ${course}
    Run Keyword And Ignore Error    QC Set Content      ${content}
    Run Keyword And Ignore Error    QC Set Type         ${qtype}
    Run Keyword And Ignore Error    QC Set Difficulty   ${difficulty}
    Run Keyword And Ignore Error    QC Set Bloom        ${bloom}
