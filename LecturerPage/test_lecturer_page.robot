*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}    https://demo-clo.minds.vn
${BROWSER}     chrome
${USERNAME}    lecturer1
${PASSWORD}    demolecturer

*** Test Cases ***
TC01 - Login as Lecturer
    Open Browser    ${BASE_URL}/en/accounts/login/    ${BROWSER}
    Maximize Browser Window
    Input Text    xpath=//input[@name='username']    ${USERNAME}
    Input Text    xpath=//input[@name='password']    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains Element    xpath=//aside
    Close Browser
