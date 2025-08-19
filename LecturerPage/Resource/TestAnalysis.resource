*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}          https://demo-clo.minds.vn
${BROWSER}           chrome
${USERNAME}          lecturer1
${PASSWORD}          demolecturer

# ===== Login locators (EN/VN) =====
${H_LOGIN}           xpath=//form//input[@id="id_username"]
${P_LOGIN}           xpath=//form//input[@id="id_password"]
${BTN_LOGIN}         xpath=//button[normalize-space(.)="Đăng nhập" or normalize-space(.)="Login"]

# ===== Menu & markers cho Test Analysis =====
${TA_MENU}           xpath=//a[contains(@href,'test-analysis') or contains(normalize-space(.),'Phân tích bài kiểm tra') or contains(normalize-space(.),'Test Analysis')]
${TA_MARK_H1}        xpath=//h1[normalize-space(.)='Phân tích bài kiểm tra' or normalize-space(.)='Test Analysis']
${TA_MARK_SEARCH}    css:input[placeholder*="Search test analyses"]
${TA_MARK_ABOUT}     xpath=//h2[contains(normalize-space(.),'About')]
${TA_MARK_EMPTY}     xpath=//*[contains(normalize-space(.),'No test analyses found.')]

# ===== Controls & Cards =====
${TA_SEARCH_INPUT}   css:input[placeholder*="Search test analyses"]
${TA_SEARCH_BTN}     xpath=//button[.//i[contains(@class,'search')] or contains(normalize-space(.),'Search')]
${TA_CARD_PERF}      xpath=//*[self::a or self::div][.//text()[contains(.,'Performance Statistics')]]
${TA_CARD_ITEM}      xpath=//*[self::a or self::div][.//text()[contains(.,'Item Analysis')]]
${TA_CARD_CLO}       xpath=//*[self::a or self::div][.//text()[contains(.,'CLO Achievement')]]

# ===== URL pattern sau khi click (mềm) =====
${URL_TA_PERF}       regexp:.*/test-analysis(/.*)?/performance|.*/test-analysis/performance
${URL_TA_ITEM}       regexp:.*/test-analysis(/.*)?/items|.*/test-analysis/items
${URL_TA_CLO}        regexp:.*/test-analysis(/.*)?/clo|.*/test-analysis/clo

*** Keywords ***
Open Browser And Login
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${H_LOGIN}    20s
    Input Text       ${H_LOGIN}    ${USERNAME}
    Input Password   ${P_LOGIN}    ${PASSWORD}
    Click Button     ${BTN_LOGIN}
    Wait Until Page Contains Element    xpath=//a[contains(@href,'/questionbank') or contains(@href,'/test-analysis') or contains(@href,'/dashboard')]    30s

Open Test Analysis Page
    [Documentation]  Điều hướng chắc tới trang Test Analysis (thử VN/EN, nếu chưa thì bấm menu).
    Go To    ${BASE_URL}/vi/test-analysis
    ${ok}=   Run Keyword And Return Status    Wait For TALanded    8s
    IF    not ${ok}
        Go To    ${BASE_URL}/en/test-analysis
        ${ok}=   Run Keyword And Return Status    Wait For TALanded    8s
        IF    not ${ok}
            Go To    ${BASE_URL}
            Wait Until Page Contains Element    ${TA_MENU}    15s
            Safe Click    ${TA_MENU}
            Wait For TALanded    15s
        END
    END

Wait For TALanded
    [Arguments]    ${timeout}=10s
    ${m1}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${TA_MARK_H1}        ${timeout}
    ${m2}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${TA_MARK_SEARCH}    2s
    ${m3}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${TA_MARK_ABOUT}     2s
    ${m4}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${TA_MARK_EMPTY}     2s
    Run Keyword If    ${m1} or ${m2} or ${m3} or ${m4}    Return From Keyword
    Fail    Test Analysis page markers not found within ${timeout}.

Search Test Analyses
    [Arguments]    ${keyword}
    Wait Until Page Contains Element    ${TA_SEARCH_INPUT}    10s
    Clear Element Text    ${TA_SEARCH_INPUT}
    Input Text            ${TA_SEARCH_INPUT}    ${keyword}
    Run Keyword If    "${keyword}"!=""    Safe Click    ${TA_SEARCH_BTN}
    Sleep    0.8s

Verify Empty State
    Wait Until Page Contains Element    ${TA_MARK_EMPTY}    10s

Click Card Performance
    Wait Until Page Contains Element    ${TA_CARD_PERF}    10s
    Safe Click    ${TA_CARD_PERF}

Click Card Item
    Wait Until Page Contains Element    ${TA_CARD_ITEM}    10s
    Safe Click    ${TA_CARD_ITEM}

Click Card CLO
    Wait Until Page Contains Element    ${TA_CARD_CLO}    10s
    Safe Click    ${TA_CARD_CLO}

Assert Url Matches
    [Arguments]    ${pattern}
    ${url}=    Get Location
    Should Match Regexp    ${url}    ${pattern}

Safe Click
    [Arguments]    ${locator}
    ${ok}=    Run Keyword And Return Status    Click Element    ${locator}
    IF    not ${ok}
        ${el}=    Get WebElement    ${locator}
        Execute Javascript    arguments[0].click();    ${el}
    END
