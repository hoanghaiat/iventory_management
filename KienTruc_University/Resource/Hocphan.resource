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
View Course
    [Arguments]    ${ITEM_COURSE}
    Wait Until Element Is Visible   ${ITEM_COURSE}    30s
    Scroll Element Into View         ${ITEM_COURSE}
    Click Element                    ${ITEM_COURSE}
View module detail
    Wait Until Element Is Visible   ${ICON_VIEW}    30s
    Click Element                    ${ICON_VIEW}
    Sleep                            2s
Edit Course
    Wait Until Element Is Visible   ${BTN_EDIT_COURSE}    30s
    Click Element                    ${BTN_EDIT_COURSE}
    Wait Until Element Is Visible    ${INPUT_COURSE_CODE}    30s
    Input Text                       ${INPUT_COURSE_CODE}    12
    Input Text                       ${INPUT_COURSE_NAME}    huyaaaa
    Scroll Element Into View         ${BTN_UPDATE}
    Wait Until Element Is Visible   ${BTN_UPDATE}    30s
    Click Element                    ${BTN_UPDATE}
    Sleep    2s
    Wait Until Element Is Visible   ${BTN_BACK_COURSE}    10s
    Click Element                    ${BTN_BACK_COURSE}
    Sleep                            2s
Search Course
    [Arguments]    ${INPUT_KEYWORD}
    Wait Until Element Is Visible    ${INPUT_SEARCH}    30s
    Input Text                       ${INPUT_SEARCH}    ${INPUT_KEYWORD}
    Click Element                    ${BTN_SEARCH_COURSE}
    Wait Until Page Contains         ${INPUT_KEYWORD}    10s
    Sleep                       2s
    Wait Until Element Is Visible   ${BTN_PROGRAM}    10s
    Click Element                    ${BTN_PROGRAM}
    Sleep                           2s

    

    
    