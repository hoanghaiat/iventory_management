*** Settings ***
Library    SeleniumLibrary     
Library    String
Library    Collections
Variables  ../variables/locator.py


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=id_username    ${USERNAME}
    Input Text    id=id_password    ${PASSWORD}
    Click Button  ${LOGIN_BTN} 

Go Back Home 
    Wait Until Element Is Visible    ${HOME_URL}