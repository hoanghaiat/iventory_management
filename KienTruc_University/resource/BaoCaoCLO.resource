*** Settings ***
Library    SeleniumLibrary
Variables   ../variables/locator.py


*** Keywords ***
Open Browser To BaoCaoCLO
    # Open Browser    ${URL}    chrome
    Login   admin    demoadmin
Close Web
    Close All Browsers
Login
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${BTN_HIDE}    30s
    Click Element    ${BTN_HIDE}
    Wait Until Element Is Visible    ${USERNAME_INPUT}    30s
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button    ${LOGIN_BUTTON}
View report list CLO
    Wait Until Element Is Visible    ${URL_REPORT_CLO}    20s
    Click Element    ${URL_REPORT_CLO}
    Sleep    3s