*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/HomePage.resource
Variables    ../Variables/locator.py

*** Keywords ***
Button Come Back
    Click Element    ${Button_Come_Back}
    Wait Until Page Contains    Trang chủ