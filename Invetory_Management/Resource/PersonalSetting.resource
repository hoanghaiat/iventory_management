*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/HomePage.resource
Variables    ../Variables/locator.py

*** Keywords ***
Button Come Back
    Click Element    ${BUTTON_COME_BACK}
    Wait Until Page Contains    Trang chủ