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

Wait Until Element Is Clickable
    [Arguments]    ${BTN_coursemanagement}    ${timeout}
    Wait Until Element Is Visible    ${BTN_coursemanagement}    ${timeout}
    # Add logic here if needed to ensure the element is clickable
Search Program In Training
    [Arguments]    ${INPUT_KEYWORD}

    Wait Until Element Is Visible    ${Menu_ProGram}    30s
    Scroll Element Into View         ${Menu_ProGram}
    Click Element                    ${Menu_ProGram}
    Wait Until Element Is Visible    ${TXT_SEARCH}    30s    
    Input Text                       ${TXT_SEARCH}    Khoa Luan
    Click Element                    ${BTN_SEARCH}
    Wait Until Page Contains          Khoa Luan    
