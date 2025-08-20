*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource   ${CURDIR}/core.resource

*** Variables ***
${QC_URL_EN}      ${BASE_URL}/en/questionbank/questions/create/
${QC_URL_VI}      ${BASE_URL}/vi/questionbank/questions/create/
${QB_URL_EN}      ${BASE_URL}/en/questionbank/
${QB_URL_VI}      ${BASE_URL}/vi/questionbank/
${QC_HEADER}      xpath=//*[self::h1 or self::h2 or self::div or self::span][contains(translate(normalize-space(.),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ'),'CREATE NEW QUESTION') or contains(normalize-space(.),'Tạo câu hỏi')]
${QC_SEL_COURSE}      xpath=(//label[contains(.,'Course') or contains(.,'Môn')]//following::*[self::select or @role='combobox'])[1]
${QC_SEL_TYPE}        xpath=(//label[contains(.,'Type') or contains(.,'Loại')]//following::*[self::select or @role='combobox'])[1]
${QC_SEL_DIFFICULTY}  xpath=(//label[contains(.,'Difficulty') or contains(.,'Độ khó')]//following::*[self::select or @role='combobox'])[1]
${QC_SEL_BLOOM}       xpath=(//label[contains(.,'Bloom') or contains(.,'Mức Bloom')]//following::*[self::select or @role='combobox'])[1]
${QC_SEL_STATUS}      xpath=(//label[contains(.,'Status') and not(contains(.,'Approval'))]//following::*[self::select or @role='combobox'])[1]
${QC_SEL_APPROVAL}    xpath=(//label[contains(.,'Approval') or contains(.,'Duyệt')]//following::*[self::select or @role='combobox'])[1]
${QC_TA_CONTENT}      xpath=(//label[contains(.,'Content') or contains(.,'Nội dung')]//following::textarea)[1]
${QC_RICH_EDITABLE}   xpath=//*[(@contenteditable='true') or contains(@class,'ql-editor')]
${QC_RTE_IFRAME}      xpath=//iframe[contains(@id,'mce') or contains(@title,'Rich Text')]
${QC_BTN_SUBMIT}      xpath=//button[@type='submit' or contains(.,'Create Question') or contains(.,'Tạo câu hỏi')]
${QB_BTN_ADD}         xpath=//*[self::a or self::button][contains(.,'Add Question') or contains(.,'Tạo câu hỏi')]

*** Keywords ***
QC Marker Should Exist
    ${ok}=    Wait For QC Landed
    Should Be True    ${ok}

QC Wait Until Document Ready
    core.Wait Until Document Ready

As Pure XPath
    [Arguments]    ${locator}
    ${xp}=    Set Variable    ${locator}
    ${xp}=    Replace String Using Regexp    ${xp}    ^xpath=    ${EMPTY}
    RETURN    ${xp}

Scroll And JS Click
    [Arguments]    ${locator}
    ${clicked}=    Run Keyword And Return Status    Click Element    ${locator}
    IF    ${clicked}    RETURN    END
    ${xp}=    As Pure XPath    ${locator}
    Execute Javascript    var xp=arguments[0];var n=document.evaluate(xp,document,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue;if(n){try{n.scrollIntoView({block:'center'});}catch(e){} n.click(); return true;} return false;    ${xp}

Normalize Base Url
    ${b}=    Convert To String    ${BASE_URL}
    ${b}=    Replace String Using Regexp    ${b}    /+$    ${EMPTY}
    Set Suite Variable    ${BASE}    ${b}

Ensure Logged In
    ${need}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//form//input[@id="id_username"]
    IF    ${need}    Login As Lecturer    

Go To Question Bank
    Normalize Base Url
    Go To    ${BASE}/en/questionbank/
    QC Wait Until Document Ready
    ${ok}=    Run Keyword And Return Status    Page Should Contain Element    ${QB_BTN_ADD}    3s
    IF    not ${ok}
        Go To    ${BASE}/vi/questionbank/
        QC Wait Until Document Ready
    END

Open Question Create
    ${has_qb}=    Run Keyword And Return Status    Go To Question Bank
    IF    ${has_qb}
        Run Keyword And Ignore Error    Scroll And JS Click    ${QB_BTN_ADD}
    END
    ${ok}=    Run Keyword And Return Status    Wait For QC Landed
    IF    not ${ok}
        Normalize Base Url
        ${ts}=    Evaluate    __import__('time').time().__int__()
        Go To    ${BASE}/en/questionbank/questions/create/?_=${ts}
        ${ok2}=    Run Keyword And Return Status    Wait For QC Landed
        IF    not ${ok2}
            Go To    ${BASE}/vi/questionbank/questions/create/?_=${ts}
            Wait For QC Landed
        END
    END

Open Question Create (direct)
    Normalize Base Url
    ${ts}=    Evaluate    __import__('time').time().__int__()
    Go To    ${BASE}/en/questionbank/questions/create/?_=${ts}
    QC Wait Until Document Ready
    Ensure Logged In
    ${ok}=    Run Keyword And Return Status    Wait For QC Landed
    IF    not ${ok}
        Reload Page
        QC Wait Until Document Ready
        ${ok2}=    Run Keyword And Return Status    Wait For QC Landed
        IF    not ${ok2}
            Go To    ${BASE}/vi/questionbank/questions/create/?_=${ts}
            QC Wait Until Document Ready
            Ensure Logged In
            Wait For QC Landed
        END
    END

Wait For QC Landed
    Wait Until Keyword Succeeds    8x    500ms    QC _landed_once
    RETURN    True

QC _landed_once
    QC Wait Until Document Ready
    ${is404a}=    Run Keyword And Return Status    Page Should Contain    Page not found
    ${is404b}=    Run Keyword And Return Status    Page Should Contain    404
    IF    ${is404a} or ${is404b}
        ${u}=    Get Location
        Fail    404: ${u}
    END
    ${on_path}=      Run Keyword And Return Status    Location Should Contain    /questionbank/questions/create
    ${has_submit}=   Run Keyword And Return Status    Page Should Contain Element    ${QC_BTN_SUBMIT}
    ${has_type}=     Run Keyword And Return Status    Page Should Contain Element    ${QC_SEL_TYPE}
    ${has_course}=   Run Keyword And Return Status    Page Should Contain Element    ${QC_SEL_COURSE}
    Run Keyword If    not ${on_path} and not ${has_submit} and not ${has_type} and not ${has_course}    Fail    Not Create page

Select From Any Dropdown By Label
    [Arguments]    ${locator}    ${label}    ${timeout}=12s
    ${st}    ${_}=    Run Keyword And Ignore Error    Select From List By Label    ${locator}    ${label}
    IF    '${st}'=='PASS'    RETURN
    Click Element    ${locator}
    ${opt}=    Set Variable    xpath=((//*[@role='listbox' or contains(@class,'menu') or contains(@class,'dropdown')]|//div[contains(@class,'dropdown-menu')])[last()]//*[self::div or self::span or self::li or self::a or self::button][normalize-space()='${label}' or contains(normalize-space(.),'${label}')])[1] | //option[normalize-space()='${label}' or contains(normalize-space(.),'${label}')]
    Wait Until Page Contains Element    ${opt}    ${timeout}
    Scroll And JS Click    ${opt}

Select First Option
    [Arguments]    ${locator}
    ${ok}=    Run Keyword And Return Status    Select From List By Index    ${locator}    1
    IF    ${ok}    RETURN    END
    Click Element    ${locator}
    ${first}=    Set Variable    xpath=(//*[@role='listbox' or contains(@class,'menu') or contains(@class,'dropdown') or contains(@class,'dropdown-menu')])[last()]//*[self::div or self::span or self::li or self::a or self::button][normalize-space()!='' and not(contains(normalize-space(),'--------'))][1]
    Scroll And JS Click    ${first}

QC Set Course
    [Arguments]    ${course_label}
    Select From Any Dropdown By Label    ${QC_SEL_COURSE}    ${course_label}

QC Set Course First
    Select First Option    ${QC_SEL_COURSE}

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
        ${res}    ${_}=    Run Keyword And Ignore Error    Select From Any Dropdown By Label    ${QC_SEL_STATUS}    ${lb}    10s
        IF    '${res}'=='PASS'    RETURN    END
    END
    Fail    Không chọn được Inactive/Disabled

QC Set Approval (rejected)
    ${labels}=    Create List    Rejected    Bị từ chối    Từ chối    Không duyệt
    FOR    ${lb}    IN    @{labels}
        ${res}    ${_}=    Run Keyword And Ignore Error    Select From Any Dropdown By Label    ${QC_SEL_APPROVAL}    ${lb}    10s
        IF    '${res}'=='PASS'    RETURN    END
    END
    Fail    Không chọn được Rejected

QC Set Content
    [Arguments]    ${text}
    ${has_ta}=    Run Keyword And Return Status    Page Should Contain Element    ${QC_TA_CONTENT}
    IF    ${has_ta}
        Clear Element Text    ${QC_TA_CONTENT}
        Input Text            ${QC_TA_CONTENT}    ${text}
        RETURN
    END
    ${has_ce}=    Run Keyword And Return Status    Page Should Contain Element    ${QC_RICH_EDITABLE}
    IF    ${has_ce}
        Scroll And JS Click    ${QC_RICH_EDITABLE}
        Press Keys            ${QC_RICH_EDITABLE}    CTRL+A+BACKSPACE
        Input Text            ${QC_RICH_EDITABLE}    ${text}
        RETURN
    END
    ${has_ifr}=    Run Keyword And Return Status    Page Should Contain Element    ${QC_RTE_IFRAME}
    IF    ${has_ifr}
        Select Frame    ${QC_RTE_IFRAME}
        Press Keys      css=body    CTRL+A+BACKSPACE
        Input Text      css=body    ${text}
        Unselect Frame
        RETURN
    END
    ${xp}=    Set Variable    textarea,[contenteditable="true"],.ql-editor
    Execute Javascript    var sel=arguments[0];var el=document.querySelector(sel);if(el){if(el.tagName==='TEXTAREA'){el.value=arguments[1]}else{el.innerHTML=arguments[1]};el.dispatchEvent(new Event('input',{bubbles:true}))}    ${xp}    ${text}

QC Submit (soft)
    Scroll And JS Click    ${QC_BTN_SUBMIT}
    QC Wait Until Document Ready
