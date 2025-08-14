*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}     https://demo-clo.minds.vn
${BROWSER}      chrome
${USERNAME}     lecturer1
${PASSWORD}     demolecturer

# ====== Locators ======
${MENU_QB}                 xpath=//a[contains(@href,'/questionbank/questions/')]
${COURSE}                  xpath=(//div[contains(@class,'filter') or contains(.,'Filter Options')]//select)[1]
${CLO}                     xpath=(//div[contains(@class,'filter') or contains(.,'Filter Options')]//select)[2]
${QUESTION_TYPE}           xpath=(//div[contains(@class,'filter') or contains(.,'Filter Options')]//select)[3]
${DIFFICULTY}              xpath=(//div[contains(@class,'filter') or contains(.,'Filter Options')]//select)[4]
${BLOOM}                   xpath=(//div[contains(@class,'filter') or contains(.,'Filter Options')]//select)[5]
${STATUS}                  xpath=(//div[contains(@class,'filter') or contains(.,'Filter Options')]//select)[6]
${APPROVAL_STATUS}         xpath=(//div[contains(@class,'filter') or contains(.,'Filter Options')]//select)[7]
${TAG}                     xpath=(//div[contains(@class,'filter') or contains(.,'Filter Options')]//select)[8]
${SEARCH_INPUT}            xpath=//input[contains(@placeholder,'Search') or @name='search' or contains(@aria-label,'Search')]
${MY_QUESTIONS_CHECK}      xpath=//input[@type='checkbox' and (../*[contains(.,'Show only my questions')] or following::*[contains(.,'Show only my questions')][1])]
${BTN_APPLY}               xpath=//button[normalize-space()='Apply Filters']
${BTN_CLEAR}               xpath=//button[normalize-space()='Clear Filters']
${ROWS}                    xpath=//div[@id='questions' or .//h3[contains(.,'Questions')]]//table//tbody/tr | //table//tbody/tr
${NO_DATA}                 xpath=//*[contains(.,'No data found') or contains(.,'Không có dữ liệu')]

*** Keywords ***
Open Browser And Login
    Open Browser    ${BASE_URL}/en/accounts/login/?next=/en/    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@id='id_username']    20s
    Input Text    xpath=//input[@id='id_username']    ${USERNAME}
    Input Text    xpath=//input[@id='id_password']    ${PASSWORD}
    Click Button   xpath=//button[normalize-space()='Đăng nhập']
    Wait Until Element Is Visible    ${MENU_QB}    30s

Go To Question Bank
    Click Element    ${MENU_QB}
    Wait Until Element Is Visible    ${BTN_APPLY}    20s
    Run Keyword And Ignore Error     Close Debug Overlay

# ===== Helpers: chống overlay / debug toolbar =====
Close Debug Overlay
    ${overlay}=    Set Variable    css=.StaticFilesPanel, #djDebug, .djDebug
    ${exists}=     Run Keyword And Return Status    Execute Javascript    return document.querySelector(arguments[0])!==null;    ${overlay}
    IF    ${exists}
        Execute Javascript    document.querySelectorAll(arguments[0]).forEach(e=>e.style.display='none');    ${overlay}
    END

# ===== Chọn option thông minh: bỏ dấu, không phân biệt hoa-thường, cho phép contains =====
Normalize Text
    [Arguments]    ${text}
    ${norm}=    Evaluate    import unicodedata; ''.join(c for c in unicodedata.normalize('NFKD', """${text}""") if not unicodedata.combining(c)).lower().strip()
    [Return]    ${norm}

Select Option Smart
    [Arguments]    ${select_locator}    ${desired_label}
    Wait Until Element Is Visible    ${select_locator}    10s
    ${items}=    Get List Items      ${select_locator}
    Log    Options in ${select_locator}: ${items}

    ${norm_desired}=    Normalize Text    ${desired_label}
    ${selected}=        Set Variable    ${False}

    FOR    ${index}    ${label}    IN ENUMERATE    @{items}
        ${norm_label}=       Normalize Text    ${label}
        ${match_exact}=      Run Keyword And Return Status    Should Be Equal    ${norm_label}    ${norm_desired}
        ${match_contains}=   Run Keyword And Return Status    Should Contain     ${norm_label}    ${norm_desired}
        IF    ${match_exact} or ${match_contains}
            Select From List By Index    ${select_locator}    ${index}
            ${selected}=    Set Variable    ${True}
            Exit For Loop
        END
    END

    Run Keyword If    not ${selected}    Fail    Option '${desired_label}' not found. Available: ${items}



    Run Keyword If    not ${selected}    Fail    Option '${desired_label}' not found. Available: ${items}

# ====== Actions on filters (dùng chọn thông minh) ======
Set Course
    [Arguments]    ${label}
    Select Option Smart    ${COURSE}    ${label}

Set CLO
    [Arguments]    ${label}
    Select Option Smart    ${CLO}    ${label}

Set Question Type
    [Arguments]    ${label}
    Select Option Smart    ${QUESTION_TYPE}    ${label}

Set Difficulty
    [Arguments]    ${label}
    Select Option Smart    ${DIFFICULTY}    ${label}

Set Bloom Level
    [Arguments]    ${label}
    Select Option Smart    ${BLOOM}    ${label}

Set Status
    [Arguments]    ${label}
    Select Option Smart    ${STATUS}    ${label}

Set Approval Status
    [Arguments]    ${label}
    Select Option Smart    ${APPROVAL_STATUS}    ${label}

Set Tag
    [Arguments]    ${label}
    Select Option Smart    ${TAG}    ${label}

Set Search Query
    [Arguments]    ${text}
    Clear Element Text    ${SEARCH_INPUT}
    Input Text            ${SEARCH_INPUT}    ${text}

Toggle My Questions
    [Arguments]    ${should_check}=True
    ${is_checked}=    Run Keyword And Return Status    Checkbox Should Be Selected    ${MY_QUESTIONS_CHECK}
    Run Keyword If    ${should_check} and not ${is_checked}    Click Element    ${MY_QUESTIONS_CHECK}
    ...    ELSE IF    not ${should_check} and ${is_checked}    Click Element    ${MY_QUESTIONS_CHECK}

# ====== Apply/Clear với cơ chế chống overlay + JS fallback ======
Apply Filters
    Wait Until Element Is Visible    ${BTN_APPLY}    15s
    Scroll Element Into View         ${BTN_APPLY}
    Sleep    0.3s
    Run Keyword And Ignore Error     Close Debug Overlay

    ${clicked}=    Run Keyword And Return Status    Click Element    ${BTN_APPLY}
    IF    not ${clicked}
        # Fallback 1: JS click
        ${js_clicked}=    Run Keyword And Return Status    Execute Javascript    arguments[0].click();    ${BTN_APPLY}
        IF    not ${js_clicked}
            # Fallback 2: submit form chứa nút Apply
            Execute Javascript    (function(b){var f=b.closest('form'); if(f){f.submit();}})(arguments[0]);    ${BTN_APPLY}
        END
    END

    Wait Until Any Elements Visible    ${ROWS}    ${NO_DATA}    15s


Clear Filters
    Click Element    ${BTN_CLEAR}
    Wait Until Element Is Visible    ${BTN_APPLY}    10s

# ====== Assertions ======
Should Have Data
    Run Keyword And Expect Error    *    Element Should Not Be Visible    ${NO_DATA}git status

    Page Should Contain Element     ${ROWS}

Should Show No Data
    Element Should Be Visible       ${NO_DATA}

# Helper: wait either A or B
Wait Until Any Elements Visible
    [Arguments]    ${locator1}    ${locator2}    ${timeout}=15s
    ${ok}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator1}    ${timeout}
    Return From Keyword If    ${ok}
    Wait Until Element Is Visible    ${locator2}    ${timeout}
