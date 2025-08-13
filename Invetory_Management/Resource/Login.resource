*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://kholuutru.minds.vn/
${USERNAME}  admin_qc_automation
${PASSWORD}  Qc@12345
${username_xpath}       xpath=//*[@id="username"]
${password_xpath}       xpath=//*[@id="password"]
${loginbtn_xpath}       xpath=//*[@id="loginBtn"]

*** Keywords ***
Login To System
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${username_xpath}    30s
    Input Text    ${username_xpath}    ${USERNAME}
    Input Text    ${password_xpath}    ${PASSWORD}
    Click Button  ${loginbtn_xpath}