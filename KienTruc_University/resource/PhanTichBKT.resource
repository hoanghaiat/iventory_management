*** Settings ***
Library    SeleniumLibrary
Variables   ../variables/locator.py


*** Keywords ***
Open Browser To PhanTichBKT
    # Open Browser    ${URL}    chrome
    Login   admin    demoadmin
Close Web
    Close All Browsers
Login 
        [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    5s
    Wait Until Element Is Visible    ${BTN_HIDE}    30s
    Click Element    ${BTN_HIDE}
    Wait Until Element Is Visible    ${USERNAME_INPUT}    30s
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button    ${LOGIN_BUTTON}

Navigate My Classes page
    Wait Until Element Is Visible    ${URL_TEST_ANALYSES}    20s
    Click Element    ${URL_TEST_ANALYSES}
    Wait Until Element Is Visible    ${NAV_MY_CLASSES}    20s
    Click Element    ${NAV_MY_CLASSES}
    Sleep    3s
Check the testanalys button
    Wait Until Element Is Visible    ${URL_TEST_ANALYSES}    20s
    Click Element    ${URL_TEST_ANALYSES}
    Sleep    3s
    Wait Until Element Is Visible    ${BTN_VIEW_TEST_ANALYSES}    20s
    Click Element    ${BTN_VIEW_TEST_ANALYSES}
    Sleep    3s

Check popup display in test analysis
    Wait Until Element Is Visible    ${URL_TEST_ANALYSES}    20s
    Click Element    ${URL_TEST_ANALYSES}
    Sleep    3s
    Wait Until Element Is Visible    ${BTN_PRINT_TEST_ANALYSES}    20s
    Click Element    ${BTN_PRINT_TEST_ANALYSES}
    Sleep    3s
Back to Analyses
    Wait Until Element Is Visible    ${URL_TEST_ANALYSES}    20s
    Click Element    ${URL_TEST_ANALYSES}
    Sleep    3s
    Wait Until Element Is Visible    ${BTN_VIEW_TEST_ANALYSES}    20s
    Click Element    ${BTN_VIEW_TEST_ANALYSES}
    Sleep    3s
    Wait Until Element Is Visible    ${BTN_BACK_TEST_ANALYSES}    20s
    Click Element    ${BTN_BACK_TEST_ANALYSES}
    Sleep    3s
Search for testanalys with empty keywords
    Wait Until Element Is Visible    ${URL_TEST_ANALYSES}    20s
    Click Element    ${URL_TEST_ANALYSES}

    Wait Until Element Is Visible    ${BTN_SEARCH_TEST_ANALYSES}    10s
    Click Element    ${BTN_SEARCH_TEST_ANALYSES}
    Wait Until Page Contains Element    ${BTN_SEARCH_TEST_ANALYSES}    20s
   
    Wait Until Page Contains Element    ${RESULT_TABLE_TEST_ANALYSES}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE_TEST_ANALYSES}
    Wait Until Page Contains Element    ${RESULT_TABLE_TEST_ANALYSES}    30s
    Sleep    10s

Search for testanalys with valid keywords
    [Arguments]    ${keywords}
    Wait Until Element Is Visible    ${URL_TEST_ANALYSES}    20s
    Click Element    ${URL_TEST_ANALYSES}
    Wait Until Element Is Visible    ${INPUT_SEARCH_TEST_ANALYSES}    20s
    Input Text   ${INPUT_SEARCH_TEST_ANALYSES}      ${keywords}

    Wait Until Element Is Visible    ${BTN_SEARCH_TEST_ANALYSES}    20s
    Click Element    ${BTN_SEARCH_TEST_ANALYSES}
    Wait Until Page Contains Element    ${BTN_SEARCH_TEST_ANALYSES}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE_TEST_ANALYSES}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE_TEST_ANALYSES}
    Wait Until Page Contains Element    ${RESULT_TABLE_TEST_ANALYSES}    30s
    Sleep    10s
Search for testanalys with invalid keywords
    [Arguments]    ${keywords}
    Wait Until Element Is Visible    ${URL_TEST_ANALYSES}    20s
    Click Element    ${URL_TEST_ANALYSES}
    Wait Until Element Is Visible    ${INPUT_SEARCH_TEST_ANALYSES}    20s
    Input Text   ${INPUT_SEARCH_TEST_ANALYSES}      ${keywords}

    Wait Until Element Is Visible    ${BTN_SEARCH_TEST_ANALYSES}    20s
    Click Element    ${BTN_SEARCH_TEST_ANALYSES}
    Wait Until Page Contains Element    ${BTN_SEARCH_TEST_ANALYSES}    30s
   
    Wait Until Page Contains Element    ${RESULT_TABLE_TEST_ANALYSES}    10s
    Sleep    10s
    Scroll Element Into View    ${RESULT_TABLE_TEST_ANALYSES}
    Wait Until Page Contains Element    ${RESULT_TABLE_TEST_ANALYSES}    30s
    Sleep    10s

Verify Print Report in test analysis detail view
    Wait Until Element Is Visible    ${URL_TEST_ANALYSES}    20s
    Click Element    ${URL_TEST_ANALYSES}
    Sleep    3s
    Wait Until Element Is Visible    ${BTN_VIEW_TEST_ANALYSES}    20s
    Click Element    ${BTN_VIEW_TEST_ANALYSES}
    Sleep    2s
    Wait Until Element Is Visible    ${BTN_PRINT_REPORT}    20s
    Click Element    ${BTN_PRINT_REPORT}
    Press Keys    NONE    ESC
    Sleep    1s
