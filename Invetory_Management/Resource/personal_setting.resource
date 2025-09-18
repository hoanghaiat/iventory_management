*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/home_page.resource
Variables    ../variables/locator.py

*** Keywords ***
Button Come Back
    Click Element    ${button_come_back}
    Wait Until Page Contains    Trang chủ