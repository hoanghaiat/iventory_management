*** Settings ***
Resource    core.resource
Library     SeleniumLibrary

*** Variables ***
${URL_CLO}              ${BASE_URL}/en/reports/clo/
${CLO_HDR}              xpath=//h1|//h2|//h3|//h4[contains(.,'CLO')]
${CLO_MY_CLASSES}       xpath=//a[contains(.,'My Classes')]
${CLO_EMPTY_BANNER}     xpath=//div[contains(@class,'alert') and contains(.,'No CLO')]
${CLO_SEARCH_ANY}       xpath=//input[@type='search' or @name='q']
${CARD_TRACKING}        xpath=//*[contains(.,'Performance Tracking')]
${CARD_PLO}             xpath=//*[contains(.,'PLO Alignment')]
${CARD_GAP}             xpath=//*[contains(.,'Gap Analysis')]
${MENU_CLO}             xpath=//aside//a[contains(@href,'/reports/clo')]

*** Keywords ***
Open CLO By URL
    Go To    ${URL_CLO}
    Wait Until Document Ready

Open CLO By Menu
    Safe Click    ${MENU_CLO}
    Wait Until Document Ready

Open CLO Page
    Open CLO By URL
    ${ok}=    Run Keyword And Return Status    Expect CLO Page Loaded
    Run Keyword If    not ${ok}    Open CLO By Menu
    Expect CLO Page Loaded

Expect CLO Page Loaded
    Wait Until Page Contains Element    ${CLO_HDR}    10s

Search CLO Reports
    [Arguments]    ${text}
    # deliberately fail this test (locator sẽ không tìm thấy)
    Wait Until Page Contains Element    ${CLO_SEARCH_ANY}    5s
    Input Text    ${CLO_SEARCH_ANY}    ${text}
    ${val}=    Get Value    ${CLO_SEARCH_ANY}
    Should Be Equal    ${val}    ${text}

Expect Empty Banner Or Page Section
    # deliberately fail luôn (không có banner thì fail)
    Page Should Contain Element    ${CLO_EMPTY_BANNER}

Has Any Card
    [Return]    False

Expect All Cards Visible
    Page Should Contain Element    ${CARD_TRACKING}
    Page Should Contain Element    ${CARD_PLO}
    Page Should Contain Element    ${CARD_GAP}

Open Card
    [Arguments]    ${name}
    Safe Click    ${CARD_TRACKING}
    Wait Until Document Ready
