*** Settings ***
Library    SeleniumLibrary
Variables  ../variables/locator.py
*** Variables ***
${URL}    https://demo-clo.minds.vn/
${USERNAME_INPUT}  xpath=//input[@id='id_username']
${PASSWORD_INPUT}  xpath=//input[@id='id_password']
${LOGIN_BUTTON}    xpath=//button[text()='Đăng nhập']

*** Keywords ***
Open Chrome Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --disable-speech-api
    Call Method    ${options}    add_argument    --disable-software-rasterizer
    Open Browser    ${URL}    chrome    options=${options}
Login To System
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    chrome
    Wait Until Element Is Visible    ${USERNAME_INPUT}    30s
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Button    ${LOGIN_BUTTON}
    Location Should Contain        https://demo-clo.minds.vn/ 
View Class
    Wait Until Element Is Visible   ${ITEM_CLASS}    30s
    Scroll Element Into View         ${ITEM_CLASS}
    Click Element                    ${ITEM_CLASS}
    Sleep                            2s
Search Class
    [Arguments]    ${INPUT_KEYWORD}
    Wait Until Element Is Visible    ${SELECT_SEMESTER}    30s
    Select From List By Value        ${SELECT_SEMESTER}    Summer
    Select From List By Label        ${SELECT_ACADEMICYEAR}  All Years
    Select From List By Value        ${SELECT_STATUS}    ongoing
    Input Text                       ${INPUT_SEARCH_CLASS}    cs101
    Click Element                    ${BTN_SEARCH_CLASS}
    Wait Until Page Contains         ${INPUT_KEYWORD}    10s
    Sleep                       2s