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
View and Create Clo
    [Arguments]    ${ITEM_COURSE}
    Wait Until Element Is Visible   ${ITEM_COURSE}    30s
    Click Element                    ${ITEM_COURSE}
    Sleep                            2s
    Wait Until Element Is Visible   ${VIEW_CLO}    30s
    Click Element                    ${VIEW_CLO}
    Sleep                            2s
    Wait Until Element Is Visible   ${BTN_CREATE_CLO}    10s
    Click Element                    ${BTN_CREATE_CLO}
    Sleep                            2s
    Wait Until Element Is Visible   ${INPUT_CLO_CODE}    10s
    Input Text                       ${INPUT_CLO_CODE}    CLO004
    Input Text                       ${CLO_DESCRIPTION}    day la dathuy
    Input Text                       ${INPUT_CLO_WEIGHT}    10
    Select From List By Value    ${SELECT_CLO_CATEGORY}    skill
    Select From List By Value    ${SELECT_CLO_LEVEL}    apply
    Select From List By Value    ${SELECT_ASSESSMENT_CLO}    exam
    Scroll Element Into View         ${CREATE_CLO}
    Wait Until Element Is Visible   ${CREATE_CLO}    30s
    Click Element                    ${CREATE_CLO}
    Sleep                            2s
Edit Clo
    [Arguments]    ${VIEW_CLO}
    Wait Until Element Is Visible   ${VIEW_CLO}    30s
    Click Element                    ${VIEW_CLO}
    Sleep                            2s
    Wait Until Element Is Visible   ${EDIT_CLO}    30s
    Click Element                    ${EDIT_CLO}
    Sleep                            2s
    Wait Until Element Is Visible   ${INPUT_CLO_CODE}    10s
    Input Text                       ${INPUT_CLO_CODE}    CLO003
    Input Text                       ${CLO_DESCRIPTION}    day la dathuy huhu
    Input Text                       ${INPUT_CLO_WEIGHT}    01
    Select From List By Value        ${SELECT_CLO_CATEGORY}    knowledge
    Select From List By Value        ${SELECT_CLO_LEVEL}    understand
    Select From List By Value        ${SELECT_ASSESSMENT_CLO}    project
    Scroll Element Into View         ${UPDATE_CLO}
    Wait Until Element Is Visible   ${UPDATE_CLO}    30s
    Click Element                    ${UPDATE_CLO}