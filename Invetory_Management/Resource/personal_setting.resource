*** Settings ***
Library    SeleniumLibrary
Resource    ../resource/home_page.resource
Variables    ../variables/locator.py

*** Keywords ***
Button Come Back
    Click Element    ${BUTTON_COME_BACK}
    Wait Until Page Contains    Trang chủ