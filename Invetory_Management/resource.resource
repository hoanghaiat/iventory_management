*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://kholuutru.minds.vn/
${USERNAME}  admintest
${PASSWORD}  admintest

*** Keywords ***
Login To System
    [Arguments]    ${username_xpath}    ${password_xpath}    ${loginbtn_xpath}
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${username_xpath}    30s
    Input Text    ${username_xpath}    ${USERNAME}
    Input Text    ${password_xpath}    ${PASSWORD}
    Click Button  ${loginbtn_xpath}
    